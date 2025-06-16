Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE01FF1C4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064021; cv=none; b=a4gUKd8FB96IWU+JWIuKs2oVK/OKtIXarAF2HYnm6eDWW7ENFTLzuC3qPLPM/ZgiCbsLr4rmZe+XFyxK5hKHz0pVcAoXzIK52l3U8ApLIzx39uQSKSj8sNvASzUw1vpuEcIAv6YCfmc+k4R2z3rVyJxyAC/ezAXBaPxv8+xrRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064021; c=relaxed/simple;
	bh=2CzM/huwLy795YELRXwr9MKHcZzbxMKXswGC1tP508g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDhx/FTLGU2WjANZLjNvyrGGGzvCoVBa7ds18x3UKW3YbZ/DdlWls4Gg9IP3OUPnSBkW2KV/HztSeHnsknii87g9NW25Z4b6Ul2s8L3p77WQ9NuTVdJcCO1fiMVnTEiBx6ux8UqCw2kfFQIBiSvjVkqDmAX8rH2umt95b8vHNPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VbPiEL9K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VbPiEL9K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0GTF0zHAJo6j+2EKbFdmXlbmn7T0fWV+dKJyj+XLkNk=; b=VbPiEL9K0hXv3lF3GdgGZanHXz
	KD2+y7iJoDdmAaDA9KHEZGnMgn58+7i6Mmwuq/IXvjU6Dv7IfPNPECQPpZl/Gwc2HmOWqkardh8pY
	hYOCDdngm1vWACFx/qBzi9YLWqXSNp0uMMCZup2+kqnZXmNxPtMGTRV2rOEMWe9/kSKiMHgq51uy6
	Gx5THP4h5OHcX6fKKxhc+IiD2VBJiDU+cTBq6wUBID6IG8UkXmfc2Zq9ls8pj6HLRS9slwtigQ0Jg
	OXb+H0VSFBdWRy88Yx+Z7NnW+6L0m2brVahoEcR0zJ8kp8uKHMNiGfJcN0mQsb3/jMiJ8VyudRfsD
	lV/ZMSNA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5av-0000000Fl4w-3D15;
	Mon, 16 Jun 2025 08:53:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C0F4304A2A; Mon, 16 Jun 2025 10:53:32 +0200 (CEST)
Date: Mon, 16 Jun 2025 10:53:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/asm: Use RDPKRU and WRPKRU mnemonics in
 <asm/special_insns.h>
Message-ID: <20250616085332.GD1613376@noisy.programming.kicks-ass.net>
References: <20250616083611.157740-1-ubizjak@gmail.com>
 <20250616083944.GC1613376@noisy.programming.kicks-ass.net>
 <CAFULd4YQe=xb2-GH8EHLyiNQL=uCBZ7QAqmasyroT9ZhPoRRwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4YQe=xb2-GH8EHLyiNQL=uCBZ7QAqmasyroT9ZhPoRRwg@mail.gmail.com>

On Mon, Jun 16, 2025 at 10:47:58AM +0200, Uros Bizjak wrote:
> On Mon, Jun 16, 2025 at 10:39 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Jun 16, 2025 at 10:35:57AM +0200, Uros Bizjak wrote:
> > > Current minimum required version of binutils is 2.30,
> > > which supports RDPKRU and WRPKRU instruction mnemonics.
> > >
> > > Replace the byte-wise specification of RDPKRU and
> > > WRPKRU with these proper mnemonics.
> >
> > What about the minimal clang version and their integrated assembler?
> 
> Yes, it works with the minimum required clang version 13.0.1.

Excellent!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
