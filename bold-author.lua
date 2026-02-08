-- bold-author.lua
function Div(div)
  -- 1. Target only the bibliography entries
  if div.classes:includes("csl-entry") then
    
    -- 2. Walk through every element inside the entry
    return div:walk {
      Str = function(el)
        -- 3. Check if the text *contains* "Nabeel" (instead of exact match)
        if el.text:find("Nabeel") then
          return pandoc.Strong { el }
        end
        return nil
      end
    }
  end
  return nil
end