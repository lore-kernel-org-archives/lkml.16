Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102622578D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719243; cv=none; b=uGzGxt4LPNWugfhh9rlG4xVthMLc5C/0UeRPuFvHj5zSTTYhn1ymbf6T3GPf2SOADc9EdrYtWtzK6FIUtKB+39AsoOVzOWWHSZEpLaQdmXn01jxJfyMkmiJY/zFa9a/IXDSz0IdyrAlODKRwYAb05gMW5unmSZaO+9oApCfC9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719243; c=relaxed/simple;
	bh=UbD6C48fBfPfDME0ZzL5s3Gj7SRBb6yASAdPd3c5lUE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=R84To3MpRsDbokv9Hg4eqO4hXyckgXejA8HkTHxBEYYvzK6hFFtOnBUxqP+LBsL1w6fskvsqSEzzMc3eomfKOr7JGF4RgwWfumnZhrLqlHqvD3QGwC+vHHvT4WPvhUJeR2SElcr9u5uykzriVlWB0o5kTxaFCmTrqWPbDVffKvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=bzRDTG2t; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="bzRDTG2t"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so4105533a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750719241; x=1751324041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pjqhDenMyB9XuTcc2/506cG3QfHXMDij5WwLQDKdRM=;
        b=bzRDTG2tIqy5VK97nhxeWL3o7BbD59WaVvvfJqVzBFxv0YUbvTJWeo9tbJFzWnzIWt
         /ENfCrxhfilew+4Orasn8hcMpzXsmC49EF2V/EU+1ZZO3PWaV3pRKHgSdCStEo523GOs
         ZUSN8bKsOf3TF5gj/IDO8zFLdxnatIa4r06CHNyuVkTEi84QqVr1WM+qgyYjujrfNxWl
         CsSVGvrRFx+ZM0Rjs/yROJkFM4GdGS+rFytjA2hig6HbIpO07PF7a3c8+wnEliv4EiF7
         xokHv2zOhTBjm3/IAew5GGoJ7MIASd1u/2ryXCR1UWzWYOMUv2JqYf9nlpAD/ZkSDbXl
         gAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719241; x=1751324041;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pjqhDenMyB9XuTcc2/506cG3QfHXMDij5WwLQDKdRM=;
        b=ed0klavLuv7ZLQbysg+RLr2jbGW6GG8MHFsZm2CjDSeW3bK8ulOOjfnOIOTPh1Siph
         OteFv07Yr50jbm1b2gPDc+6x/Zu13bPzdVtYXWp0lVimdwGdGiN8Uzy05N/WoHCpsxFR
         vPnzHsr1W9s6PqCqU74w3pIBiA4gqnvK/rkXSlxf72OurdTTorKAUDnW4EKFKPY63nux
         D4mDbmItwZzch7qZlTzCVfDmoMVDKku5iAEdRpUdqvvqThIcuSUlQBS8CFCD4jgh1hsq
         CFUEgNkMP5W/PkvO4bUl9s5eFYHdhner0aCYOWBCGvDAWWWqw+Nv2CtsYe8QUrjVJveW
         THVA==
X-Forwarded-Encrypted: i=1; AJvYcCU99xeISKwjA/95Mt5k7EcdY8aAs/iHUvv9NlvDk89qyQZ51Nu4QWrME5WL8HdTMkjqI1iaO3prnXSP0Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcfrF9EvwlXiKYPfvd5DxX500Hahm9W/QulxooRYPrsybunOl
	FnLzLhugRsHapcy2QaPY3wA1y93XVOO/T2+x+kQlEK6PqJje4InLy3RGMzAIs0k7RRk=
X-Gm-Gg: ASbGncuViQxGIblhwJj/vLBWy/QL4/OjqWBqihajCgbCYZ1qukD/10ItFpFxYE0/g5c
	7YbwbqjPHmj4uw6agIbi58ptisC7BpujHN58e4SHzjktcuP6pwQmST3cVAR7JQHtKfTcSbu4TjP
	lejgXIBKTH83eMSLItNRZyTmFjHXvxy5naid8Wg5VLLZUAMQazlXPey0pfHj4H9eH6uT6v2Y9FZ
	xC7uovL7wUk0ue+wH7TuhSBMfTTr1+EFbR3/VW9bmfrtESvzHu71UWybXd02ZvCLUm9KOOtgc05
	Y6mFp6ip/38MTrJwAM6ce+Zmax4AiGoG5daqykI3vK3mTF8795BJ0NISq4Ak
X-Google-Smtp-Source: AGHT+IHLv7JWIqsjuGKZLAq8zTRiZK8mgX7ZyQt+nhI3z6c9vjzp9N2l1yr4+aHwWg3ZAZewtUDFug==
X-Received: by 2002:a17:90b:2549:b0:311:b5ac:6f5d with SMTP id 98e67ed59e1d1-3159d8fed81mr19356270a91.29.1750719240714;
        Mon, 23 Jun 2025 15:54:00 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3159e07d222sm8769678a91.45.2025.06.23.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:54:00 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:54:00 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 15:53:55 PDT (-0700)
Subject:     Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
In-Reply-To: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  Atish Patra <atishp@rivosinc.com>, ajones@ventanamicro.com, cleger@rivosinc.com, apatel@ventanamicro.com,
  thomas.weissschuh@linutronix.de, david.laight.linux@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rkrcmar@ventanamicro.com
Message-ID: <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Having patch 3 of 2 is not normal.

On Thu, 19 Jun 2025 12:03:15 PDT (-0700), rkrcmar@ventanamicro.com wrote:
> Tracepoits generate bad code in the non-trace path.
>
> The acceptable tracepoint overhead in the non-tracing path is a nop, and
> possibly a second 2 byte nop for alignment, but the actual overhead is
> way higher.  For example, the sbi_fwft_set with tracepoints:
>    0xffffffff80022ee8 <+0>:	auipc	a5,0x2cec
>    0xffffffff80022eec <+4>:	lbu	a5,1704(a5) # 0xffffffff82d0f590 <sbi_fwft_supported>
>    0xffffffff80022ef0 <+8>:	beqz	a5,0xffffffff80022fa0 <sbi_fwft_set+184>
>    0xffffffff80022ef2 <+10>:	addi	sp,sp,-48
>    0xffffffff80022ef4 <+12>:	sd	s0,32(sp)
>    0xffffffff80022ef6 <+14>:	sd	s1,24(sp)
>    0xffffffff80022ef8 <+16>:	sd	s2,16(sp)
>    0xffffffff80022efa <+18>:	sd	ra,40(sp)
>    0xffffffff80022efc <+20>:	addi	s0,sp,48
>    0xffffffff80022efe <+22>:	slli	s1,a0,0x20
>    0xffffffff80022f02 <+26>:	mv	s2,a1
>    0xffffffff80022f04 <+28>:	srli	s1,s1,0x20
>    0xffffffff80022f06 <+30>:	nop
>    0xffffffff80022f08 <+32>:	nop
>    0xffffffff80022f0c <+36>:	lui	a7,0x46574
>    0xffffffff80022f10 <+40>:	mv	a0,s1
>    0xffffffff80022f12 <+42>:	mv	a1,s2
>    0xffffffff80022f14 <+44>:	addi	a7,a7,1620 # 0x46574654
>    0xffffffff80022f18 <+48>:	li	a6,0
>    0xffffffff80022f1a <+50>:	ecall
>    0xffffffff80022f1e <+54>:	mv	s1,a0
>    0xffffffff80022f20 <+56>:	nop
>    0xffffffff80022f24 <+60>:	addiw	a0,s1,14
>    0xffffffff80022f28 <+64>:	li	a5,14
>    0xffffffff80022f2a <+66>:	bltu	a5,a0,0xffffffff80022f9a <sbi_fwft_set+178>
>    0xffffffff80022f2e <+70>:	slli	a5,a0,0x20
>    0xffffffff80022f32 <+74>:	srli	a0,a5,0x1e
>    0xffffffff80022f36 <+78>:	auipc	a5,0x1c75
>    0xffffffff80022f3a <+82>:	addi	a5,a5,-886 # 0xffffffff81c97bc0 <CSWTCH.177>
>    0xffffffff80022f3e <+86>:	add	a5,a5,a0
>    0xffffffff80022f40 <+88>:	lw	a0,0(a5)
>    0xffffffff80022f42 <+90>:	ld	ra,40(sp)
>    0xffffffff80022f44 <+92>:	ld	s0,32(sp)
>    0xffffffff80022f46 <+94>:	ld	s1,24(sp)
>    0xffffffff80022f48 <+96>:	ld	s2,16(sp)
>    0xffffffff80022f4a <+98>:	addi	sp,sp,48
>    0xffffffff80022f4c <+100>:	ret
>    [tracepoint slowpaths]
>    0xffffffff80022f9a <+178>:	li	a0,-524
>    0xffffffff80022f9e <+182>:	j	0xffffffff80022f42 <sbi_fwft_set+90>
>    0xffffffff80022fa0 <+184>:	li	a0,-95
>    0xffffffff80022fa4 <+188>:	ret
>
> Without tracepoints:
>    0xffffffff80022b40 <+0>:	addi	sp,sp,-16
>    0xffffffff80022b42 <+2>:	sd	s0,0(sp)
>    0xffffffff80022b44 <+4>:	sd	ra,8(sp)
>    0xffffffff80022b46 <+6>:	addi	s0,sp,16
>    0xffffffff80022b48 <+8>:	auipc	a5,0x2ced
>    0xffffffff80022b4c <+12>:	lbu	a5,-1464(a5) # 0xffffffff82d0f590 <sbi_fwft_supported>
>    0xffffffff80022b50 <+16>:	beqz	a5,0xffffffff80022b8e <sbi_fwft_set+78>
>    0xffffffff80022b52 <+18>:	lui	a7,0x46574
>    0xffffffff80022b56 <+22>:	slli	a0,a0,0x20
>    0xffffffff80022b58 <+24>:	srli	a0,a0,0x20
>    0xffffffff80022b5a <+26>:	addi	a7,a7,1620 # 0x46574654
>    0xffffffff80022b5e <+30>:	li	a6,0
>    0xffffffff80022b60 <+32>:	ecall
>    0xffffffff80022b64 <+36>:	li	a5,14
>    0xffffffff80022b66 <+38>:	addiw	a0,a0,14
>    0xffffffff80022b68 <+40>:	bltu	a5,a0,0xffffffff80022b88 <sbi_fwft_set+72>
>    0xffffffff80022b6c <+44>:	slli	a5,a0,0x20
>    0xffffffff80022b70 <+48>:	srli	a0,a5,0x1e
>    0xffffffff80022b74 <+52>:	auipc	a5,0x1c75
>    0xffffffff80022b78 <+56>:	addi	a5,a5,-300 # 0xffffffff81c97a48 <CSWTCH.176>
>    0xffffffff80022b7c <+60>:	add	a5,a5,a0
>    0xffffffff80022b7e <+62>:	lw	a0,0(a5)
>    0xffffffff80022b80 <+64>:	ld	ra,8(sp)
>    0xffffffff80022b82 <+66>:	ld	s0,0(sp)
>    0xffffffff80022b84 <+68>:	addi	sp,sp,16
>    0xffffffff80022b86 <+70>:	ret
>
>    0xffffffff80022b88 <+72>:	li	a0,-524
>    0xffffffff80022b8c <+76>:	j	0xffffffff80022b80 <sbi_fwft_set+64>
>    0xffffffff80022b8e <+78>:	li	a0,-95
>    0xffffffff80022b92 <+82>:	j	0xffffffff80022b80 <sbi_fwft_set+64>
>
> It would be nice if RISC-V had a way to tell compilers to generate the
> desired code, because if this issue isn't limited to ecall tracepoints,
> then disabling CONFIG_TRACEPOINTS is starting to look good. :)

So the issue is the extra save/restore on function entry?  That's the 
sort of think shrink wrapping is supposed to help with.  It's been 
implemented in GCC for a while, but I'm not sure how well it's been 
pushed on (IIRC it was just one of the SPEC workloads).

That said, this is kind of hard to reason about.  Can you pull out a 
smaller example?

> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h   | 30 ++--------------------------
>  arch/riscv/include/asm/trace.h | 36 ----------------------------------
>  arch/riscv/kernel/sbi_ecall.c  | 18 -----------------
>  3 files changed, 2 insertions(+), 82 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 7aff31583a3d..ffab0614d24a 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -11,7 +11,6 @@
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
>  #include <linux/jump_label.h>
> -#include <linux/tracepoint-defs.h>
>
>  #ifdef CONFIG_RISCV_SBI
>  enum sbi_ext_id {
> @@ -461,16 +460,6 @@ struct sbiret {
>  	long value;
>  };
>
> -#ifdef CONFIG_TRACEPOINTS
> -DECLARE_TRACEPOINT(sbi_call);
> -DECLARE_TRACEPOINT(sbi_return);
> -extern void do_trace_sbi_call(int ext, int fid);
> -extern void do_trace_sbi_return(int ext, long error, long value);
> -#else
> -static inline void do_trace_sbi_call(int ext, int fid) {};
> -static inline void do_trace_sbi_return(int ext, long error, long value) {};
> -#endif
> -
>  void sbi_init(void);
>  long __sbi_base_ecall(int fid);
>
> @@ -509,32 +498,17 @@ long __sbi_base_ecall(int fid);
>  #define __sbi_ecall_constraints7  __sbi_ecall_constraints6, "r" (__a4)
>  #define __sbi_ecall_constraints8  __sbi_ecall_constraints7, "r" (__a5)
>
> -#define __sbi_ecall_trace_call() \
> -	if (tracepoint_enabled(sbi_call)) \
> -		do_trace_sbi_call(__ta7, __ta6)
> -
> -#define __sbi_ecall_trace_return() \
> -	if (tracepoint_enabled(sbi_return)) \
> -		do_trace_sbi_return(__ta7, __ret.error, __ret.value)
> -
> -/*
> - * Clear a1 to avoid leaking unrelated kernel state through tracepoints in case
> - * the register doesn't get overwritten by the ecall nor the arguments.
> - */
>  #define sbi_ecall(A...) \
>  ({ \
>  	CONCATENATE(__sbi_ecall_args, COUNT_ARGS(A))(A); \
> -	__sbi_ecall_trace_call(); \
>  	register uintptr_t __r0 asm ("a0"); \
> -	register uintptr_t __r1 asm ("a1") = 0; \
> +	register uintptr_t __r1 asm ("a1"); \
>  	CONCATENATE(__sbi_ecall_regs, COUNT_ARGS(A)); \
>  	asm volatile ("ecall" \
>  			: "=r" (__r0), "=r" (__r1) \
>  			: CONCATENATE(__sbi_ecall_constraints, COUNT_ARGS(A)) \
>  			: "memory"); \
> -	struct sbiret __ret = {.error = __r0, .value = __r1}; \
> -	__sbi_ecall_trace_return(); \
> -	__ret; \
> +	(struct sbiret){.error = __r0, .value = __r1}; \
>  })
>
>  #ifdef CONFIG_RISCV_SBI_V01
> diff --git a/arch/riscv/include/asm/trace.h b/arch/riscv/include/asm/trace.h
> index 6151cee5450c..7c99d91fcce3 100644
> --- a/arch/riscv/include/asm/trace.h
> +++ b/arch/riscv/include/asm/trace.h
> @@ -7,42 +7,6 @@
>
>  #include <linux/tracepoint.h>
>
> -TRACE_EVENT_CONDITION(sbi_call,
> -	TP_PROTO(int ext, int fid),
> -	TP_ARGS(ext, fid),
> -	TP_CONDITION(ext != SBI_EXT_HSM),
> -
> -	TP_STRUCT__entry(
> -		__field(int, ext)
> -		__field(int, fid)
> -	),
> -
> -	TP_fast_assign(
> -		__entry->ext = ext;
> -		__entry->fid = fid;
> -	),
> -
> -	TP_printk("ext=0x%x fid=%d", __entry->ext, __entry->fid)
> -);
> -
> -TRACE_EVENT_CONDITION(sbi_return,
> -	TP_PROTO(int ext, long error, long value),
> -	TP_ARGS(ext, error, value),
> -	TP_CONDITION(ext != SBI_EXT_HSM),
> -
> -	TP_STRUCT__entry(
> -		__field(long, error)
> -		__field(long, value)
> -	),
> -
> -	TP_fast_assign(
> -		__entry->error = error;
> -		__entry->value = value;
> -	),
> -
> -	TP_printk("error=%ld value=0x%lx", __entry->error, __entry->value)
> -);
> -
>  #endif /* _TRACE_RISCV_H */
>
>  #undef TRACE_INCLUDE_PATH
> diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
> index b783a46fff1c..62489ffeae2c 100644
> --- a/arch/riscv/kernel/sbi_ecall.c
> +++ b/arch/riscv/kernel/sbi_ecall.c
> @@ -2,8 +2,6 @@
>  /* Copyright (c) 2024 Rivos Inc. */
>
>  #include <asm/sbi.h>
> -#define CREATE_TRACE_POINTS
> -#include <asm/trace.h>
>
>  long __sbi_base_ecall(int fid)
>  {
> @@ -16,19 +14,3 @@ long __sbi_base_ecall(int fid)
>  		return sbi_err_map_linux_errno(ret.error);
>  }
>  EXPORT_SYMBOL(__sbi_base_ecall);
> -
> -#ifdef CONFIG_TRACEPOINTS
> -void do_trace_sbi_call(int ext, int fid)
> -{
> -	trace_sbi_call(ext, fid);
> -}
> -EXPORT_SYMBOL(do_trace_sbi_call);
> -EXPORT_TRACEPOINT_SYMBOL(sbi_call);
> -
> -void do_trace_sbi_return(int ext, long error, long value)
> -{
> -	trace_sbi_return(ext, error, value);
> -}
> -EXPORT_SYMBOL(do_trace_sbi_return);
> -EXPORT_TRACEPOINT_SYMBOL(sbi_return);
> -#endif
