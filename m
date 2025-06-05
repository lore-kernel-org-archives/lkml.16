Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821E1FF1C9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104119; cv=none; b=T6/P0/tKpvuBkaj3sMRqzz1rRby/FXMvyyWcCwgdBI97IKrLR71JbiuBmnDAQH+8S72uXvImCYXG0UxGqqcBNnyDxhq9neyeAYJfUIRpwhXc2zdpHoKJ51hSVag+eJ3DPQPbtd2X1NPOhaBS8+zJVvxP/Waij62w12nWaBNH4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104119; c=relaxed/simple;
	bh=mRQoz8hGC8K4ob6BUuQVFp4blnARaI6s2Lx2a7QTqbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtbXVeN6ChfkKyYFKXEpk6PWO6nV0TVGDnG3e6eRMmAitOAL2T9Jq+fUTC1dYJNHEY1Kle6tbBmpJPxiMhbeTtxPAjGKYJgM80VDXevNhC4N4ZLVU5dkzLYf/kVtxVCsGNaPaLKtq5WPFdUAlF6HcviOmBIoGXnE6ZhvDMIdac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Vilb6tQy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Vilb6tQy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30e5430ed0bso651603a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104117; x=1749708917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY/L4bm+P9Rr6i37e8lfQjnEvic7ox3vmCP9UKIlwY4=;
        b=Vilb6tQyxWLFKZiVdZu43u1i2/TFgpZ2bXh+gm3IWmIP+h2XH1LTsVRcr4CplrSeaG
         oqZz+camKuqd70VtAZQE30zU7qzpkR7eAi2+REFSiA6HFfy6tGyIzPflgUj3BbS4TOzz
         imYMsj6fhs8s951gsYzM8d8SYAnvdlzmDbe4IebwCrj2L8ZjLH4l1E4fDoMIGfKFCWTO
         jvAeO6w7iUvMsDdvg306hVJUX1C8Ssqz2+4UdUPVnghkuTMiP+D7N2fAVPbzukBLhLCa
         H5sb3+rklHdv8gaoSZQ13eCsZidbN8oyL9kO7qkHwdDyitsTkwS5WiYbFnXd/Am4VY++
         Tmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104117; x=1749708917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY/L4bm+P9Rr6i37e8lfQjnEvic7ox3vmCP9UKIlwY4=;
        b=pI4E/JigKrzmNiBmZIBZ1+SI438XTB1pG7BJPsY7avLJKbQpIPekhvE8Sw9X8Qq2Wt
         eYo1Phwd2gpK1KxPMGvTZFtpNOnJc8XuTfyK1yDZPQJ1293T0zkIlMv3NgDPRexpfVlE
         tuJindna3s4ClLKRFL5Gci8IxZNcz8+Exo/55lN7obfHzjp3Qu/I3FWiyGkbNCIvEbgV
         Roi1pCuKaiLTD0Pw6LjXrGw8oDSe+ujieWK8Xxgk0zouiR1Eth2nzl8l41ZQZx4DhvAe
         x/8JpnvfbPdN9sR2QBVPFYu989aQJoXwqkR+LMORjtaEMqylN7GLaFzCNxvdHlH8v8Qf
         rLZg==
X-Forwarded-Encrypted: i=1; AJvYcCWNRx8WrhHE5GieArAVIAZR6OaHUFxhx0zA6h9RHEJ88po4t/GzJn22quxreyOZhVdl/WC63iuRmi0U/tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiqgpI/hbRwKumjNSzKx/d1jdJ78wk5gc6mrCXm9IjU+gOZqWY
	npo7c5/rlmZ4DIpZlfjwzaBKyl5Wh5rB7zE2jC1IXsdKThZgP4NLPGLM9AreeHgxqHM=
X-Gm-Gg: ASbGncu/fyssNMifzmmLRc9s0A8F5TzC5Awjjbh69wQmhR4eNH6gbmbqHfEjYBMcCsq
	7UgAgoaKL0K+xd+pGtIbIo4KYlumaYJgOdfIvpTNtD3oj7PGvCgkrIfr7MRrzTXvboC4/FdmY/8
	U6/maj7dsIvBfRMI3A+iMSTVPver60MgjJ0QCBeN0r2lztPlNK1hCAlM5sKtOXHADyTPy8VoyCy
	hcGvA87MUfUO4Lzku72zzN/HHPFr35MqvLd8azAMQ8kBTP5/PTJFKrtp18mDzGs5VgUHgavMoXY
	/ylD6mzjsxizlG+80MP4+T4XigmV2G/3+rdnIu0EQLjIkuDAIftkGJLZtUryBHyuJxTLuZanlox
	NHIMf4HvGCh7UAmatq0QROzN9RA8=
X-Google-Smtp-Source: AGHT+IH+eTAD19cy9DJlja/MN5YACVJ9sgwSL2k4cnnE8LZ5kPurak1nzFsWixYBq+aRFevEKulw1A==
X-Received: by 2002:a17:90b:5587:b0:311:f99e:7f4b with SMTP id 98e67ed59e1d1-3130cd6d86bmr8229933a91.28.1749104116821;
        Wed, 04 Jun 2025 23:15:16 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 03/13] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Thu,  5 Jun 2025 11:44:48 +0530
Message-ID: <20250605061458.196003-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kvm_riscv_vcpu_alloc_vector_context() does return an error code
upon failure so don't ignore this in kvm_arch_vcpu_create().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e0a01af426ff..6a1914b21ec3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
+	/* Setup VCPU vector context */
+	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
+	if (rc)
+		return rc;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
-- 
2.43.0

