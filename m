Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6170274667
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481180; cv=none; b=TM7/Hpu/5VCB2iovds80IaQjjOHWuGXAaBrOTXbKstnleYGSgmDtQZwcES28ci2hHdY8mfDRe46ss5SyicVAjPg35mNuVt+W4cf8u1ahf3LvpnrGkb1gvuh7JIqzRAi8OYTcwvNmIYqxpYazByvlMjDPeLzY1ByPdgykWKSzaZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481180; c=relaxed/simple;
	bh=9BSvBt0OecV6YwUFtY5L/MBkp8S1ZbggBZys7UTbSWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9Se+YTMDt4O+fPyQmN/w1qXczP2CUcYI/UX52P/yfM8RjMfbKZBKSyD9cGTICoG7NhjeCv9sBFn5jF7Ot9lG06y+SYGF014CV0iRTUE7cBXmQU2mBc1vWBSoRDxmdOTi2cog/wx6nZ+40uOtWrTqSzHKOw8EjO+l00Nq9ueW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yMMoOl15; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yMMoOl15"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2264aefc45dso78174095ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481178; x=1747085978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrOpef+mqFExNdYyOI2IIHYIr3RNpPTOkYkLVHjm6Us=;
        b=yMMoOl15EbGWPYjGib8ZBup107wwSxrLlpEyC/IwPe+c+1mWJyOoHM8PD+UZNw72FK
         SKBKVdXETHO64YxwYCrGgIi/o9KZP8JS86RBmgUdIqr+4ZZC7nfdd1yObNWX9QemajOc
         d2Qpcdoiljd9EQRjKP1j1eYTk6waMrN7dUIFnQxJe1yB7epIzZ/6cOr0GHlSVHK2BO1C
         KvlbHpqNallF9EPXwDdtmSEAWrn04n3zdzLKlH5PhsvtKOFAVknyPOCRHX70C5HcuZGC
         c/3MUTqb2x/cwzxcK0/iRjvxXs3cXm563GMqv7m2amUilQ81OVYpdJHWLK4YLTvSW9Au
         GO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481178; x=1747085978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrOpef+mqFExNdYyOI2IIHYIr3RNpPTOkYkLVHjm6Us=;
        b=Rky1ZwWgEtdxCvLfLbrzQMXcAyHQmFsRvaJbczhnQ22CwXuwKpmSg2PCpmFArdToET
         tADBVG9rfaD19dv38ZxmC7fY+02K5a1uIW50kzn6GeUBwUClAK3GGqOIGhCuGNrmNmym
         /iADdtOTSGUe/XHSgYI/puBmpDhp7gPLg4vvYJqHt/zRzXSX4UzmqFMEcaG+OBqRIMV2
         8KWZnjflQ04PHVucyXRjoryhfMheI2K2RZo24o+v1FmSf5IW6sPzqb/DVtq/XHGIc2Wn
         0+funDB2jOkGVNVQyNTes0DfopCaC7oc3464JtRJvKzJd4nsxOuzHdywXYCDttzT+WaE
         xKDw==
X-Forwarded-Encrypted: i=1; AJvYcCXIG2vCV1tiOn6mPE1iPqqdzv0IbbiGQt4KV74AXZnSHxRo4DJnO9AjR2gYyA940rQ/uis3kFLwShgp09g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOcFqa0YADV2AiwcwxXMXGexORMsrXHLDrmpeS+gz16Bs+8ip
	SWyJ+H26vPyCCp0bvT6AKj4KAUHfC4mFiyPYebfQIab7tqks5Y+NZs2jjSQSYfo=
X-Gm-Gg: ASbGncu2ibJ0Mt3EL9ozhrxOnemcnG4zYwa9LpoAB2LW+r2mdUpC+55hZQ0egC6WOdt
	Hh2hKOUILmGgWB6OB4soWYH1lfkYG4rbpUqQVUQy3DNOM1c4H7e7X7rZ9Y04TgutsVgyvwWGIeD
	TAMhG5B2mqrmpoG1LtLC79+f1g4kUSR1T06hrjSTW7FWLac5fRi59pHxEVJYb0SDQo21eN3Iism
	D70e2hY7tupr4Z8kZfr/OJ5mmTpHY4z3+jP8MSPuXIcW8Pz3vA0gw0MTXcYkRL4OcQwl9neb+CE
	rVSs71H6whg8eLjeHfaIfWsg2mUGPXIZnWyDLI4OhtcQlXGeiBHDyg==
X-Google-Smtp-Source: AGHT+IFfWbZJOYWgohE6peHPOXmV8Bx9l1eOyThbAl9PHsbsWLwC5zSC5Wu3EefTf6bWH77K42NMRQ==
X-Received: by 2002:a17:902:e80e:b0:224:13a4:d61e with SMTP id d9443c01a7336-22e1eb0a454mr122010005ad.51.1746481178148;
        Mon, 05 May 2025 14:39:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:27 -0700
Subject: [PATCH 2/5] RISC-V: KVM: Add a hstateen lazy enabler helper
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-2-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
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
 arch/riscv/kvm/vcpu_insn.c             | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+)

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
index 97dec18e6989..3bc39572b79d 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -235,6 +235,27 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return KVM_INSN_EXIT_TO_USER_SPACE;
 }
 
+int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_num,
+					uint64_t hstateen_feature_bit_mask)
+{
+	/* Access from VS shouldn't trap if smstaeen is not present */
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
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

