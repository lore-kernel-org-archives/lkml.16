Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088028F952
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358703; cv=none; b=MPQPVP7QUre6YoCKs4L/pV/tTwu/7FjIHoZp3Ix8LhDVUffR4P1cgTIPeBfp04JW18YNQVwswRjmV7DpeLdD6IPYt45+rGV75QQPpW2k5UNkfPMeO/WoUEwH542+CCoJ9BxYV0zVB19xqbHygAQZDmMnbOlTTK6VOevVEycykSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358703; c=relaxed/simple;
	bh=6VE+DhjJ/CNlU8qlEAH22RJnfVlayNkgvidu6F8WaX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTnBYKEX/xzXzVWLdIQwcnIQBdBe6/ywfKmQ+9GU2wFC3EEBs1uKMOE1JSKP4Zria9to/xHmiGRDwBvvQMWSnElDmC853KSHBVH6yLrwW5DIjL2Ak2mrOWDf7g++qnKqbO4rER9bWpzZ0xKrjfN4+gobh8zA5jV/d5g5gR8qEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vn4ssqD5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ugY7xUUZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vn4ssqD5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ugY7xUUZ"
Date: Fri, 11 Apr 2025 10:04:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744358699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=acahTmX/Ax/Xqa2f81n9R3vfnkbghOQZSuqUtDgmDeM=;
	b=vn4ssqD5JVEiAj/kpeH5e0vHVyEUEGiE7CU9zpBifLFAgaz8fIAq/Rcrtkko0HIVY48woe
	nArX6fn3jfNP/ZaIq+wlktW0KmJcCmYESJNZryoJtZ4lOS8Z0Ec06fsu5RbG5lxypBWr9i
	ZP9cgKaQYJT8aDbtZHshjRpIirBMSINoviM602kahPTR+nF9uNOeautxlIg4PJBnT3yqtk
	MOYaZdfuXocNfACPJEySkRVYZYZaNz6YY4/RvgikVGqFFKaBEyg8R9swpUZXGawT7CKp2d
	1Quk8T1XWpuP57fTryJGK0GL3QpyfyR5OT51Xq6H282YFbmpzN2+IYRi6Hcrqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744358699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=acahTmX/Ax/Xqa2f81n9R3vfnkbghOQZSuqUtDgmDeM=;
	b=ugY7xUUZqt2Uu5n/DsIYlO/QK28i7E0Wv0P6u+AYKwbrXKRVEEmoB5JIw3qdikao3pKbo9
	DVSp/qUHQ84BA3BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
Message-ID: <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
References: <20250411024600.16045-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411024600.16045-1-xry111@xry111.site>

On Fri, Apr 11, 2025 at 10:46:00AM +0800, Xi Ruoyao wrote:
> Hook up the generic vDSO implementation to the generic vDSO getrandom
> implementation by providing the required __arch_chacha20_blocks_nostack
> and getrandom_syscall implementations. Also wire up the selftests.
> 
> The benchmark result:
> 
> 	vdso: 25000000 times in 2.466341333 seconds
> 	libc: 25000000 times in 41.447720005 seconds
> 	syscall: 25000000 times in 41.043926672 seconds
> 
> 	vdso: 25000000 x 256 times in 162.286219353 seconds
> 	libc: 25000000 x 256 times in 2953.855018685 seconds
> 	syscall: 25000000 x 256 times in 2796.268546000 seconds
> 
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> 
> [v1]->v2:
> - Fix the commit message.
> - Only build the vDSO getrandom code if CONFIG_VDSO_GETRANDOM, to
>   unbreak RV32 build.
> - Likewise, only enable the selftest if __riscv_xlen == 64.
> 
> [v1]: https://lore.kernel.org/all/20250224122541.65045-1-xry111@xry111.site/
> 
>  arch/riscv/Kconfig                            |   1 +
>  arch/riscv/include/asm/vdso/getrandom.h       |  30 +++
>  arch/riscv/kernel/vdso/Makefile               |  12 +
>  arch/riscv/kernel/vdso/getrandom.c            |  10 +
>  arch/riscv/kernel/vdso/vdso.lds.S             |   1 +
>  arch/riscv/kernel/vdso/vgetrandom-chacha.S    | 244 ++++++++++++++++++
>  .../selftests/vDSO/vgetrandom-chacha.S        |   2 +
>  7 files changed, 300 insertions(+)
>  create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
>  create mode 100644 arch/riscv/kernel/vdso/getrandom.c
>  create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S

<snip>

> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 8e86965a8aae..abc69cda0445 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -80,6 +80,7 @@ VERSION
>  #ifndef COMPAT_VDSO
>  		__vdso_riscv_hwprobe;
>  #endif
> +		__vdso_getrandom;

For consistency this could be gated behind CONFIG_VDSO_GETRANDOM.

>  	local: *;
>  	};
>  }
> diff --git a/arch/riscv/kernel/vdso/vgetrandom-chacha.S b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
> new file mode 100644
> index 000000000000..d793cadc78a6
> --- /dev/null
> +++ b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
> @@ -0,0 +1,244 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Xi Ruoyao <xry111@xry111.site>. All Rights Reserved.
> + *
> + * Based on arch/loongarch/vdso/vgetrandom-chacha.S.
> + */
> +
> +#include <asm/asm.h>
> +#include <linux/linkage.h>
> +
> +.text
> +
> +.macro	ROTRI	rd rs imm
> +	slliw	t0, \rs, 32 - \imm
> +	srliw	\rd, \rs, \imm
> +	or	\rd, \rd, t0
> +.endm
> +
> +.macro	OP_4REG	op d0 d1 d2 d3 s0 s1 s2 s3
> +	\op	\d0, \d0, \s0
> +	\op	\d1, \d1, \s1
> +	\op	\d2, \d2, \s2
> +	\op	\d3, \d3, \s3
> +.endm
> +
> +/*
> + *	a0: output bytes
> + * 	a1: 32-byte key input
> + *	a2: 8-byte counter input/output
> + *	a3: number of 64-byte blocks to write to output
> + */
> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
> +
> +#define output		a0
> +#define key		a1
> +#define counter		a2
> +#define nblocks		a3
> +#define i		a4
> +#define state0		s0
> +#define state1		s1
> +#define state2		s2
> +#define state3		s3
> +#define state4		s4
> +#define state5		s5
> +#define state6		s6
> +#define state7		s7
> +#define state8		s8
> +#define state9		s9
> +#define state10		s10
> +#define state11		s11
> +#define state12		a5
> +#define state13		a6
> +#define state14		a7
> +#define state15		t1
> +#define cnt		t2
> +#define copy0		t3
> +#define copy1		t4
> +#define copy2		t5
> +#define copy3		t6
> +
> +/* Packs to be used with OP_4REG */
> +#define line0		state0, state1, state2, state3
> +#define line1		state4, state5, state6, state7
> +#define line2		state8, state9, state10, state11
> +#define line3		state12, state13, state14, state15
> +
> +#define line1_perm	state5, state6, state7, state4
> +#define line2_perm	state10, state11, state8, state9
> +#define line3_perm	state15, state12, state13, state14
> +
> +#define copy		copy0, copy1, copy2, copy3
> +
> +#define _16		16, 16, 16, 16
> +#define _20		20, 20, 20, 20
> +#define _24		24, 24, 24, 24
> +#define _25		25, 25, 25, 25
> +
> +	addi		sp, sp, -12*SZREG
> +	REG_S		s0,         (sp)
> +	REG_S		s1,    SZREG(sp)
> +	REG_S		s2,  2*SZREG(sp)
> +	REG_S		s3,  3*SZREG(sp)
> +	REG_S		s4,  4*SZREG(sp)
> +	REG_S		s5,  5*SZREG(sp)
> +	REG_S		s6,  6*SZREG(sp)
> +	REG_S		s7,  7*SZREG(sp)
> +	REG_S		s8,  8*SZREG(sp)
> +	REG_S		s9,  9*SZREG(sp)
> +	REG_S		s10, 10*SZREG(sp)
> +	REG_S		s11, 11*SZREG(sp)

This should have the same comment as the loongarch implementation that it is
fine to store to the stack here. Contrary to the general claim of the
documentation for __arch_chacha20_blocks_nostack() in include/linux/getrandom.h.

<snip>
