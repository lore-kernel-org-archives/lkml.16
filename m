Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D18239E67
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946142; cv=none; b=d92qJolLS2QH5Xiw3/nUbdbYzmH18nioF0BzuHTZsgkXWORSmvdpqhFJy+HqurFqMcYHcTgPVa+yLAToJ9B5ruqFx4wpg5JpFZyGLZIJN+a97O/vbrlpfX3RBo4hoDEBdAiEJ8ceA+XcSD7x0sV8gqR5ZgBFD0juljpcgugXtS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946142; c=relaxed/simple;
	bh=G5DjctQXgpnKHi8p8ajBugWNHkXnFCRfVVal3XFToIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRAXmpp19d/JHgHCDpS2O1kexjpSKaJpshILqlUenU8HHVIPyvHHaKAXP/YZzJz7RM+YFHQyiQRj24F/6AbtMH4XI1N0wHblbDTs+AloRpxU5feu2OTXETiVt6sHUyCefLhyzAjRUil8JGNZD3PpngjDpDcjVIGbvoaLdCEyOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fgjlF1VP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fgjlF1VP"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so7493725b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946139; x=1748550939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9U/5M+ajo+Gkj1tgfbc1vbd2oCHGdy+fsgX0VrxxjDQ=;
        b=fgjlF1VP9G0aHiVcaBbmbjk6X83+LQJc1GShZHyVup4TMTbHMhs+sLZZWK2/0tthgX
         Jv/ETPVtJ7T+y7f8w9VffxJk/W5AzchnNBNeHqju0xsiB2jF8H+ZPX91dKY/amy/yrC0
         yRvln8CSHsLWdZt9q1gzWqVbxcQ96QfZ9nfDdGaqLGZGudcd+klSccRS1bIj3prLqhyK
         qwE/W3fPisuUc9my7z1gSQwDyb7CKbZ22qj3C+/6MX9yggtXV5127YSBWhrAsbCkkk58
         VelxSW4orGGo2Ner1XSpwx1EpYX+LtSnky8m/RCtAgnabaGYT4cOfGN1rkrTVXJI8/dR
         hXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946139; x=1748550939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U/5M+ajo+Gkj1tgfbc1vbd2oCHGdy+fsgX0VrxxjDQ=;
        b=PWlLp90jab5XepZ3kOOqH4vWsBWwnCKv24Qhw5EK2FAyCFa3H/vmy/w1s5k3N9fu0q
         rtNfT2DhDHjAkhycPqQHTx1es9jIo9KX2c7rc30IaKINIrHnlCQvUtb2e680oUGK8IyR
         /rG4xg3cGtdjK8omdDKq3q6v4O0087hDQjeiw7rYGRl4kIjoljhBZjIy/+cZNUhr8QmB
         0pxWnAWDeuv8fIQnSPoCBjitEhjbNjoH9jPGlphJldPAMxlGJaiL4/4LH/gQjxDw/ZFX
         NgNLpplxxPKSFQ81AXHVN/895mbHesBc/28ixG797Jo943+5Z9r1yRJibbkvwS68KWq4
         z0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqWJyVBPeoy3PDeWLv5l8AQusKoTwGuILbt8veI/jJTCzwaxn1AlK9iCvYKySbODFdWyjWZ7SXuRZW+ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wOchS4biQhOghXVeR1lpMhaq8IJs3OKweMVVQ9fJh9A86wpR
	K3ITcyzaAqNHdxoUKK8+3DGE6HaSQWenoGJtRPGneC7HJtACye6Zk4JNo35a5gsogZ0=
X-Gm-Gg: ASbGncuzwlMMG041inZ53AQDrT60CXTRb6/643Zs5EtCnLztKs76YTxbU+Od8D32KuH
	dyp0jopG5zuBwvzyDjGcu78ljDrj3XzsqPHanspQbkE/n87tKrV6UvZbmnTqUttImaQCPsjqHAT
	k3Y+AUzwlWPRF/S+/XJs4SiJx3OF4l9gk8KlfVv+co474SaBiG/TYEnQOpc/8IC5Isfbmvm1xnu
	NflC10G4Uq2cjLhvyIfDXPy25eXM4sUPGNVxNRHxLTShivg6rDop1p6wNebg16CVXEuf4n1A+L/
	lm00mQWFCYCRw9vmS68iEe0p4iDRwju01NoFrXsTVwI8p2OVTbfaEZ1PQ+1jzbnZ
X-Google-Smtp-Source: AGHT+IELwMEFwHhuScHHyQ7/U0noZU5+9NnOKAusz1Utvndq2rvsq/J8AdaP7d6jJo94bLP1ogTjNw==
X-Received: by 2002:a17:90b:17cc:b0:30e:9349:2d99 with SMTP id 98e67ed59e1d1-310e96b5ff6mr767848a91.5.1747946138723;
        Thu, 22 May 2025 13:35:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:26 -0700
Subject: [PATCH v2 2/5] RISC-V: KVM: Add a hstateen lazy enabler helper
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-2-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

Hstateen has different bits that can be enabled lazily at runtime.
Most of them have similar functionality where the hstateen bit must
be enabled if not enabled already. The correpsonding config bit in
vcpu must be enabled as well so that hstateen CSR is updated correctly
during the next vcpu load. In absesnce of Smstateen extension, exit
to the userspace in the trap because CSR access control exists
architecturally only if Smstateen extension is available.

Add a common helper function to achieve the above said objective.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++++
 arch/riscv/kvm/vcpu_insn.c             | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..1125f3f1c8c4 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -6,6 +6,8 @@
 #ifndef __KVM_VCPU_RISCV_INSN_H
 #define __KVM_VCPU_RISCV_INSN_H
 
+#include <linux/kvm_types.h>
+
 struct kvm_vcpu;
 struct kvm_run;
 struct kvm_cpu_trap;
@@ -44,5 +46,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      unsigned long fault_addr,
 			      unsigned long htinst);
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask);
 
 #endif
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..0a7e229cfd34 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -235,6 +235,36 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return KVM_INSN_EXIT_TO_USER_SPACE;
 }
 
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask)
+{
+	/* Access from VS shouldn't trap if smstaeen is not present */
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	/*
+	 * Make sure that KVM doesn't enable any guest visible state via sstateen (lower 32 bits)
+	 * yet. Access is restricted to prevent unintended behavior.
+	 */
+	if (hstateen_feature_bit_mask & GENMASK(31, 0)) {
+		pr_err("Unexpected access from lower 32 bits of hstateen0\n");
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+	/* Enable the bit in hstateen0 lazily upon first access */
+	if (!(vcpu->arch.cfg.hstateen0 & hstateen_feature_bit_mask)) {
+		vcpu->arch.cfg.hstateen0 |= hstateen_feature_bit_mask;
+		csr_set(CSR_HSTATEEN0, hstateen_feature_bit_mask);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_set(CSR_HSTATEEN0H, hstateen_feature_bit_mask >> 32);
+	} else {
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	}
+
+	/* Let the guest retry the instruction read after hstateen0 is modified */
+	return KVM_INSN_CONTINUE_SAME_SEPC;
+}
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS

-- 
2.43.0

