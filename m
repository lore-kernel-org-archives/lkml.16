Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37C27B516
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504036; cv=none; b=mel1V7Uu9D+3RokDigsEZ8kXmNMQawYcWIO6ccBJRCiTRHn6nSx/94q+8wjpE3xf6hWzmWfj5/3pHcF+/71NY5MHsBf6Z94rGJ5YjRybkBc2tCroZxvkrFTaPWocYWKlR53UwuGYO7rT2R0AwJAIRIrwbFXzi2AQTTNH5uvGMiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504036; c=relaxed/simple;
	bh=62G1u7Mmcj0LoLg/GsZOxRpsdU6hf0LcgEiDACKmXjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EHCghYlf7G91jIgcRBH9M573boOmj4Oajs8yzEsw7zBgh/I09/S5+Lxa4A5v4FynJeZlAXY0LL86URz6y0GC5mEggR/Tni7tl0EraOzvLM/KW8eSfZGwAyFEvoGr5axrnAQ86Mkh2H8COYtSgq3Vn1Rxv4k9NMZ4kFWmDXdE05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YyLEy0uC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyLEy0uC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf680d351so13779685e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504031; x=1746108831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=;
        b=YyLEy0uC+aKHIkM4oaNNOOvTEZxl/5B4cXMJWSiA5CH0VKETdRs1XxMP9euG6CgE2e
         Z23rgG1SUAKMC/rdVHWjNbC+XWmyfueGcOirkOcsGMCQPLCujAKCkPge1SHWgctMolRg
         VsK7AbhITHdDJZ/mZTkqKU2opmMA5akZbn1I1JWbXeLTDgeuLCR+bqweC7o3r8fqG0JP
         rvxIZ6AW6JAFEQIIudhQnHCQgdgEg6zG4+kSRQJN8FbIPXzyGwglOHS25g10OTkEfunL
         lbyuyS6pqq7X1Q8tQ/K+fZGkXN0vkHcZtBXrR60SkIIevTg4zC9iJj8ScVY3BHkXRwUW
         mzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504031; x=1746108831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=;
        b=rKFdMnOYyALmK+KZO74UvLOKqsjftrfkvkRmoR6ZAs18Z7fix8QSlAH7cn2VlNHDLG
         zuE4JK0LNaPB2C4Eyq0pDNEwddRGADqH89iacIOQ1knNIOtBfkt9/hCcQhKv68z97DFC
         SAIV0IvXRU0Q4F5sqW/VqjOWis+eaODFzS0v1AGoFYvUWdBQCXeLAweaD/DZrQAXaDm7
         X1y+hxQc0DgFdZEcMC8yUTbn11lZKJFx8mvHEfyupl1V1buJEKA2sO3rPtzy0DajJguI
         8i9S0gv/9cK2BpNSJ3A9lGshxLGD1DYrQa2yT9GMCJ+dQo6etTuhtNTb1i/3t9ORGltW
         rfPQ==
X-Gm-Message-State: AOJu0Yy1Rp1bGv7J2two1Qkztdn7iffU4R6Ed7ckLDEiaFinOUmc8jdl
	2HGLxMIDz77Fz40lPWD2+D5YptGJQnTWsNO5942UMciBU7nqCWIfJuhsOiH7OmzeqvcJY28kcUf
	cfi0=
X-Gm-Gg: ASbGnctJ1Pr0uxtgSX3k0EfZ50oXDung62cTb5jFcGypEz1jpwKmh6U6S68nqLqXPaR
	h9VJAWolaQtQvU68oLjBxbQB4XMIlQKQla9XNImRnvYeBJ2bojMNcqaXgR9gHRHJ3bBRvUnDODA
	QOYv7LQaa+2KGIeSeXAcmqt58LPjI5J8VUZpCu2PtdxSuXwSlEh2nZT9owhwkgIT4k6GgXGHwM8
	BI9guOAvEOClKcTSaRjR7Q5z8KslsZwlhH06iRChMpemCPSqse3D8ETR4X6R1itequGNeMO/tO4
	9G9aNNk7FnrkH0TjEzMAoX7f2cvOdNZwrLDbLxly4yWKa062pcsKJkndNR76wboz21LYFteHlDa
	jvBod0aSNHrNrkqNV
X-Google-Smtp-Source: AGHT+IGs6TOHidyOdLjO/aiH4v937+mffmDnW0sidZAyNfcPHTexYT+C0CxkEqdPf2DwJcaHqEXYnw==
X-Received: by 2002:adf:ebcc:0:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-3a06d673778mr1956533f8f.13.1745504031472;
        Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 05/34] KVM: Add KVM_SET_DTB_ADDRESS ioctl to pass guest DTB address from userspace
Date: Thu, 24 Apr 2025 15:13:12 +0100
Message-Id: <20250424141341.841734-6-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors, such as Gunyah, require access to the guest's
device tree blob (DTB) in order to inspect and/or modify it before
starting the guest. The userspace virtual machine monitor (e.g. QEMU)
is responsible for loading the guest's DTB into memory at a guest
physical address, but the hypervisor backend must be informed of that
address and size.

To support this use case, introduce a new ioctl: KVM_SET_DTB_ADDRESS.
This allows userspace to provide the guest physical address and size
of the DTB via a `struct kvm_dtb`, which is now stored in `struct kvm`.

The ioctl allows platform-specific backends like Gunyah to retrieve
the DTB location when configuring the VM.

This patch also increments the KVM API version to 13 to reflect the
addition of this new ioctl.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_host.h |  1 +
 include/uapi/linux/kvm.h | 14 ++++++++++----
 virt/kvm/kvm_main.c      |  8 ++++++++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3461346b37e0..4e98c7cad2bd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -862,6 +862,7 @@ struct kvm {
 	/* Protected by slots_locks (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
+	struct kvm_dtb dtb;
 	char stats_id[KVM_STATS_NAME_SIZE];
 };
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c6988e2c68d5..8f8161cd61a7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -14,7 +14,7 @@
 #include <linux/ioctl.h>
 #include <asm/kvm.h>
 
-#define KVM_API_VERSION 12
+#define KVM_API_VERSION 13
 
 /*
  * Backwards-compatible definitions.
@@ -43,6 +43,11 @@ struct kvm_userspace_memory_region2 {
 	__u64 pad2[14];
 };
 
+struct kvm_dtb {
+	__u64 guest_phys_addr;
+	__u64 size;
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
  * userspace, other bits are reserved for kvm internal use which are defined
@@ -1190,11 +1195,12 @@ struct kvm_vfio_spapr_tce {
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
 #define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
 					 struct kvm_userspace_memory_region2)
+#define KVM_SET_DTB_ADDRESS      _IOW(KVMIO, 0x50, struct kvm_dtb)
 
 /* enable ucontrol for s390 */
-#define KVM_S390_UCAS_MAP        _IOW(KVMIO, 0x50, struct kvm_s390_ucas_mapping)
-#define KVM_S390_UCAS_UNMAP      _IOW(KVMIO, 0x51, struct kvm_s390_ucas_mapping)
-#define KVM_S390_VCPU_FAULT	 _IOW(KVMIO, 0x52, unsigned long)
+#define KVM_S390_UCAS_MAP        _IOW(KVMIO, 0x55, struct kvm_s390_ucas_mapping)
+#define KVM_S390_UCAS_UNMAP      _IOW(KVMIO, 0x56, struct kvm_s390_ucas_mapping)
+#define KVM_S390_VCPU_FAULT	 _IOW(KVMIO, 0x57, unsigned long)
 
 /* Device model IOC */
 #define KVM_CREATE_IRQCHIP        _IO(KVMIO,   0x60)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dbb7ed95523f..a984051e2470 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5121,6 +5121,14 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
 		break;
 	}
+	case KVM_SET_DTB_ADDRESS: {
+		r = 0;
+		if (copy_from_user(&kvm->dtb, argp, sizeof(struct kvm_dtb))) {
+			r = -EFAULT;
+			goto out;
+		}
+		break;
+	}
 	case KVM_GET_DIRTY_LOG: {
 		struct kvm_dirty_log log;
 
-- 
2.39.5

