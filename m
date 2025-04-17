Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1381E1DEB;
	Thu, 17 Apr 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877927; cv=none; b=oQ1L3IiOlUj52KxHm7dr0CIly9ZyNmBVwz59NWuqHBfY6fArLQssp9KMpWZ5SavnVIBpyYs91D3d/GR5xVC0PZMg6nvXXpn87xiuXat9YSj9ys740OYEOTExtFn29QqujlB+2Pew18qRconsJAK7bxzy0fs8cB7NqWn1x3nHhIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877927; c=relaxed/simple;
	bh=zC243CWaGHrRpNw8U3+qfH+cJdWLLBF4X7QNIS9gMOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jyiig/GUIiL+OEuJy3zmWDSsKwDwwP57n/b2Qb8JxtJGMVxUTomc2nvYuz11nKMomm+zrfPrDUQpQNbvoj1Y0O2kXjq+W8574h2ftkENhcdAAmdZYm5pVcBDL8suM2ryLclwoIwl7LGEjhM5Pk5J79GNoGqm+UMDGBp4rPv36GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jh4iia2K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jh4iia2K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WKoL6w1HyHLnuQ/jvQEFAqz9pICEkBt7xFqHH3Bwd5s=; b=jh4iia2KiL7+R9HJiEpgOus2Mv
	PvXZjcr/9if5+xFG8wv0HXx8TfBbCjrRynAoyIEHToRnX2LGQ0uVPKOHtOUuQIrTeP1xWjykp35Eq
	uN5Xp3yplbpo4kjEx9kYoygI4/0csQizM184Fry+JQi2uSt/dBBR2Xt818GCfBZcdjO5W7d5vIWFx
	K6QYqBIS///546kD4Wl9xlFdUOciDf3aViDVrkNUOLqjgX77OkXynzOZWgFPR4WFnyKb5SnpIp4+g
	+m2b4kp1hEDq8tdBSXCxAi7jj90QTZldzERvyQJp5RPsI0ugJ8pWROFvHaRRyZ9KPXBq8oGRnzFOI
	yDNJrJsw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KRv-0000000B54Y-3gyc;
	Thu, 17 Apr 2025 08:18:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 337E9300619; Thu, 17 Apr 2025 10:18:18 +0200 (CEST)
Date: Thu, 17 Apr 2025 10:18:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>,
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
Message-ID: <20250417081818.GJ38216@noisy.programming.kicks-ass.net>
References: <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net>
 <202504161442.66CE2596@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202504161442.66CE2596@keescook>

On Wed, Apr 16, 2025 at 02:51:55PM -0700, Kees Cook wrote:
> On Wed, Apr 16, 2025 at 10:20:40PM +0200, Peter Zijlstra wrote:
> > On Tue, Apr 15, 2025 at 05:15:31PM +0200, Miguel Ojeda wrote:
> > > On Thu, Apr 10, 2025 at 4:00 PM Alice Ryhl <aliceryhl@google.com> wrote:
> > > >
> > > > I submitted a PR that I believe should fix it:
> > > > https://github.com/rust-lang/rust/pull/139632
> > > 
> > > This landed, scheduled for Rust 1.88 (2025-06-26) if all goes well.
> > > 
> > > Peter: are you OK with landing a patch like this? Well, modified to
> > > look like this now that we know the version:
> > > 
> > >     depends on FINEIBT
> > >     depends on !RUST || RUSTC_VERSION >= 108800
> > > 
> > > (assuming we confirm the nightly build works properly)
> > 
> > I don't much like it -- disabling FineIBT at config time like this also
> > kills the CFI type rehash.
> 
> This isn't disabling CONFIG_FINEIBT (which gates cfi_rand), it's making
> FineIBT not enabled by default at boot time. This is actually when I
> created CONFIG_CFI_AUTO_DEFAULT: to be able to have kCFI _with_ type
> rehashing still enabled.

Urgh, yeah, reading hard :-/

OK, Ack
