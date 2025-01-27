if vim.g.snippets == "luasnip" then
    return
end


local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.config.set_config {
    --Tells luasnip to remember to keep around the last snippet
    --You can jump back into it even of you move outside of the selection
    history = true,

    --This allows dynamic snippets, it updates as you type!
    updateevnts = "TextChanged,TextChangedI",

    --Autosnippets:
    enable_autosnippets = true,

    --vid3
}

-- complicated function for dynamicNode.
local function jdocsnip(args, _, old_state)
	-- !!! old_state is used to preserve user-input here. DON'T DO IT THAT WAY!
	-- Using a restoreNode instead is much easier.
	-- View this only as an example on how old_state functions.
	local nodes = {
		t({ "/**", " * " }),
		i(1, "A short Description"),
		t({ "", "" }),
	}

	-- These will be merged with the snippet; that way, should the snippet be updated,
	-- some user input eg. text can be referred to in the new snippet.
	local param_nodes = {}

	if old_state then
		nodes[2] = i(1, old_state.descr:get_text())
	end
	param_nodes.descr = nodes[2]

	-- At least one param.
	if string.find(args[2][1], ", ") then
		vim.list_extend(nodes, { t({ " * ", "" }) })
	end

	local insert = 2
	for indx, arg in ipairs(vim.split(args[2][1], ", ", true)) do
		-- Get actual name parameter.
		arg = vim.split(arg, " ", true)[2]
		if arg then
			local inode
			-- if there was some text in this parameter, use it as static_text for this new snippet.
			if old_state and old_state[arg] then
				inode = i(insert, old_state["arg" .. arg]:get_text())
			else
				inode = i(insert)
			end
			vim.list_extend(
				nodes,
				{ t({ " * @param " .. arg .. " " }), inode, t({ "", "" }) }
			)
			param_nodes["arg" .. arg] = inode

			insert = insert + 1
		end
	end

	if args[1][1] ~= "void" then
		local inode
		if old_state and old_state.ret then
			inode = i(insert, old_state.ret:get_text())
		else
			inode = i(insert)
		end

		vim.list_extend(
			nodes,
			{ t({ " * ", " * @return " }), inode, t({ "", "" }) }
		)
		param_nodes.ret = inode
		insert = insert + 1
	end

	if vim.tbl_count(args[3]) ~= 1 then
		local exc = string.gsub(args[3][2], " throws ", "")
		local ins
		if old_state and old_state.ex then
			ins = i(insert, old_state.ex:get_text())
		else
			ins = i(insert)
		end
		vim.list_extend(
			nodes,
			{ t({ " * ", " * @throws " .. exc .. " " }), ins, t({ "", "" }) }
		)
		param_nodes.ex = ins
		insert = insert + 1
	end

	vim.list_extend(nodes, { t({ " */" }) })

	local snip = sn(nil, nodes)
	-- Error on attempting overwrite.
	snip.old_state = param_nodes
	return snip
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
	local file = io.popen(command, "r")
	local res = {}
	for line in file:lines() do
		table.insert(res, line)
	end
	return res
end

-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
	local fmt = fmt or "%Y-%m-%d"
	return sn(nil, i(1, os.date(fmt)))
end

    --could be a problem in the future but works for now 
    vim.keymap.set("n", "<leader>-", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")


    --KEYMAP for luasnip

    --<c-k> is my expansion key 
    -- this will expand the current item or jump to the next item within the snippet.
    vim.keymap.set({"i","s"}, "<C-k>",function ()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, {silent = true})

    --<c-j> is my expansion key 
    --this always moves to the previous item within the snippet 
    vim.keymap.set({"i","s"}, "<C-j>",function ()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, {silent = true})


    --<c-l> is selcting within a list of options.
    -- this is useful for choice nodes
    vim.keymap.set("i", "<C-l>",function ()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end)

    ls.add_snippets("all", {
        s("trigger", { t("Wow! Text!") })
    },
    {
        key = "all_snippets"

    })

    -- ls.parser.paser_snippet(<text>, <Vscode style snippets>)
--    ls.add_snippets = {
--        all = {
            --Available on any filetype
 --           ls.parser.parse_snippet("expand", "--this is what was expanded"),
 --       },

  --      lua = {
            --Lua specific snippets go here.
   --     },
  --  }

ls.add_snippets("java", {
	-- Very long example for a java class.
            --java specific snippets go here
            s("fn", {
		d(6, jdocsnip, { 2, 4, 5 }),
		t({ "", "" }),
		c(1, {
			t("public "),
			t("private "),
		}),
		c(2, {
			t("void"),
			t("String"),
			t("char"),
			t("int"),
			t("double"),
			t("boolean"),
			i(nil, ""),
		}),
		t(" "),
		i(3, "myFunc"),
		t("("),
		i(4),
		t(")"),
		c(5, {
			t(""),
			sn(nil, {
				t({ "", " throws " }),
				i(1),
			}),
		}),
		t({ " {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
}, {
	key = "java",
})





