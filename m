Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEA612CDAE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749444196; cv=none; b=lT+TSNMOpLDJu4mp6GczSGKUSp1pR4zbWmqXSA/w6oOEnDZJZO9Yd2qq2wix14pSF/mf7w0MY3n0gElLfcOZZ1GGXlSpt2pj8y/RO0fnI8mqID+PYJWyOmZ53nzzv4FSHcJpq1wzIrdeicdTnY73zo2Y59j1g9Z63D5uINA6MuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749444196; c=relaxed/simple;
	bh=XzAJgPdBBnmkzunedSqvjUymGxpV7sHfPAEWvIEeanM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDv1LfcYYvEiuZo1x5Zc/JARJZwPGQtVg+IFhFkaeI8PMhLBHIBy7d7X4iNLypVbrEZSqSnfoFmNJFd6wKlGvK3J0RZjM9U0/w1Gqacu9gX1Gpg7f4aFDK+7dSZZqHzEKgCznBqfCf3NdDR/8CdDUyU14s6dPVHrZUPMQjuaX/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=kxFj+wGs; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="kxFj+wGs"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso37233835ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 21:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749444194; x=1750048994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLPCYr5e6u6vsBLYdaChBsgJrVajuCmHnbhRzhd1SBo=;
        b=kxFj+wGsJ1R80zCJwr4N4apb1ooS3BBGXddVs2QsAhAiO571nzz0lCgb11pPIzG+H4
         xM7HM3pjiMVXleEBb90x4jdNe3wyFHQwdYAPuM+MqMyw0wQ8msy513eJmuBQeJwz33za
         9ApgSDNWgcxrljkWtPsTwAlP2kDhq3rDdhJ6vXi523hY8vPNtLfnPNdGtwvZziD4M7UD
         iiF5bCp3rvOCMMtyhJ0IxqiAXxZPzi/RcI7nx2VJlr68/BqIz7+6iJUpSkYVpScqdPsW
         ZXFMvwR3ZwezxIL/W9+7Hfr/mgjWxdNhDOQbxoR0EqRYo9qljMhhUWFyY2XQCwQ/VEjz
         HARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749444194; x=1750048994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLPCYr5e6u6vsBLYdaChBsgJrVajuCmHnbhRzhd1SBo=;
        b=gly4uOP6KhjCzw2v6htjg+B66IhW+VDRwGjht2ymQ6ek2pSQSZjZuf5lDzlygQ+wym
         xWc/fQ2Xr5BPc6NnDiKjtz+bMZ6zF7oEPX3nGEgs8StuvPqdJUK0sEjwWQfjhP3B4Uf5
         hgzUlCFF7bPT4y7arY03TJm87mouTl54xB8k49bvasKprL/93tKUU2b4RVSjzsz/AtBE
         OG8n77srVfcAahHwCTSedr1dPq4tv0K8QOz/rX58iRgvlk+XAHjHsYIAO0aN3jFG63Ut
         VArJLqQ/CDRhvrjhxreSPk3iPyZburX0YE3tW6wdNwoWSF95Qo3G+7Ot3izLOWfW5b/B
         L4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVeioo1hlLCO4u7vvOU7c8puW7JaGMRc7iA5oUkSO2nKwR9OZCfk4Q6EvVmj3MB56ma1NE6frii/xWTV/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVSYSdN79LVQTo7ncCLkiqpQV29DHLqqzF4si3dSoMSZWW2Ph4
	3l/z6T7PIB9zy2UpJ7CKNpe74zz/Kkq27tryn9D2icIQPN2n3y8W9kZO0iBkNfy+DIh8d74mxFE
	LpNewbn870efs2LE4+gCa7+tQKv+b1LxCyqjjmVE74w==
X-Gm-Gg: ASbGnctXg5dOKmpqnB6TNa6XFz68lZsLkIcfVZASikzENRzPIHVRUkbuN4Ay71LvS6L
	z3J0Oiq2eFjIS4t/+TkFKZRwkd1xPwgbVmK8DcK/LFZpiGPX2k54DUqBvurWOn7yKfkfh5RyufG
	LA3QzkIWExTDJN2i1uyQJq5AIylKqCT34HWs+vYXnFPt9yzrzeBvWL36KuP5yL8rqEsOCMNmt0K
	yjZOYNsvRqVSIw=
X-Google-Smtp-Source: AGHT+IFFQRtEtS/hG2Tw2Y3tZ7JBIHK8O7AtEvWbVFh3c/WKDcNmXYTLq1lKt0Z4JpmLj9iCX/JRFdqRRAtWqZiaZsc=
X-Received: by 2002:a05:6e02:148e:b0:3dc:8075:ccde with SMTP id
 e9e14a558f8ab-3ddce3ed62emr126702145ab.4.1749444194076; Sun, 08 Jun 2025
 21:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-2-apatel@ventanamicro.com>
In-Reply-To: <20250605061458.196003-2-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jun 2025 10:13:02 +0530
X-Gm-Features: AX0GCFtusVCpQiVS1V0qV1zXXOQlncy-D3d7CPodLU4fm3d-HJJqnbKjeEFLTPI
Message-ID: <CAAhSdy1O+MvJ6nr0D2+8_9cQ=hT+zW0f-rcg7sw8uP_kuzd25g@mail.gmail.com>
Subject: Re: [PATCH 01/13] RISC-V: KVM: Fix the size parameter check in SBI
 SFENCE calls
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
> As-per the SBI specification, an SBI remote fence operation applies
> to the entire address space if either:
> 1) start_addr and size are both 0
> 2) size is equal to 2^XLEN-1
>
> From the above, only #1 is checked by SBI SFENCE calls so fix the
> size parameter check in SBI SFENCE calls to cover #2 as well.
>
> Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on V=
CPU requests")
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
> index 5fbf3f94f1e8..9752d2ffff68 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -103,7 +103,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu=
 *vcpu, struct kvm_run *run
>                 kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT)=
;
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> -               if (cp->a2 =3D=3D 0 && cp->a3 =3D=3D 0)
> +               if ((cp->a2 =3D=3D 0 && cp->a3 =3D=3D 0) || cp->a3 =3D=3D=
 -1UL)
>                         kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask=
);
>                 else
>                         kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask=
,
> @@ -111,7 +111,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu=
 *vcpu, struct kvm_run *run
>                 kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_S=
ENT);
>                 break;
>         case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> -               if (cp->a2 =3D=3D 0 && cp->a3 =3D=3D 0)
> +               if ((cp->a2 =3D=3D 0 && cp->a3 =3D=3D 0) || cp->a3 =3D=3D=
 -1UL)
>                         kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
>                                                        hbase, hmask, cp->=
a4);
>                 else
> --
> 2.43.0
>
