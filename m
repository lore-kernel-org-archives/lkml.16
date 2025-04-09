Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87383266B4B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209507; cv=none; b=lt+8Oa0xg7TBcf/tda6Ys/B5Wih36y75r43n1gNrGhyHtFdy9mpUKojV1tEb03Sqfz9tUwY8wLl9RzdsOuVteabkfap4BtNYls15fkOzmigmxMq15ic9Li45AUiEaRdYc+VQNWkphCdKNICv4XbTy7XpFd6JpqK4kBgz4HGYknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209507; c=relaxed/simple;
	bh=gPThaHkh23wMLS29TS3udC+7BGq3UOyBF3wgbXcRsP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4Yk4fgsa8eZtprUQVp6dc7WHL5hQaUX/bqQ8oAkCJVwpcLyrrL2rTYR5gJHkSGJv58N3jcAzQY/AhJWRtgbkoawbq//FjBRJ6kuYhsXkWJviWo/FEQiRJqsuS2hgEosSOy70t/tu+h5qjA6E0+dbRqLezjC13oZrZPuvjB38Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SnOS1iXF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SnOS1iXF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/ftJ0lIre/iSDadRbsiaBWpqoXh5G21mnZQULLWhUjw=; b=SnOS1iXF14qomWiqKBbsyqP9wS
	QQFox9x3Xuja9WR0BTh8OLhzygr9JOWytB/8AdFbVPmdOBJpot1jDYeCtUXZWb4sN/Z9qhxQPCCR5
	NXpFYrY98Ap1jOA6Qw2qFcqj6tYiTYw0XRX3QNCcUbctXPc4/ktDai8nra7jYaqj3D7Qk2ETMRjXx
	CewzqfUQ6ndHKH+kdHYfYGGpiK35pKNqkO8ZHAMQyPh5kzU/obhPucLEtSZdh/uSONjCtYjqdQAYS
	O3/eIkqWfK45g5CmnT9A6MJtVM0086NgWw60kf6oWQ0Ld/dtjn5SNLXizhW2OAT7ZmowEe2Vdc0JG
	ybzFYy2g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2WZK-00000008dNt-1lDX;
	Wed, 09 Apr 2025 14:38:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7687630057A; Wed,  9 Apr 2025 16:38:21 +0200 (CEST)
Date: Wed, 9 Apr 2025 16:38:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation
 readability
Message-ID: <20250409143821.GE9833@noisy.programming.kicks-ass.net>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>

On Tue, Apr 08, 2025 at 01:21:17AM -0700, Josh Poimboeuf wrote:
> Improve the readability and compactness of alternatives code.
> 
> ---------------------
> ALTERNATIVE() before:
> ---------------------
> 
>   	# ALT: oldinstr
>   771:
>   	rep movsb
>   772:
>   # ALT: padding
>   .skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
>   773:
>   .pushsection .altinstructions,"a"
>    .long 771b - .
>    .long 774f - .
>    .4byte (((1 << 0) << 16) | ((18*32+ 4)))
>    .byte 773b-771b
>    .byte 775f-774f
>   .popsection
>   .pushsection .altinstr_replacement, "ax"
>   # ALT: replacement
>   774:
>   	call rep_movs_alternative
>   775:
>   .popsection
> 
> --------------------
> ALTERNATIVE() after:
> --------------------
> 
>  # <ALTERNATIVE>
>  771:	rep movsb
>  772:	.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
>  773:
>  # ALT ENTRY:
>  .pushsection .altinstructions,"a";  .long 771b - .;  .long 774f - .;  .4byte (((1 << 0) << 16) | ((18*32+ 4)));  .byte 773b-771b;  .byte 775f-774f; .popsection

I find this very hard to read. I prefer the multi line form it had
before.

Other than that, I like the new layout.

>  # ALT REPLACEMENT:
>  .pushsection .altinstr_replacement, "ax"
>  774:	call rep_movs_alternative
>  775:
>  .popsection
>  # </ALTERNATIVE>

