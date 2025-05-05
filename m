Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA60274676
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481181; cv=none; b=GwVKeThFgVMgyXu3tSVxfiaz4hORXyKox7ySVS7i8klDdIJhUtmDUgP8XiUJQmGHeIOjBpCOHnKLE4Gr2QTk+eprbMdsGDhCeD6eNXMWDwdP2SqmNg6Mik6JmO77HMBGPrrl0fUcPiYdAMybNdrazbTJ6z5N86e5pt0FS59D4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481181; c=relaxed/simple;
	bh=jhp/61im/NHYvFzN/JEXw6pD0pJy0Hk/tmvWDBz/SFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ER4mc+uqaQXBqFLzXg4fCwRDcxClsbLzhDLmQe7w6iFAK551+REKfkr99e1nxEMhWLKWMRRVs3qShzJ4A0/yYpfEh6ayHhPcKl4mwMEeh8oxBK90qjVPf2xeNdWQBNdBS+unway1Wag8QeUW2pZbGLQczuE83SipNulwCAqA9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gFpycmdh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gFpycmdh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22d95f0dda4so71416025ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481179; x=1747085979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBkYMTmSl4PimBL1H4hWSadeldBIQV0hA1hHqFFVE6E=;
        b=gFpycmdh43qMf4a1ik6oAS3vDg61v0R8M/JeDgndL26gLENsgCoK3p747btYo/jxsg
         9IqLoBGljp/2IBwFvjaqxBsP6AGJuSF+Y2vCVZvTFHGEqotcI7P68EB8VMcnPQsDTk+y
         bNRqUw2rXBB+LA4DXrXWXBIzg2AYoq6fvxN/ZKTNDqyVhiKPFX+CtTt0Ulnv8AlSjUsr
         gSb5oJ5wB8lza+wqkVGi4o89YjUx0Z+U8inLnKgqXhfrjHJVHjz6QVLtTIPL+YUd0sv1
         Vxxf59N5CTgJowP9wiD1/sxy0hIyoK59bTaxwigpJSHjG5PatCmsH+XpycB32oj70S+w
         QvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481179; x=1747085979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBkYMTmSl4PimBL1H4hWSadeldBIQV0hA1hHqFFVE6E=;
        b=mQ03SOciEdS36fSNewCNMePwCy9IHPq4TqhY7BXKxh9DSumf4xn5cWg/D6qaG+5EfM
         bhsEZvQo2BNW9Eh1MHEVY2F3QYozKnLGHD96Ks76/a9oZjaewb3fjZHnoXITr364Ke4E
         1P3rhcvwYBuecps5vpqy7xaFUNhRyEOXZjU0kd+wT1tXhI7nZKPyBiHVtwK6DafXnQGJ
         XZwkcdCMPS763jH754/u/2CRdhX1OY+rrVe2SdIyz/cd4ygsYc8JHSJzvKPBY/uZs5T6
         L5AU06NTiJE5UKjg648Tx9adMTdAXWisO1lLVxG8txH6lD+shoI5cUtA94RSXzzMl943
         wNvw==
X-Forwarded-Encrypted: i=1; AJvYcCUXkxHlSQ5CR/bYhh4DAHGeRIb/ScrravTnz88P8cI6SBuycY3fBiRU8Lp0Ovt0w/lDw3LKpuZFObx5Z2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6DJb4l2RUjG2z+HdK0FEdoIVObs+17T9aCOFBtyUR4FoA7bn
	1kfCcs28nTVLiVynCgK9iGHneXaJlI/9c4EYAq50YMdX8+4oktKbaMKSkZmXqTw=
X-Gm-Gg: ASbGnct/UnqUcSolz6EqwVxIJ3rqD136ty5do1hZlzf8iGxbINl+D4uaa967up8xdPN
	GP9vslUqELs2URut7oiqQBIT0//3VlBIlCmu8dG5n3rd6P7/TKhx0zsM5d87Ih4fHJqiib7FtZ7
	/myKEP8VMBTVN+xz5EcU3xKJuZ1mKaAsCcxIH7+2enIc4g5+VjTxOfo7fs1zDkLVrnuiWsm5z/S
	vddVP5rEZYBcawQU99qSVpcq+or9eTUskd9DspTVyPlhp5SoxqIuE7GArtf63pFB59NNfrrmMm4
	8PWHLIZHKN6e/hyJPUNVZgUA5DYysug8ov0MWBFSxAClRQPh6oGqbg==
X-Google-Smtp-Source: AGHT+IFSjl7ZZTm9sRdhzbga0ISTzjUyoYmypOpH2UHF3JUrUhm15fO1yXOvC7GyT9L7318UQ6VTkw==
X-Received: by 2002:a17:902:ecc1:b0:224:c76:5e57 with SMTP id d9443c01a7336-22e3637e732mr7765845ad.39.1746481178982;
        Mon, 05 May 2025 14:39:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:28 -0700
Subject: [PATCH 3/5] RISC-V: KVM: Support lazy enabling of siselect and aia
 bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-3-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

Smstateen extension controls the SISELECT and SIPH/SIEH register
through hstateen.AIA bit (58). Add lazy enabling support for those
bits.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia.h | 13 ++++++++++++-
 arch/riscv/kvm/aia.c             | 34 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_insn.c       |  3 +++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 760a1aef09f7..9e39b0e15169 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -142,12 +142,23 @@ int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned long *val,
 				 unsigned long new_val,
 				 unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_hstateen_enable(struct kvm_vcpu *vcpu,
+				       unsigned int csr_num, unsigned long *val,
+				       unsigned long new_val, unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_rmw_isel(struct kvm_vcpu *vcpu, unsigned int csr_num, unsigned long *val,
+				unsigned long new_val, unsigned long wr_mask);
 int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long *val, unsigned long new_val,
 				unsigned long wr_mask);
 #define KVM_RISCV_VCPU_AIA_CSR_FUNCS \
 { .base = CSR_SIREG,      .count = 1, .func = kvm_riscv_vcpu_aia_rmw_ireg }, \
-{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei },
+{ .base = CSR_SISELECT,   .count = 1, .func = kvm_riscv_vcpu_aia_rmw_isel }, \
+{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei }, \
+{ .base = CSR_STOPI,      .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
+
+#define KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS \
+{ .base = CSR_SIPH,	  .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
+{ .base = CSR_SIEH,	  .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 1e0d2217ade7..3dfabf51a4d2 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -235,6 +235,40 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_aia_hstateen_enable(struct kvm_vcpu *vcpu,
+				       unsigned int csr_num,
+				       unsigned long *val,
+				       unsigned long new_val,
+				       unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_AIA);
+}
+
+int kvm_riscv_vcpu_aia_rmw_isel(struct kvm_vcpu *vcpu,
+				unsigned int csr_num,
+				unsigned long *val,
+				unsigned long new_val,
+				unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_AIA_ISEL);
+}
+
 int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned int csr_num,
 				 unsigned long *val,
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 3bc39572b79d..c46907bfe42f 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -260,6 +260,9 @@ static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
+#ifdef CONFIG_32BIT
+	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS
+#endif
 };
 
 /**

-- 
2.43.0

