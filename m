Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03ED284B2D;
	Thu, 10 Apr 2025 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288571; cv=none; b=n0yERUpFBV87ngkA/zrNXzIdtU+w8KP05z6txjLifv8mlXfe62Dtc5ZWo567P/61N2cs0WYU9fHVFEey6nkMNn2kCFpDC+ds0YcXmru08bsJd08y4+kWchrlIgwClg5xQOxKFAmkSG+yuXidJoKLAfFOyNehnjuuu193lotidPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288571; c=relaxed/simple;
	bh=cVn7xC89saiR5jp0eerjt3p5ElXNnkdnhDGtjaUlakc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuVJCc77jCQtzxp4lACAp1aceMg4PDoV1G5wF+c1r3nPkf4axmoRytTnt6v/vyYeyByIvL1t/gfDxmhf9+KsFQI6/esGXBwNx59jNWCPaH3fPa4aUM2L1n9ERTz5xb4aftOEJnbEWrW/Vtiix80Z4Enn+5j6nvhF23qjuXWs3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IBN7vqvE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IBN7vqvE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6v0kO3/lMWo2fqBA7CjDAKubyui1E7t9KE+4SAsf10I=; b=IBN7vqvELx2pY76GWah1i6BGEw
	boBHpT1OJ3xYkaTooLgeWpWPqebgyU2dGKJOLvrIIbaFPmLH92JIgLqBKgQlm8SK2VjMQsW7tyD2k
	vS7ObJURtsGJQW7mz3RNdetrScd+42ha53K8hIu094LtvXYf3eO4nuwKc4oVO5ct9gh4Iv6CSIu+e
	BI2m5t2vWrGnObIN7hSBaDP55uAU/5CiPvniAsWXv0LpKm0WFOxIEKxArTt4k2SN0GaJz71Xo1LKT
	c0Zt9ER9CN0UDyUMzFd6IZa1sTITeE7YZt51wwVTEcz5lycTbVE19VqVBKwtJs8+q7AsPpwL56MWN
	SZnwgy4w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r8U-00000002su8-0Eg1;
	Thu, 10 Apr 2025 12:36:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4CA723003FA; Thu, 10 Apr 2025 14:36:02 +0200 (CEST)
Date: Thu, 10 Apr 2025 14:36:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
Message-ID: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410115420.366349-1-panikiel@google.com>

On Thu, Apr 10, 2025 at 11:54:20AM +0000, Paweł Anikiel wrote:
> Calling core::fmt::write() from rust code while FineIBT is enabled
> results in a kernel panic:
> 
> [ 4614.199779] kernel BUG at arch/x86/kernel/cet.c:132!
> [ 4614.205343] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [ 4614.211781] CPU: 2 UID: 0 PID: 6057 Comm: dmabuf_dump Tainted: G     U     O       6.12.17-android16-0-g6ab38c534a43 #1 9da040f27673ec3945e23b998a0f8bd64c846599
> [ 4614.227832] Tainted: [U]=USER, [O]=OOT_MODULE
> [ 4614.241247] RIP: 0010:do_kernel_cp_fault+0xea/0xf0
> [ 4614.246621] Code: c6 15 8d ad ac 48 0f 44 f1 48 8d 04 80 48 8d 14 45 d0 37 42 ac 48 c7 c7 22 99 bb ac e8 9f 7a 05 00 0f 0b eb 9a 67 0f b9 40 12 <0f> 0b cc cc cc cc 66 0f 1f 00 41 81 ea 00 00 00 00 74 03 0f 0b 90
> [ 4614.267606] RSP: 0018:ffffb95acfa4b978 EFLAGS: 00010097
> [ 4614.273464] RAX: 0000000000000057 RBX: ffffb95acfa4b9b8 RCX: 3ff1c813cb576300
> [ 4614.281426] RDX: ffff9a50b792b8d0 RSI: ffff9a50b791d548 RDI: ffff9a50b791d548
> [ 4614.289408] RBP: ffffb95acfa4b980 R08: 0000000000000d7c R09: ffffffffad45d500
> [ 4614.297399] R10: 0000000000002874 R11: 0000000000000004 R12: 0000000000000000
> [ 4614.305369] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000003
> [ 4614.313345] FS:  000076fa106dcfe8(0000) GS:ffff9a50b7900000(0000) knlGS:0000000000000000
> [ 4614.322386] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 4614.328806] CR2: 000076f8fc207bd0 CR3: 0000000227242000 CR4: 0000000000f52eb0
> [ 4614.336777] PKRU: 55555554
> [ 4614.339786] Call Trace:
> [ 4614.342524]  <TASK>
> [ 4614.344867]  ? __die_body+0x69/0xb0
> [ 4614.348786]  ? die+0xa9/0xd0
> [ 4614.352000]  ? do_trap+0x89/0x160
> [ 4614.355721]  ? do_kernel_cp_fault+0xea/0xf0
> [ 4614.360413]  ? handle_invalid_op+0x69/0x90
> [ 4614.364985]  ? do_kernel_cp_fault+0xea/0xf0
> [ 4614.369654]  ? exc_invalid_op+0x36/0x60
> [ 4614.373959]  ? asm_exc_invalid_op+0x1f/0x30
> [ 4614.378643]  ? do_kernel_cp_fault+0xea/0xf0
> [ 4614.383335]  ? do_kernel_cp_fault+0x31/0xf0
> [ 4614.388005]  exc_control_protection+0x49/0x70
> [ 4614.392871]  asm_exc_control_protection+0x2b/0x60
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
> 
> This makes rust currently incompatible with FineIBT. Add a Kconfig
> dependency that prevents FineIBT from getting turned on by default
> if rust is enabled.

Why ?!, what's wrong with removing that no_sanitize() instead?

How is it still compatible with kCFI and not with FineIBT?

NAK
