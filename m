Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0A31FF1B0;
	Wed, 16 Apr 2025 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834849; cv=none; b=WTM86nIWzJVqLvHG7Y6Saj5sMc1Irr762uKNausRE0JokMxFcoCS7xcWAKdO/f6BT1xbcWPZwxkx8ONK1LYUCVPSgf6VRufO9IXC4ztOTjrAKnYX5sRazfh6NHfTUi7g89uCJjehEIKw4f0tMvIozox3Mn/cHpCmcag/w1j8HwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834849; c=relaxed/simple;
	bh=A4JKbQ1uMhF5YXJCF7NutZmWzbrcLVCbBd807TQ2xzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7o6gCc+p/rIcKfUHSQR7RmSTt+plsVvLND32zu2hu4LqNOx/zA4mgIrpKpK2B0e6ZVbSblOyRhuVYSC6Zl3bK1M5VaHgxkNyTmtTUjCnBdGTavPb9nAEeGwpYKe3pICLojZFc1fVMKQ8OtytE9Y+Fgrp/F+KnfPe0sOPVnFvuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p1TNMs0o; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p1TNMs0o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8hQ9yBdo+gWHumulcNGPsp6kYuNkj95wusn3V3lqSDo=; b=p1TNMs0oTAvt1v3aicpiYXDKRD
	OoPfoT2MuG8k/UU5xcBOZBwDOK6NVKp1IHwnUVtXwLRnEVz7X/MJHfRpbcvwxwle4OXZtlgz9hUku
	obrlT9YEE7Vp//cMNRAQ/CyzhHBxuTMye/D0M7vw9MKCk7PArFyxuvmXx8sqPdecYxWtFhQ4FnnEz
	zkrMprG22QYpEw+5E5+UBgiLozGYRR5vcYYSGYbQDzJKNZZm0OArkhUyVceRrJTVVwRacKS40dKzM
	PRv/dBV7gZVfyTZmxVBZ8Ni5jDpjSDCXKZ+08wFnS/I6wAs+CY/rf18Z+9a3GfjV0f7778Rg5697/
	fpqVyJtg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59FQ-0000000AVAK-0cMl;
	Wed, 16 Apr 2025 20:20:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4A3CF3003C4; Wed, 16 Apr 2025 22:20:40 +0200 (CEST)
Date: Wed, 16 Apr 2025 22:20:40 +0200
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
Message-ID: <20250416202040.GD38216@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>

On Tue, Apr 15, 2025 at 05:15:31PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 4:00 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > I submitted a PR that I believe should fix it:
> > https://github.com/rust-lang/rust/pull/139632
> 
> This landed, scheduled for Rust 1.88 (2025-06-26) if all goes well.
> 
> Peter: are you OK with landing a patch like this? Well, modified to
> look like this now that we know the version:
> 
>     depends on FINEIBT
>     depends on !RUST || RUSTC_VERSION >= 108800
> 
> (assuming we confirm the nightly build works properly)

I don't much like it -- disabling FineIBT at config time like this also
kills the CFI type rehash. Not to mention that FineIBT is a Spectre-BHI
mitigation, esp. with that arity thing on top.

I don't suppose we can simply mandate this rust version?

Speaking of which, I should go install this latest rust thing....
