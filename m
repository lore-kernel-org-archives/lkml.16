Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38201F5434
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448335; cv=none; b=qJaXv/lIVWgpYiDg8IuJkPWSuhDw+btX7B7jPD+EFCh4sTUlGfm+s0QEeE812h7IiEgVbn7ztpBWAlEDSM/yvud4ds1kmjnLS021jqI4YWmudwALcuys2rmOV3B2tVhb96A3TYZyN3g5bBAizJ5aHjOz0CJsKw6UcXWDqaGxLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448335; c=relaxed/simple;
	bh=z9yc6YZ8/bzyIza72DBETn31TjUPwyUy4wMzJdbZb6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOlfmjnMsZHA7IR1mdnfKajQzH70egESd1MysXCNgZcbzVi65w0idFdbApJKgeaMGrAejmy/JEvxHwvYrEIp0KTta19mxXP/pazQGn8DzlYdKJMJO35q3YxNwg8b50oO41qoG1GPUB1pDK+eB/AhCgbeoFgpUM6Pas56d6ZgnLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=NZqj8GCx; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="NZqj8GCx"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so11730905ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746448333; x=1747053133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ROvQBGSdDBOd+A03xhzhhLZdwd+Yr3g8998GOj2eyg=;
        b=NZqj8GCxTJO8JUfpyTyKZyynZcZ3zqTF6hQ4OfdcjKNX1oqWuZT/e6mmPJwa6R/ta2
         gWzO6TIyMDlHwllSmfYd7eTwPm/0RRECRN3LEx4pCPqShNw0oqBS72RwmBDEy2UtrxNa
         VG+tDvCrlhjKuQwNoA+xRwK7xF6aao+bNqEF6j207i9X24zgYij4O+z4RSiTPITaN3eX
         98E0yO6AS2N5Q+2v43Yz+cHbmeaLp+5sscLdo89ljp5ghOXGhP0nB7FPMkNcLwIObCGx
         i/6gsjEOk/eyHyBgOyBsMX0g3HxbyTBnm08cyRrXhyoKLDyeNmnp1qmtPQOh63yrgm3M
         FUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448333; x=1747053133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ROvQBGSdDBOd+A03xhzhhLZdwd+Yr3g8998GOj2eyg=;
        b=aJUnr6MdqFoltu0WYzVVCluruaLZGSf1FyEZC123Amuo6HJjtRWDlvlhv8e9Mdf8x4
         rBIM5PAlpZOQeqX1jVxOH6sGzphWzaGXIqTWOFtigqSa4uDsBNLD9Sudl7ZrdGaLsIcL
         /GddaGKOmGHk0/4xonJDpgi6hozbchFSLctNAz+U7G9UKFD/5wp5mll6oujk4yWihEVR
         3rJJG8RIkzkyJSLU5/Z9X5RaF4Mp4a2SakXbdqn9/ynqyCGmuPkWbZOIdYV45HL/P3/b
         QlkKVfO3JMYbBPx5gEZmol33WxkeNLIQ0BdxW/qB9cgpivRe6UBbFsCDtl7MO0MzPv5K
         3Udw==
X-Forwarded-Encrypted: i=1; AJvYcCX0rfsfrR9Xqopco8AlGRd9yoAogHjStaIWyxpOND7IPatgcX4liZ1X9b7D6Is5pDrk+q1pVusOxMPl/uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Dfb+5V3mbA2eP0Wogrw7upqKF9b1J4iSiETtj4wLv+/a4Kln
	hJ6VLB64qXoKG7qK75Xtn+nIkM/Cj0X6Ttm2vx6DwaYVH/6AtpT9qi6Fol0eVbB1aqoKssw7qFC
	OcoEXZHPvW4JMkTLkYyFe0QvTAFsJDy7ZZQU8NA==
X-Gm-Gg: ASbGncuKYkwEauSh7xwlLzzw/7sVsJ6Eh28Hwln67un9qSZPtETvp0Z6kiOZQ/m4nfQ
	7/KCpJWUyDUDuXD3Nk6FizFoeoYSHjmIOwn688uykM+M1jS9aLMLOut/lZ1jcTuuEWcXsyivgQQ
	jOD7UJBWL7hxaHHWsgP6ZtXTI=
X-Google-Smtp-Source: AGHT+IGKfyVuSpXvhyCqr3MzLrMWyvS/DXDaTYYmrBeFPlCthPJdi1/XEIr6vTapFuhwTG/+VDZdp44YaLe79OiDUvE=
X-Received: by 2002:a92:ca4e:0:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3da569fc0fdmr78214885ab.22.1746448332626; Mon, 05 May 2025
 05:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com> <20250227123628.2931490-2-hchauhan@ventanamicro.com>
In-Reply-To: <20250227123628.2931490-2-hchauhan@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 May 2025 18:02:03 +0530
X-Gm-Features: ATxdqUH3w6mQ0qSoQ0tXhdBpHdmtraVQBLRXb-lEZsWxpb787pmCQYQjNjM4yWg
Message-ID: <CAAhSdy1bupf80qpio6-HpwzC53MW3UguKj+zxd3Zmduxay4rpg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/10] riscv: Define ioremap_cache for RISC-V
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	lenb@kernel.org, james.morse@arm.com, tony.luck@intel.com, ardb@kernel.org, 
	conor@kernel.org, cleger@rivosinc.com, robert.moore@intel.com, 
	sunilvl@ventanamicro.com, apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 6:08=E2=80=AFPM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> bert and einj drivers use ioremap_cache for mapping entries
> but ioremap_cache is not defined for RISC-V.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  arch/riscv/include/asm/io.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 1c5c641075d2..e23a4901e928 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -30,6 +30,9 @@
>  #define PCI_IOBASE             ((void __iomem *)PCI_IO_START)
>  #endif /* CONFIG_MMU */
>
> +#define ioremap_cache(addr, size)                                      \
> +       ((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
> +

There is a compile error observed with this patch applied
on the latest Linux-6.15-rcX kernel.

To fix compile error, we need the following change:
s/_PAGE_KERNEL/PAGE_KERNEL/

Regards,
Anup
