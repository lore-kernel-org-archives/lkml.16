Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A82F2E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749444220; cv=none; b=Bu1V5+4MpxPyH1oXfidKxFF+BRsN4Ph5VQExtlduPIN8uJGMHHRfr12N+gtWsFTuhc10rMOkG7t7PbBxUIv7bqsEOA3e1I92C6ym99FNBUyCqV3+SyBkkazX/ycTVTVkXHdiwpn6E3fZEjDy9WjhOTKzFNrhCtmFn3w2w/hHtHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749444220; c=relaxed/simple;
	bh=KVfo8G06p5LMkd2xNdl1EKUUib93vSUo9xJvPueK79s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTz4WPKdREGwDdRVQ9UIRJ7dNAsUG5BNBhqmE/mYWmP5dCsXxGHgnwHfVy2OGpFCUdXlTl/HCeVY/MswpqRpZdCiiVEnve3E2+E8WEEw9NXv92lz79cuKfmQK7l3rzGVpvjsV3y2giGxN87IILLP/byJ3U8T1rXN/uBgGj9AaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=nKkpmMrB; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="nKkpmMrB"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc4ad070bso13785105ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 21:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749444216; x=1750049016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQQ7TbohytoS1WSMjMWeTE196VOLo8ZyRtVEZ0jt55Q=;
        b=nKkpmMrBgqqsAVnjd3apAyzGNsA+rlwiPh9WWDSW4UTgvddWgM2axVtU8k52TF0d45
         h6K+pS0v13lOafIdyPZnOHcCUDTN42D3/zJrAH4+mteM8gqu0dNnZDK2Em6SrLqQR1jL
         Oe5qIzFjIzpMEfFC20N7m4X35cCeRDj13MPPnNvuDIgXpNBu9Pf/ib6J9DBOUeYGRioe
         wpAndpv3lJxiDNewr29gT1St7Nvldooy9k6cTMoDbttO1cW5xdV0aWb63v7VtVEWzPu3
         3CRl6jeGetTq6BcZ1qR//tBZOCRyGu7zuQTO8ozoQ3cNXZliCjvbENzlNFWheYD3wtPY
         jKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749444216; x=1750049016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQQ7TbohytoS1WSMjMWeTE196VOLo8ZyRtVEZ0jt55Q=;
        b=ICSHGX/a4HVyp5YuHKCaTuxiS1ij6NMxLrzmw2SvFKlpfTWjZHg6Y3nFXe5iRfmwuS
         8lfq2SxurIxgq+K0epMgpqo0PBTmtRMx1CQ0ta2igsun2GQ731W1lgTdw+l/RVSSMen4
         6RtSV+8L4xQPYyy9Nv2/CiWfb3RnT8wjY6WYf3oswYaxjGbQNKU1arB3xlB8A0ylIsoZ
         7pEa1wy2XuxKZdQ7pkXkQCZ2wtKQxrCg9MT+CGz2Rd7Y5gsw2il2m6FYI5RDJbcTpFBL
         trY9c7LArxb3lPzUdGmb17J/qwYSw2UdKX2eMuwZQav+HLkzMdfNUEvRTFEZ6yvUNM6w
         Cruw==
X-Forwarded-Encrypted: i=1; AJvYcCXqkg82bbd4k/y/DObNgKWWoTO1MwslHRfFvgZcRrY3KJtqYXlbnbQvJbNbKXxvYRXESCXjbbiB/5L8Tb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG5LM0/vKFY3WvZss0QodOL2bYQ1ViiQ3rBrzfgo4yOf6kFHiQ
	pYNgN27mlgBlJPK+vSfiE3PJA9SzcPDNFFN3e9fkDnQdAjTiZdSwdmuWT5u9vvwaMH5fDWiimnq
	b6AkAhtxvdLRdXyGcp4P7Q44P24+4XRVgU6ikFZ1n5g==
X-Gm-Gg: ASbGncvscR7nZMHZDoLWGer0xfBQ0jdOQRmD+qAicYyOfmYBDD/yx1YY+zJ8bjeGm7p
	Lg15F0/yeukK7q2p+hkPo7PcGzpIcwrKHUaIh1NG8nVwLQvUKrRJAgUlANposTY+WtYAD94EEgB
	gjUUH2wJHWm2e9AC3yMBTArODlaUAWC5GKYGWzwDgFfF8IrIbtOwQpj0UwEfjhgJCeBMJNDBEbm
	B0vCRYhGiEaLVU=
X-Google-Smtp-Source: AGHT+IEiT5Sw29VzR06/mvnFI1yGklPp8h7VXnxBQ4Lmq6+VmwASCk+pP5VvhvXXqY9B0VYHEp/vir28r/BOWJ/SLPw=
X-Received: by 2002:a05:6e02:16c8:b0:3dd:b726:cc52 with SMTP id
 e9e14a558f8ab-3ddce3cd206mr114422245ab.5.1749444216566; Sun, 08 Jun 2025
 21:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-3-apatel@ventanamicro.com>
In-Reply-To: <20250605061458.196003-3-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jun 2025 10:13:24 +0530
X-Gm-Features: AX0GCFt1fzaaBq3Mt6tIzl8UPp0uXSKLfg_c9BLRPnyCkszfqY1Fzs_Sfg2tTEM
Message-ID: <CAAhSdy1kRHEBoKMSd2OYWj6fHZHU1HQq+68-H3=cJGNTF=5WLg@mail.gmail.com>
Subject: Re: [PATCH 02/13] RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 11:45=E2=80=AFAM Anup Patel <apatel@ventanamicro.com=
> wrote:
>
> The SBI specification clearly states that SBI HFENCE calls should
> return SBI_ERR_NOT_SUPPORTED when one of the target hart doesn=E2=80=99t
> support hypervisor extension (aka nested virtualization in-case
> of KVM RISC-V).
>
> Fixes: c7fa3c48de86 ("RISC-V: KVM: Treat SBI HFENCE calls as NOPs")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Queued as a fix for Linux-6.16

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_replace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_=
replace.c
> index 9752d2ffff68..b17fad091bab 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -127,9 +127,9 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu=
 *vcpu, struct kvm_run *run
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
>                 /*
>                  * Until nested virtualization is implemented, the
> -                * SBI HFENCE calls should be treated as NOPs
> +                * SBI HFENCE calls should return not supported
> +                * hence fallthrough.
>                  */
> -               break;
>         default:
>                 retdata->err_val =3D SBI_ERR_NOT_SUPPORTED;
>         }
> --
> 2.43.0
>
