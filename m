Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9321765B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104150; cv=none; b=YVGggJguBEH/yJCG7SkM16m7GWxPBbKUZVA7Im4jua3Xa0NlBMm/zEMVHGINyamOHvs7thB4N5oVuAbjc83gy5whyIl3ElgNPG5NVybgSLbXiM6iOiodGGzA6JYArnj2F5o2ZRbo8HsDBEjBU3KL2XQNyhIV43b5RaDuPU9CJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104150; c=relaxed/simple;
	bh=/DDImLrZIWe6DHfRVDh2VF/oihV7w86USnafdPxDL18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPRM6fOLEHYN+0ni/roVYxmZJPhO34+Gg/CSU6UL/w0gW4rAgHmfS+w9o/mjG1YwAR9gOjDh3Q4Ynvia3U6HP2ckh41o+WFBZsxNgUFTK+JOKfYLYgrISdZqIGIZEdrwwYgP+9N/M6aCrvavLDsx4UpLs3WV2KxST3h7S9LC7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=V6Wdhcz5; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="V6Wdhcz5"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso501607a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104148; x=1749708948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=V6Wdhcz5aiHGC0C84nAsaI442TSnPk/yar5bAr6t84SXSVyu2VIB4JHKrrxSkheWBr
         ATyXi0sljLqLnNjB6CWTVb8qN02VITDtwnsBMbpWTMEbt2fmLEs2YGxYprQzqsHg1sGf
         4q7k/ut1ra5alow5+yYYIwjHmgYw3cEEU04NRl4vlxaXBib2x8ehKQZaXxTXFgEUp/BQ
         cSNi2UTM+eniEMz0LgzsM2jWgdhgPma47QD06kKgdxjzy69oT39HSgU8TJxzT55DoRrW
         rOp5iOsZOHtav4pNiFp3rzcvhNV8wdA/M8nIiTWjfxrk86eRIZBrsmBfqO04z55ykFgM
         P+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104148; x=1749708948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=FUnKKQwlLWL2o9CVkehsKf4Fv2w06Xq0OG03J5PGbX+Sr/6KD4erXtWL2Ugk1YyCug
         7zBDkhgcLEpWjOG0NiI6QICl4wIC06nUNMqUBl1BmJI950I6UsA+fd0tsf3yPDMq8VRd
         vSA4737kAHrQKfTIbBzQ5bPL2shWxJ/c7Vs2LtRwcnUoTazEsEw8cwxahv1hkzu93GEN
         nkM6zsZL0L3mzF/AIot0ck0Eq1GArJogRf/rWbfeXPOrFOvKPA2SC5yxxeLWpeGSBCFC
         R74rQw90Kv7a8YU2/zCUpBAy02zNb63PrsrlPOYvNxdQ1O5jqt0mDm8KQ3b8jFtYs/d6
         +rfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEb/6IVW4zgK20Td1mzsttrwaUWmzU3cX21imnqqTkSevjdpIClFKz86/vs5YaCEuMr0j8Dzz/aP4UwsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCRjEcHFWF5DifuynmYzPFs2sWPdrIZgD2ujoS7E2p5gTSRkC
	yOajGCPG1XTCkp4TWHtLQZuxMrpLgvC5dwiXxo9B5sY0G9ZwCcUBkRAMeUubiNTz4UQ=
X-Gm-Gg: ASbGncuo9TViGJHkLZ2hzoqQ3EHH97t41nKNzSgUbW3SQa1vpBh+9WcY3Zof4Ktgzpq
	K6II0nOn69/EWmMXSMfF8PmIMRiGzNEyc/RQLcHglDaEljHIMGHXjgzvWsBN+TXdi7gSjCR3aTQ
	ZmQYIYMkSmsPhNjIfhEIcWKl+EcxMISujz2f2WrWRkfdo3sYVzrZlgHBa1qSQN/mO4VSOLtaWvi
	c0aV40PCDq2z3SeaJ1QaJ4e5kbAo72FXzn0xHOAtBmDVbmfGC4S4L2jMMetUA1xzOTKV3L417Jp
	v7TURolDBrSfF/5QoTD4Jy5lfk2jwwTKHmUnQlBbWbvxFLou0okxXfof7ljFCX2MI/Tkuf3YJL1
	ermvXhg==
X-Google-Smtp-Source: AGHT+IF1vChQlmPdBhFqDNCJg7mNgqFPE+jCNdqDdFH2eL595DiIm4Pp7WZXYGhvZd5N4Z0BmeSfBw==
X-Received: by 2002:a17:90a:d444:b0:311:abba:53c0 with SMTP id 98e67ed59e1d1-3130cd12d75mr8464937a91.9.1749104147746;
        Wed, 04 Jun 2025 23:15:47 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:47 -0700 (PDT)
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
Subject: [PATCH 11/13] RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
Date: Thu,  5 Jun 2025 11:44:56 +0530
Message-ID: <20250605061458.196003-12-apatel@ventanamicro.com>
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

Currently, the struct kvm_riscv_hfence does not have vmid field
and various hfence processing functions always pick vmid assigned
to the guest/VM. This prevents us from doing hfence operation on
arbitrary vmid hence add vmid field to struct kvm_riscv_hfence
and use it wherever applicable.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_tlb.h |  1 +
 arch/riscv/kvm/tlb.c             | 30 ++++++++++++++++--------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
index cd00c9a46cb1..f67e03edeaec 100644
--- a/arch/riscv/include/asm/kvm_tlb.h
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -19,6 +19,7 @@ enum kvm_riscv_hfence_type {
 struct kvm_riscv_hfence {
 	enum kvm_riscv_hfence_type type;
 	unsigned long asid;
+	unsigned long vmid;
 	unsigned long order;
 	gpa_t addr;
 	gpa_t size;
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 6fc4361c3d75..349fcfc93f54 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -237,49 +237,43 @@ static bool vcpu_hfence_enqueue(struct kvm_vcpu *vcpu,
 
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 {
-	unsigned long vmid;
 	struct kvm_riscv_hfence d = { 0 };
-	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 
 	while (vcpu_hfence_dequeue(vcpu, &d)) {
 		switch (d.type) {
 		case KVM_RISCV_HFENCE_UNKNOWN:
 			break;
 		case KVM_RISCV_HFENCE_GVMA_VMID_GPA:
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_gvma_vmid(nacl_shmem(), vmid,
+				nacl_hfence_gvma_vmid(nacl_shmem(), d.vmid,
 						      d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_gvma_vmid_gpa(vmid, d.addr,
+				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
 								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma_asid(nacl_shmem(), vmid, d.asid,
+				nacl_hfence_vvma_asid(nacl_shmem(), d.vmid, d.asid,
 						      d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_vvma_asid_gva(vmid, d.asid, d.addr,
+				kvm_riscv_local_hfence_vvma_asid_gva(d.vmid, d.asid, d.addr,
 								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma_asid_all(nacl_shmem(), vmid, d.asid);
+				nacl_hfence_vvma_asid_all(nacl_shmem(), d.vmid, d.asid);
 			else
-				kvm_riscv_local_hfence_vvma_asid_all(vmid, d.asid);
+				kvm_riscv_local_hfence_vvma_asid_all(d.vmid, d.asid);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma(nacl_shmem(), vmid,
+				nacl_hfence_vvma(nacl_shmem(), d.vmid,
 						 d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_vvma_gva(vmid, d.addr,
+				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
 								d.size, d.order);
 			break;
 		default:
@@ -336,10 +330,12 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    gpa_t gpa, gpa_t gpsz,
 				    unsigned long order)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
 	data.asid = 0;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gpa;
 	data.size = gpsz;
 	data.order = order;
@@ -359,10 +355,12 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long gva, unsigned long gvsz,
 				    unsigned long order, unsigned long asid)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
 	data.asid = asid;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -374,10 +372,12 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long asid)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
 	data.asid = asid;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = data.size = data.order = 0;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
 			    KVM_REQ_HFENCE_VVMA_ALL, &data);
@@ -388,10 +388,12 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long gva, unsigned long gvsz,
 			       unsigned long order)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
 	data.asid = 0;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
-- 
2.43.0

