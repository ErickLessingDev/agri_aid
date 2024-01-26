import React,{useState} from 'react'
import Intro from './Intro'

const App = () => {
    return (
        <div className='flex h-screen w-screen '>
            <div className='mx-auto'>
                <Intro />
            </div>
        </div>
    )
}

export default App;