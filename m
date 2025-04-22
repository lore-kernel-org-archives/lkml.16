Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDFD1C6BE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323364; cv=none; b=ctHpeB2goK3quTctQQYX08cdxhU1WmI5oJ6DPepVow/ui2bJguai6hkD5+ktEwj1GXiCHScpKfr3JJm5b9KofVXrdhB/fsimRvgLDhCSZSr94YGlXup+sL92qg/tOalAug8MVlGElhEVBSUGNzD+mtcw6WtKQuYnEmG1xw05BUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323364; c=relaxed/simple;
	bh=zpkMhX8HCNefWED5kaVM3Q6owZhUzsSiOXyAW+56Ses=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRhrBweyGXi8O8BPYW5888bC5YD8FgibOSYFOZwmdU+krQTrPS/JIkLu0dYeyhtzhrBm7jroaqBuRHN59qho5zt2c/PJNvi0x62dI64ygN4N5I48ul01Mhg86hcobRPTGvjEcL0kfMjKU9kEI7p42k3JpE2HNU6f5SOedVYIgn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1igxjdE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1igxjdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7E3C4CEE9;
	Tue, 22 Apr 2025 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745323364;
	bh=zpkMhX8HCNefWED5kaVM3Q6owZhUzsSiOXyAW+56Ses=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1igxjdEop8sJ/+DE0SN7RzmL4JFePf6aUDa8be4f6G6Cz6DVkf8mz3u1vYYrYGRM
	 ED7oSovNS30wYofj4sNOp/ywllIOZ5cWY99sg2bad1w05KtFc85grEItQkM5vflu86
	 cbK3XJxRySni7tiWP2LlQr2uysi6pmoc5mtamvM2tkgWIk6jlSoF61ayJp9oJw2djW
	 zjCKWta8DCgELE1rXMPNYBJ3+fBCYUqZ8vfJhTBCt1iYQp3eucgl7xQr3fj5jZScYK
	 HuVqpNipBLjANPQ4SxeMQM74e1/C62CO6q2gUcqY0Pv5HvUOIdsaVNWOnK7km0WD1a
	 d+GrMpT1pzrCg==
Date: Tue, 22 Apr 2025 14:02:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2] noinstr: Use asm_inline() in
 instrumentation_{begin,end}()
Message-ID: <aAeFYB7E2QiRNeoM@gmail.com>
References: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> Use asm_inline() in the instrumentation begin/end macros to prevent the
> compiler from making poor inlining decisions based on the length of the
> objtool annotations.
> 
> Without the objtool annotations, each macro resolves to a single NOP.
> Using inline_asm() seems obviously correct here as it accurately
> communicates the actual code size to the compiler.

s/inline_asm
 /asm_inline

> 
> These macros are used by WARN() and lockdep, so this change can affect a
> lot of functions.
> 
> For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> 0.17% increase in text size:
> 
>   add/remove: 74/352 grow/shrink: 914/353 up/down: 80747/-47120 (33627)
>   Total: Before=19460272, After=19493899, chg +0.17%
> 
> The text growth is presumably due to increased inlining.  A net total of
> 278 functions were removed (+74 / -352).  Each of the removed functions
> is likely inlined at multiple sites which explains the somewhat
> significant code growth.

So:

 - 353 function shrunk by 47120 bytes, that's -133 bytes per function 
   affected.

 - 914 functions grew by 80747 bytes, that's +88 bytes per function, 
   but there's 3x of them.

That's a lot of net text growth, isn't it? It's certainly not just a 
single instruction or two per inlining, as asm_inline() would suggest.

> One example from Uros:
> 
>     $ grep "<encode_string>"  objdump.old
>    
>     00000000004506e0 <encode_string>:
>      45113c:       e8 9f f5 ff ff          call   4506e0 <encode_string>
>      452bcb:       e9 10 db ff ff          jmp    4506e0 <encode_string>
>      453d33:       e8 a8 c9 ff ff          call   4506e0 <encode_string>
>      453ef7:       e8 e4 c7 ff ff          call   4506e0 <encode_string>
>      45549f:       e8 3c b2 ff ff          call   4506e0 <encode_string>
>      455843:       e8 98 ae ff ff          call   4506e0 <encode_string>
>      455b37:       e8 a4 ab ff ff          call   4506e0 <encode_string>
>      455b47:       e8 94 ab ff ff          call   4506e0 <encode_string>
>      4564fa:       e8 e1 a1 ff ff          call   4506e0 <encode_string>
>      456669:       e8 72 a0 ff ff          call   4506e0 <encode_string>
>      456691:       e8 4a a0 ff ff          call   4506e0 <encode_string>
>      4566a0:       e8 3b a0 ff ff          call   4506e0 <encode_string>
>      4569aa:       e8 31 9d ff ff          call   4506e0 <encode_string>
>      456e79:       e9 62 98 ff ff          jmp    4506e0 <encode_string>
>      456efe:       e9 dd 97 ff ff          jmp    4506e0 <encode_string>
>    
>     All these are calls now inline:
>    
>     encode_string                                 58       -     -58
>    
>     ... where for example encode_putfh() grows by:
>    
>     encode_putfh                                  70     118     +48

That still doesn't make it clear where the apparently ~10 instructions 
per inlining come from, right?

Thanks,

	Ingo
