Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA591F461A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397911; cv=none; b=X3fIkIMYeNwjZoIUfT/NXsTmr4gsxXoOXzdAIWJbcfZ4cuL01LCss1S0gFevA96xwGszRfg5l6RqOJJOhiccfhbKILTRA3tNI9diRcB7VpEhlMIduKnHsYeGlliuzl/+E5wsdYunFLrQpOF/TrKyV7uHSe/2vMNBt5ZGl22De3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397911; c=relaxed/simple;
	bh=i0ExAqzof2XFCLPmeASsLkrB22kGZnWGGeFJvHlps+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPsJ+XfFYFKRmiIn3Lz3iNTzJGZ2EMWd/efdX8I7JiXErwEwtJQsm8e/7yIZ8cMD5dQd0SphAS8UoILfeZTyuTE4jQr+GNB1Yl1twh55YvKxbPQDsSs2Raj4J1Nx8k/FOnlaXVpNZuh8lmYeEUH63+/sZXQFO5+NL1qF6oPUAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=NhvkQ2Iq; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="NhvkQ2Iq"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85e15dc8035so62904839f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747397909; x=1748002709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXLHJHBQsbaoIB4GIfSa4RhdBp3kCgsZPB8o/GVOJzA=;
        b=NhvkQ2IqKwboYX75ONSl1R+8ITRnzUgQ7mFaqVNHxEHUg9Erzp6oxYTeJNYz8HPCAx
         jcXtyAhVQMUNB1ZTazmSb0GANnT256neVUXKUpMK3eLrhqLpHMiKIO75ZOMgAut/oI4Q
         rYV0qOkOTtUwbWVRTNkyJXR1Q5R5tIpFeGahpa8rIfSAtDcIbe7feseWPbOdg32ZR4kn
         UCdaxc+oKf8f8kF4BhEoQpqQk5AOy9Z+KN8wO5HtP32qLYRosGWtX1X61iI7KIpc+ytX
         bUOgy1IIDYaJROuBIYWinDTdNlCe7+mH6z5ltnSdfYaNrbhLidaS0xqmz9FHoWi7eXJx
         5sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747397909; x=1748002709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXLHJHBQsbaoIB4GIfSa4RhdBp3kCgsZPB8o/GVOJzA=;
        b=ibA+TbPCii03PYlxADh2gh0UzyaoLdYwK2ko5Grri6DuDtbWoWarW6bpZl2/MdmX9q
         Vs9JWE0chiflghi/vg5R4JCSe9/CFJ1alyoXPpRhcVLn0+2kV71Ymq+647NXNimNlTxZ
         PtOb7QMXhxHnS4D6PPyxdejbbvPmNQpL/5XBUxxLK4KnMS0ZK7eL1mw+t7i83i7G698h
         4Yiw0kEfRX4+mrZnrBtwORPs9mGzxdax5MOp7I5J3FI1WIZC0HNfT/ucx6aKqZw3lr9/
         AY4DnjzO++JyAUYlU7sGntD4BN7YVjJC7XTBjEUx+Y41FvtHZM4OyKG90xSFX1OnyaNg
         PKvA==
X-Forwarded-Encrypted: i=1; AJvYcCUVq4OXLnFegUIvorR8QqUqRl41b2lWfaL+RHLbW0CFTyz7HYI67s+ix7SdrcMpao82FfgV0nwczyJkcpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynNhDTinFabiGFI5ynj26rUIZiXL5uPJ5IUyxQoTdIeZF9qzc4
	8bMfuDXd/3JL8wMUCzMS/iU22q23EzZ9IWwqJfuIquro3jWMveUZ9WFysxIh/EuFRa7XpCrnUCY
	68JH6iJaBQL56kb5Y+HnaZVX/QJnBQnt3kMMfPHD+1g==
X-Gm-Gg: ASbGncs39cxihTYK80fs7EeH4hcNqNqiEPS+geVeTlCfCSy15NyYP8hDBmNc+r0B/RR
	HYd4mYmlT+VsL3XS6wQqs8Vnl/ux8CwnSL2mzdAd/QmhzSEPQy1cXn32dUKAuP4ROmDmkMvz3q2
	VjKShPhWIPubnLgS67wRnVp1ZbjdFRFb+M6Q==
X-Google-Smtp-Source: AGHT+IHD34D+aR8KNoG6UkMJChpNYbMrPeEL3hYF56R0IoB3miRbKE+gadHVNrNRu+Eu4UN/LJ5mYFMMVGXgscMuLoE=
X-Received: by 2002:a05:6602:388b:b0:85b:b82f:965b with SMTP id
 ca18e2360f4ac-86a24cd615cmr292088439f.12.1747397908949; Fri, 16 May 2025
 05:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
In-Reply-To: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 May 2025 17:48:18 +0530
X-Gm-Features: AX0GCFurvQGwK_iA09j5NRc65qTDV-rGIIByVlNf-XtMe4x-bC4mOj899x_A1VI
Message-ID: <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 4:41=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> Scounteren CSR controls the direct access the hpmcounters and cycle/
> instret/time from the userspace. It's the supervisor's responsibility
> to set it up correctly for it's user space. They hypervisor doesn't
> need to decide the policy on behalf of the supervisor.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes in v3:
> - Removed the redundant declaration
> - Link to v2: https://lore.kernel.org/r/20250515-fix_scounteren_vs-v2-1-1=
fd8dc0693e8@rivosinc.com
>
> Changes in v2:
> - Remove the scounteren initialization instead of just setting the TM bit=
.
> - Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c=
1f52af93c79@rivosinc.com
> ---
>  arch/riscv/kvm/vcpu.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..9bfaae9a11ea 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  {
>         int rc;
>         struct kvm_cpu_context *cntx;
> -       struct kvm_vcpu_csr *reset_csr =3D &vcpu->arch.guest_reset_csr;
>
>         spin_lock_init(&vcpu->arch.mp_state_lock);
>
> @@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>         if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
>                 return -ENOMEM;
>
> -       /* By default, make CY, TM, and IR counters accessible in VU mode=
 */
> -       reset_csr->scounteren =3D 0x7;
> -
>         /* Setup VCPU timer */
>         kvm_riscv_vcpu_timer_init(vcpu);
>
>
> ---
> base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
> change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
> --

Overall, this looks good.

Reviewed-by: Anup Patel <anup@brainfault.org>

Currently, the scounteren.TM bit is only set by the Linux SBI PMU
driver but KVM RISC-V only provides SBI PMU for guest when
Sscofpmf is available in host so we need the below hunk to
completely get rid-off scounteren initialization in KVM RISC-V.

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..bdf3352acf4c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -131,6 +131,12 @@ secondary_start_sbi:
     csrw CSR_IE, zero
     csrw CSR_IP, zero

+#ifndef CONFIG_RISCV_M_MODE
+    /* Enable time CSR */
+    li t0, 0x2
+    csrw CSR_SCOUNTEREN, t0
+#endif
+
     /* Load the global pointer */
     load_global_pointer

@@ -226,6 +232,10 @@ SYM_CODE_START(_start_kernel)
      * to hand it to us.
      */
     csrr a0, CSR_MHARTID
+#else
+    /* Enable time CSR */
+    li t0, 0x2
+    csrw CSR_SCOUNTEREN, t0
 #endif /* CONFIG_RISCV_M_MODE */

     /* Load the global pointer */

I have queued this patch for Linux-6.16 with the above hunk squashed.

Thanks,
Anup
