Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92001219317
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104159; cv=none; b=tptjIU5uK/nDNDwChSC1zlohtHG3vNxznKuh4q0rpenf6LMlYwK32o5tfzshap4WUCYfgOEloqA+BT/8zrpJuvYfVw3Cf9h8F1Ebn5MNHWY2sY/1Ry6Z4HMRig/vCp0qE+lKmmEGOoaZCIQnjpqiDuV1SooZ6u5zl+g+j5aX++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104159; c=relaxed/simple;
	bh=XN4nRLB9K0FlDxsE36UR8rEo5bM83tbmLM+G36akoCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uu0adJ4AqiKfv7Qw1gUphzYgGsLK3+WeUP5OYCjweVAxA9/SYAkx7/YlI0ktzvamWIz1mWfqErCb0UPITnpiDWoSUl8+KiCTR7q8kPopGXeHxDw3LMkURtJkKHL6ix8ReD0iBZGkp3a5KQc7qE4HpeXm1sZ5BMO+KQ87jPACYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pVH7Zo3e; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pVH7Zo3e"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-312150900afso628932a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104156; x=1749708956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJnA2ITAN8AbKW8vRXTI9OBsRCn2zeX47qUEnC92+48=;
        b=pVH7Zo3eJUjMdw6RIdUUnCCV5HAan3rxFMZx8slpwUIJIP9lH1nbdiE5EABMWts1Cm
         LJrWDkr6Ve9xN/hG6sOVyMiclAis5aMEPbTmsX2nJtPA/dUlkt8QWBuDF3C0AXH87Ybc
         ksYeggWHlRQs0x+RBCQU/ZfiHPas0EinP6mPrytWMnqGbE/BludRshEWJk7usfhZzfP3
         bfmJ8I/E124g/cEQcLswr6MX1a/8+yTULXHLj5i8zfrcMLLRqLqh5vvoY3R/5fg9yIcs
         rwJnyL0p8e5HqIac+a7A8Pz3vSH8aRIIFVMmXmPQfLqXM4q5Xe9nGEq4gipBHzQxNFEK
         J8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104156; x=1749708956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJnA2ITAN8AbKW8vRXTI9OBsRCn2zeX47qUEnC92+48=;
        b=YlOfCMoBld9NWXufv83jrbxGSqJP7vSVzN75pSs0jsc96ta1s5T6TG9SC9sMpqIaha
         XK7ljjJrngNJMMncTxEW0TGLkUzTvL2oS/iBlmk2iHuv0deVt7e/lfeNoAQPgLGVJ3W4
         687kTyU8LlzsE7sDlHRF7+sTF5GoX4GqhVumOgaXIuXrEQnxsI8XxPatBCK4C5bvP+Wp
         n1lSiqBFQdPoHLOkq17CoYEWD6QgO+WpSwf77l7wuXdjqtXdyEp7+qd5iGTIxnVq8rmH
         b+54grQc43jR9w4LUf0IApAV53+KheGvdHR8cZO+Mbuah9O43aQOXh6Gb3X+PkUl9w16
         qsBg==
X-Forwarded-Encrypted: i=1; AJvYcCVRONq26dVgP2n9BuNpOi4TfD1KwsE7yQalqNf0q45TwTsZ6zSN0DbkH6HmLiYH998Bk+hO7RIB9rk9MKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDSCL2OuStcEUUzzXbYX3Eyu3BztpqPak0SAwmixfCEJR069QO
	Nks07uvR/IStgO4BTsVMAU8GkQA/32kyEKjZ6T+s+tRveKpMmfAv8vEgVwh6cuft6cM=
X-Gm-Gg: ASbGncs3ENFNG+U6oLwHcJ9bwOrwDdt1I1vzeQ0ChwydGdnuK+tZiQ+4K/+kC/4rYuP
	CzmfFQQqv3MfaVCAy+L7pw59kRvVaPHn/3mTo9oUFcWzuVgEF6cBWvgergIO9ERJxbb0k/sT/Qv
	6Uti1RzAKZNJr+1UXQcC+0cg8eKTIDAvQm2HkMPHxQz8tD7GqpXtBeQMDOIc+OmB28nAgVTfRkY
	69sCM69e24wKr+W2gEZwy6YAlbqH+trERYm7Tq49hqUcPY5DGi1F/1Yc6w7DmpYCXeb6d5NUF5F
	gDSQh7ZjpsuJa0AH2g1gHAsjZkyRUaeTZ1mDCzJFYiBMISvVLhmnYPg5Xg4dirkVtm5GThs/+gy
	NoJvZmQ==
X-Google-Smtp-Source: AGHT+IGidU5oO/NtKWVZfC9oWMHMT1bnyxO6WBsndaUc4qqkBjwaBRbjIPk9+Qztot5hQY4gLIxDWQ==
X-Received: by 2002:a17:90b:2e49:b0:311:a314:c2ca with SMTP id 98e67ed59e1d1-3130ccf6f95mr7911585a91.6.1749104155801;
        Wed, 04 Jun 2025 23:15:55 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:55 -0700 (PDT)
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
Subject: [PATCH 13/13] RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs
Date: Thu,  5 Jun 2025 11:44:58 +0530
Message-ID: <20250605061458.196003-14-apatel@ventanamicro.com>
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

Currently, all kvm_riscv_hfence_xyz() APIs assume VMID to be the
host VMID of the Guest/VM which resticts use of these APIs only
for host TLB maintenance. Let's allow passing VMID as parameter
to all kvm_riscv_hfence_xyz() APIs so that they can be re-used
for nested virtualization related TLB maintenance.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_tlb.h  | 17 ++++++---
 arch/riscv/kvm/gstage.c           |  3 +-
 arch/riscv/kvm/tlb.c              | 61 ++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi_replace.c | 17 +++++----
 arch/riscv/kvm/vcpu_sbi_v01.c     | 25 ++++++-------
 5 files changed, 73 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
index f67e03edeaec..38a2f933ad3a 100644
--- a/arch/riscv/include/asm/kvm_tlb.h
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -11,9 +11,11 @@
 enum kvm_riscv_hfence_type {
 	KVM_RISCV_HFENCE_UNKNOWN = 0,
 	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
+	KVM_RISCV_HFENCE_GVMA_VMID_ALL,
 	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
 	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
 	KVM_RISCV_HFENCE_VVMA_GVA,
+	KVM_RISCV_HFENCE_VVMA_ALL
 };
 
 struct kvm_riscv_hfence {
@@ -59,21 +61,24 @@ void kvm_riscv_fence_i(struct kvm *kvm,
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order);
+				    unsigned long order, unsigned long vmid);
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask);
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long vmid);
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid);
+				    unsigned long order, unsigned long asid,
+				    unsigned long vmid);
 void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid);
+				    unsigned long asid, unsigned long vmid);
 void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask,
 			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order);
+			       unsigned long order, unsigned long vmid);
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask);
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long vmid);
 
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index c7d61f14f6be..c5dc47b156c4 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -117,7 +117,8 @@ static void gstage_tlb_flush(struct kvm_gstage *gstage, u32 level, gpa_t addr)
 	if (gstage->flags & KVM_GSTAGE_FLAGS_LOCAL)
 		kvm_riscv_local_hfence_gvma_vmid_gpa(gstage->vmid, addr, BIT(order), order);
 	else
-		kvm_riscv_hfence_gvma_vmid_gpa(gstage->kvm, -1UL, 0, addr, BIT(order), order);
+		kvm_riscv_hfence_gvma_vmid_gpa(gstage->kvm, -1UL, 0, addr, BIT(order), order,
+					       gstage->vmid);
 }
 
 int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 349fcfc93f54..3c5a70a2b927 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -251,6 +251,12 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
 								     d.size, d.order);
 			break;
+		case KVM_RISCV_HFENCE_GVMA_VMID_ALL:
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_gvma_vmid_all(nacl_shmem(), d.vmid);
+			else
+				kvm_riscv_local_hfence_gvma_vmid_all(d.vmid);
+			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
 			if (kvm_riscv_nacl_available())
@@ -276,6 +282,13 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
 								d.size, d.order);
 			break;
+		case KVM_RISCV_HFENCE_VVMA_ALL:
+			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_vvma_all(nacl_shmem(), d.vmid);
+			else
+				kvm_riscv_local_hfence_vvma_all(d.vmid);
+			break;
 		default:
 			break;
 		}
@@ -328,14 +341,13 @@ void kvm_riscv_fence_i(struct kvm *kvm,
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order)
+				    unsigned long order, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
 	data.asid = 0;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gpa;
 	data.size = gpsz;
 	data.order = order;
@@ -344,23 +356,28 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 }
 
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask)
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long vmid)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
-			    KVM_REQ_TLB_FLUSH, NULL);
+	struct kvm_riscv_hfence data = {0};
+
+	data.type = KVM_RISCV_HFENCE_GVMA_VMID_ALL;
+	data.vmid = vmid;
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
+			    KVM_REQ_TLB_FLUSH, &data);
 }
 
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid)
+				    unsigned long order, unsigned long asid,
+				    unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
 	data.asid = asid;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -370,15 +387,13 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 
 void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid)
+				    unsigned long asid, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
-	struct kvm_riscv_hfence data;
+	struct kvm_riscv_hfence data = {0};
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
 	data.asid = asid;
-	data.vmid = READ_ONCE(v->vmid);
-	data.addr = data.size = data.order = 0;
+	data.vmid = vmid;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
 			    KVM_REQ_HFENCE_VVMA_ALL, &data);
 }
@@ -386,14 +401,13 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask,
 			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order)
+			       unsigned long order, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
 	data.asid = 0;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -402,16 +416,21 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 }
 
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask)
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long vmid)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
-			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
+	struct kvm_riscv_hfence data = {0};
+
+	data.type = KVM_RISCV_HFENCE_VVMA_ALL;
+	data.vmid = vmid;
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
+			    KVM_REQ_HFENCE_VVMA_ALL, &data);
 }
 
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
 {
 	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
 				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
-				       PAGE_SHIFT);
+				       PAGE_SHIFT, READ_ONCE(kvm->arch.vmid.vmid));
 	return 0;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index b17fad091bab..b490ed1428a6 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -96,6 +96,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
 	unsigned long funcid = cp->a6;
+	unsigned long vmid;
 
 	switch (funcid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
@@ -103,22 +104,22 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
-			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask);
+			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask, vmid);
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
-						  cp->a2, cp->a3, PAGE_SHIFT);
+						  cp->a2, cp->a3, PAGE_SHIFT, vmid);
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
-			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
-						       hbase, hmask, cp->a4);
+			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, hbase, hmask,
+						       cp->a4, vmid);
 		else
-			kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm,
-						       hbase, hmask,
-						       cp->a2, cp->a3,
-						       PAGE_SHIFT, cp->a4);
+			kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, hbase, hmask, cp->a2,
+						       cp->a3, PAGE_SHIFT, cp->a4, vmid);
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 8f4c4fa16227..368dfddd23d9 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -23,6 +23,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	struct kvm_cpu_trap *utrap = retdata->utrap;
+	unsigned long vmid;
 
 	switch (cp->a7) {
 	case SBI_EXT_0_1_CONSOLE_GETCHAR:
@@ -78,25 +79,21 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
 			kvm_riscv_fence_i(vcpu->kvm, 0, hmask);
 		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA) {
+			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_all(vcpu->kvm,
-							  0, hmask);
+				kvm_riscv_hfence_vvma_all(vcpu->kvm, 0, hmask, vmid);
 			else
-				kvm_riscv_hfence_vvma_gva(vcpu->kvm,
-							  0, hmask,
-							  cp->a1, cp->a2,
-							  PAGE_SHIFT);
+				kvm_riscv_hfence_vvma_gva(vcpu->kvm, 0, hmask, cp->a1,
+							  cp->a2, PAGE_SHIFT, vmid);
 		} else {
+			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
-							       0, hmask,
-							       cp->a3);
+				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, 0, hmask,
+							       cp->a3, vmid);
 			else
-				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm,
-							       0, hmask,
-							       cp->a1, cp->a2,
-							       PAGE_SHIFT,
-							       cp->a3);
+				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, 0, hmask,
+							       cp->a1, cp->a2, PAGE_SHIFT,
+							       cp->a3, vmid);
 		}
 		break;
 	default:
-- 
2.43.0

