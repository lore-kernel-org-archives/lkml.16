Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB2D28750C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592826; cv=none; b=Fu6OcQxLmjZjcPPGnDvIfZGWR7zO/99pKE005jVYIiNaFnLdYqv2c0PzO+7qe8/BBZuKrFyd/f2/fiPjRuqwwIcZ+ALa0VBpoXF1skQMTpsq1KGtMd3Tuno6Ecdrh0Zif4Itad8I1uKWiKrLZtNGyUrexpKp/SkKmJCL0nEp/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592826; c=relaxed/simple;
	bh=eXoFJCNh4G3Ka6JYRvaglUvLPbda6XqrFz5OEJjd4ms=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=UOqp5wk4ncN3Eci5J7KdRzygqf0lWDJb49j2rBL+kWeOhPtnqGJLuhdtCihPxZlzHwHNvZAx3JssrCcMevMzjnyr8lH/EMKdGtQ1bdiNThAA/QF3m2SCTDUBC+Mr2+m0z3QKaPN2wiqgk1386QD6bFROQqm3qyCDWM6tEfWHdow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=VBeg5wle; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="VBeg5wle"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7481600130eso5870625b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749592824; x=1750197624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrBP6UsoGHLw+5eAdBdYWaCCq8gCbQTY1XMuaiY+2Lw=;
        b=VBeg5wleRx/yyw5MW3FVQjYicKp0lr/9OU2CYgaIMXQ3WrsI74PzVgArwrJq7bHcWc
         KXVPHVii5AHql6AN8iMdwx7nGcGIMGL/G4lnvadYqrguDkpOeRsYnRaEDvrDb46Q389l
         bjvFs0eexwCZ+jw8acy32fs0KXEcT0ttjCom+KFYZYoRKIUnNNerTLSIRrC2l6n09en0
         9RqG4eAGCpREiJ7ZYo4xUv/md1yflZwW0eKR5GqzNOjHaOIX/+jt/FcbxbcmQzvAt97L
         Sk/ucoL3Ed+A/Bk4beyczeeuBxi2Wj/XNZSMk6gO8pSpPHV847iEOEKki26SMfjxmysN
         N3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592824; x=1750197624;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrBP6UsoGHLw+5eAdBdYWaCCq8gCbQTY1XMuaiY+2Lw=;
        b=bcWz/Fjp7Y2DM95AT4WXWwAcNJrpkn6BgOi5MoCRoZKZsK39b3NV2sKhg/8bSH9l4c
         sn1s9NRE74po/XgOkra95GRtHTsiMUyukXHDld2UJnvIKsIP8CobWPTDMLAdLyztA02c
         GbAg7YhAoJfayEUhexqHplHwiikxJ673Z0XIh4NcdF4OrlTxPUPxMTj7AOay4eJkAGnI
         Ik8KG1VQsVIwqEFGJnXaM0QmFRCj9uivpMtXftRQhyfL3vUNjgJkUPE3tUfSp8YBSslu
         XySoRG9+tEM7QsMcw/JRLZ7FAiF9d87DqtCDFDyLrQySUDx/TEvIf7UnNYh2EaKRjGlQ
         2RlA==
X-Forwarded-Encrypted: i=1; AJvYcCWnQLiEkpjKq6V2OiVxIDNPeEOdCCjt3NU5YPBXAdTFk4VcOtEEP2BtAC9NQsLvUjskRVEHmPar5+TgnQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfkeg316p9KIbg7Xs0ZLA0I5kfTBuuPPpNPXOPrPTeJaApT2kH
	UCqRbCyT0iJo356FPqkN6M5fBCYZd+d1IvwfQTDj8Q0rYsZ2EYNE4fMqQCV0GfhYnNY=
X-Gm-Gg: ASbGncvQ8OI7kFitiYG6wsq1mg3WDZfucRqJIQ4PiR4E2a/T5xrkuwA/GxcwD7fSZbb
	mBjyFykHF4OZt6N+miEPSrozHQKFHlzWMLZDwh5Pizt2PpW6uRJtnEss1BZDpUq7GZrpAP4GJoU
	HCLWx7eJVSmtytNPJ6F4ZjHxCjng5dc/6scU98XXN4ZyJv9DXrRc14iEFNvF29o0Sm0SmKoIZMy
	p2/TUnSoNCwA/ZB1lnOw8JqVeIiDdFjNBrMibr4m2GE2egx4yF9CPn+0b0StZ1pquz1tVPEimnF
	jLGfruQD28Vg33DOdzMlc+FQiVVo5ISAvZXpxIpcwULjKcM2NKLLW+yu2OJE
X-Google-Smtp-Source: AGHT+IFllGevFXQlZAeRhC/LJ2atL5zsQ9GAQAUBz61xaiQ/Ef25jeJJ70xcxW+UT9y4LiRUnDhn3w==
X-Received: by 2002:a05:6a00:3d48:b0:740:9c57:3907 with SMTP id d2e1a72fcca58-7486fe83a5bmr529366b3a.19.1749592823472;
        Tue, 10 Jun 2025 15:00:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482b0c0138sm7876880b3a.110.2025.06.10.15.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:00:22 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:00:22 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 14:58:37 PDT (-0700)
Subject:     Re: [PATCH 3/4] raid6: riscv: Allow code to be compiled in userspace
In-Reply-To: <20250610101234.1100660-4-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-BE370728-B36C-4BF9-B980-D6AF42A83272@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 10 Jun 2025 03:12:33 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> To support userspace raid6test, this patch adds __KERNEL__ ifdef for kernel
> header inclusions also userspace wrapper definitions to allow code to be
> compiled in userspace.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  lib/raid6/recov_rvv.c |  7 +------
>  lib/raid6/rvv.c       | 11 ++++-------
>  lib/raid6/rvv.h       | 15 +++++++++++++++
>  3 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
> index 500da521a806..8f2be833c015 100644
> --- a/lib/raid6/recov_rvv.c
> +++ b/lib/raid6/recov_rvv.c
> @@ -4,13 +4,8 @@
>   * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>   */
>
> -#include <asm/vector.h>
>  #include <linux/raid/pq.h>
> -
> -static int rvv_has_vector(void)
> -{
> -	return has_vector();
> -}
> +#include "rvv.h"
>
>  static void __raid6_2data_recov_rvv(int bytes, u8 *p, u8 *q, u8 *dp,
>  				    u8 *dq, const u8 *pbmul,
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index b193ea176d5d..99dfa16d37c7 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -9,16 +9,13 @@
>   *	Copyright 2002-2004 H. Peter Anvin
>   */
>
> -#include <asm/vector.h>
> -#include <linux/raid/pq.h>
>  #include "rvv.h"
>
> +#ifdef __KERNEL__
>  #define NSIZE	(riscv_v_vsize / 32) /* NSIZE = vlenb */
> -
> -static int rvv_has_vector(void)
> -{
> -	return has_vector();
> -}
> +#else
> +#define NSIZE  16
> +#endif

and looking at the code a bit more, this makes this VLS when run in 
userspace.  So we etiher need a check for that, or to check VL in the 
loop.

>
>  static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
> diff --git a/lib/raid6/rvv.h b/lib/raid6/rvv.h
> index 94044a1b707b..595dfbf95d4e 100644
> --- a/lib/raid6/rvv.h
> +++ b/lib/raid6/rvv.h
> @@ -7,6 +7,21 @@
>   * Definitions for RISC-V RAID-6 code
>   */
>
> +#ifdef __KERNEL__
> +#include <asm/vector.h>
> +#else
> +#define kernel_vector_begin()
> +#define kernel_vector_end()
> +#define has_vector()		(1)
> +#endif
> +
> +#include <linux/raid/pq.h>
> +
> +static int rvv_has_vector(void)
> +{
> +	return has_vector();
> +}
> +
>  #define RAID6_RVV_WRAPPER(_n)						\
>  	static void raid6_rvv ## _n ## _gen_syndrome(int disks,		\
>  					size_t bytes, void **ptrs)	\
