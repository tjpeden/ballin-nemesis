class AutocompleteInput < SimpleForm::Inputs::StringInput
  def input 
    @input_type = 'text'
    source = options.delete(:source)
    input_html_options[:data] = {:source => source}
    super
  end
end
