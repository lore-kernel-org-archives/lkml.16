Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079721422B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104142; cv=none; b=p8uj6tUfJtzv34kCWYutcOu4gZ2+hJjiWPK2rr04lpT21yb9xhnVVLAQLj6O4ZU+y6npQmuYY0BFJ3JhRDoRV50tVJZdyiwSvt/0PviI1RjFre2+MHt2zB1/blpjwR/RcGAzxw4bT37cn73JltD6e/Zz+Dn9W4PlZYb153nNZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104142; c=relaxed/simple;
	bh=aqhFaQgpndhA0TLNptW4POc6Er0vQpFq4mJ6KXKEQ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+GklJa+t8q3bZVXJvKeSvko8+0LLQth0+EuD3IqeWOYEwnILt+cgmFnA/KslR1qQJybghPo/VL8BTqWAjdBCOeJj42twEAlJummGciare4d/M+WMPUSmlkJPXPvaoZoCp8h+ZvNV6PeU+2JjVcrodMQHHSv1JUTidnnITWQu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gK53H4L7; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gK53H4L7"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso441864a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104140; x=1749708940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5L0+ykOWiXelXLICAGslkImYlGqzZkgVfyp6ia3O1g=;
        b=gK53H4L7XyLLtcKiYhXnDkYS4zA86eQxo8D/BmVCT5V9KBEkjje8APFGxvVZ/ikq3B
         1WSk0eZ2mnEsInQeVKSj1egbDwzJCO54AlmGv1KNrAeYUaraj7UmeY6IlodjyBx0PAg6
         NNcpQK+Nnl/8VCPuGI49/Kn3aDQ3aTWmK6AJMRjB+j/QnqKL+pRUe3IC93f4Zcw5SRzK
         I+lC6ZzfL44Ltv8zIe7Kyse1zix9bjNc2NHpnOjSW7OQulHQKNybGaqqOPztylrTBLs5
         DSqShvdSwpB/txgi945DVCjoZzRlwsi0eCwBUSOSvw3pe1ZN/mhvJv9YfAuX2j+xiG/Y
         0+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104140; x=1749708940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5L0+ykOWiXelXLICAGslkImYlGqzZkgVfyp6ia3O1g=;
        b=hYc1yxrAGOHbpI6Ns2zepp1nJAGa5JA3+veL9hPkwe1pu7SUcxEO8SJFA81/Xt3f08
         v+jrMRPStche8ImOhx4yitFc/3bLkhKP6YIxX2pICMz0bq/ziDysAPJTSuMyJdclVQX8
         S40WqoETlkOBh147K7nwm6p/AaAD3wd26rsQKIWDPjWj1nyJ2d9gg8+YQiHYoKm8d5a0
         v1tujOA15O+etTJo943d59MZp/uHlGwc10AN/+pMYgC5xRc5oNFZnOvQtTVnTCsjFzoM
         ArE2RXLUMleW422vf2dg3HYEfKjwwpPtWaHdabyP4NuImjd/l/u6xIFry9HEyjDU+Be2
         umGg==
X-Forwarded-Encrypted: i=1; AJvYcCXPF58OvEIRI/eEP0kOuXVnR8p8Dii76HuFhgWfZbxxMu64XrAjDvUCWVh3CovHLa+MmAZjdwFu1nXw/po=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXY94ajcLAmH8fqfmdMgwRQMcDDhan++OdufCUbcgpvtb+Pcm
	UYMMfyu2c5DCQCxELtn3nOF7sFztd9WWbLJytHORPDYj2CLn0xmt2/ZRWuzWIWRtLB8=
X-Gm-Gg: ASbGncvc8qozkrUUallJ+VpOdIWAyM4/U1u8rz+W4jCHVKx0hmoxafbmVWBzGZx4flb
	NSmjPNwccuAekFFg30deZ2L2fnYB2SK0R4YAIvCZkB209wM+xh61r8wNz/TURwRNlG9Fr4ZYn5d
	ojK9wJLhLgqOndag7ekV2NP4PqtirnULPImIHbbG/JnxHVgFg/K0WRZGEZutReHRDBpzUEHmyPT
	aoMQ570KZQgszyw8axJ1lHtrCCmQA35tA2Ot5t/V7ACeA1YL6oMeDXNpnV9jne1vWsPyuXlg+S2
	zHnxSq3sV9Bo2qYynwbBjHJhT1F5Sc1ARjBch6Cq07lLzVoDdS5QIq/Si0lk8l5FAsflBzVaUBz
	VNlc/yA==
X-Google-Smtp-Source: AGHT+IGeCP7yjnGqfjqlB4ks6ph12/2Dcv3NbYOPrnzOV1SF+VtBogS3QcmQr2cFbHhenw53773/UA==
X-Received: by 2002:a17:90b:1d51:b0:313:2464:ad20 with SMTP id 98e67ed59e1d1-3132464ad44mr5168665a91.13.1749104140057;
        Wed, 04 Jun 2025 23:15:40 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:39 -0700 (PDT)
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
Subject: [PATCH 09/13] RISC-V: KVM: Factor-out MMU related declarations into separate headers
Date: Thu,  5 Jun 2025 11:44:54 +0530
Message-ID: <20250605061458.196003-10-apatel@ventanamicro.com>
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

The MMU, TLB, and VMID management for KVM RISC-V already exists as
seprate sources so create separate headers along these lines. This
further simplifies asm/kvm_host.h header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 100 +-----------------------------
 arch/riscv/include/asm/kvm_mmu.h  |  26 ++++++++
 arch/riscv/include/asm/kvm_tlb.h  |  78 +++++++++++++++++++++++
 arch/riscv/include/asm/kvm_vmid.h |  27 ++++++++
 arch/riscv/kvm/aia_imsic.c        |   1 +
 arch/riscv/kvm/main.c             |   1 +
 arch/riscv/kvm/mmu.c              |   1 +
 arch/riscv/kvm/tlb.c              |   2 +
 arch/riscv/kvm/vcpu.c             |   1 +
 arch/riscv/kvm/vcpu_exit.c        |   1 +
 arch/riscv/kvm/vm.c               |   1 +
 arch/riscv/kvm/vmid.c             |   2 +
 12 files changed, 143 insertions(+), 98 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_mmu.h
 create mode 100644 arch/riscv/include/asm/kvm_tlb.h
 create mode 100644 arch/riscv/include/asm/kvm_vmid.h

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index b9e241c46209..8d7a59274386 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -16,6 +16,8 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_aia.h>
 #include <asm/ptrace.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -55,24 +57,6 @@
 					 BIT(IRQ_VS_TIMER) | \
 					 BIT(IRQ_VS_EXT))
 
-enum kvm_riscv_hfence_type {
-	KVM_RISCV_HFENCE_UNKNOWN = 0,
-	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
-	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
-	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
-	KVM_RISCV_HFENCE_VVMA_GVA,
-};
-
-struct kvm_riscv_hfence {
-	enum kvm_riscv_hfence_type type;
-	unsigned long asid;
-	unsigned long order;
-	gpa_t addr;
-	gpa_t size;
-};
-
-#define KVM_RISCV_VCPU_MAX_HFENCE	64
-
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
 };
@@ -98,15 +82,6 @@ struct kvm_vcpu_stat {
 struct kvm_arch_memory_slot {
 };
 
-struct kvm_vmid {
-	/*
-	 * Writes to vmid_version and vmid happen with vmid_lock held
-	 * whereas reads happen without any lock held.
-	 */
-	unsigned long vmid_version;
-	unsigned long vmid;
-};
-
 struct kvm_arch {
 	/* G-stage vmid */
 	struct kvm_vmid vmid;
@@ -307,77 +282,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
 }
 
-#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
-
-void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
-					  gpa_t gpa, gpa_t gpsz,
-					  unsigned long order);
-void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
-void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
-				     unsigned long order);
-void kvm_riscv_local_hfence_gvma_all(void);
-void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
-					  unsigned long asid,
-					  unsigned long gva,
-					  unsigned long gvsz,
-					  unsigned long order);
-void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
-					  unsigned long asid);
-void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
-				     unsigned long gva, unsigned long gvsz,
-				     unsigned long order);
-void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
-
-void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
-
-void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
-
-void kvm_riscv_fence_i(struct kvm *kvm,
-		       unsigned long hbase, unsigned long hmask);
-void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order);
-void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask);
-void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid);
-void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid);
-void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask,
-			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order);
-void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask);
-
-int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
-			     phys_addr_t hpa, unsigned long size,
-			     bool writable, bool in_atomic);
-void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
-			      unsigned long size);
-int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
-			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write);
-int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
-void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
-void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
-void __init kvm_riscv_gstage_mode_detect(void);
-unsigned long __init kvm_riscv_gstage_mode(void);
-int kvm_riscv_gstage_gpa_bits(void);
-
-void __init kvm_riscv_gstage_vmid_detect(void);
-unsigned long kvm_riscv_gstage_vmid_bits(void);
-int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
-void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
-void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
-
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
 void __kvm_riscv_unpriv_trap(void);
diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
new file mode 100644
index 000000000000..4e1654282ee4
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_mmu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_MMU_H_
+#define __RISCV_KVM_MMU_H_
+
+#include <linux/kvm_types.h>
+
+int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
+			     phys_addr_t hpa, unsigned long size,
+			     bool writable, bool in_atomic);
+void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
+			      unsigned long size);
+int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
+			 struct kvm_memory_slot *memslot,
+			 gpa_t gpa, unsigned long hva, bool is_write);
+int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
+void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
+void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_mode_detect(void);
+unsigned long kvm_riscv_gstage_mode(void);
+int kvm_riscv_gstage_gpa_bits(void);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
new file mode 100644
index 000000000000..cd00c9a46cb1
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_TLB_H_
+#define __RISCV_KVM_TLB_H_
+
+#include <linux/kvm_types.h>
+
+enum kvm_riscv_hfence_type {
+	KVM_RISCV_HFENCE_UNKNOWN = 0,
+	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
+	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
+	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
+	KVM_RISCV_HFENCE_VVMA_GVA,
+};
+
+struct kvm_riscv_hfence {
+	enum kvm_riscv_hfence_type type;
+	unsigned long asid;
+	unsigned long order;
+	gpa_t addr;
+	gpa_t size;
+};
+
+#define KVM_RISCV_VCPU_MAX_HFENCE	64
+
+#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
+
+void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
+					  gpa_t gpa, gpa_t gpsz,
+					  unsigned long order);
+void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
+void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
+				     unsigned long order);
+void kvm_riscv_local_hfence_gvma_all(void);
+void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
+					  unsigned long asid,
+					  unsigned long gva,
+					  unsigned long gvsz,
+					  unsigned long order);
+void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
+					  unsigned long asid);
+void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
+				     unsigned long gva, unsigned long gvsz,
+				     unsigned long order);
+void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
+
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
+
+void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
+void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
+void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
+
+void kvm_riscv_fence_i(struct kvm *kvm,
+		       unsigned long hbase, unsigned long hmask);
+void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    gpa_t gpa, gpa_t gpsz,
+				    unsigned long order);
+void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask);
+void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long gva, unsigned long gvsz,
+				    unsigned long order, unsigned long asid);
+void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long asid);
+void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long gva, unsigned long gvsz,
+			       unsigned long order);
+void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
+			       unsigned long hbase, unsigned long hmask);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_vmid.h b/arch/riscv/include/asm/kvm_vmid.h
new file mode 100644
index 000000000000..ab98e1434fb7
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vmid.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_VMID_H_
+#define __RISCV_KVM_VMID_H_
+
+#include <linux/kvm_types.h>
+
+struct kvm_vmid {
+	/*
+	 * Writes to vmid_version and vmid happen with vmid_lock held
+	 * whereas reads happen without any lock held.
+	 */
+	unsigned long vmid_version;
+	unsigned long vmid;
+};
+
+void __init kvm_riscv_gstage_vmid_detect(void);
+unsigned long kvm_riscv_gstage_vmid_bits(void);
+int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
+void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
+
+#endif
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 29ef9c2133a9..40b469c0a01f 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -16,6 +16,7 @@
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
+#include <asm/kvm_mmu.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 4b24705dc63a..b861a5dd7bd9 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/kvm_host.h>
 #include <asm/cpufeature.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 834d855b0478..c9d87e7472fb 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -15,6 +15,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index f46a27658c2e..6fc4361c3d75 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,6 +15,8 @@
 #include <asm/cpufeature.h>
 #include <asm/insn-def.h>
 #include <asm/kvm_nacl.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 684efaf5cee9..bfe4d1369b24 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_vector.h>
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c18412795..cc82bbab0e24 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_mmu.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index b27ec8f96697..8601cf29e5f8 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_mmu.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 92c01255f86f..3b426c800480 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,8 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
-- 
2.43.0

