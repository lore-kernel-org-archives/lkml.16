Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0726224243
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523951; cv=none; b=MHrkFNYGD1O0ZVF89wtR2gNCLmFkMWUg/odoeaRp95jX4YQxHO8sLglwJhyvTsMDl8TCVFXNTPXJCSNEpO8kCCTm2Mv8nVjG3eqmm+hTSDwmaqz2Rk2J8Lqg47CMTjdh107yie85CrhDGElE8vVb/7CrtrTlOSuHUC8pTMMks44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523951; c=relaxed/simple;
	bh=IzgYPa9TLRk/unXxPit+XhBgPDXmtIE8BQwrHks1a1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7F0ZnqqWX+T1/hrhJ3IOJ2h8RxjAPiK5j795z5Ta+TY8/bQcXYlCeAQSnn1IWAQcJfy7hD0uYlUarTI99EPV9qoJLQjMcByO6SAVeecl4yr6LhRRWjrj6e5Ti7lYA+m/VmDRYb+9D6S0JNwz1eQ6X5XRwyJBClZShUHMBo5sk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FskCZzmj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FskCZzmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThjFpyMC5Hp17v5ZX3gmbcUwmxsf/SI/3VCI26Zru1Q=;
	b=FskCZzmjo+biTgYld/gpiRMW4B2e+sWznDvvJVRCIvziwmnB3QKsy9mCsAlXScE629cxVF
	S4+ESB1xsk5/2ZJjZSx3CbH41qf1YybYW8ci4LOnm2VR8Z9FOeiXwm64kxVkbKlPLBCL4Y
	80i3NnAkJxHEo/zphfUKEWla89n1HMw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-onhNahw8Ozedos648IqU4Q-1; Tue, 01 Apr 2025 12:12:27 -0400
X-MC-Unique: onhNahw8Ozedos648IqU4Q-1
X-Mimecast-MFC-AGG-ID: onhNahw8Ozedos648IqU4Q_1743523947
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912e4e2033so2464164f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523946; x=1744128746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThjFpyMC5Hp17v5ZX3gmbcUwmxsf/SI/3VCI26Zru1Q=;
        b=KQNYI5C4vbL+6vZsOz8cUCOhMan9F5vE0Kyb0s3aImkmOpMYyEskzcQSWw7sNkxKCS
         tm+nw7VdtV8Ll/9uVV5O+FhdfcRvmaemWLTzFSLeNXds09pvVxP7oD40q8KEJnMDtqvU
         YDxEXs11onh3YiAETC2zM5ChFXLlvzEHkSVzwJ/VrG6HdTuhGPMmJrJxKnRCRhKExdam
         UTLJxrJFotwzdUDBINU8crhAdKp5v8bYegrn7PnF24n4aXAL3ZspgPZtqE66ITZKwcsW
         H5gGhQ2mp2+71VQRDvplGgAkhRrVr2lC5ihmLtGve1qHBUwPTFPq61HbmSbuO9TTEjgq
         ohZw==
X-Gm-Message-State: AOJu0YwdzovWGZhqverwmsqGH2KRJ0JgljPtXQPkkn5hjRHFwf1ZybiB
	u97oUMtL/KTDUi0IL9+Np7k/XKpYZv3V7S3ZHBZjEe9lxrnYxLRmSSWkfjNMagidBgc99cAuGiz
	C+uaC+yT2E7pouyqTK/1vTfIMptde/mPmMNLgPgIHJdEvebqzH5ai+kdI+nsAVa3XafXYfwQPAQ
	TVA5SrO7zLd5ob4lk9H71NmfOu8mrYtgmSEyrkeke34KRZYg==
X-Gm-Gg: ASbGnctEk5BXvFWWKzwGj3cz7f/sTWbRUfAWJUHZD9SNi8h6uigXd/uaRa5YPlM6IwJ
	LLFhNshUk1iCSGdvcIOBE9rtVaeEAXREq9sxeulNVegijSYe0jZhWpoPjNsFl7veUDEBLj67rgD
	W/mLwcLkD8TuLEm/2XKCdseBsy8/Xi37iPmjV7bO4vm+VcN370ZEHOAOqBCfbengndyJAR5eLPt
	pD1RgYag98FQFr59xS3AKjOV5XI4w9vWug6rCTSzZuk3x/JX4XSWXx2yd9auHmgdPH56DCcFgD+
	ThlAWITR2RGl8jZjdXfIAQ==
X-Received: by 2002:a5d:5984:0:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39c120e079amr11107187f8f.25.1743523946174;
        Tue, 01 Apr 2025 09:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBwtO/kXcEsLY7KXcPjFkl0MSW5C3pyJQtoPcatQB9sVIkAZFxi2d3eLTTZNav5W8Iob3Pfw==
X-Received: by 2002:a5d:5984:0:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39c120e079amr11107136f8f.25.1743523945640;
        Tue, 01 Apr 2025 09:12:25 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5ea4sm206316555e9.25.2025.04.01.09.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:12:23 -0700 (PDT)
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
Subject: [PATCH 28/29] selftests: kvm: add plane infrastructure
Date: Tue,  1 Apr 2025 18:11:05 +0200
Message-ID: <20250401161106.790710-29-pbonzini@redhat.com>
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

Allow creating plane and vCPU-plane file descriptors, and close them
when the VM is freed.  Rewrite the previous test using the new
infrastructure (separate for easier review).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 48 ++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 65 ++++++++++++++++++-
 tools/testing/selftests/kvm/plane_test.c      | 21 +++---
 3 files changed, 119 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 373912464fb4..c1dfe071357e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -67,6 +67,20 @@ struct kvm_vcpu {
 	uint32_t dirty_gfns_count;
 };
 
+struct kvm_plane {
+	struct list_head list;
+	uint32_t id;
+	int fd;
+	struct kvm_vm *vm;
+};
+
+struct kvm_plane_vcpu {
+	struct list_head list;
+	uint32_t id;
+	int fd;
+	struct kvm_vcpu *plane0;
+};
+
 struct userspace_mem_regions {
 	struct rb_root gpa_tree;
 	struct rb_root hva_tree;
@@ -93,6 +107,8 @@ struct kvm_vm {
 	unsigned int va_bits;
 	uint64_t max_gfn;
 	struct list_head vcpus;
+	struct list_head planes;
+	struct list_head plane_vcpus;
 	struct userspace_mem_regions regions;
 	struct sparsebit *vpages_valid;
 	struct sparsebit *vpages_mapped;
@@ -338,6 +354,21 @@ do {											\
 	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd, ret, vm);		\
 })
 
+static __always_inline void static_assert_is_plane(struct kvm_plane *plane) { }
+
+#define __plane_ioctl(plane, cmd, arg)				\
+({								\
+	static_assert_is_plane(plane);				\
+	kvm_do_ioctl((plane)->fd, cmd, arg);			\
+})
+
+#define plane_ioctl(plane, cmd, arg)				\
+({								\
+	int ret = __plane_ioctl(plane, cmd, arg);		\
+								\
+	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd, ret, (plane)->vm); \
+})
+
 static __always_inline void static_assert_is_vcpu(struct kvm_vcpu *vcpu) { }
 
 #define __vcpu_ioctl(vcpu, cmd, arg)				\
@@ -353,6 +384,21 @@ static __always_inline void static_assert_is_vcpu(struct kvm_vcpu *vcpu) { }
 	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd, ret, (vcpu)->vm);	\
 })
 
+static __always_inline void static_assert_is_plane_vcpu(struct kvm_plane_vcpu *plane_vcpu) { }
+
+#define __plane_vcpu_ioctl(plane_vcpu, cmd, arg)		\
+({								\
+	static_assert_is_plane_vcpu(plane_vcpu);		\
+	kvm_do_ioctl((plane_vcpu)->fd, cmd, arg);		\
+})
+
+#define plane_vcpu_ioctl(plane_vcpu, cmd, arg)			\
+({								\
+	int ret = __plane_vcpu_ioctl(plane_vcpu, cmd, arg);	\
+								\
+	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd, ret, (plane_vcpu)->plane0->vm); \
+})
+
 /*
  * Looks up and returns the value corresponding to the capability
  * (KVM_CAP_*) given by cap.
@@ -601,6 +647,8 @@ void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags);
 void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
 void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
 struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
+struct kvm_plane *vm_plane_add(struct kvm_vm *vm, int plane_id);
+struct kvm_plane_vcpu *__vm_plane_vcpu_add(struct kvm_vcpu *vcpu, struct kvm_plane *plane);
 void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
 vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
 vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 815bc45dd8dc..a2f233945e1c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -279,6 +279,8 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	TEST_ASSERT(vm != NULL, "Insufficient Memory");
 
 	INIT_LIST_HEAD(&vm->vcpus);
+	INIT_LIST_HEAD(&vm->planes);
+	INIT_LIST_HEAD(&vm->plane_vcpus);
 	vm->regions.gpa_tree = RB_ROOT;
 	vm->regions.hva_tree = RB_ROOT;
 	hash_init(vm->regions.slot_hash);
@@ -757,10 +759,22 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 
 void kvm_vm_release(struct kvm_vm *vmp)
 {
-	struct kvm_vcpu *vcpu, *tmp;
+	struct kvm_vcpu *vcpu, *tmp_vcpu;
+	struct kvm_plane_vcpu *plane_vcpu, *tmp_plane_vcpu;
+	struct kvm_plane *plane, *tmp_plane;
 	int ret;
 
-	list_for_each_entry_safe(vcpu, tmp, &vmp->vcpus, list)
+	list_for_each_entry_safe(plane_vcpu, tmp_plane_vcpu, &vmp->plane_vcpus, list) {
+		close(plane_vcpu->fd);
+		free(plane_vcpu);
+	}
+
+	list_for_each_entry_safe(plane, tmp_plane, &vmp->planes, list) {
+		close(plane->fd);
+		free(plane);
+	}
+
+	list_for_each_entry_safe(vcpu, tmp_vcpu, &vmp->vcpus, list)
 		vm_vcpu_rm(vmp, vcpu);
 
 	ret = close(vmp->fd);
@@ -1314,6 +1328,52 @@ static bool vcpu_exists(struct kvm_vm *vm, uint32_t vcpu_id)
 	return false;
 }
 
+/*
+ * Adds a virtual CPU to the VM specified by vm with the ID given by vcpu_id.
+ * No additional vCPU setup is done.  Returns the vCPU.
+ */
+struct kvm_plane *vm_plane_add(struct kvm_vm *vm, int plane_id)
+{
+	struct kvm_plane *plane;
+
+	/* Allocate and initialize new vcpu structure. */
+	plane = calloc(1, sizeof(*plane));
+	TEST_ASSERT(plane != NULL, "Insufficient Memory");
+
+	plane->fd = __vm_ioctl(vm, KVM_CREATE_PLANE, (void *)(unsigned long)plane_id);
+	TEST_ASSERT_VM_VCPU_IOCTL(plane->fd >= 0, KVM_CREATE_PLANE, plane->fd, vm);
+	plane->vm = vm;
+	plane->id = plane_id;
+
+	/* Add to linked-list of extra-plane VCPUs. */
+	list_add(&plane->list, &vm->planes);
+
+	return plane;
+}
+
+/*
+ * Adds a virtual CPU to the VM specified by vm with the ID given by vcpu_id.
+ * No additional vCPU setup is done.  Returns the vCPU.
+ */
+struct kvm_plane_vcpu *__vm_plane_vcpu_add(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
+{
+	struct kvm_plane_vcpu *plane_vcpu;
+
+	/* Allocate and initialize new vcpu structure. */
+	plane_vcpu = calloc(1, sizeof(*plane_vcpu));
+	TEST_ASSERT(plane_vcpu != NULL, "Insufficient Memory");
+
+	plane_vcpu->fd = __plane_ioctl(plane, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
+	TEST_ASSERT_VM_VCPU_IOCTL(plane_vcpu->fd >= 0, KVM_CREATE_VCPU_PLANE, plane_vcpu->fd, plane->vm);
+	plane_vcpu->id = vcpu->id;
+	plane_vcpu->plane0 = vcpu;
+
+	/* Add to linked-list of extra-plane VCPUs. */
+	list_add(&plane_vcpu->list, &plane->vm->plane_vcpus);
+
+	return plane_vcpu;
+}
+
 /*
  * Adds a virtual CPU to the VM specified by vm with the ID given by vcpu_id.
  * No additional vCPU setup is done.  Returns the vCPU.
@@ -2021,6 +2081,7 @@ static struct exit_reason {
 	KVM_EXIT_STRING(NOTIFY),
 	KVM_EXIT_STRING(LOONGARCH_IOCSR),
 	KVM_EXIT_STRING(MEMORY_FAULT),
+	KVM_EXIT_STRING(PLANE_EVENT),
 };
 
 /*
diff --git a/tools/testing/selftests/kvm/plane_test.c b/tools/testing/selftests/kvm/plane_test.c
index 43c8de13490a..9cf3ab76b3cd 100644
--- a/tools/testing/selftests/kvm/plane_test.c
+++ b/tools/testing/selftests/kvm/plane_test.c
@@ -47,20 +47,19 @@ void test_create_plane(void)
 {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
-	int r, planefd, plane_vcpufd;
+	struct kvm_plane *plane;
+	int r;
 
 	vm = vm_create_barebones();
 	vcpu = __vm_vcpu_add(vm, 0);
 
-	planefd = __vm_ioctl(vm, KVM_CREATE_PLANE, (void *)(unsigned long)1);
-	TEST_ASSERT(planefd >= 0, "Creating new plane, got error: %d",
-		    errno);
+	plane = vm_plane_add(vm, 1);
 
-	r = ioctl(planefd, KVM_CHECK_EXTENSION, KVM_CAP_PLANES);
+	r = __plane_ioctl(plane, KVM_CHECK_EXTENSION, (void *)(unsigned long)KVM_CAP_PLANES);
 	TEST_ASSERT(r == 0,
 		    "Checking KVM_CHECK_EXTENSION(KVM_CAP_PLANES). ret: %d", r);
 
-	r = ioctl(planefd, KVM_CHECK_EXTENSION, KVM_CAP_CHECK_EXTENSION_VM);
+	r = __plane_ioctl(plane, KVM_CHECK_EXTENSION, (void *)(unsigned long)KVM_CAP_CHECK_EXTENSION_VM);
 	TEST_ASSERT(r == 1,
 		    "Checking KVM_CHECK_EXTENSION(KVM_CAP_CHECK_EXTENSION_VM). ret: %d", r);
 
@@ -69,22 +68,18 @@ void test_create_plane(void)
 		    "Creating existing plane, expecting EEXIST. ret: %d, errno: %d",
 		    r, errno);
 
-	plane_vcpufd = ioctl(planefd, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
-	TEST_ASSERT(plane_vcpufd >= 0, "Creating vCPU for plane 1, got error: %d", errno);
+	__vm_plane_vcpu_add(vcpu, plane);
 
-	r = ioctl(planefd, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
+	r = __plane_ioctl(plane, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
 	TEST_ASSERT(r == -1 && errno == EEXIST,
 		    "Creating vCPU again for plane 1. ret: %d, errno: %d",
 		    r, errno);
 
-	r = ioctl(planefd, KVM_RUN, (void *)(unsigned long)0);
+	r = __plane_ioctl(plane, KVM_RUN, (void *)(unsigned long)0);
 	TEST_ASSERT(r == -1 && errno == ENOTTY,
 		    "Running plane vCPU again for plane 1. ret: %d, errno: %d",
 		    r, errno);
 
-	close(plane_vcpufd);
-	close(planefd);
-
 	kvm_vm_free(vm);
 	ksft_test_result_pass("basic planefd and plane_vcpufd operation\n");
 }
-- 
2.49.0

