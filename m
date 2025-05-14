Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7795725DD07
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220127; cv=none; b=fa6wRMBOe01e2cVnh0MEaik0LNUaVkE4KsnN1C1GmVjV5CmOvbyyuUQWGgVbSFTZtuR6H6ivY/JlCtHZY0e6pKTx1s1X6v+hJvJ2whYMgntq2mxQ9FH6fnT5+bhniiLM4W8JPCbUhm31Kx7pKVBYpDUK4N/GIayYSc9/95I83HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220127; c=relaxed/simple;
	bh=Wz9I9xC4F27JXB+jiXgRktQ8fB8iSJ26dOapb8gTGWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGwP8ujEhuMJuwQ0LSh2N2xyaKl53Yp1FbgoMevTFS71S4OvroX2IYiKRFamH1sjWtb2dzhVcV5+NeAbZzL6OpT8Kh8lHT7C1OrC2/OA8KXf30Qn4LWetxagB6JhEBi52J1nhESSlCLt3hVfOgp88JNBWn5k/BvMTBzCr5mrLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=izzjTcC/; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="izzjTcC/"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86a07a1acffso82187039f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747220124; x=1747824924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRXF9DYELCFr5DWcRHF2au4ZCt3rEGvlc0W9vQ4Jvt0=;
        b=izzjTcC/LTj6htqYkDqTLqrJQ7iJ4FRsB5avH+7QVoi7Wr/eg7ydZC9IVwq2JfbCmC
         uRYbORPRdXFL1PeesKTqq7afkpaD2UZGCK7h62aFtcDYW/Hk7XLejB9Wv91lgxR/ZLj5
         mFnt1lMHLEJdGa3bCzMz60llxLqvqX6ndKdhy+erC64Q02U0qQrHczMUEQ9M5Ppg9u2F
         YB6SeYwjuIAhOGf2RIM7zjVH6tTT1Q7Vx3qKWMsJVJ0S5YFfWJQcjlAnbwI6uUoeNuXJ
         rXyuZ/jBdTHIrYhA5yypnWlz/rlsHXIaYjTjRHXazlH2uGT/vNoyAOmOE9hxLg10NZij
         v8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747220124; x=1747824924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRXF9DYELCFr5DWcRHF2au4ZCt3rEGvlc0W9vQ4Jvt0=;
        b=Qkdeqztt/oCM3Bw1U6734c4gdSdcJstJ5ugE8MPe1oKya+Cyn3giJQIqsf0BbCymIz
         L1EZV0CYyQHBE4jeVl4FIspxyyLt96GywGtxmqjDr13gDzlZSQm+GBGBc4fbAsYJV7Ik
         baaSHrCkEH///wBhxNbcX0JI9IPE7kmghCXN93i8GeyHFQscEU3//8hSpMwFVILmxMg7
         u/tr9DfTVzkEEf6xuW3jTz/3hyUqQcvYu4aqdJwOOnoBV00axB00/7dACCfY76VN2fos
         B8YHCq4Dh1LdmUkVWoxx4F6hn9y13QTcq95XEexOpJyOGvhFMpi4R3d6L4c5WogwIqph
         Fm7A==
X-Forwarded-Encrypted: i=1; AJvYcCU0ax73/XwHe6Ie51DK83zbvYRtxQItseiEgPtGjbK+wbtsHOqqUUmox3cI/MjOQdaMDM3XqWlSiWoiiTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMAr/WJ/JNghZXN+0hPINDYfGRqvI9lToQ9ZV7UquA+HeIRHM
	1OZ6aRuFHWnaxS2GF4Iocw6UI5gZUpSZuUF5XUMHAna9lrInrwlw8M44xITd4ZbnCFS/BUVpKve
	WsWANswuITLuDSThwJM/7qWxf/h8Bw/nEOrzO3Q==
X-Gm-Gg: ASbGncsGJEw7HvxVHHLwPcyplbNdxqaf4Vi82LYzT+EzBJiiDDOltvbOtt4J3GGydj0
	J3OTJkNfpECkroVZdxwXC2GWewvNe6btBw+8d3Lp9dRXrvgg4XF8iJTOxbRpljOleFPidJCrtrc
	Z090RHWw46xLxpBM0yFz0Ug6Mt2DStjeSH46miE6Btrs59
X-Google-Smtp-Source: AGHT+IEsUcIqOtDh4qY84VrR7dhWsUpg7gwW9C2txJWoPP6k/tpHi1CvIf0OsIfE3p0Zr1XdgR25bvUfnZ7cRBd3PFw=
X-Received: by 2002:a05:6e02:198b:b0:3db:75b6:7624 with SMTP id
 e9e14a558f8ab-3db75b6780fmr2850135ab.11.1747220124329; Wed, 14 May 2025
 03:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
In-Reply-To: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 14 May 2025 16:25:12 +0530
X-Gm-Features: AX0GCFtIxlTWYfHTygNZSZFPokesN2cLhuuKOTpmwdkrTRv-yq2sET779gpzlaA
Message-ID: <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:13=E2=80=AFPM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> The KVM virtualizes PMU in RISC-V and disables all counter access except
> TM bit by default vi hstateen CSR. There is no benefit in enabling CY/TM
> bits in scounteren for the guest user space as it can't be run without
> hcounteren anyways.
>
> Allow only TM bit which matches the hcounteren default setting.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..873593bfe610 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -146,8 +146,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>         if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
>                 return -ENOMEM;
>
> -       /* By default, make CY, TM, and IR counters accessible in VU mode=
 */
> -       reset_csr->scounteren =3D 0x7;
> +       /* By default, only TM should be accessible in VU mode */
> +       reset_csr->scounteren =3D 0x2;

Let's remove this as well because the Linux SBI PMU driver
does initialize scounteren correctly.

Regards,
Anup
