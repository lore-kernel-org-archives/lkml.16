Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63BA48
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703334; cv=none; b=rT5BRzbgq9jTR3kQd1L0X1qqTsc8KjrtQMdf/OiWLAVvY9bo/Ro4EWxEDn7wiQLD10j6FBdJYFz42x3DZILtKKTiD/FvZGm4Y3Smy4ODtf6m9D6OI9knwBCbkkDyyfgOC4oBI9IKeebu5p6zkTHjdjlHkQC5Fh6dtINzmVFkAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703334; c=relaxed/simple;
	bh=vw2tbzVqkHXbv4l4xY+MOdvBNk2prrvQAjLsKues81o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glNvd/WCEc3OvA7lzv/n0WL7oQsYhuzYV8F14mB60RQim45SZCh0RDJCjOwueJKFjsR/gtFHULudUTPQC9T7sQRfe+EHX+qx22udkwdBK6M6HpCmJmc/IhdW8XHJxqbpPCok7RkULuBwHsXZIrb4gEMJleS+HrOnKNX4d5p3iW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xoq6gYmA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xoq6gYmA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aE+a9b08qt+UJaWgNcbO7KYDvQE21VYD/npNfE6tcJo=; b=Xoq6gYmAJZWY2zWMxkmaF9BNoi
	Jzq3gvHUVF2k/1j7D92TYVwf/LVNrV2RyyWjFZDzXEVGSijKNUT8k56zJVWnmgDB9+HlI1U5131pw
	hIVpnAyiQ70QX7ATxHIIzQGvDroyNXsZ4GzZQdFdAMNMpwnc/7kYz9DNRedNAADyMQxwEKDOrhq9Z
	DrKfIToGpzeC/9g8BjP4bW2LrPV6KKtc0LseZDu/4Ygx7Ha9jDAZHu5ESHjuB1wL3IH2MbfO7vx0S
	PUv8Kgbl5UZxouY0Dv4YZgqOYSzDT6FUcc5TAVPrgEn/PGJSWAz8hDtHKh0CicsiDYVFvcbQmnz8o
	MSw/Vmgw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4b2H-00000009pf4-2p26;
	Tue, 15 Apr 2025 07:48:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3FC7E30037D; Tue, 15 Apr 2025 09:48:49 +0200 (CEST)
Date: Tue, 15 Apr 2025 09:48:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2] noinstr: Use asm_inline() in
 instrumentation_{begin,end}()
Message-ID: <20250415074849.GJ5600@noisy.programming.kicks-ass.net>
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

On Mon, Apr 14, 2025 at 05:27:11PM -0700, Josh Poimboeuf wrote:
> Use asm_inline() in the instrumentation begin/end macros to prevent the
> compiler from making poor inlining decisions based on the length of the
> objtool annotations.
> 
> Without the objtool annotations, each macro resolves to a single NOP.
> Using inline_asm() seems obviously correct here as it accurately
> communicates the actual code size to the compiler.
> 
> These macros are used by WARN() and lockdep, so this change can affect a
> lot of functions.
> 
> For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> 0.17% increase in text size:
> 
>   add/remove: 74/352 grow/shrink: 914/353 up/down: 80747/-47120 (33627)
>   Total: Before=19460272, After=19493899, chg +0.17%

Hmm, I was surprised that defconfig was affected at all. Why does
defconfig have DEBUG_ENTRY on?
