Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A102147E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523895; cv=none; b=C52fxSCUBN1ewGuVuTE/7+VLjAaMpWVyXFSFbNmd2pQ1MB1C4ee7w3xGp0uSwb8LhG4cBLgPk5hz3JjXJKmBvonxK34+kWsovWq35YWEJpk+dQTkWR7Zb1XwMrH2tz8W/4W1CuAwIKublE5DB2Vb5FfxjO0vu9Qqort8Qyre5Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523895; c=relaxed/simple;
	bh=U6yMn8cBq8sVKBGacb4GZasvrwVKcSNV989ya6C5aGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezl7ZP1xrDHRAmuPCXCtkr/dmJTLGNJRpqzJi1OeI8zZC59x5a4aeid8WINVZGRYcepG6qgeJN4e8DfEA/evDedKYb6NvULz+xMLZvLKZJnIHsSCNhmh9GFjXgy7ceOMBQxBqOci+JuD++wkyT92po8fm5vnjrKavilDiMKQoFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LvBP984M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LvBP984M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cb+CmZ3WRWsV/9FrwrAoBArv5drunjdteeEUhGgbJHE=;
	b=LvBP984MMw6oD1slshN1PSkOrnvyuvjmbebalCi6cCb41yfQ+OPE3mEStrZujdnr+2tOpI
	1hRQINxj2XMfuaEefuOE8Lj+zfrp2oJhwuU7/DBVvj54YsGLH7KMkUTPyXyAXP/3wncLec
	l8R9lGMXzwR5StYTfDK2eVfsafmWXJM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-IwgK8cutP9Cn2J-BtP5gNQ-1; Tue, 01 Apr 2025 12:11:32 -0400
X-MC-Unique: IwgK8cutP9Cn2J-BtP5gNQ-1
X-Mimecast-MFC-AGG-ID: IwgK8cutP9Cn2J-BtP5gNQ_1743523891
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391315098b2so2512543f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523890; x=1744128690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb+CmZ3WRWsV/9FrwrAoBArv5drunjdteeEUhGgbJHE=;
        b=RjC001sQ/rEIEiys8rdQFaGzRZmdMg9iYWtbTNa6RWmC/cS03GzjwnjUIyNiQsz731
         1uEpkhJbsV+Ep/8GhbDnas/tVO/olV7VGROPxJIDAOSS4B5zOav/XWToEGpRSuA0a9eF
         q2xNzSWqNEY+XXB71oTafEENRok555+mWPmkzwMLRP9XTsPkmwHP1PkIHBhuv3llTrZ3
         x1/wu+GbPoq/7LNpxEwerSZfcj9EYluiXOke9lcl25fIvYZzFuAbo9sHScd+O2eaABUt
         vmn90ZpE0hmSilhQXxObaa8Zmd4cUHf8jFSkWMhSAU4Sl901v/gOl1Gz82jb7WUUjysu
         plrw==
X-Gm-Message-State: AOJu0YynkPHBnepBaAfREpNkBV59YyG5Sz83iopmhBZuLSLO6qthhmxb
	fb7vrj0HlIk2jPDAqMpVcNjKxg0CdUHffjHnWUcaMLFeyL+v4IRP0mCDBFpKarSVJP58lwUCYGm
	/A1fM1ab5g/u+Zm/H+yhjKXFFYGD9E0FX78q2k5d6+6ZjUwv50eXJ2r/preQfr4eZG0Y/siTXZN
	ZH2BcBugZbiJbo526aOWoIQ7nHBdZa3SYKHtiY8/z+DbEwMA==
X-Gm-Gg: ASbGncuHoWPy1ZQPlQq0GjdW3io7+P1M0k0ur2Ah/GAigUQwmc9AMEOtWRswBH56orm
	RbKOG7CI8knsJjp+CbUnNPtV6Rcv2OkchgmDjbIvQRYFOjRqIrfGWJf9H7mNZqk2ry2Bi4gaptT
	pzHk+9UoXRNZPjZ3nieswt005/yCKLZzP1XtAqJBGd6blbCGKMyKmVIq06ebUy+lzh+8DPTQzIU
	atFQmnfw7ycRdMyggbPYSyX2kAw/6NmE3gkm4LeU1rQT8lWKTRQrHrZPck2LnO6DHH86yQBaTHZ
	4C0EqOyqXeBG2uDCoL9FZQ==
X-Received: by 2002:a05:6000:2406:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-39c1424288amr10394887f8f.15.1743523890117;
        Tue, 01 Apr 2025 09:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4bSLgkcclAnLgXImQoVywXonho7NhGNG6jPdFeVRkXIeTp4vzQ53xbuKaIBnWKYfV8gHRsg==
X-Received: by 2002:a05:6000:2406:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-39c1424288amr10394829f8f.15.1743523889638;
        Tue, 01 Apr 2025 09:11:29 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663617sm14614220f8f.34.2025.04.01.09.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:28 -0700 (PDT)
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
Subject: [PATCH 08/29] KVM: move vcpu_array to struct kvm_plane
Date: Tue,  1 Apr 2025 18:10:45 +0200
Message-ID: <20250401161106.790710-9-pbonzini@redhat.com>
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

Different planes may have only a subset of the vCPUs available in
the initial plane, therefore vcpu_array must also be moved to
struct kvm_plane.  New functions allow accessing the vCPUs of
a struct kvm_plane and, as usual, the older names automatically
go through kvm->planes[0].

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/kvm_host.h | 29 +++++++++++++++++++++--------
 virt/kvm/kvm_main.c      | 22 +++++++++++++++-------
 2 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0db27814294f..0a91b556767e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -763,6 +763,7 @@ struct kvm_memslots {
 
 struct kvm_plane {
 	struct kvm *kvm;
+	struct xarray vcpu_array;
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	/* Protected by slots_locks (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
@@ -795,7 +796,6 @@ struct kvm {
 	struct kvm_memslots __memslots[KVM_MAX_NR_ADDRESS_SPACES][2];
 	/* The current active memslot set for each address space */
 	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
-	struct xarray vcpu_array;
 
 	struct kvm_plane *planes[KVM_MAX_VCPU_PLANES];
 
@@ -990,20 +990,20 @@ static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 				      !refcount_read(&kvm->users_count));
 }
 
-static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
+static inline struct kvm_vcpu *kvm_get_plane_vcpu(struct kvm_plane *plane, int i)
 {
-	struct kvm_vcpu *vcpu = xa_load(&kvm->vcpu_array, i);
+	struct kvm_vcpu *vcpu = xa_load(&plane->vcpu_array, i);
 	if (vcpu && unlikely(vcpu->plane == -1))
 		return NULL;
 
 	return vcpu;
 }
 
-#define kvm_for_each_vcpu(idx, vcpup, kvm)			\
-	xa_for_each(&kvm->vcpu_array, idx, vcpup)		\
+#define kvm_for_each_plane_vcpu(idx, vcpup, plane_)				\
+	xa_for_each(&(plane_)->vcpu_array, idx, vcpup)		\
 		if ((vcpup)->plane == -1) ; else		\
 
-static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
+static inline struct kvm_vcpu *kvm_get_plane_vcpu_by_id(struct kvm_plane *plane, int id)
 {
 	struct kvm_vcpu *vcpu = NULL;
 	unsigned long i;
@@ -1011,15 +1011,28 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 	if (id < 0)
 		return NULL;
 	if (id < KVM_MAX_VCPUS)
-		vcpu = kvm_get_vcpu(kvm, id);
+		vcpu = kvm_get_plane_vcpu(plane, id);
 	if (vcpu && vcpu->vcpu_id == id)
 		return vcpu;
-	kvm_for_each_vcpu(i, vcpu, kvm)
+	kvm_for_each_plane_vcpu(i, vcpu, plane)
 		if (vcpu->vcpu_id == id)
 			return vcpu;
 	return NULL;
 }
 
+static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
+{
+	return kvm_get_plane_vcpu(kvm->planes[0], i);
+}
+
+#define kvm_for_each_vcpu(idx, vcpup, kvm)				\
+	kvm_for_each_plane_vcpu(idx, vcpup, kvm->planes[0])
+
+static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
+{
+	return kvm_get_plane_vcpu_by_id(kvm->planes[0], id);
+}
+
 void kvm_destroy_vcpus(struct kvm *kvm);
 
 void vcpu_load(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eba02cb7cc57..cd4dfc399cad 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -481,12 +481,19 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 void kvm_destroy_vcpus(struct kvm *kvm)
 {
+	int j;
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		kvm_vcpu_destroy(vcpu);
-		xa_erase(&kvm->vcpu_array, i);
+	for (j = ARRAY_SIZE(kvm->planes) - 1; j >= 0; j--) {
+		struct kvm_plane *plane = kvm->planes[j];
+		if (!plane)
+			continue;
+
+		kvm_for_each_plane_vcpu(i, vcpu, plane) {
+			kvm_vcpu_destroy(vcpu);
+			xa_erase(&plane->vcpu_array, i);
+		}
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
@@ -1110,6 +1117,7 @@ static struct kvm_plane *kvm_create_vm_plane(struct kvm *kvm, unsigned plane_id)
 	plane->kvm = kvm;
 	plane->plane = plane_id;
 
+	xa_init(&plane->vcpu_array);
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	xa_init(&plane->mem_attr_array);
 #endif
@@ -1137,7 +1145,6 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	mutex_init(&kvm->slots_arch_lock);
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
-	xa_init(&kvm->vcpu_array);
 
 	INIT_LIST_HEAD(&kvm->gpc_list);
 	spin_lock_init(&kvm->gpc_lock);
@@ -3930,6 +3937,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 {
 	int nr_vcpus, start, i, idx, yielded;
 	struct kvm *kvm = me->kvm;
+	struct kvm_plane *plane = kvm->planes[me->plane];
 	struct kvm_vcpu *vcpu;
 	int try = 3;
 
@@ -3967,7 +3975,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 		if (idx == me->vcpu_idx)
 			continue;
 
-		vcpu = xa_load(&kvm->vcpu_array, idx);
+		vcpu = xa_load(&plane->vcpu_array, idx);
 		if (!READ_ONCE(vcpu->ready))
 			continue;
 		if (kvm_vcpu_is_blocking(vcpu) && !vcpu_dy_runnable(vcpu))
@@ -4192,7 +4200,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	 */
 	vcpu->plane = -1;
 	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
-	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
+	r = xa_insert(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
 	WARN_ON_ONCE(r == -EBUSY);
 	if (r)
 		goto unlock_vcpu_destroy;
@@ -4228,7 +4236,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 kvm_put_xa_erase:
 	mutex_unlock(&vcpu->mutex);
 	kvm_put_kvm_no_destroy(kvm);
-	xa_erase(&kvm->vcpu_array, vcpu->vcpu_idx);
+	xa_erase(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx);
 unlock_vcpu_destroy:
 	mutex_unlock(&kvm->lock);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
-- 
2.49.0

