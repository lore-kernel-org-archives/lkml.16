Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE1320897F;
	Fri, 18 Apr 2025 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969550; cv=none; b=MRp5IvfIubEQthS9k46Se6J/o2UU5bKgwZhHs2oUKw7Am2vSsSgLYCpSacksScRmcoDehfE6qqrYQIaDOnxMWGOIEoj0Ns8V2AIVSH195XYtsYkAx/jLKm93KxhH3ejD9v1rBueo+wGT01d5uPBO0hZQAUuFY2YLaeyK3BVCOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969550; c=relaxed/simple;
	bh=/VWk/qu/0SLEGpG0adrMSRjkwdkd7Frqc1J6jZHqJZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbmaHbNuKWDbW7Cb+ZPEXAGp4wmUWegYkc4qu2AzLKhI3hAeL77P+WhVOz6qCzZPdRgFJAM2j+NIPDQskSgp0+0tep+s2Xx72k+T0UDaj/X4mSDANNI39eosRxTSJeKFUTNI5G/tsjYowO1rt4iL74G7CgN1N7vfvyaRMJfUNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Il525ew/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Il525ew/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sIOGNKasiXmdrAug0qXJ+2iRTYzL03tYy35iVUrubZc=; b=Il525ew/r4P1f0A3Mg9F7+nTRf
	vRmuZuMJISMCS+R+mq7UQoFIJvH45DNRPQQKpTl5XbiTTVpcGcOsp7PVS2ztWmixHWTMVtV4V3ERy
	aqKKCHOPSfx9LqzLe2TILAut33vCTvaTXqG6znyvu+cUITHRxx0YfWLVq//O8mEf6jUMZS8JuBach
	SGx3gF4Sn42oNj+TAEYNlAyWSPOGULVYXsskjj369eSCkjNy6B2CNxjhFbp1ao09ptiNYJcAatu/V
	IxuaIfP5Rqcf5CHzDMspX7J8hZ5VvinfaoTF7OphAOYZFyrlQGavSlLxka0xnc+a7D+yn1qHW7Ot2
	A+i/m7XA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iHj-0000000Cdoy-2oOK;
	Fri, 18 Apr 2025 09:45:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2B671300619; Fri, 18 Apr 2025 11:45:22 +0200 (CEST)
Date: Fri, 18 Apr 2025 11:45:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
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
Message-ID: <20250418094521.GQ38216@noisy.programming.kicks-ass.net>
References: <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net>
 <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net>
 <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net>
 <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>

On Thu, Apr 17, 2025 at 08:40:24PM +0200, Miguel Ojeda wrote:

> From 2c6636c82f8c6c18e18c085fe69d0cd3dbe3b991 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>
> Date: Thu, 10 Apr 2025 11:54:20 +0000
> Subject: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST or Rust >=
>  1.88
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Calling core::fmt::write() from rust code while FineIBT is enabled
> results in a kernel panic:
> 
> [ 4614.199779] kernel BUG at arch/x86/kernel/cet.c:132!
> [ 4614.205343] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [ 4614.211781] CPU: 2 UID: 0 PID: 6057 Comm: dmabuf_dump Tainted: G     U     O       6.12.17-android16-0-g6ab38c534a43 #1 9da040f27673ec3945e23b998a0f8bd64c846599
> [ 4614.227832] Tainted: [U]=USER, [O]=OOT_MODULE
> [ 4614.241247] RIP: 0010:do_kernel_cp_fault+0xea/0xf0

Might want to 'compress' the splat a bit, lots of useless bits on etc.

> [ 4614.398144] RIP: 0010:_RNvXs5_NtNtNtCs3o2tGsuHyou_4core3fmt3num3impyNtB9_7Display3fmt+0x0/0x20
> [ 4614.407792] Code: 48 f7 df 48 0f 48 f9 48 89 f2 89 c6 5d e9 18 fd ff ff 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 41 81 ea 14 61 af 2c 74 03 0f 0b 90 <66> 0f 1f 00 55 48 89 e5 48 89 f2 48 8b 3f be 01 00 00 00 5d e9 e7
> [ 4614.428775] RSP: 0018:ffffb95acfa4ba68 EFLAGS: 00010246
> [ 4614.434609] RAX: 0000000000000000 RBX: 0000000000000010 RCX: 0000000000000000
> [ 4614.442587] RDX: 0000000000000007 RSI: ffffb95acfa4ba70 RDI: ffffb95acfa4bc88
> [ 4614.450557] RBP: ffffb95acfa4bae0 R08: ffff0a00ffffff05 R09: 0000000000000070
> [ 4614.458527] R10: 0000000000000000 R11: ffffffffab67eaf0 R12: ffffb95acfa4bcc8
> [ 4614.466493] R13: ffffffffac5d50f0 R14: 0000000000000000 R15: 0000000000000000
> [ 4614.474473]  ? __cfi__RNvXs5_NtNtNtCs3o2tGsuHyou_4core3fmt3num3impyNtB9_7Display3fmt+0x10/0x10
> [ 4614.484118]  ? _RNvNtCs3o2tGsuHyou_4core3fmt5write+0x1d2/0x250
> 
> This happens because core::fmt::write() calls
> core::fmt::rt::Argument::fmt(), which currently has CFI disabled:
> 
> library/core/src/fmt/rt.rs:
> 171     // FIXME: Transmuting formatter in new and indirectly branching to/calling
> 172     // it here is an explicit CFI violation.
> 173     #[allow(inline_no_sanitize)]
> 174     #[no_sanitize(cfi, kcfi)]
> 175     #[inline]
> 176     pub(super) unsafe fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> 
> This causes a Control Protection exception, because FineIBT has sealed
> off the original function's endbr64.

Right, doing an indirect call without the CFI adornment to a CFI adorned
function is explicitly not supported.

> This makes rust currently incompatible with FineIBT. Add a Kconfig
> dependency that prevents FineIBT from getting turned on by default
> if rust is enabled.
> 
> [ Rust 1.88.0 (scheduled for 2025-06-26) should have this fixed [1],
>   and thus we relaxed the condition with Rust >= 1.88.
> 
>   When `objtool` lands checking for this with e.g. [2], the plan is
>   to ideally run that in upstream Rust's CI to prevent regressions
>   early [3], since we do not control `core`'s source code.

I'm still firmly of the opinion Rust should grow up and have a stable
core which we can pull into the kernel. Relying on that much out of tree
code is 'unfortunate'.

>   Alice tested the Rust PR backported to an older compiler.
> 
>     - Miguel ]
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Peter Zijlstra <peterz@infradead.org>
> Link: https://github.com/rust-lang/rust/pull/139632 [1]
> Link: https://lore.kernel.org/rust-for-linux/20250410154556.GB9003@noisy.programming.kicks-ass.net/ [2]
> Link: https://github.com/rust-lang/rust/pull/139632#issuecomment-2801950873 [3]
> Link: https://lore.kernel.org/r/20250410115420.366349-1-panikiel@google.com
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  arch/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 4b9f378e05f6..5873c9e39919 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2368,6 +2368,7 @@ config STRICT_SIGALTSTACK_SIZE
>  config CFI_AUTO_DEFAULT
>  	bool "Attempt to use FineIBT by default at boot time"
>  	depends on FINEIBT
> +	depends on !RUST || RUSTC_VERSION >= 108800
>  	default y
>  	help
>  	  Attempt to use FineIBT by default at boot time. If enabled,
> 
> base-commit: c1b4071ec3a6a594df6c49bf8f04a60a88072525
> -- 
> 2.49.0
> 

