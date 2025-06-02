Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD342629D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901451; cv=none; b=HEcwMp/ugw5cRwDmCASpOmhYgs1j1XoVATSE1gevEl5K2NL9xzJcWAbs0xiqz4WE3w8hDu9IyziECNJ0/xg0I1CCWw3BZnMkL1oe634LMRVlDa1IIeFyQZN0dj8yVIvqsq4CljMh4tfY5smHLtmcs8WpBOdYCqAWmL5kH6PsJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901451; c=relaxed/simple;
	bh=Avxk7uiGDcVdibBzpTBCMITiGYiAjLULDMdnkWXuTEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3epYYII+b2jJxec6DseF/iykJ9lKLhjBi2SORFf+RiCgj2EdIPX8SUYYPIrR6PcXUHjs20VKIFfvl7Id1iaP2B0a4jIItEVkhAQtQnJsl9ZaFmHhXiUH4Knrlm/12d9gjgdfvWNsCymRpqcx+pFLiXqBHDE/tS/Xl8Nhe9CMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jnWkyvoP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jnWkyvoP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D3wetvgdNNMOwVxl4hVBjZDppgpQ6Ns+o6HpYvOnbHs=; b=jnWkyvoPYDC4XJWQk5EzwthWdd
	Sg8Vk86hC3GQDxxHYrIowD7m5fsNBUt+YEDM5VKg8VduFdB4LXcxKcgM6Z3zrNlAiXCqGDW+HhS/i
	u0iHBmRd+hPI1NyQCJ8+EVZrVXIWA4nwcMmAYlP7GJGq4+gxJbOwjQHABtHZTBDm/QSNKyDJ4qJKA
	yhIyVlp6egEWLYaQUiAZzrKqh+6J6MRk+CmSsu0WRkR1y3bgQCjQ2EUMr/M3G6fNnP18kMjU+U4R2
	QP6Kw1lDFi1KwywG8tOPgfXpTrIUK1HGih0yDaApH6sO+Qtxwjpas9dPF/N34JSOzspge2YRRrC83
	aReWtzZw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMD9q-00000001Moo-20qh;
	Mon, 02 Jun 2025 21:57:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CCDDC300787; Mon,  2 Jun 2025 23:57:25 +0200 (CEST)
Date: Mon, 2 Jun 2025 23:57:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250602215725.GA39782@noisy.programming.kicks-ass.net>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net>
 <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>

On Mon, Jun 02, 2025 at 09:38:09AM -0700, Linus Torvalds wrote:

> And no, I'm not ok with only using 'objdump' and friends to look at
> assembly generation. I want to be able to do
> 
>    make xyz.s
> 
> and look at code generation without throwing up.

So if I stuff the asm macro in a global asm() block then GCC ends up
looking like so:

        .set warn_imm, 0
        warn_add_reg var=warn_imm reg=%rcx      # tmp215
        .set warn_imm, (warn_imm << 4)
        warn_add_reg var=warn_imm reg=%rdx      # tmp212
        1: ud1 warn_imm(%ecx),%rax      # tmp210
        .pushsection .discard.annotate_insn,"M",@progbits,8
        .long 1b - .
        .long 8
        .popsection
        .pushsection __bug_table, "aw" ; 123: .long 1b - . ; .long .LC76 - . ; .long .LC0 - . ; .word 8710 ; .word 2321 ; .org 123b + 6 + 4 + 6 ; .popsection   #,,,

However, clangd is 'helpful' and fully expands the asm macro for the .s
file :-(
