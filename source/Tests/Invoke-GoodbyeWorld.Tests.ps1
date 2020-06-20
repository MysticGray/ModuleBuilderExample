 	
Describe 'Invoke-GoodbyeWorld' {
    It 'Should Return Goodbye World' {
        Invoke-GoodbyeWorld | Should -Be "Goodbye World"
    }
  }