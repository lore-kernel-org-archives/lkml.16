Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146BB1DF261;
	Thu, 10 Apr 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298096; cv=none; b=UjPb72pSK9x7dfn4r8LV1ucGgxAOKxiCGi2Cax0QUz0iNy/7bhADNwzhnjsmz//m4YSPjwiGDGZokRqkrik6+c+8BtL+LS+BsJia7bqLhIrf6Qb12NckVwdTHdRfGURbXI35nGH2WZX9/FvNCTWO523b3gx8K1L10ffWJMCDq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298096; c=relaxed/simple;
	bh=JWJsSbuYyP7E/5P6BqQuKqrH4iz7lf4ac3XiJqgHNws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6ogq9+6eEOq3CYMHiIa1Dh+o+CQHLCCSMkqvLXBttsE19JelsTU2XZ6wfKBc4aVzViQ6noEzPLEDfX67CvkYFDk5dqI0Kr5O6HbU0admNZzlmgnshEupBTA4Impm9GYBc9PHHqKYbrkB/hAKSiWNU4BaiI3Rs1i6BoxXMUZuVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qavFG0w3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qavFG0w3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pH0Ut7hetGrbmTYmwu60hC2Wp1+T3H7RLfBhgkPhW8U=; b=qavFG0w3wPMQtc0IcNVdwGwb7q
	GS3hfaYnHEQoEND7m2WlYYoRxKe1QTpAHmZQysOCyaX4ILXyFfTen0WLtvKKwddaMbE/emV4ztCze
	Sg5PtjNjsJoPByjGsszdQ10ZPxkqmpN31DGluJildMzTO8ZjPAsjdlaTWG/mFqD7jgvcOnH2iIpRA
	xgrxdgxmRn7msorl9keFrvtpydOs5/js6TUbvq60ret7x1c3lVEGV7lso+P1AH4RHRl8VST9Cs91C
	/hU2I5BPwx2c1dSPiJ2Gci3ijl8NR/HBLJUY5stUxU6rO5WqgjRlEvdsTxMemYo9jWWoe5zuafStE
	0UfKhgVg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tc6-000000033VM-1Np7;
	Thu, 10 Apr 2025 15:14:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8C63F3003FA; Thu, 10 Apr 2025 17:14:46 +0200 (CEST)
Date: Thu, 10 Apr 2025 17:14:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
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
Message-ID: <20250410151446.GJ9833@noisy.programming.kicks-ass.net>
References: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <20250410140850.GH9833@noisy.programming.kicks-ass.net>
 <CANiq72kS8kfCcaqtG0KUN4Ywh6i4PHaFOg12jF+Y7CAb5SJLbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kS8kfCcaqtG0KUN4Ywh6i4PHaFOg12jF+Y7CAb5SJLbA@mail.gmail.com>

On Thu, Apr 10, 2025 at 04:54:20PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 4:08 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Maybe I've been living in C/C++ land for too long, but you either expose
> > a full language feature and then everybody can use it, runtime,
> > libraries and user code alike, or you don't.
> 
> I find it unlikely that C++ stdlibs happen to build and work properly
> with compilers they are not tested for. Say, MS' STL with GCC or
> libc++ with MSVC.

Ignoring MSVC, which is a horrible joke of a compiler (or did Sutter
finally cluebat that team into building a sane compiler?), there are
definitely cross compiler STL implementations around.

> At the very least, you need to agree on builtins or `#ifdef` stuff
> manually for magic bits, and you need to avoid to rely on any compiler
> detail (or bug... :) anywhere (say, the non-conforming template
> behavior from old MSVC), and so on. So you need an active effort to
> make it work, I would expect.

Again, with the exception of MSVC, Boost builds on most C++ compilers
and is the staging ground for many new library features.

> And with new complex features like modules, I find it even more
> unlikely the first implementations of a compiler's stdlib would happen
> to work on the first implementation of the feature of another
> compiler...

Sure, shit happens, but... at least they try, it *should* work.

And the old STL (although STL really is far more a library than runtime,
it being fully optional) will most certainly build on a new compiler
from the same family.

And I know Linus hates on C++ something mighty, but in this parallel
universe where he doesn't, I would still recommend the kernel to not use
STL and instead build its own libraries (or borrow some nice pieces here
and there).

> Now, it is true that Rust's `core` uses a lot of internal features,
> precisely because they don't expect to be built by anything else that
> the current (and current - 1) compiler, so they actually take
> advantage of that.

So I don't think this is a good thing. Even builtin stuff should be
more stable than this.

> It would perhaps be nice to split the "really requires magic" in
> `core` from the rest somehow. In this case it wouldn't have helped
> though, since the formatting machinery still uses builtins last time I
> looked.

Right, to the point where we can carry a copy of the non-magic part
locally that matches the minimum version requirement. And no other bits
are to be used by in-tree rust code.

> Relatedly, GCC Rust's goal is to build an old `core` at the moment, so
> that they have a fixed set of things to solve.

Very sensible. The Rust project should have an stable core subset / variant
:-)
