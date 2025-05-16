Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99677233D88
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389400; cv=none; b=Fm8/6BXuB2DxgRmLUAJnZfALeLgMNzF+E4LiOt7AF1S0l37A4EUcDpkrf1HN6IN7iKA0vK1Wrsfc+raFL36ZXs5dH1bKs8eO9kg3l4oz9sHeBoD+sHisuJ2qo54KX2Qf2CzIFPEGlqSGNGsi7I594x/3adYTcn8pWVQvsJmp0HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389400; c=relaxed/simple;
	bh=4X67REA9r+ghn/5V4fyB008xDYh4aHfUgGG1zyzi+Bo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sZf8tMd6zp7yz8NXcJchkBy76lL+mQ1qIAUUv+LGk0ZDlf+NW97rVU1lpUQr3JKmD532ax450ZICIIwAM92il5S6aKJIPAU/3K+lsfGO2LJNSyH2FtXhFbAk1lO7w5hJ3spdyzrH9fKxCVtx76GEYwUUic3Kv0zympVy7NV/58o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mYujRaZn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mYujRaZn"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad1b94382b8so335189966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747389397; x=1747994197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti4ZqP+Hl0JDcB2DFZd59wj7uwh2SBcukM1irTJ/QT8=;
        b=mYujRaZnfFY5Ob8SR8TqUhIyw3i8/O6QwYISyT9+6QY2+EmU/Sg3Se2zy04gz+D69z
         SvFUHeNp/FPYVFFYSpjp9wptFA3SM5FoALJueDlY7vS7GvJP1mv+DRxy7ecMLPJyVjtw
         ZUGupVNzoCo1nZ6lIT3NpX6uXGR/yZRbJ3g07W4IEZDbTUuH1r77uobB00e4zWgfBDrO
         b9D4RVvVXQfLN7LkB2GCBE/HQXsGKpzHV/1R6jzNFJCNqTK5swl1sf2a0DaHCvuUpY7z
         NeKk+WD8c1hJlha+4HTc20dMNBB86S0c7/4zUK0xa3UsRw1lI26xJCqQtIjTxpJ2uxAB
         SIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389397; x=1747994197;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ti4ZqP+Hl0JDcB2DFZd59wj7uwh2SBcukM1irTJ/QT8=;
        b=Gacwob4+aU4LFSGASBth+ojyBQxHqiJQn2NUrxpqmVnLSMvPPHO1eoGoq8bRLIbkqT
         i9NJp9zqi+4/CWByhObQaUp2SynhZDKNkwZFS2zSbr6H3R7LHuWBvP3ypylZw1D/G+UJ
         yKVM7ScgyzqsgQ5SjZCOmZqAmgttVvuTwpRk8dh5HOq9SMEr9Wd0scVSHqMfOKydzyRH
         NwRJm5gpNY3rJMiTxjsxPp8Kfnq+vfw9hFXk7gcIDLISpsbsc3AQYLMGi/iUAJzOSl7Y
         op+L8BsDUNAL4XVjHnyM0OI0OFI0rkOu5QBqDB3VZY8XbQY1/PXEmqpDO+v5cT6K4yAf
         FL8g==
X-Forwarded-Encrypted: i=1; AJvYcCWcxFiwiVmtg6re7Va8jOTKpZ9X6kyeeJ35A12JP8JKOCtpH9OuxHVJwl8qM8r7eXiZQ2x/rOUyUhGC4ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YymSidxHw758YQYQ2E3Sl8OObZ1VMWydHx4/9iYWIxOTZZMat/b
	FbLtZG6FLpWuAdfdvkpboPFkWPrOWfW5UD6Cxgj1saGdaRgydypdDL05WdiRvpIxW3Q=
X-Gm-Gg: ASbGnctInCgDbZchBGM7kDyTEpBYaVnGOp8x5BIahWKt4Ru4LU0L51JEAGk1btVz91Q
	360X17Hrv3SAl40tGEBl1xSrpbAY7AmUbw5W9I2eWgApK6GQkNhRMfL6UayzHviJFSwLeWUsPez
	7BxEcVYSHv5JomtOD9OVoZBS920uLay6fyV/kwdyucGJhZ8rOeY46PD0PfUzf4H0Lh774QgbdXC
	Sdm6PjFCltt1rPhRjoyjmKBKIchQMg9fRbgJQaq9MrzksiKBL5fltjkrINH1vYri9dv3GTmNNG4
	KeYBkVPZNw9DY356YabYax6PjPkWv833wVfvz5WgYKc6LuptomSwJHai8VVG6KnSXneG
X-Google-Smtp-Source: AGHT+IFh2zAJl1Uj5Dr32GIK/RqZ9T0owi1RiR8KLA1E0llsHrNCCqszm3h/QZEbyvFvfkdXsmjKfg==
X-Received: by 2002:a17:907:9624:b0:ad2:4da6:f573 with SMTP id a640c23a62f3a-ad52d5ba810mr300923366b.41.1747389396719;
        Fri, 16 May 2025 02:56:36 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:101e:447e:2959:9e3d:ac05:c19d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d490789sm127955866b.130.2025.05.16.02.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:56:36 -0700 (PDT)
Date: Fri, 16 May 2025 11:56:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
CC: kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
In-Reply-To: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
Message-ID: <C74B29B0-FB1F-4E67-AFDF-FAD7C86FB329@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 16, 2025 1:11:18 AM GMT+02:00, Atish Patra <atishp@rivosinc=2Ecom> w=
rote:
>Scounteren CSR controls the direct access the hpmcounters and cycle/
>instret/time from the userspace=2E It's the supervisor's responsibility
>to set it up correctly for it's user space=2E They hypervisor doesn't
>need to decide the policy on behalf of the supervisor=2E
>
>Signed-off-by: Atish Patra <atishp@rivosinc=2Ecom>
>---
>Changes in v3:
>- Removed the redundant declaration=20
>- Link to v2: https://lore=2Ekernel=2Eorg/r/20250515-fix_scounteren_vs-v2=
-1-1fd8dc0693e8@rivosinc=2Ecom
>
>Changes in v2:
>- Remove the scounteren initialization instead of just setting the TM bit=
=2E=20
>- Link to v1: https://lore=2Ekernel=2Eorg/r/20250513-fix_scounteren_vs-v1=
-1-c1f52af93c79@rivosinc=2Ecom
>---
> arch/riscv/kvm/vcpu=2Ec | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/arch/riscv/kvm/vcpu=2Ec b/arch/riscv/kvm/vcpu=2Ec
>index 60d684c76c58=2E=2E9bfaae9a11ea 100644
>--- a/arch/riscv/kvm/vcpu=2Ec
>+++ b/arch/riscv/kvm/vcpu=2Ec
>@@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> {
> 	int rc;
> 	struct kvm_cpu_context *cntx;
>-	struct kvm_vcpu_csr *reset_csr =3D &vcpu->arch=2Eguest_reset_csr;
>=20
> 	spin_lock_init(&vcpu->arch=2Emp_state_lock);
>=20
>@@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
> 		return -ENOMEM;
>=20
>-	/* By default, make CY, TM, and IR counters accessible in VU mode */
>-	reset_csr->scounteren =3D 0x7;
>-
> 	/* Setup VCPU timer */
> 	kvm_riscv_vcpu_timer_init(vcpu);
>=20
>
>---
>base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
>change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
>--
>Regards,
>Atish patra
>
>

Signed-off-by: Andrew Jones <ajones@ventanamicro=2Ecom>
