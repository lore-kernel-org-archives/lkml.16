Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF6ADDDC;
	Wed, 16 Apr 2025 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840319; cv=none; b=O715mcMh9MWQTC2DxeKI7hwcnLG2ryzDTY+Cbe8e7JSeKHd7zdEZhLqBaq8vsxpH5cxVGSlX/DxGe/x74LJ7mMcqoJbusvM4c3C8FHzhkaaB9ac9GIxhPpVQlrN9kKemmF69AiY5DScux+75RT2/aUAEGrU5eEtAvLWPExOA6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840319; c=relaxed/simple;
	bh=41OMhVN3An+hHekXXsR4xAJaKfMiYVVQ6T1BBojs4e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa4vnF4UOMScFnyqaRM6r4M9F59ygGc4lVndT1KuEdjp/LmER6bSLSlNY+SeasvtKwWwYpt0lhtLqydlbka1LbN/b+9QozHbaBpWWs9mY1DcDxcpx3WHkZ2GlkeBAtQNDi3s05jWG0IzJfosb7NRWmctNde4O5G+iP/ooAGsKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXMDbb7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXMDbb7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CC1C4CEE2;
	Wed, 16 Apr 2025 21:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744840318;
	bh=41OMhVN3An+hHekXXsR4xAJaKfMiYVVQ6T1BBojs4e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXMDbb7zq3A2BRkkETWJcA5VlnQYC0I6DhaD5oCEQhe2CfFrbYyQKTz7QoDOyaosO
	 4jUrilKE+4L5+jW6Uu+snPbBTpq3AX5S4IqCHNQo4xyj2v9PMc0n4XsKEUC118vY8W
	 Sbedy+Q+fV+SdbCJLV9KCjQo/WZGaw9SHkQCSHgyjpUZvD38fVinvuUljgvWOqoOD2
	 +sFM6rdNZar3NEknmV6T6qqAU6XJaIE7Ks7HCPTqJVE0Do5O9oXzPls/pWz5ZAmhec
	 0wPP943m3fgVvCqle3jmID66ZW0FJUh5lqf9y6PhNlR575cdazW44zKInCW/x32Z/H
	 CQw+mtP0g4huQ==
Date: Wed, 16 Apr 2025 14:51:55 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <202504161442.66CE2596@keescook>
References: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416202040.GD38216@noisy.programming.kicks-ass.net>

On Wed, Apr 16, 2025 at 10:20:40PM +0200, Peter Zijlstra wrote:
> On Tue, Apr 15, 2025 at 05:15:31PM +0200, Miguel Ojeda wrote:
> > On Thu, Apr 10, 2025 at 4:00 PM Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > I submitted a PR that I believe should fix it:
> > > https://github.com/rust-lang/rust/pull/139632
> > 
> > This landed, scheduled for Rust 1.88 (2025-06-26) if all goes well.
> > 
> > Peter: are you OK with landing a patch like this? Well, modified to
> > look like this now that we know the version:
> > 
> >     depends on FINEIBT
> >     depends on !RUST || RUSTC_VERSION >= 108800
> > 
> > (assuming we confirm the nightly build works properly)
> 
> I don't much like it -- disabling FineIBT at config time like this also
> kills the CFI type rehash.

This isn't disabling CONFIG_FINEIBT (which gates cfi_rand), it's making
FineIBT not enabled by default at boot time. This is actually when I
created CONFIG_CFI_AUTO_DEFAULT: to be able to have kCFI _with_ type
rehashing still enabled.

> Not to mention that FineIBT is a Spectre-BHI
> mitigation, esp. with that arity thing on top.

That's certainly true, but the needed overlapping corner cases seem to
make this tolerable?

> I don't suppose we can simply mandate this rust version?

Perhaps capture the needed version in the Kconfig change at least, so it
becomes self-documenting.

-Kees

-- 
Kees Cook
