Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5C28C5C0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290789; cv=none; b=GF3SjVY9jRjkKI7178gcRD5edUYxyrtwlYJ1VfannU1aKOU56HeaRS+di7uYSZvgG/W+8ukcASN+LVkup2znyEmST8bK2zYFkbet4PLQAgxkQS1zLXxIXHO9QZ7usKXKbpp+JEfGW2SayJvl2zlWYwmtf1MbXxn6RT2LWkwASgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290789; c=relaxed/simple;
	bh=hONinfDjvOw8gTQfpwaYCDvuvi1OXqjyAAyhe4SC7qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEbwPGfWypBgFIAfXN2zbBIpifF0ykpO0jOFOAJ7i6UZD7RxriyzX9vlk5+7DHXFtl6eZ0nl2qKzOAJ7spRK2mNoPEynpvYMQI6jJNyM8iTh8zShKriRDPKRm6pmBMsaBFiC7BCnVDR8s8BI2/HeeZLc/Ua1d9YIxqi9iaXS2R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrS12oEQ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrS12oEQ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e904f53151so6442226d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744290786; x=1744895586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS2L2zF8hjS4Jep3FrFd2D8wosPq+a76cdZ3GpjU6uM=;
        b=zrS12oEQYXuzSwnBXiOpUyNsqTQ09gxop7k5o0+1oEX1PPlxrZwL66bdrU94qYckYR
         Jz6GojYgHWnVWBujnmFW30oUw8gyL5+bIzn/uEr4jZxlN+xjAtlFUOu94D5/18mOljdQ
         U1VfAZF8BY9OxoHLUZU47sSnAMgI4BbOv5SQy0CE5KTCvg3I3FcIEMU35jBwHAXtg6d4
         3tsBeMWTFrTYH5CogZyqpzShzCgfhy+4e5ngnJRd9fiCoa7m54GLHBOgv161GuOWjh07
         oabwTY+dpaxzp7qEZA19Mkk5xRZxEI8mKJXqdz4VP1AxRsHjq05yaXyrPpwVnx/F55Gu
         Is+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290786; x=1744895586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS2L2zF8hjS4Jep3FrFd2D8wosPq+a76cdZ3GpjU6uM=;
        b=pnRt5HCSTK1xOGIisZKyQZ06WIBNW+gd4KYUIMe61LBltADEpVmIGsyDvg2MveGo3+
         1/OJ/I2TrSc8JIX6z4hi8rXzfXeAQcDUAusw577dPrcb7sJPfr5+7ht+aDwBz4NsL56o
         BbHYA9F3utW0NXgWEB27wi341PTNrPhLacvxiSYPQpZi1lS6wfl6Hv05fSiz4TZ/hbrK
         LRSD21Z6xZCNliS5kXnaXJNjgW69soq/aSZt75R3XyLi9Aya5gqYGLvWNdxCuiv30NyS
         hdVqhl1d8xhdhGytpQokmyGTJo0pJBc68m6xQOZuKYl6pSXF1YZkZGgjYJiBXAw5IIOd
         ri5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3G7t81QuWlQA8pRM3nphAhDaOL6TSvqOM4EkucxXiLOHnriMPlklH4FaDRZmMWV/0pU68tAv7/zizX80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4JSOLjcov97OjXo6ENaPhNynlfvH044zHtUN9+SZz8vzqy/X
	CWTwZL3/PDhKvfFryO4AIHUrSfC3mJsLsT+OM4F58K8Z+FLO/p2eTYS3VcjLigoo8dhu5pHe807
	ot422wpWXd6QwP5i3lSUQEVL36+LUonv1apkl
X-Gm-Gg: ASbGncsDQP2sPR0ApYu/A+Z/9fWM9hnWzF7stGWskvLqK85NyQqxQwSK+mAUTAAVy42
	aJr3gKCw0xZHUj5yScp24SmwJqm3Js2sibUB/ZnwXM/A1Xu6oVRc+0vGZByUstsqcawMhj9iQZQ
	UsgmO1gbO32goSC5avEUIhBjqvf0tDv4U8300fPbosxd7kRHSY4j8JcbaN7H9J
X-Google-Smtp-Source: AGHT+IEMGZpmMkc9w98wb18hYpZHORs197OKREtKuvP6GVu0WBPBxw4j21haL1/dVQiyH/8deyilkETszBXcmkWQGsM=
X-Received: by 2002:a05:6214:76b:b0:6e6:6c39:cb71 with SMTP id
 6a1803df08f44-6f0e77e411cmr29042496d6.45.1744290785862; Thu, 10 Apr 2025
 06:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410124526.GB9833@noisy.programming.kicks-ass.net>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Thu, 10 Apr 2025 15:12:54 +0200
X-Gm-Features: ATxdqUFjrZQhmNWxroR0rPrXfuuVe8x9q-ptUlOJNkaWbM8mw6et4QcW2KhoU-M
Message-ID: <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 2:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 02:36:02PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 10, 2025 at 11:54:20AM +0000, Pawe=C5=82 Anikiel wrote:
> > > Calling core::fmt::write() from rust code while FineIBT is enabled
> > > results in a kernel panic:
> > >
> > > [ 4614.199779] kernel BUG at arch/x86/kernel/cet.c:132!
> > > [ 4614.205343] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> > > [ 4614.211781] CPU: 2 UID: 0 PID: 6057 Comm: dmabuf_dump Tainted: G  =
   U     O       6.12.17-android16-0-g6ab38c534a43 #1 9da040f27673ec3945e23=
b998a0f8bd64c846599
> > > [ 4614.227832] Tainted: [U]=3DUSER, [O]=3DOOT_MODULE
> > > [ 4614.241247] RIP: 0010:do_kernel_cp_fault+0xea/0xf0
> > > [ 4614.246621] Code: c6 15 8d ad ac 48 0f 44 f1 48 8d 04 80 48 8d 14 =
45 d0 37 42 ac 48 c7 c7 22 99 bb ac e8 9f 7a 05 00 0f 0b eb 9a 67 0f b9 40 =
12 <0f> 0b cc cc cc cc 66 0f 1f 00 41 81 ea 00 00 00 00 74 03 0f 0b 90
> > > [ 4614.267606] RSP: 0018:ffffb95acfa4b978 EFLAGS: 00010097
> > > [ 4614.273464] RAX: 0000000000000057 RBX: ffffb95acfa4b9b8 RCX: 3ff1c=
813cb576300
> > > [ 4614.281426] RDX: ffff9a50b792b8d0 RSI: ffff9a50b791d548 RDI: ffff9=
a50b791d548
> > > [ 4614.289408] RBP: ffffb95acfa4b980 R08: 0000000000000d7c R09: fffff=
fffad45d500
> > > [ 4614.297399] R10: 0000000000002874 R11: 0000000000000004 R12: 00000=
00000000000
> > > [ 4614.305369] R13: 0000000000000000 R14: 0000000000000000 R15: 00000=
00000000003
> > > [ 4614.313345] FS:  000076fa106dcfe8(0000) GS:ffff9a50b7900000(0000) =
knlGS:0000000000000000
> > > [ 4614.322386] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [ 4614.328806] CR2: 000076f8fc207bd0 CR3: 0000000227242000 CR4: 00000=
00000f52eb0
> > > [ 4614.336777] PKRU: 55555554
> > > [ 4614.339786] Call Trace:
> > > [ 4614.342524]  <TASK>
> > > [ 4614.344867]  ? __die_body+0x69/0xb0
> > > [ 4614.348786]  ? die+0xa9/0xd0
> > > [ 4614.352000]  ? do_trap+0x89/0x160
> > > [ 4614.355721]  ? do_kernel_cp_fault+0xea/0xf0
> > > [ 4614.360413]  ? handle_invalid_op+0x69/0x90
> > > [ 4614.364985]  ? do_kernel_cp_fault+0xea/0xf0
> > > [ 4614.369654]  ? exc_invalid_op+0x36/0x60
> > > [ 4614.373959]  ? asm_exc_invalid_op+0x1f/0x30
> > > [ 4614.378643]  ? do_kernel_cp_fault+0xea/0xf0
> > > [ 4614.383335]  ? do_kernel_cp_fault+0x31/0xf0
> > > [ 4614.388005]  exc_control_protection+0x49/0x70
> > > [ 4614.392871]  asm_exc_control_protection+0x2b/0x60
> > > [ 4614.398144] RIP: 0010:_RNvXs5_NtNtNtCs3o2tGsuHyou_4core3fmt3num3im=
pyNtB9_7Display3fmt+0x0/0x20
> > > [ 4614.407792] Code: 48 f7 df 48 0f 48 f9 48 89 f2 89 c6 5d e9 18 fd =
ff ff 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 41 81 ea 14 61 af 2c 74 03 0f 0b =
90 <66> 0f 1f 00 55 48 89 e5 48 89 f2 48 8b 3f be 01 00 00 00 5d e9 e7
> > > [ 4614.428775] RSP: 0018:ffffb95acfa4ba68 EFLAGS: 00010246
> > > [ 4614.434609] RAX: 0000000000000000 RBX: 0000000000000010 RCX: 00000=
00000000000
> > > [ 4614.442587] RDX: 0000000000000007 RSI: ffffb95acfa4ba70 RDI: ffffb=
95acfa4bc88
> > > [ 4614.450557] RBP: ffffb95acfa4bae0 R08: ffff0a00ffffff05 R09: 00000=
00000000070
> > > [ 4614.458527] R10: 0000000000000000 R11: ffffffffab67eaf0 R12: ffffb=
95acfa4bcc8
> > > [ 4614.466493] R13: ffffffffac5d50f0 R14: 0000000000000000 R15: 00000=
00000000000
> > > [ 4614.474473]  ? __cfi__RNvXs5_NtNtNtCs3o2tGsuHyou_4core3fmt3num3imp=
yNtB9_7Display3fmt+0x10/0x10
> > > [ 4614.484118]  ? _RNvNtCs3o2tGsuHyou_4core3fmt5write+0x1d2/0x250
> > >
> > > This happens because core::fmt::write() calls
> > > core::fmt::rt::Argument::fmt(), which currently has CFI disabled:
> > >
> > > library/core/src/fmt/rt.rs:
> > > 171     // FIXME: Transmuting formatter in new and indirectly branchi=
ng to/calling
> > > 172     // it here is an explicit CFI violation.
> > > 173     #[allow(inline_no_sanitize)]
> > > 174     #[no_sanitize(cfi, kcfi)]
> > > 175     #[inline]
> > > 176     pub(super) unsafe fn fmt(&self, f: &mut Formatter<'_>) -> Res=
ult {
> > >
> > > This causes a Control Protection exception, because FineIBT has seale=
d
> > > off the original function's endbr64.
> > >
> > > This makes rust currently incompatible with FineIBT. Add a Kconfig
> > > dependency that prevents FineIBT from getting turned on by default
> > > if rust is enabled.
> >
> > Why ?!, what's wrong with removing that no_sanitize() instead?

I'll let the rust maintainers answer this one.

> >
> > How is it still compatible with kCFI and not with FineIBT?

kCFI keeps the original function's endbr64. If a callsite disables
CFI, it simply jumps to that function (without any magic value
checks), the endbr64 is there, so no #CP.

With FineIBT, the original function's endbr64 gets replaced with a
nop, and the callsite is supposed to be modified to jump to the CFI
preamble. With CFI disabled, that modification doesn't happen
(cfi_rewrite_callers() quietly ignores that callsite), so we jump to
the nop, and we get a #CP.

>
> FWIW, CFI violations of any kind are a no-no. They're not accepted in C
> and they're not accepted in Rust. This is clearly a Rust bug that needs
> to be fixed ASAP. Disabling CFI is not an option.

This is a known issue, but it doesn't seem to have high priority:
https://github.com/rust-lang/rust/issues/115199
