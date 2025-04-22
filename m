Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B452918C0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338406; cv=none; b=c7pLb0b373UuL2ZcwvVbYYKDjxRhQDlnxrPMzXn6qogOsK2U7x9rRH9ZxfaHJOu1OsTlGwhGJcm8mttewS0S2uZdXFk0nNbyCJUNhnexaO+olru8SCX09+gkcWoH4h+kSxHt1WXNDnx4ouhmWAB6yvx/nzUB8QzS5O/a4wdkDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338406; c=relaxed/simple;
	bh=GbaTSjOqBo9mwa25MuyKjKe1K1svHqcIqHZk10nn8zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLbbDQCzDynwMn4HwKROn1JEDm3Sx5SCp9/4tb0JmXASMqvsRVb5ECb4A8F2JSceuDO4mkm8JAE+oPUhwZQtSN5GwToae1LEf+OyPhB+ssXSaz21W6g0j98Iw1PMDovuRhC0PUgEeewwxCqw8l9+6/LdMPkJNYrmWfrzptNSv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LZUHYXfR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LZUHYXfR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227b828de00so57003985ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745338402; x=1745943202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTgn5pA95Zb8rTkNuVvW2h+3Nk3fgnXRTMGJh+Fh+V4=;
        b=LZUHYXfRV5gFXWQf5nUbJTzA47PoYSRIqUBY3bmGPPaGZN5JL+77b9ribhSFzzQ9bK
         kOU7+uo1C05ePNmZVQZBx2IS5fEvbtewWcgFGXE3mBbg0H+6UcV4Y4rA7ZEcnrHxxo62
         3Yy/7YgmlySys7Rkwzp7AV0KZLI4EnKzRgT+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338402; x=1745943202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTgn5pA95Zb8rTkNuVvW2h+3Nk3fgnXRTMGJh+Fh+V4=;
        b=vysApzztD8hizw74kshnleeuzqmLl5ehVkKaJYPK8pBh8HWjR94OE9ZtmI0Ez0SXY3
         BRxn1erqy/ScPO0CvdS+tmDaSApoy0qceJR4EhRojQpbum7OqG3dwOisJjEWYoATiwuB
         xIfIeNiR4Z0WMeawwK2h4cI9ozRG/MQyQWxteTAHOTVZyacFdk/heabyOWHL56Tzf1vv
         vZ7pvwX737dhEgc9SEH3U0XWsz4shso4GHxo+ujDN+fysZPxUv78nzK0fz7xh6yZX12Y
         HusPUMOBVgA0IRE3g8AInftjvmguiBU9f3HEOt/13yB4xkm0Sn5cKbZ8YONm67L9KIgk
         z8vQ==
X-Gm-Message-State: AOJu0Yy55gTRBMJ7WO7+zwAqpuVQHXtPOMKhyQ42W6aOBYQ3D8yZY7i/
	u4NQKFegQc9ql00Bj/ebAtQNdgJzKTued0YQ7uvdowscZ1KN9cQNmVN/rv0WC03LRgW+Hq982pl
	Iled0m+hanLJckjtzBYse5lgs/yLI/th4xfHSV9uvwqG5fmBMqILOg6FPmayy2QVVpRoPOCwV4r
	PPiy2VgvHoV3qWDVHmd+oggiUsqokdpMCilp1/N1VXFbmAqA==
X-Gm-Gg: ASbGncusXZQo+sIIW3yXePFHg25eHnSE25O9hFWEeClx4ru58I9wxQnWvwkoSwYO+AE
	8DfvAStdRrkkky8I+kP/GVOUlqqy9WxPOKtdRpooULbXYKsMUW8PcRjhEQiiWeE7Q/UwW5jxue5
	zkss6Dqi5YqfAQ//Mnnl6dmo9T8a0N349H0qYbvs/qSX2TwAHpGsDvlxdUb097UupJVTCgiGpoW
	OZcBwkT+xH3CHdMf1gQUtJd4CmwPHHIvEdnGgrpXL+J6y7TcFmE1dMV945Nvmh8EZGD34NgFuZL
	w5UqmgbhT45oGMw8SRHfEgTPgbMHUsmpzGIP9UPeo1FBzpg47dw8KTAgkJBKjgZXR7y4pcj7MVr
	FKIKv+aAm1AwNY2bFalsZVI6EvdWiYSLF9euxASeMSvE=
X-Google-Smtp-Source: AGHT+IFDLWqg629rzCH2SUzJ3m01kDXWAFPIF78TFJbY80uinkxRLsa91Mzp2+BKFOe5YkIhQu9EsQ==
X-Received: by 2002:a17:902:f707:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22c53566f1cmr265660735ad.5.1745338401748;
        Tue, 22 Apr 2025 09:13:21 -0700 (PDT)
Received: from localhost.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb03d2sm87462375ad.142.2025.04.22.09.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:13:21 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Zack Rusin <zack.rusin@broadcom.com>,
	Doug Covelli <doug.covelli@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/5] KVM: x86: Allow enabling of the vmware backdoor via a cap
Date: Tue, 22 Apr 2025 12:12:21 -0400
Message-ID: <20250422161304.579394-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422161304.579394-1-zack.rusin@broadcom.com>
References: <20250422161304.579394-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow enabling of the vmware backdoor on a per-vm basis. The vmware
backdoor could only be enabled systemwide via the kernel parameter
kvm.enable_vmware_backdoor which required modifying the kernels boot
parameters.

Add the KVM_CAP_X86_VMWARE_BACKDOOR cap that enables the backdoor at the
hypervisor level and allows setting it on a per-vm basis.

The default is whatever kvm.enable_vmware_backdoor was set to, which
by default is false.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Doug Covelli <doug.covelli@broadcom.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: kvm@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/virt/kvm/api.rst  | 15 +++++++++++++++
 arch/x86/include/asm/kvm_host.h | 11 +++++++++++
 arch/x86/kvm/Makefile           |  1 +
 arch/x86/kvm/kvm_vmware.c       | 16 ++++++++++++++++
 arch/x86/kvm/kvm_vmware.h       | 10 +++++++---
 arch/x86/kvm/x86.c              | 21 +++++++++++++++++----
 include/uapi/linux/kvm.h        |  1 +
 7 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 arch/x86/kvm/kvm_vmware.c

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2b52eb77e29c..24bc80764fdc 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8258,6 +8258,21 @@ KVM exits with the register state of either the L1 or L2 guest
 depending on which executed at the time of an exit. Userspace must
 take care to differentiate between these cases.
 
+7.37 KVM_CAP_X86_VMWARE_BACKDOOR
+--------------------------------
+
+:Architectures: x86
+:Parameters: args[0] whether the feature should be enabled or not
+:Returns: 0 on success.
+
+The presence of this capability indicates that KVM supports
+enabling of the VMware backdoor via the enable cap interface.
+
+When enabled KVM will support VMware backdoor PV interface. The
+default value for it is set via the kvm.enable_vmware_backdoor
+kernel parameter (false when not set). Must be set before any
+VCPUs have been created.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 32ae3aa50c7e..5670d7d02d1b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1192,6 +1192,13 @@ struct kvm_xen {
 };
 #endif
 
+#ifdef CONFIG_KVM_VMWARE
+/* VMware emulation context */
+struct kvm_vmware {
+	bool backdoor_enabled;
+};
+#endif
+
 enum kvm_irqchip_mode {
 	KVM_IRQCHIP_NONE,
 	KVM_IRQCHIP_KERNEL,       /* created with KVM_CREATE_IRQCHIP */
@@ -1420,6 +1427,10 @@ struct kvm_arch {
 	struct kvm_hv hyperv;
 #endif
 
+#ifdef CONFIG_KVM_VMWARE
+	struct kvm_vmware vmware;
+#endif
+
 #ifdef CONFIG_KVM_XEN
 	struct kvm_xen xen;
 #endif
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index f9dddb8cb466..addd6a1005ce 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -12,6 +12,7 @@ kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
 
 kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_HYPERV) += hyperv.o
+kvm-$(CONFIG_KVM_VMWARE) += kvm_vmware.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
diff --git a/arch/x86/kvm/kvm_vmware.c b/arch/x86/kvm/kvm_vmware.c
new file mode 100644
index 000000000000..b8ede454751f
--- /dev/null
+++ b/arch/x86/kvm/kvm_vmware.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ */
+
+ #include "kvm_vmware.h"
+
+bool __read_mostly enable_vmware_backdoor;
+EXPORT_SYMBOL_GPL(enable_vmware_backdoor);
+module_param(enable_vmware_backdoor, bool, 0444);
+
+void kvm_vmware_init_vm(struct kvm *kvm)
+{
+	kvm->arch.vmware.backdoor_enabled = enable_vmware_backdoor;
+}
diff --git a/arch/x86/kvm/kvm_vmware.h b/arch/x86/kvm/kvm_vmware.h
index 8f091687dcd9..de55c9ee7c0f 100644
--- a/arch/x86/kvm/kvm_vmware.h
+++ b/arch/x86/kvm/kvm_vmware.h
@@ -15,11 +15,9 @@
 #define VMWARE_BACKDOOR_PMC_REAL_TIME		0x10001
 #define VMWARE_BACKDOOR_PMC_APPARENT_TIME	0x10002
 
-extern bool enable_vmware_backdoor;
-
 static inline bool kvm_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
 {
-	return enable_vmware_backdoor;
+	return vcpu->kvm->arch.vmware.backdoor_enabled;
 }
 
 static inline bool kvm_vmware_is_backdoor_pmc(u32 pmc_idx)
@@ -95,6 +93,8 @@ static inline bool kvm_vmware_is_backdoor_opcode(u8 opcode_len, u8 b)
 	return false;
 }
 
+void kvm_vmware_init_vm(struct kvm *kvm);
+
 #else /* !CONFIG_KVM_VMWARE */
 
 static inline bool kvm_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
@@ -122,6 +122,10 @@ static inline bool kvm_vmware_is_backdoor_opcode(u8 opcode_len, u8 len)
 	return false;
 }
 
+static inline void kvm_vmware_init_vm(struct kvm *kvm)
+{
+}
+
 #endif /* CONFIG_KVM_VMWARE */
 
 #endif /* __ARCH_X86_KVM_VMWARE_H__ */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1b0c6925d339..a0b0830e5ece 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -169,10 +169,6 @@ module_param(tsc_tolerance_ppm, uint, 0644);
 static bool __read_mostly vector_hashing = true;
 module_param(vector_hashing, bool, 0444);
 
-bool __read_mostly enable_vmware_backdoor = false;
-module_param(enable_vmware_backdoor, bool, 0444);
-EXPORT_SYMBOL_GPL(enable_vmware_backdoor);
-
 /*
  * Flags to manipulate forced emulation behavior (any non-zero value will
  * enable forced emulation).
@@ -4654,6 +4650,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_MEMORY_FAULT_INFO:
 	case KVM_CAP_X86_GUEST_MODE:
+#ifdef CONFIG_KVM_VMWARE
+	case KVM_CAP_X86_VMWARE_BACKDOOR:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_PRE_FAULT_MEMORY:
@@ -6735,6 +6734,19 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		mutex_unlock(&kvm->lock);
 		break;
 	}
+#ifdef CONFIG_KVM_VMWARE
+	case KVM_CAP_X86_VMWARE_BACKDOOR:
+		r = -EINVAL;
+		if (cap->args[0] & ~1)
+			break;
+		mutex_lock(&kvm->lock);
+		if (!kvm->created_vcpus) {
+			kvm->arch.vmware.backdoor_enabled = cap->args[0];
+			r = 0;
+		}
+		mutex_unlock(&kvm->lock);
+		break;
+#endif
 	default:
 		r = -EINVAL;
 		break;
@@ -12707,6 +12719,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	kvm_apicv_init(kvm);
 	kvm_hv_init_vm(kvm);
+	kvm_vmware_init_vm(kvm);
 	kvm_xen_init_vm(kvm);
 
 	if (ignore_msrs && !report_ignored_msrs) {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 45e6d8fca9b9..793d0cf7ae3c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -929,6 +929,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_X86_VMWARE_BACKDOOR 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.48.1

