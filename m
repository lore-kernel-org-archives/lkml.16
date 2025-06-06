Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3111E8854
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194444; cv=none; b=TwO7+QMLjuGPTvzvTbRKxuth1tgGca7ogTxCl+t87/9E6QDvXeuEYF5mBA0B4TMoT7HVt+7lGmfpEUjZzHWMUKnjz4Kq0N3RlPGxgRMMKnUWjw9+Pi1ju5oFu835zzpvNm6Sl+sDAMSJun11PzTfwbFBF9p8+QNyhqo5vRcKnQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194444; c=relaxed/simple;
	bh=M5kQoi5l1F2xbAXjsDY23Sg7Oydzs2CnUoi9pUyGZCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCs24gEG4P7tQvkgVPw8P/SkaOa/DP0tPdGGS3G0Ku2Ow2WzLlhMMxeEV7HzOyyJDAq/5PrXXYLX/qKzlv1NJbXe5m2bug3iy8kiULYo0Pj2etAp7IQqLJdy8vO9XmVEg3pbfun6dduukibsor4LVfMg69k9iAML1MpTSLhtIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=haPpsRB9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="haPpsRB9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PdNEXa7Mfg5Ci5v52BoSQ6Y+Zcd15/jWdQFozBU5faM=; b=haPpsRB90nFNKX2XcfcOyirEe3
	MC4eqbh9RqsC0mMFvxNH4nEtbewWsd7CyVf20Ck3e8p/ln4fXJwa4V7iEp/X2yISevpXErj7jAGau
	Cly8m+3S6wHqnJfoeVWWgU+xT/mb+c43hvvHvahNAeA3KYYPFG4+tP3ccCMDe8lwmzkEWVsoOZn1l
	EnLMuKBMjeCfvhF8/BM+fDrqyHIl0S07+6XA7Z+WR3sQKyB5K2XaK57N5j4JSFhhDAJlIGEm2o2Ns
	qZPJu3hOo61XJCwnN0rvj6rnMqQqSZi88CHzNmxNUmBmqYJjYnyAdWYB/kjxL3RATObw1zQj1gzDb
	VfdY/3Xg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRNP-00000001FMn-0ssN;
	Fri, 06 Jun 2025 07:20:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ECF1E30078B; Fri,  6 Jun 2025 09:20:29 +0200 (CEST)
Date: Fri, 6 Jun 2025 09:20:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, torvalds@linux-foundation.org,
	mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250606072029.GI30486@noisy.programming.kicks-ass.net>
References: <20250605164733.737543-1-mjguzik@gmail.com>
 <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4b1dQO3biWvRoHfpyE-Bot0urmWDzxfO0dEverzuQOpdA@mail.gmail.com>
 <CAFULd4Zito-1VasojoL7qZdu_yggDgQL_0qMSv6ZBrtMe3i1zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4Zito-1VasojoL7qZdu_yggDgQL_0qMSv6ZBrtMe3i1zA@mail.gmail.com>

On Fri, Jun 06, 2025 at 08:27:39AM +0200, Uros Bizjak wrote:
> On Fri, Jun 6, 2025 at 8:13 AM Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > On Thu, Jun 5, 2025 at 9:00 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> > > > gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> > > > comes with a significant penalty on CPUs without the respective fast
> > > > short ops bits (FSRM/FSRS).
> > >
> > > I don't suppose there's a magic compiler toggle to make it emit prefix
> > > padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
> > > right?
> > >
> > > Something like:
> > >
> > >    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)
> >
> > This won't fly, because gas complains:
> >
> > z.s: Assembler messages:
> > z.s:1: Error: same type of prefix used twice
> 
> However, it is possible to use " cs ; cs ; cs ; rep movsb". 

Heh, the way I encoded it was:

	.byte 0x2e, 0x2e, 0x2e
	rep movsb %ds:(%rsi), %es:(%rdi)

GCC compiled it, and then objdump grokked it (although it outputs one CS
too few). Your variant is much nicer though.

> We can add a compile flag to the compiler, and it will be able to emit
> the desired sequence.

Thanks; Linus, this would be acceptable?

