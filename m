Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E751DED64
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270971; cv=none; b=TT+y24L1md7rMt2/X2YFoOeEwMl98VC19GOhwHAaSpJRYnpt4UckAQOxGvJCAkmfPeFv4dFCipw6FomLVN0ZKT9/WxmiELoGjA9A9U2r2hoAq1CjR4Bl+m7ap/P9qmuZEbDMv0bIwvFcHo6fRbWqN6SL8vwa72dUGN0SwDeA024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270971; c=relaxed/simple;
	bh=s56ILs2X511BK3TzmKm827j0NPmFccGAczoHM4lFIVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmHSaPJVNcYjsQt5K//EBUp8aXkTcT2hkdM+F43/dKq7dAfBKrNJZxLW32ikbyFjr9uhkjybk+MEf4W7cszaDtBe+nHGf4/cCisVoxIDtW7PrjdXeKreDIUpyRLdlu99lk7WtylsoL/ytxku24FOpnX2JBG+5y15kmRMnzodBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ANc6vgl/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ANc6vgl/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g8duZxkPVS24hjNQcj3gCKwBgUqUfEF5TI3FylCBaP8=; b=ANc6vgl/WMGljfvNRwOojgTHfR
	ywTBSHZ5Iku85NRt7TKA6dClm7M23x9oOFk0D7B3hjCJefk0yo/IILj1KbANRXHYVNBOvuMXNieoe
	qi3JwYZiPJ8dnBtqRyz6eBUXvg/gNOunFh6Ma5jWmvl8T40yPMqUT3+AJmxk1XP/G4RjUrLd4MHqH
	z2CtoDvdb2B88ynV5xo+5FRhV3sF2klckDxI71MSTlyqmB19xNBnQEthXn0RXF/JHyLTO7ef193pD
	W72j9I0u6amnuy8YOPf7Oi+zGYVSHBAE7qyirxEpTQ43zNui4fDwCNkgwfoCZVH4JoWEx0WjMOFXy
	guHoWBKQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Zg-00000003GM5-0OvX;
	Mon, 30 Jun 2025 08:09:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F25AB300125; Mon, 30 Jun 2025 10:09:10 +0200 (CEST)
Date: Mon, 30 Jun 2025 10:09:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexander Potapenko <glider@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, quic_jiangenj@quicinc.com,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
Message-ID: <20250630080910.GK1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-3-glider@google.com>
 <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>
 <CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-WD3dHW7=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mEMS+fmR+J2WkzhDeOMR3c88TRdEEhP12r-WD3dHW7=w@mail.gmail.com>

On Sun, Jun 29, 2025 at 09:25:34PM +0200, Miguel Ojeda wrote:

> > I think we can fix this by setting AllowShortFunctionsOnASingleLine:
> > Empty, SplitEmptyFunction: false in .clang-format
> >
> > Miguel, do you think this is a reasonable change?
> 
> I have a few changes in the backlog for clang-format that I hope to
> get to soon -- the usual constraints are that the options are
> supported in all LLVMs we support (there are some options that I have
> to take a look into that weren't available back when we added the
> config),

Since clang format is an entirely optional thing, I don't think we
should care about old versions when inconvenient. Perhaps stick to the
very latest version.

> and to try to match the style of as much as the kernel as
> possible (i.e. since different files in the kernel do different
> things).

You can have per directory .clang-format files to account for this. Eg.
net/ can have its own file that allows their silly comment style etc.

I suppose include/linux/ is going to be a wee problem..

Still, in general I don't like linters, they're too rigid, its either
all or nothing with those things.


And like I said, in my neovim-lsp adventures, I had to stomp hard on
clang-format, it got in the way far more than it was helpful.
