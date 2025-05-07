Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8623C38C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618246; cv=none; b=kYsi5Ddg47BLuHj6GeYOYFyIBqTHNQzyzdHpOc4qR5CIBxuBqS7Ltmdfyk5md6qKZj71IaLvM8kXtz2mxsRqXfe6OzHSVL0zPeaZ2wFied/a0tb0YZunQqha/qla8hBs6oa//o56nWedFkSpP6wpOw6zgwixMSc/FH/L8DfSt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618246; c=relaxed/simple;
	bh=qEEBf/EvhFb5+S8vt2g6XJwST6O0nTQJRpn12U1g7EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z536eqA9/a21J2VvK+di/QFvM/1qddG4wnJ3RY9iZlwUHjPs93o7um8YBavwvADy8sPurEa9zAgwgtYd+y8c0kHQchR1/gX1tZvDLdvzRSV3BTFLv0IuDQS/L7Syn45AWcRCwa68NPxAyvkhhlLjNGKG04VMUeJsPTwkLx94+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=gU1jYMHt; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="gU1jYMHt"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3da7642b5deso2536695ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746618243; x=1747223043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVz2E+K/uMAryK5WXZfBalhzFkygNbdnQ6nqZ/JT97Y=;
        b=gU1jYMHtLBX/bg6svOh/7/0bsT6Z+HrtMQzz7sSs+MZt1TfP1dglBLOf69poDnGZKN
         rGGzzdWiMTgzVDiLw7vgrMpVRWE+1J74dwaV1KTqsnVjik5t+NuxzGiSUQ2ZGnqCIxNp
         VXa8wyN+oH6CKLiCNzpnoxi88jnA5qACOS3BAagy2svsLUdUYPbe0PBSU/678M5grmac
         CP5jSi5Y9JDkKVdXRfHqwNXY0OaiOG6skPI2gvMB0phNILSWNOhUn67LfSapnmwMlbbb
         8BndgiZM/syqMYPm2tzvwYob1FQfT31nsoj5ZY9u9SQYiL6abQjzgCQ33ZczPsfdMsXE
         Ar0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618243; x=1747223043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVz2E+K/uMAryK5WXZfBalhzFkygNbdnQ6nqZ/JT97Y=;
        b=aAQY4oG5Thikd4RgSZ3ttWYvMe8Bre9lrfeHZWUY1o3vOvD9P704oDGJwCxw4Dh8vj
         19N0Hspv2DXphIRSR82lwLZ45VodmiBp/nJZwEusNqMyDrt2FUQboQq3emnn3S3/4HSk
         m6hr1bDpwtXQt9XkBEjui4n/uZuPMrcCazkH/Att5aS43ue6EMUbKujvDLDBDPBt3krm
         rs9wZWKJcTs1DX77vJOR4HnZL7S+RxscGiU2fYbXQIXlQzrHYcq7DMDB8Rg5CxtV4otD
         YO1GnWCRxXyxLLVE5uNkTOXI1nOmjndiKDVlOz8wak2LJsfQnsnTkG7j8gNQ0bbZJlQt
         o1lg==
X-Forwarded-Encrypted: i=1; AJvYcCVuBeBfxWHTeUzyB3FiXm948P45ScJNszguIzPerrDwp9l6DR51NW8fSVYwhlqtmuPRgWC8K7ZcJ6nfwOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSjPV/DMRwQJq0cwDgW4f+taicHqMvBCwoF90V3Nn4jAjIya5
	0STtbRe8o2PKgWkVR6uDxs4BYOkzBdl55Tt6koBQO319U1+XTcI67iUnlta4R6bN+KX/iA5q0y1
	uXvyf217kjfCZ2YhELWP/rjhj4S8F/mrk4oHuJA==
X-Gm-Gg: ASbGncsoBIVKmkRMG4auuZEFucMNibPryb+LwBsAGpJGNJQIFcaN3EdM+hEPIQNPvQz
	cp/VNMbd5RpUigkHL6gERNCW0hnhYvQyAc83E8ViJgn2JzBodfWK+wsiZcg2g/yjLOZq5oIBTwW
	YrBPRkYvWF6wpmSu0BOpwfJIfUMFVfqU2MBQ==
X-Google-Smtp-Source: AGHT+IEqTEU3gW24Jmigd2cIa8Pl0Ves+lUOw1f5tu/7B6fJK/PzbflFbxkax13tPvkDxDTPwZvRy4srBUyjnSLHpH0=
X-Received: by 2002:a05:6e02:1529:b0:3d8:21ae:d9c with SMTP id
 e9e14a558f8ab-3da738e9934mr32539925ab.5.1746618242847; Wed, 07 May 2025
 04:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 May 2025 17:13:51 +0530
X-Gm-Features: ATxdqUETEm-yQn1qrwlBDD0f3dy7uLqyAaalj3uycXV7-PAmSrqpx552FKWRajk
Message-ID: <CAAhSdy0XBTW1FUuUwSBanspDwpHMRbBL-8oSiRR1R=5SgF1+hw@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> Do not depend on the reset structures.
>
> vector.datap is a kernel memory pointer that needs to be preserved as it
> is not a part of the guest vector data.
>
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>

Queued this patch for Linux-6.16

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h |  6 ++----
>  arch/riscv/kvm/vcpu.c                    |  5 ++++-
>  arch/riscv/kvm/vcpu_vector.c             | 13 +++++++------
>  3 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/includ=
e/asm/kvm_vcpu_vector.h
> index 27f5bccdd8b0..57a798a4cb0d 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -33,8 +33,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu=
_context *cntx,
>                                          unsigned long *isa);
>  void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
>  void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
> -int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu,
> -                                       struct kvm_cpu_context *cntx);
> +int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
>  #else
>
> @@ -62,8 +61,7 @@ static inline void kvm_riscv_vcpu_host_vector_restore(s=
truct kvm_cpu_context *cn
>  {
>  }
>
> -static inline int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *v=
cpu,
> -                                                     struct kvm_cpu_cont=
ext *cntx)
> +static inline int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *v=
cpu)
>  {
>         return 0;
>  }
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..2fb75288ecfe 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -57,6 +57,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>         struct kvm_vcpu_csr *reset_csr =3D &vcpu->arch.guest_reset_csr;
>         struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
>         struct kvm_cpu_context *reset_cntx =3D &vcpu->arch.guest_reset_co=
ntext;
> +       void *vector_datap =3D cntx->vector.datap;
>         bool loaded;
>
>         /**
> @@ -79,6 +80,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>
>         kvm_riscv_vcpu_fp_reset(vcpu);
>
> +       /* Restore datap as it's not a part of the guest context. */
> +       cntx->vector.datap =3D vector_datap;
>         kvm_riscv_vcpu_vector_reset(vcpu);
>
>         kvm_riscv_vcpu_timer_reset(vcpu);
> @@ -143,7 +146,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>         cntx->hstatus |=3D HSTATUS_SPV;
>         spin_unlock(&vcpu->arch.reset_cntx_lock);
>
> -       if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
> +       if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
>                 return -ENOMEM;
>
>         /* By default, make CY, TM, and IR counters accessible in VU mode=
 */
> diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
> index d92d1348045c..a5f88cb717f3 100644
> --- a/arch/riscv/kvm/vcpu_vector.c
> +++ b/arch/riscv/kvm/vcpu_vector.c
> @@ -22,6 +22,9 @@ void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>         struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
>
>         cntx->sstatus &=3D ~SR_VS;
> +
> +       cntx->vector.vlenb =3D riscv_v_vsize / 32;
> +
>         if (riscv_isa_extension_available(isa, v)) {
>                 cntx->sstatus |=3D SR_VS_INITIAL;
>                 WARN_ON(!cntx->vector.datap);
> @@ -70,13 +73,11 @@ void kvm_riscv_vcpu_host_vector_restore(struct kvm_cp=
u_context *cntx)
>                 __kvm_riscv_vector_restore(cntx);
>  }
>
> -int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu,
> -                                       struct kvm_cpu_context *cntx)
> +int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
>  {
> -       cntx->vector.datap =3D kmalloc(riscv_v_vsize, GFP_KERNEL);
> -       if (!cntx->vector.datap)
> +       vcpu->arch.guest_context.vector.datap =3D kzalloc(riscv_v_vsize, =
GFP_KERNEL);
> +       if (!vcpu->arch.guest_context.vector.datap)
>                 return -ENOMEM;
> -       cntx->vector.vlenb =3D riscv_v_vsize / 32;
>
>         vcpu->arch.host_context.vector.datap =3D kzalloc(riscv_v_vsize, G=
FP_KERNEL);
>         if (!vcpu->arch.host_context.vector.datap)
> @@ -87,7 +88,7 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu=
 *vcpu,
>
>  void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
>  {
> -       kfree(vcpu->arch.guest_reset_context.vector.datap);
> +       kfree(vcpu->arch.guest_context.vector.datap);
>         kfree(vcpu->arch.host_context.vector.datap);
>  }
>  #endif
> --
> 2.48.1
>
