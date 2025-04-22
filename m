Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713F293472
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338409; cv=none; b=PtCpxIR57qJUEGpk3ewHsgBWrOFr3pRxjc5MVEdl3lh3pDMTyqF0pbAmVVeUaUulk3ZyTg4AuyixJYrDD49OYvNsJsbdlN1O0NFKaM+BgQPr5BEl9rXWEivNLNc1LlygNZOAaJz1NPscxoOQvO4yzh0Tj1TP5xPEujS2s1GMYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338409; c=relaxed/simple;
	bh=wZyGnaU9VKPQKehMP8wf4K5Z9nGpXchW01UtloVdEQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHZcCqOZ2pX1FD4mPzTsYWvYcf1kZsi8tHmrF42F2qtXd9vsUD53rZ2MnMSUoh9AIC5zcR2ygq5Hv/0WH4vRdAzMteZEyFIKyj8/ok4Jg4eyJwfERrfQqtyZMTcf9JbL2CHfteMIP8+rvJvPhIFbigSktka2SepZHewaISggCJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=geI162k1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="geI162k1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224191d92e4so53121105ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745338406; x=1745943206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYxBieSKIgS6H6yAXjPCIOcA2I5tG+O4lrtR0vcRYlI=;
        b=geI162k1MVLjh4QDInpGc1f8lQNB+NV/zNJg1HuthT2kp2Cv81LI5eXo9+QdWg7kWD
         cQymVafcb35itvBk7RCkOOQTCSqL65OYaHBPFea4YB1OQgPBoElIkXw8YTLOiM+qc4rp
         C894dQFYjWVLvn2KOELaLPlcQ9UFfzgEIxPjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338406; x=1745943206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYxBieSKIgS6H6yAXjPCIOcA2I5tG+O4lrtR0vcRYlI=;
        b=dB7fF3+ezge5ke3/1iYKMfiOxy3nd1kminVijJiIyuQZKlYr9TJMGq++HcMPz1nFe/
         3U5tYMiU6XXrxScgx/Qtidh7SEiDQW+UJk6U+bxbB/BrhPS6Uhau/XnXAyQ+R2WB1tQo
         6bXGxSNv0V1URLYxyIFoSAJJ5rYEF9itM+xjgutNTKfXOqunv9iQjm13kOTmTcoAxvfP
         bDG02aWvT/3LUzkBYpHmZMK7F4ovCRq5wObBJ/lrfTqsCKkfCCsu7R7BIxjZsAC/FrLO
         z5KGbdwcmDdqP4CenTUodHobxnx9Q6M6tOWM7V8ZHY3+UgJU827+JzGERgfDNYfq/Bzm
         3dTw==
X-Gm-Message-State: AOJu0Yz4+dFAs+wnhv1/CabCoqaZdoe/m0r4y6eRtwlYWPXTCf5R233C
	LebuubD3JhMr7NaZ4R95qPtppWujx8ash3D13CblmXot2aJyKaQ7spznP0mXg+xRSAyca0YC3vG
	fcvmj6C0vWEaFEcCbsJ8JpKr0h0sLJ53vTQA/nmYqDm3o/UIZUjeLO19taNSqqRiyOMDxcU/PPi
	E8Cf5T/ZEL9SRepL+xS99OjYCW3N4+sxruMJsbGXS4Fsq/3A==
X-Gm-Gg: ASbGncvdYtGgh+oAWtbdan7Tt4DjwJSjV3kIMzVfh/U+U8EtUKKg0lfgj1aqETco1UR
	hLmN2G3MdHhR4ZKrrRL40yD44JAQ1jPdwPG4RcPn5hbaSaiHRfvLVvsN6RxfCYlOQbiSs9qB1eM
	7zIHjKTzimc/e0qZCE9kE0Fy9tdCF3npcapUUoQr/E4Ns58ofjx8F6zOMMPakAuvCQ+xJcIPc8p
	pRhi0iJ6JwOig5Nbj+UbVz1ZcbX+FlmNMzrEGb0pU8qBrx0zFfTn2sYlyxuCbsrOqt0nDbbga4P
	+/EStFJmmU3L3lyMe2z/ODsyMZ+kDUnKuCSZ7joMhnUNHYQ1KhOh0SLpNN1dRHbhn1KduKdQrRh
	yvfMbyld5QrnOHd8m/MyfSbpz7Jqw9iDO
X-Google-Smtp-Source: AGHT+IFUvWhafII9vCi70h93pyV2tLtAs4kKP+wr0pbhir/6F18FqckDEpBNWILkVgMQ+IyZlIqSWg==
X-Received: by 2002:a17:902:ce8c:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22c53607c5bmr246637305ad.36.1745338406314;
        Tue, 22 Apr 2025 09:13:26 -0700 (PDT)
Received: from localhost.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb03d2sm87462375ad.142.2025.04.22.09.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:13:26 -0700 (PDT)
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
Subject: [PATCH v2 4/5] KVM: x86: Add support for legacy VMware backdoors in nested setups
Date: Tue, 22 Apr 2025 12:12:23 -0400
Message-ID: <20250422161304.579394-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422161304.579394-1-zack.rusin@broadcom.com>
References: <20250422161304.579394-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow handling VMware backdoors by the L0 monitor. This is required on
setups running Windows VBS, where the L1 will be running Hyper-V which
can't handle VMware backdoors. Thus on Windows VBS legacy VMware backdoor
calls issued by the userspace will end up in Hyper-V (L1) and endup
throwing an error.
Add a KVM cap that, in nested setups, allows the legacy VMware backdoor
to be handled by the L0 monitor. Thanks to this we can make sure that
VMware backdoor is always handled by the correct monitor.

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
 Documentation/virt/kvm/api.rst  | 14 +++++++++++
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/Kconfig            |  1 +
 arch/x86/kvm/kvm_vmware.h       | 42 +++++++++++++++++++++++++++++++++
 arch/x86/kvm/svm/nested.c       |  6 +++++
 arch/x86/kvm/svm/svm.c          |  3 ++-
 arch/x86/kvm/vmx/nested.c       |  6 +++++
 arch/x86/kvm/x86.c              |  8 +++++++
 include/uapi/linux/kvm.h        |  1 +
 9 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 6d3d2a509848..55bd464ebf95 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8322,6 +8322,20 @@ userspace handling of hypercalls is discouraged. To implement
 such functionality, use KVM_EXIT_IO (x86) or KVM_EXIT_MMIO
 (all except s390).
 
+7.39 KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0
+------------------------------------------
+
+:Architectures: x86
+:Parameters: args[0] whether the feature should be enabled or not
+:Returns: 0 on success.
+
+Capability allows VMware backdoors to be handled by L0 when running
+on nested configurations. This is required when, for example
+running Windows guest with Hyper-V VBS enabled - in that configuration
+the VMware backdoor calls issued by VMware tools would endup in Hyper-V
+(L1) which doesn't handle VMware backdoor. Enable this option to have
+VMware backdoor sent to L0 monitor.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 86bacda2802e..2a806aa93a9e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1197,6 +1197,7 @@ struct kvm_xen {
 struct kvm_vmware {
 	bool backdoor_enabled;
 	bool hypercall_enabled;
+	bool nested_backdoor_l0_enabled;
 };
 #endif
 
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index f817601924bd..8fefde6f2e78 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -190,6 +190,7 @@ config KVM_VMWARE
 	  formatted IN, OUT and RDPMC instructions which need to be
 	  intercepted.
 	  - VMware hypercall interface: VMware hypercalls exit to userspace
+	  - VMware legacy backdoor handling in L0
 
 	  If unsure, say "Y".
 
diff --git a/arch/x86/kvm/kvm_vmware.h b/arch/x86/kvm/kvm_vmware.h
index 846b90091a2a..d90bcf73bae4 100644
--- a/arch/x86/kvm/kvm_vmware.h
+++ b/arch/x86/kvm/kvm_vmware.h
@@ -9,6 +9,9 @@
 
 #include <linux/kvm_host.h>
 
+#include "asm/vmware.h"
+#include "x86.h"
+
 #ifdef CONFIG_KVM_VMWARE
 
 #define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
@@ -98,6 +101,35 @@ static inline bool kvm_vmware_hypercall_enabled(struct kvm *kvm)
 	return kvm->arch.vmware.hypercall_enabled;
 }
 
+static inline bool kvm_vmware_nested_backdoor_l0_enabled(struct kvm *kvm)
+{
+	return kvm->arch.vmware.backdoor_enabled &&
+		kvm->arch.vmware.nested_backdoor_l0_enabled;
+}
+
+static inline bool kvm_vmware_wants_backdoor_to_l0(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	/* We only care about the lower 32 bits */
+	const unsigned long mask = 0xffffffff;
+	const unsigned long port_mask = 0xffff;
+	unsigned long rax, rdx;
+
+	if (!kvm_vmware_nested_backdoor_l0_enabled(vcpu->kvm))
+		return false;
+
+	if (cpl != 3)
+		return false;
+
+	rax = kvm_rax_read(vcpu) & mask;
+	if (rax == VMWARE_HYPERVISOR_MAGIC) {
+		rdx = kvm_rdx_read(vcpu) & port_mask;
+		return (rdx == VMWARE_HYPERVISOR_PORT ||
+			rdx == VMWARE_HYPERVISOR_PORT_HB);
+	}
+
+	return false;
+}
+
 void kvm_vmware_init_vm(struct kvm *kvm);
 int kvm_vmware_hypercall(struct kvm_vcpu *vcpu);
 
@@ -142,6 +174,16 @@ static inline int kvm_vmware_hypercall(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static inline bool kvm_vmware_nested_backdoor_l0_enabled(struct kvm *kvm)
+{
+	return false;
+}
+
+static inline bool kvm_vmware_wants_backdoor_to_l0(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	return false;
+}
+
 #endif /* CONFIG_KVM_VMWARE */
 
 #endif /* __ARCH_X86_KVM_VMWARE_H__ */
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 04c375bf1ac2..74c472e51479 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -22,6 +22,7 @@
 #include <asm/debugreg.h>
 
 #include "kvm_emulate.h"
+#include "kvm_vmware.h"
 #include "trace.h"
 #include "mmu.h"
 #include "x86.h"
@@ -1517,6 +1518,11 @@ int nested_svm_exit_special(struct vcpu_svm *svm)
 			 svm->vcpu.arch.apf.host_apf_flags)
 			/* Trap async PF even if not shadowing */
 			return NESTED_EXIT_HOST;
+#ifdef CONFIG_KVM_VMWARE
+		else if ((exit_code == (SVM_EXIT_EXCP_BASE + GP_VECTOR)) &&
+			 kvm_vmware_wants_backdoor_to_l0(vcpu, to_svm(vcpu)->vmcb->save.cpl))
+			return NESTED_EXIT_HOST;
+#endif
 		break;
 	}
 	case SVM_EXIT_VMMCALL:
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index be106bd60553..96996e7f9de4 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2407,7 +2407,8 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 		 * VMware backdoor emulation on #GP interception only handles
 		 * IN{S}, OUT{S}, and RDPMC.
 		 */
-		if (!is_guest_mode(vcpu))
+		if (!is_guest_mode(vcpu)  ||
+		    kvm_vmware_wants_backdoor_to_l0(vcpu, svm_get_cpl(vcpu)))
 			return kvm_emulate_instruction(vcpu,
 				EMULTYPE_VMWARE_GP | EMULTYPE_NO_DECODE);
 	} else {
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index ed8a3cb53961..ff8a1dbbba01 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -10,6 +10,7 @@
 #include "x86.h"
 #include "cpuid.h"
 #include "hyperv.h"
+#include "kvm_vmware.h"
 #include "mmu.h"
 #include "nested.h"
 #include "pmu.h"
@@ -6386,6 +6387,11 @@ static bool nested_vmx_l0_wants_exit(struct kvm_vcpu *vcpu,
 			return true;
 		else if (is_ve_fault(intr_info))
 			return true;
+#ifdef CONFIG_KVM_VMWARE
+		else if (is_gp_fault(intr_info) &&
+			 kvm_vmware_wants_backdoor_to_l0(vcpu, vmx_get_cpl(vcpu)))
+			return true;
+#endif
 		return false;
 	case EXIT_REASON_EXTERNAL_INTERRUPT:
 		return true;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 300cef9a37e2..5dc57bc57851 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4653,6 +4653,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #ifdef CONFIG_KVM_VMWARE
 	case KVM_CAP_X86_VMWARE_BACKDOOR:
 	case KVM_CAP_X86_VMWARE_HYPERCALL:
+	case KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0:
 #endif
 		r = 1;
 		break;
@@ -6754,6 +6755,13 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		kvm->arch.vmware.hypercall_enabled = cap->args[0];
 		r = 0;
 		break;
+	case KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0:
+		r = -EINVAL;
+		if (cap->args[0] & ~1)
+			break;
+		kvm->arch.vmware.nested_backdoor_l0_enabled = cap->args[0];
+		r = 0;
+		break;
 #endif
 	default:
 		r = -EINVAL;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index adf1a1449c06..f5d63c0c79f5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -955,6 +955,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_X86_VMWARE_BACKDOOR 239
 #define KVM_CAP_X86_VMWARE_HYPERCALL 240
+#define KVM_CAP_X86_VMWARE_NESTED_BACKDOOR_L0 241
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.48.1

