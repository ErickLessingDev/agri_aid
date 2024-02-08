module ApplicationHelper
    def flash_class(key)
        case key.to_sym
            when :notice
                "bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative"
            when :alert
                "bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
            else
                "border border-gray-400 text-gray-700 px-4 py-3 rounded relative"
            end
        end

        def flash_title(key)
            case key.to_sym
            when :notice
                "Success"
            when :alert
                "Error"
            else
                "Notice"
        end
    end
end
