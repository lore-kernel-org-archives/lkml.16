Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A520DD54
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523883; cv=none; b=PQoc9cUCAjLyxh2ndScQM798zdMXx6a0BMH/B3yTotiKx9Ev9aZbmsSeEbSMyfmpTKDBPkmeiSOiVGzDeYW6Z1Sorl9ag+dn4eefUkjrD79dshZQZT3drDEBYmsomcbniMi2V3LrKqXzU4hUdAlcVUpHlsnctSkCiQwXnlMSJJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523883; c=relaxed/simple;
	bh=yRG3ANAcWURe86N1hf41BIQjs3HGQuEMu8uGmCkgimo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyVS7yM+jKGUtYGO3cjOAzkxW7Av3dETcT/EiB+BaJtA5an7cPjVWhLEhOJ4bvERJK7XOf2xB9dil3duZIuZZocoZG4imPmoAFKHeK5GG2EKzcqWe3gY+GC1fSpluFTfwcwZEPkmjzGu13WkmtWhtD0cdtOPb/4zlDt5BGQCu9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHTOiJuk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHTOiJuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5sOJ1ZN51NGUB7AKsam1Z/J0Y4Aw58lesO8LZ+8PjM=;
	b=AHTOiJukaE8JnXSCn8bMGuFT9DWpFpwgA+A1smcM2nFkSWrUdoYX9veOLbtIeFjb3zYkau
	3oK6E2duR9u6R51woOqADUm+GWkFrJTEDNRsJLk/1rhtoMr9vy8kH/U7B2UFoFnHNjFtso
	L27YXizteiT5i3jnF8iPUo62B0SVjmo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-RY9bVk5UO1WjH_paW8RvlA-1; Tue, 01 Apr 2025 12:11:19 -0400
X-MC-Unique: RY9bVk5UO1WjH_paW8RvlA-1
X-Mimecast-MFC-AGG-ID: RY9bVk5UO1WjH_paW8RvlA_1743523878
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so35531545e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523878; x=1744128678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5sOJ1ZN51NGUB7AKsam1Z/J0Y4Aw58lesO8LZ+8PjM=;
        b=sXTtBPovEK+TXVfgfr+cGVsk2+rZjdqrNkESNEwPNKLffrI+emF5U5wgxQKS9un7Wh
         cD7yKkUweZI3HL+oVYcW4BXa/qVEG7IkWWAtbqjz1BXKMWHAMRDeD2NtutwFBzXQ4FFi
         6HDaMWKKDqprr8kIXm4WsunNA4M/9Coq9/Fi53dl8latR7sFjmntjixRrAkt9oxrmGVu
         q4GS7htgCKcTVcuc/sihY+pFxP/EPnmgoR+6Wh7KTw3XkLoRJ6AkNnbZSBEbroVDaN6z
         cTxZTUYHA2xy8/tMAU03kGKS1kTXg7rnbc5NHoG/oMhgEyv35FmDaYM/tbFyPDyHcIyZ
         KPhw==
X-Gm-Message-State: AOJu0Yx6+5F/vuYNrljaR1YwNl1QqOnJz5JqJGw6ud7yueSogq8zNr/n
	fGnHkJtgkhMs6vWAnonKVADprGRsJjbVkTReLsm8N6GaBEd03qQotl5IRINepzDJwA20TgvL5Df
	TG9hOJBwDvfVmsls99/tRXh4U2m9+3/rHlDwbkpUA+6S83TCwiEMpRC5vXPlwM6dYPsEtLfHR/p
	FQAQ54PWobODb5W/AkDKHnPyIqTYIXtsmR7txtg/5t4i/rEA==
X-Gm-Gg: ASbGncuAn+x6sxzDYMw8O8ke9z8AVPsTahDTRk969pMxxyVGBfl2MVklbMsTcfnENTi
	TgtKqgvea3AjVtkVpf5gbyyjgMLojbD2PuCpu3y+mqe7xtuiHRPmBvU0+YBEBMuQMyuE9XtuAVP
	cUnPsc4BTIETqQocd4VaHCBHtkuYl4OAYci/eI2TznVXzJAJPS61e88m3ajREmuCfaEh6T5Q3v6
	1UFSwJJP2V/ytmHXwnYpxYC9to+rTvL+EW3P1iaA48jSq0TUtdPjsZgMUK8KdgZJDOzDdWWoFgj
	DYI8mymckzn8MbL8DYENxg==
X-Received: by 2002:a05:600c:198f:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43db61d8326mr133339185e9.3.1743523877765;
        Tue, 01 Apr 2025 09:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbyCKX5Aqf5nXfh6DE7+ASXGOt8qcrXWAlRQRnDUDahaaum0QoMpdBp6Nw+tK1Bgywmh1HQw==
X-Received: by 2002:a05:600c:198f:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43db61d8326mr133338495e9.3.1743523877277;
        Tue, 01 Apr 2025 09:11:17 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4294sm14189742f8f.89.2025.04.01.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:15 -0700 (PDT)
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
Subject: [PATCH 03/29] KVM: add plane info to structs
Date: Tue,  1 Apr 2025 18:10:40 +0200
Message-ID: <20250401161106.790710-4-pbonzini@redhat.com>
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

Add some of the data to move from one plane to the other within a VM,
typically from plane N to plane 0.

There is quite some difference here because while separate planes provide
very little of the vm file descriptor functionality, they are almost fully
functional vCPUs except that non-zero planes(*) can only be ran indirectly
through the initial plane.

Therefore, vCPUs use struct kvm_vcpu for all planes, with just a couple
fields that will be added later and will only be valid for plane 0.  At
the VM level instead plane info is stored in a completely different struct.
For now struct kvm_plane has no architecture-specific counterpart, but this
may change in the future if needed.  It's possible for example that some MMU
info becomes per-plane in order to support per-plane RWX permissions.

(*) I will restrain from calling them astral planes.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/kvm_host.h  | 17 ++++++++++++++++-
 include/linux/kvm_types.h |  1 +
 virt/kvm/kvm_main.c       | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c8f1facdb600..0e16c34080ef 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -84,6 +84,10 @@
 #define KVM_MAX_NR_ADDRESS_SPACES	1
 #endif
 
+#ifndef KVM_MAX_VCPU_PLANES
+#define KVM_MAX_VCPU_PLANES		1
+#endif
+
 /*
  * For the normal pfn, the highest 12 bits should be zero,
  * so we can mask bit 62 ~ bit 52  to indicate the error pfn,
@@ -332,7 +336,8 @@ struct kvm_vcpu {
 #ifdef CONFIG_PROVE_RCU
 	int srcu_depth;
 #endif
-	int mode;
+	short plane;
+	short mode;
 	u64 requests;
 	unsigned long guest_debug;
 
@@ -367,6 +372,8 @@ struct kvm_vcpu {
 	} async_pf;
 #endif
 
+	struct kvm_vcpu *plane0;
+
 #ifdef CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT
 	/*
 	 * Cpu relax intercept or pause loop exit optimization
@@ -753,6 +760,11 @@ struct kvm_memslots {
 	int node_idx;
 };
 
+struct kvm_plane {
+	struct kvm *kvm;
+	int plane;
+};
+
 struct kvm {
 #ifdef KVM_HAVE_MMU_RWLOCK
 	rwlock_t mmu_lock;
@@ -777,6 +789,9 @@ struct kvm {
 	/* The current active memslot set for each address space */
 	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
 	struct xarray vcpu_array;
+
+	struct kvm_plane *planes[KVM_MAX_VCPU_PLANES];
+
 	/*
 	 * Protected by slots_lock, but can be read outside if an
 	 * incorrect answer is acceptable.
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 827ecc0b7e10..7d0a86108d1a 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -11,6 +11,7 @@ struct kvm_interrupt;
 struct kvm_irq_routing_table;
 struct kvm_memory_slot;
 struct kvm_one_reg;
+struct kvm_plane;
 struct kvm_run;
 struct kvm_userspace_memory_region;
 struct kvm_vcpu;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f6c947961b78..67773b6b9576 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1095,9 +1095,22 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 }
 
+static struct kvm_plane *kvm_create_vm_plane(struct kvm *kvm, unsigned plane_id)
+{
+	struct kvm_plane *plane = kzalloc(sizeof(struct kvm_plane), GFP_KERNEL_ACCOUNT);
+
+	if (!plane)
+		return ERR_PTR(-ENOMEM);
+
+	plane->kvm = kvm;
+	plane->plane = plane_id;
+	return plane;
+}
+
 static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 {
 	struct kvm *kvm = kvm_arch_alloc_vm();
+	struct kvm_plane *plane0;
 	struct kvm_memslots *slots;
 	int r, i, j;
 
@@ -1136,6 +1149,13 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	snprintf(kvm->stats_id, sizeof(kvm->stats_id), "kvm-%d",
 		 task_pid_nr(current));
 
+	plane0 = kvm_create_vm_plane(kvm, 0);
+	if (IS_ERR(plane0)) {
+		r = PTR_ERR(plane0);
+		goto out_err_no_plane0;
+	}
+	kvm->planes[0] = plane0;
+
 	r = -ENOMEM;
 	if (init_srcu_struct(&kvm->srcu))
 		goto out_err_no_srcu;
@@ -1227,6 +1247,8 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_irq_srcu:
 	cleanup_srcu_struct(&kvm->srcu);
 out_err_no_srcu:
+	kfree(kvm->planes[0]);
+out_err_no_plane0:
 	kvm_arch_free_vm(kvm);
 	mmdrop(current->mm);
 	return ERR_PTR(r);
@@ -1253,6 +1275,10 @@ static void kvm_destroy_devices(struct kvm *kvm)
 	}
 }
 
+static void kvm_destroy_plane(struct kvm_plane *plane)
+{
+}
+
 static void kvm_destroy_vm(struct kvm *kvm)
 {
 	int i;
@@ -1309,6 +1335,11 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	xa_destroy(&kvm->mem_attr_array);
 #endif
+	for (i = 0; i < ARRAY_SIZE(kvm->planes); i++) {
+		struct kvm_plane *plane = kvm->planes[i];
+		if (plane)
+			kvm_destroy_plane(plane);
+	}
 	kvm_arch_free_vm(kvm);
 	preempt_notifier_dec();
 	kvm_disable_virtualization();
@@ -4110,6 +4141,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	}
 	vcpu->run = page_address(page);
 
+	vcpu->plane0 = vcpu;
 	kvm_vcpu_init(vcpu, kvm, id);
 
 	r = kvm_arch_vcpu_create(vcpu);
-- 
2.49.0

