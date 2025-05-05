Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53C2749EB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481182; cv=none; b=iMRIa4e8PJYVpK0VcraisdtaGti80V0xkeDlnYh5kzgHmTd0g6L6M8onCv78pHO6+1Zp3J0V+Vg3+P49eIQFacvCFgKZpewOVD4xrgquHzxp/+wPl7RQMw9vWmxnfX39fdO6ojqZw2c5fJAj6Ft7Mk5N6zrFDIdTTi26pLCQV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481182; c=relaxed/simple;
	bh=hI14ytp30z40KhYvKEMBG0/A96oDveAf8+rhwv3xToI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMk85lexrZFFwdJk1KZRv/NSK2/838f8yCCaJW3Tu00cVslkX/3kFIlCF+K/QPEJyN9v5X0tMaPNbyLA4e7PeJl4cHAX4v/IwOpwgU5l0Z5qyI2KMIrD58iIzamWfjpZDAX/RI+46dluj2lKQsSJQFmjo9Ldft9uKwVwm/D5gt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qCUBoyOL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qCUBoyOL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74068f95d9fso2139011b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481180; x=1747085980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=;
        b=qCUBoyOLZy88zdxUcCZ78CMtAHNsj7EE2KXOKEns3QpFeJjCas9hkh1E7/+1++VC/5
         j59HIUoplA2kD876mFsn5xnuEn/SsX0M/Onha2a+teCfMODM4EcYTnCaeDvAaiYlLMWh
         W2Pwoe5FQTzsADA2EFDjBUhQTKgJFpgnBG2Ed5qd15LvYhSpcblYPio9Go5K3OXhvPCa
         fJT6QqPDVEO+SViNaS9vHvaY4nCibC2G3IAiM6yALIt6UaDq6yknK8EWr88ZCrKkAdrN
         MnBxMo41PP7cwUCrlP48Ugx6kt0Q7378od8cP0kVQALsJI/TOTr1A84KvIpR9RiwJLwu
         IPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481180; x=1747085980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=;
        b=Toxbphner0nm4yAMvUf7HUINERQZr2Kd0angZIXGTIhFAyVA8LC19qCX/u40f5WnDV
         T/HwZAkpMzhcTENyJaUbF/Sc6HPNAOuDxJPJGnuXU4PupgjK+L1i4J/0BbVyy2iQ+YqF
         bGOfLxQTOp3GSqn6wDGWfKoXs4a1s7H7GFeL3MJrjhIGvPRx3zQUu3dvSG3GXk4aTPsH
         J63qBDLV4t6nIzVdOLwM6np6NrYU69zyFsOESYP8NBG38gWrY6vIqAqtemnmGgFw7id8
         9QBUlehcCef1w+ZrBUxWztG/eHObTVU2TCU5py/dGRToj38X7dYb+0C8zdV0hivZF41L
         horw==
X-Forwarded-Encrypted: i=1; AJvYcCUSLQxxecT/AtJdLGNvboS89ZHFmymtSI/+Fbban5nNG0HEXHQXc5eB1K6PlMbr8BNaRbVhCpoHEG0gtxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaU/yrgS3Xl+LwGF/vn+sDfgkfrYq9WkMUlkhnsGxxbfYzDzIP
	G+g7tNuCG3412rBnbTTxRFZd5zCR4ZKzZ6io21DVOJt1Ite1+R35ne6iGZeLiS+BPI+gC1lIeGq
	Q
X-Gm-Gg: ASbGnctfZGr/necqgxLjjdP3PtAoIuTunbgMZlR8QzD4Go2BS7Mbxs97lK/RSVQdLFC
	t6hhF3ouaW1ikxDbCoWB4KLLxCS8IVcAqtEYosxzrm6c7VWwGeo5teRxio5IngQzGkFqDhhC7zN
	nB5S4sxxvu55gltcrf8ZtAvHEuaXTA11WQrSdfFj65oK13j0qV1I02m99aB6MMPTBhR5i5mZajG
	mmAZASoTFqtjQwggOwEYwog3jpzj5E3UJy+dAzawviceYEw+oBbiezXi3m5lQWPLO7bzSQ2HL5i
	+zyOu9koWVY5im9pohpmNJbhWiBHFfwJCZ0z5Dfd8vuWu/amopSaLQ==
X-Google-Smtp-Source: AGHT+IHaY1/wqoejX+c2irF8o4c25FVRdJ7OcAVhO20N1cFEts/lKwVCx4wh1gNDM2vBI71ScyuV8g==
X-Received: by 2002:a05:6a00:2793:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-740919bcf33mr1106942b3a.8.1746481179845;
        Mon, 05 May 2025 14:39:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:29 -0700
Subject: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
instead of bootime.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_insn.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index c46907bfe42f..ed6302b1992b 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
 	return KVM_INSN_CONTINUE_SAME_SEPC;
 }
 
+static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HSENVCFG);
+}
+
+static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	const unsigned long *isa = vcpu->arch.isa;
+
+	if (riscv_isa_extension_available(isa, SMSTATEEN))
+		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_SSTATEEN0);
+	else
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+}
+
+#define KVM_RISCV_VCPU_STATEEN_CSR_FUNCS \
+{ .base = CSR_SENVCFG,    .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_senvcfg }, \
+{ .base = CSR_SSTATEEN0,  .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_stateen },\
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+	KVM_RISCV_VCPU_STATEEN_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 #ifdef CONFIG_32BIT
 	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS

-- 
2.43.0

