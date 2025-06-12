Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649824678F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734701; cv=none; b=oufuxXTR0JphzYWJn8NubugI4NWWrozOjB3PdFvVEXhUpM7+45bvDh+aIXoPrKhcuT9kNUDJXL1K/VuLAjadgYo0IA3G8gTpGYff2O8EXt9btahSOeSjVH3yBpbgP6mU0CcuKomuLvSw0uYn8eaCdvEVxzyPuYDCPobtUILE6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734701; c=relaxed/simple;
	bh=DU9IwlAABlRldQPF9GYrkO15wu6B5JwT0CWU4BnHJh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oe+0mRdYkzl/8VrMJKj/yTfzR5cuov/CjLuNChZbA92TIjI1JvBayZpDVAbD4kuLGEP4endNHy42gzEhLiP04ePAhFnwx2CJbD/4VNBdzrreeb1r3gMo8wyIgjZQFzzmot0Hyn90cMW8NJa/MIsw+NuJZshT8nk+llrbnhiKda8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=RLGb6dDx; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="RLGb6dDx"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ddc5084952so4082805ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734699; x=1750339499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhSPjmAyA8pIxhMtvIKhAFsTVRGm0gzw/fSyIMnZboY=;
        b=RLGb6dDxc9Mq+a70HM4NPlyIqrUe4hwSH1OOv5M4TQecLRGnDH3Mk2owG/z10tjKZY
         kbbcXv+X/gpv/R43r6fnWntRUQZCbKlDP2kyo42rUs4PyhVzPHKq7fyTniBCsHOdj7GN
         ECmBiLdKYso6gIH33zRyFjGah5cTobXezo/r9SYXXF/F1q9WhFcH58IX0KPgXJ5PWcmz
         UHtpcfU6JtiF9imz7/SQaL/KExuxECgc/e8XQah9pmj5+7/BqV8oek2pQL9Kj/jMS9DR
         u8f0UUPliA4ug3pvaJXSrTDDqKDtnIEQaucW+I9ouk7WczRwTWi6qm131vpK+kac4z+0
         FiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734699; x=1750339499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhSPjmAyA8pIxhMtvIKhAFsTVRGm0gzw/fSyIMnZboY=;
        b=iR0mVFmHgpVrBzeGcCQ8I1hGZK4bOyeeWCbZo3JJ7YKAMo0D5dS7ZaKxvLDcGcLi42
         nAJCEmlnSBWBNI4R5FWyE6Rc4KCmCFaLn11eKTferWIDX+PtDvNpdscRDlfw7rRJ40ff
         GeszSjYSuPD+qDL9WQT2y7BbVZk+2OKa9KyKLyOgGAm9zW79sl8d5jtjotP75X4eZ7gC
         5YTY0c8OTZwNCBdcQDrlUvOA/yNn0mSM2Y+7Ek06DbuVGNXStLZDNdPYjaHf25AeXWhV
         Cx1DyR1hubv/+zAN7v9YlZt51x9ikjXCJ3S7KmNDLNT+Dol1ONWsQ9SxkYYABOJ0SVB0
         2Bag==
X-Forwarded-Encrypted: i=1; AJvYcCUtYss2V72lbljXfFD0znyJ3O998S3ZXAAg8viyDtqLZl7hPaK1aO+HkbgHfH1e65xAlcfdMvFQ2VWpL4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3RZ0YK5eUbW9P5NsdOj+qMzrizZOZd3B3c6okjKzzC/TEA/JU
	pIl541RIeb/9hc63zMhTrXVYkq9UC1dWjFTZ8axpM06ImsT4e4VLgBZVaDmxJgPFKIRNiTlIOPb
	ZmW+LbsrgFVtH5e+LDaWVOxvrCZm+5LNg5nz+ifPZqA==
X-Gm-Gg: ASbGncudhjw5oBd/sDsYwgJsZaDEUg4TOOnP5KTg/EbFaNjlFdTHBp1qponoQ7BjwgT
	Sz6smJpsAoiEkyCr1blzDNeUgOn4XS/CDL/GDpNo91b4kSKj5R5TlxyL+nrSb304PP5p5Jk1ASY
	9ERBvZfr1FTcMEahq4Im4Kyj4W7CTmaexIurCLaZ3FKsy1
X-Google-Smtp-Source: AGHT+IEXc2HNwR+arC4fRPEFksycFniWaNbrCQxuAysOQziE7TtUqOEu/PfXdc7DJFVevcMFaqzNNcUrtmqmcHPi7Pg=
X-Received: by 2002:a05:6e02:2611:b0:3db:86fc:d328 with SMTP id
 e9e14a558f8ab-3ddfb57a71amr32260835ab.5.1749734698811; Thu, 12 Jun 2025
 06:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-13-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-13-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:54:46 +0530
X-Gm-Features: AX0GCFtl3CrqRqD9KaNbf7iyN6PgsitR5osvCuOQHoEz6erXpTG9A6k-oITxB2E
Message-ID: <CAAhSdy0C6adKeWmFadS2qeZgJu0VWEscncu7Wti==eCzjQgSsg@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] RISC-V: KVM: add SBI extension reset callback
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 3:52=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Currently, only the STA extension needed a reset function but that's
> going to be the case for FWFT as well. Add a reset callback that can be
> implemented by SBI extensions.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for Linux-6.17

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_host.h     |  1 -
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 ++
>  arch/riscv/kvm/vcpu.c                 |  2 +-
>  arch/riscv/kvm/vcpu_sbi.c             | 24 ++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_sta.c         |  3 ++-
>  5 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> index 0e9c2fab6378..4fa02e082142 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -407,7 +407,6 @@ void __kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu)=
;
>  void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
>  bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
>
> -void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
>
>  #endif /* __RISCV_KVM_HOST_H__ */
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index bcb90757b149..cb68b3a57c8f 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -57,6 +57,7 @@ struct kvm_vcpu_sbi_extension {
>          */
>         int (*init)(struct kvm_vcpu *vcpu);
>         void (*deinit)(struct kvm_vcpu *vcpu);
> +       void (*reset)(struct kvm_vcpu *vcpu);
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *r=
un);
> @@ -78,6 +79,7 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu,=
 int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)=
;
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
>
>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long =
reg_num,
>                                    unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2259717e3b89..ec9f44545cea 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -96,7 +96,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>         vcpu->arch.hfence_tail =3D 0;
>         memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue=
));
>
> -       kvm_riscv_vcpu_sbi_sta_reset(vcpu);
> +       kvm_riscv_vcpu_sbi_reset(vcpu);
>
>         /* Reset the guest CSRs for hotplug usecase */
>         if (loaded)
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 3139f171c20f..50be079b5528 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -536,3 +536,27 @@ void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu=
)
>                 ext->deinit(vcpu);
>         }
>  }
> +
> +void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_sbi_context *scontext =3D &vcpu->arch.sbi_context=
;
> +       const struct kvm_riscv_sbi_extension_entry *entry;
> +       const struct kvm_vcpu_sbi_extension *ext;
> +       int idx, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +               entry =3D &sbi_ext[i];
> +               ext =3D entry->ext_ptr;
> +               idx =3D entry->ext_idx;
> +
> +               if (idx < 0 || idx >=3D ARRAY_SIZE(scontext->ext_status))
> +                       continue;
> +
> +               if (scontext->ext_status[idx] !=3D KVM_RISCV_SBI_EXT_STAT=
US_ENABLED ||
> +                   !ext->reset)
> +                       continue;
> +
> +               ext->reset(vcpu);
> +       }
> +}
> +
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.=
c
> index 5f35427114c1..cc6cb7c8f0e4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -16,7 +16,7 @@
>  #include <asm/sbi.h>
>  #include <asm/uaccess.h>
>
> -void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
> +static void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
>  {
>         vcpu->arch.sta.shmem =3D INVALID_GPA;
>         vcpu->arch.sta.last_steal =3D 0;
> @@ -156,6 +156,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta =
=3D {
>         .extid_end =3D SBI_EXT_STA,
>         .handler =3D kvm_sbi_ext_sta_handler,
>         .probe =3D kvm_sbi_ext_sta_probe,
> +       .reset =3D kvm_riscv_vcpu_sbi_sta_reset,
>  };
>
>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
> --
> 2.49.0
>
