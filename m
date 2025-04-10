Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF852857C7;
	Thu, 10 Apr 2025 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294139; cv=none; b=DS0isx1oA1MMWxph/t46GpivyFgkIwS7JZfjhRknCmpddmCKkhWEOAKc71IeA8eifAyBTh6yHrxTQnohBNmYPQD2iHBsNAjJRYe6B+CLvhs9FlQ9rY7ctxrGvGIEudgczhnsB7igYebZQell0kNIqivZnM0/jk2/07CV7e7qf5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294139; c=relaxed/simple;
	bh=VTLvHKuTmbWi8p5/jt+YLvLtFZ+xMYkTT5BFHTA9bNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaXG07GjNxHGvacwW8TY2BWwMZi3d5wRPpHDBdQvYSFh2SkDSMNg8Th2vx6hZwVS9NVbG72YWOX1dmN9q0acMTTJ3yuTVh1/UvOLIhlc/r6WShUh/MU02Q/a9MLS9+/ZV5cb7ynEU0DPl74rSBO9dodJaT0IV5gjXMigv4qK5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VUfsNwVE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VUfsNwVE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QxgtQ5JKfKOHEwtSfyG+Wonf2mElgCsFlIe7Wt1b7Xc=; b=VUfsNwVEayjni0UTOGtDBCi+hc
	sL5R3AhZnLiqq+LJmQCgXLXVDMwm2L/+SSxlffDhKP3K0fJPaSROelzj92I3Pz9Xi8HLIXVgUph2A
	pU8qnDJtVOuXTl11b8REdeHHKX7d7egwZJdLBfzy/u52tTTyrqX0u5MiL37thiztEcetW+6WpXnf4
	sforPo937HDfCbWgQD+jbcoIm8tGONGaPb+BaigEY2qpNZEBQBPz7Q1JcwRPLZkYneZM/OJ9C40uf
	Dux+3LzREw9fnJ2bj5AycmtieDToEPzdztoVQPASqthIwex3hkGTweYGAHoTcDu7dVDatp5aG5SNo
	uaRAf6sw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2saI-00000002yqV-35tA;
	Thu, 10 Apr 2025 14:08:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BEC143003FA; Thu, 10 Apr 2025 16:08:50 +0200 (CEST)
Date: Thu, 10 Apr 2025 16:08:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Matthew Maurer <mmaurer@google.com>,
	Ramon de C Valle <rcvalle@google.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
Message-ID: <20250410140850.GH9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>

On Thu, Apr 10, 2025 at 03:59:53PM +0200, Alice Ryhl wrote:
> On Thu, Apr 10, 2025 at 3:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Apr 10, 2025 at 03:27:55PM +0200, Miguel Ojeda wrote:
> > > On Thu, Apr 10, 2025 at 3:26 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > New compiler can't build old core?
> > >
> > > No, that is not intended to work -- `core` is tied to the compiler.
> >
> > OMFG, you just gave me another reason to hate on this rust-bucket of a
> > language :-/ What language can't even build an old version of its own
> > runtime :-(
> 
> I don't think there's anything unreasonable about having a place to
> put logic that depends on compiler internals.

Having compiler internals exposed to such an extend that programs can
make use of them _is_ weird. It creates the whole problem of where to
put it.

C++ doesn't have anything like this afaik. Esp. if you disable rtti and
exception muck, you get a very minimal runtime. And even if you don't,
it certainly doesn't break every 6 weeks. ABIs and all that.

Maybe I've been living in C/C++ land for too long, but you either expose
a full language feature and then everybody can use it, runtime,
libraries and user code alike, or you don't.

> > Anyway, given this core nonsense is now CFI unsound, it is no longer
> > suitable to build the kernel. So either refrain from using part of the
> > core that trips this, or get it fixed asap.
> 
> I submitted a PR that I believe should fix it:
> https://github.com/rust-lang/rust/pull/139632

Thanks!
