Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F87C20F088
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523888; cv=none; b=Myp64PZm0x98wKBBIrufT0f65UM/IzoRKjuo1BJaBvDqHSASawnoYhehaH4JnaIZQQsbBeXxPldV4+4B7cUfZ37NEmDkgja7eDNxNK7qugU5n3CGwiJtaIUNjmSc48hTFkrgVFha/T9MbcAckydOdJTMyqVDLbmTnFjpoXCQJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523888; c=relaxed/simple;
	bh=rxM4+r5oKn3FrtYxyoYERVyr2vDI5fg2rK7DFIuTtwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/Bo8iY4D14KmnKmZlpxwkGcCJeF9OyNy5PVPa6oOxAfiGVhmZa//gSBDX6/++DeUcsr7n8rlPeVMFp7VsyhQIWArRSr9w+PXQEAF4xi4H0SjDLosqPHsKb26aigAUjYBeP0H+sTSsWDUYkcZ40Ff/jETIlKVItEAzs3L6LCuak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6q7JRT0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6q7JRT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaUbfvoP8aPmiGrV9eVE67gclsfaX3jw4nCiV/n0Ni4=;
	b=e6q7JRT0izGViacuCXk2qpAW675QODl6wzwH8s4rHsR9Qw2eV+s23TAnXZUVSD0KxmFbyV
	eBQyANkOThmLFO21RExFlE0/bLK6QMyOxZMq2tf9wjlsvpXlQELyDfsysU5JabolY5+ZQj
	D92x76ZbUA37T/7lnIow4Yuj0NPSv1w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-5ftztJdKO5i2n1vV51m4lQ-1; Tue, 01 Apr 2025 12:11:24 -0400
X-MC-Unique: 5ftztJdKO5i2n1vV51m4lQ-1
X-Mimecast-MFC-AGG-ID: 5ftztJdKO5i2n1vV51m4lQ_1743523883
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so40935005e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523882; x=1744128682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaUbfvoP8aPmiGrV9eVE67gclsfaX3jw4nCiV/n0Ni4=;
        b=wJVqGfehcUIyP++PB2/EYNt6PuWymPZ0j+zcoczF/CKrgvTUt48UFeR7Fx4dQxgXy6
         E3ImaLEdyarb5gVrEVLALMCxBAEZBCmiGSjKlaz99+CV2aHCho0ClmsJZeJPzgt8HoWG
         rCNwe51s8uPtEju2Q9aRHGtzX+ck9feP62EAq2hCBInpy8l4O8b/tvMZzrx6+JrCE/xP
         hdhzhhTw8vE3A9pvLvDCQPR1bBY+f3V6PrY1jRUoALIElK3OH0p4CY933lMnN7BP+AfR
         /nNU9hsWOgX7HKvLfi5hbDffj3J+88HpRD3LLzh7MMkdE7faCs+PM146gru1RcnnUDEc
         sR2A==
X-Gm-Message-State: AOJu0Yw7xs0Rs2l5u5UwRThgDjR6mcarqws85CchKzDpnrZalQk2ncxT
	Kd8ydK3kWUHZp6yIJnvyoC3rqIU741AcCAY0XPvIcxK2uhKNyi7gq26BcpuLVzWo5bn2cyWOSdc
	vYyVJBBJhMTK1lwKgcSNX2kosHIok0G/TDywo9GnTnfwKDozJfOhkpJF+jP6FZGfvvfnT6d0BH7
	ejyArZg9YC4A9KzYQttElYZUhXBkURoiAVddrd+VkmMHpwrw==
X-Gm-Gg: ASbGncsLYloJt9CUHTaCvUnssUhkZA4dikhYqdcRu4helNDR39HUlPX9EF4b2CgWRBz
	zeftWUUZ5tsmxGxIc26VYftvv2x/yLIvp09Gvhp3/lCZvwFqMlCu4TfVAriZkH/BXpUVEbY7xvb
	e5iIHy5GkrgPJU3hN0g5YeiSrs+e16xHZTAbicRxaDj1PLqhToEGm2tZ99cO30jC2zPOLObO4HM
	TJ4bnkdSPDvEah5a44lcDKi4slmy4MHNQnpBrbQv1SsWZwlOMlVUQoLcMMMycqkte6OgTFy2nNR
	6NXv5+DCUP3bTpHesGqO9w==
X-Received: by 2002:a05:600c:cc8:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43ea5f001b7mr45447985e9.27.1743523882231;
        Tue, 01 Apr 2025 09:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZdEWzHsg0YswCSXrdzj6ch9i3n9G2iz9TWc1mNERKBxpVsH1+e/xNG+caFFDjVEabapAovQ==
X-Received: by 2002:a05:600c:cc8:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43ea5f001b7mr45447655e9.27.1743523881889;
        Tue, 01 Apr 2025 09:11:21 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ab86sm14896816f8f.51.2025.04.01.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: roy.hopkins@suse.com,
	seanjc@google.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	jroedel@suse.de,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH 05/29] KVM: add plane support to KVM_SIGNAL_MSI
Date: Tue,  1 Apr 2025 18:10:42 +0200
Message-ID: <20250401161106.790710-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161106.790710-1-pbonzini@redhat.com>
References: <20250401161106.790710-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct kvm_kernel_irq_routing_entry is the main tool for sending
cross-plane IPIs.  Make kvm_send_userspace_msi the first function to
accept a struct kvm_plane pointer, in preparation for making it available
from plane file descriptors.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/kvm_host.h | 3 ++-
 virt/kvm/irqchip.c       | 5 ++++-
 virt/kvm/kvm_main.c      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6bd9b0b3cbee..98bae5dc3515 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -684,6 +684,7 @@ struct kvm_kernel_irq_routing_entry {
 			u32 data;
 			u32 flags;
 			u32 devid;
+			u32 plane;
 		} msi;
 		struct kvm_s390_adapter_int adapter;
 		struct kvm_hv_sint hv_sint;
@@ -2218,7 +2219,7 @@ static inline int kvm_init_irq_routing(struct kvm *kvm)
 
 #endif
 
-int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi);
+int kvm_send_userspace_msi(struct kvm_plane *plane, struct kvm_msi *msi);
 
 void kvm_eventfd_init(struct kvm *kvm);
 int kvm_ioeventfd(struct kvm *kvm, struct kvm_ioeventfd *args);
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 162d8ed889f2..84952345e3c2 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -45,8 +45,10 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 	return irq_rt->chip[irqchip][pin];
 }
 
-int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
+int kvm_send_userspace_msi(struct kvm_plane *plane, struct kvm_msi *msi)
 {
+	struct kvm *kvm = plane->kvm;
+	unsigned plane_id = plane->plane;
 	struct kvm_kernel_irq_routing_entry route;
 
 	if (!kvm_arch_irqchip_in_kernel(kvm) || (msi->flags & ~KVM_MSI_VALID_DEVID))
@@ -57,6 +59,7 @@ int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
 	route.msi.data = msi->data;
 	route.msi.flags = msi->flags;
 	route.msi.devid = msi->devid;
+	route.msi.plane = plane_id;
 
 	return kvm_set_msi(&route, kvm, KVM_USERSPACE_IRQ_SOURCE_ID, 1, false);
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e83db27580da..5b44a7f9e52e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5207,7 +5207,7 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = -EFAULT;
 		if (copy_from_user(&msi, argp, sizeof(msi)))
 			goto out;
-		r = kvm_send_userspace_msi(kvm, &msi);
+		r = kvm_send_userspace_msi(kvm->planes[0], &msi);
 		break;
 	}
 #endif
-- 
2.49.0

