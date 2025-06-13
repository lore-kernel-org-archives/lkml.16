Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FB8259CA5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797886; cv=none; b=vACxnYzpn4bdKwlAngeZjoq5HnbxjwBypoSYDLUNnUGM16MAAKjcEN01t3VxVbwYg0+on5DVLtR5ONlfLTqarzGq0z7YWCPVLmlbtVlEwEb5BO2cHwZlWs62M3d6WHzLrfvAV+bZHm/IhjoppFYzmtX2779JWMHAXfh+c2ryS2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797886; c=relaxed/simple;
	bh=S4GPuCe590xZl2EuRNnIMDQ2EGVo96MnzdBawsw3VME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/oioyNny4brMmxdOVc7nG/eBjjiUx/Lgry+NvHFS/YaoKRMPiEz5dD0agnBYk8uAhIM+4ZJn9ua5jwY7KfzYFjKdf6rmfXTlkhTJoYCJKAlTnydIDdahcupvWKPVdUrpSn1+yCn8I9a9j3m3ogwNsPI0JMJN5ELMdGHpiJTwio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lmUgZLo8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lmUgZLo8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2363e973db1so24190405ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797884; x=1750402684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=lmUgZLo8xgCeCBp+1/EWNdUnInsVBoDGwGrDBLciCnihe9T6Jw8u29g1iqNDxoAUzE
         TYzBS9Z24/bZtrp3u07JvhkpjXQuDI5n5vDQWFyxX5M+sZEF+bmNySIXSuTWUhY46AmF
         XIt3Fm2uwyoHmdhH+oXuMCHy4totmmKIg9YOiMY7ULWdDP3LsiJ98J7yXz1hl6rUUkJ8
         9gnBU+n9EQv1yPdim4Am7qme8oblhE6eqILz9WcE1shAOTroaPepysiIKzGkYVWg61Ie
         UVYbtjxyaMpSSa5m+T4xLB392V6vJTexcX4ulPYYeuSTbfP+keNdSi76d+OXkWWaC+dL
         Z2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797884; x=1750402684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=Rta4uXYilgJe1BRTjGnU5kYAgQxdLdAnGjH/0jNXVlxSecoes3DTYGAbAzobOrSlNP
         C81YXISUmPVXlgYFT5QCKXtHKk/atdRufAr977bh2ZwlqsqIYt05uYDVDsi3d32gigav
         ymkdNokT3oz5rhykG3g6N4ZVfmSlfJqVUHSsNJ24t7zgSDkW2D2gvSbsVUec/M0pE59I
         stMwcihhok7+IBrZw0/t7pHNnRWRRwX5pA3wN+0wE7i5ZrX2usigPop3DgRR2HDRZCnr
         Xnp2ZwkregoSyvZ0cNe1/ZoIMPchMSQmQhevEBAYOMQ4Z1xEPEzKQ5cmwsUtUYe33vQs
         lupQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmO6S+8dW+tg5q9UX4W9s/gsC+GktoeONpU6jcuXH2YJXvN3CFPX9j4AvcHcdt3jdoeruKpYEnbDq27b8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Ysh8LdqlgV6EWE9Bh3kz2fV3fdmHkcqRJf49lHj5TakPEXtz
	5+2F+hlGG/oFc4ciKNbSNM/ISnhJSaGLmRiWPzoDBRhmX6/E+iD/WgdcZheyQnbTsqk=
X-Gm-Gg: ASbGncu88FNnUeiKpvPNLGMB/F52FpMu+IfdO6EftzVRAZr62Lqr3UI7qCf6s9G+NUd
	NRWtd2dWn87/DLQj1ubu5srE6z/dyGvqo3kCzAWYKu0HDnEz6Rsh/1qOUiNEVf++T/+qF3HById
	oOzXD49cDF7REOqb7RxtVS9pnqqyFmnL3Yye6RhHxq7LKaBzRDxhDSpEiw2d3chTWG6Y/dqqHuN
	b0pj/1opmHzBkuYB+DCc3VpfqQlfpqZko6J3EEkPUL3O3DlyI4GJgVSXgBAH50y9lytZP1+sPjT
	d1i5/oT4j2MvyyF1kO8Wa79xPQhmwgxZ+/HOk3U8W3Zt8J8eseiXxrM/Ch0Amb2bUy2SExkcYNm
	fSo4p1nUl73pgdAqLb20=
X-Google-Smtp-Source: AGHT+IG1oIFmYmo4nzolmhFmjeasCs1i1bS0vqnVVHiUcmyimhpiT1WD26mREN2ygRQRC/I3Yp7nzA==
X-Received: by 2002:a17:902:f647:b0:234:595d:a58e with SMTP id d9443c01a7336-2365fb73e68mr22915165ad.25.1749797883849;
        Thu, 12 Jun 2025 23:58:03 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:03 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v2 02/12] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Fri, 13 Jun 2025 12:27:33 +0530
Message-ID: <20250613065743.737102-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 806c41931cde..b195a93add1c 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -509,12 +509,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -526,8 +526,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b467dc1f4c7f..f9fb3dbbe0c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -159,9 +159,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0

