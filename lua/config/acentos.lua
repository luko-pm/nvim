local t = {
    a='á',
    e='é',
    i='í',
    o='ó',
    u='ú',
    A='Á',
    E='É',
    I='Í',
    O='Ó',
    U='Ú',
    ["á"] = "a",
    ["é"] = "e",
    ["í"] = "i",
    ["ó"] = "o",
    ["ú"] = "u",
    ["Á"] = "A",
    ["É"] = "E",
    ["Í"] = "I",
    ["Ó"] = "O",
    ["Ú"] = "U",

}

function Acento()
    vim.cmd([[normal! v"ay]])
    local c = t[vim.fn.getreg('a')]
    if c then
        local s = "normal! r" .. c
        vim.cmd(s)
    end
end
