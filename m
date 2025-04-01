Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17115223302
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523941; cv=none; b=CkEyMYcAWVFzhweXPTBApcN8DjYKWYmLqpXuarRD0+MuqwwmimVFDA4Kp6EbN8wQorPMh6inAFahwmGuUigPoH3vJAhY582ZJ2EbKkzu6E9HpogrO0ZQrNB8U1tm0yiQ8MXKMdgr97iAqLbl4vVZc6RvHAWkMNxYzJ3ZKXMkRF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523941; c=relaxed/simple;
	bh=RqolX2nBYsBB1RvK+C0gqm089aXRe/tRZbLNpfcHISU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZkAU/AYqGJIqG6ORFQlMoSpDb4EclhW32WNaQwHVOlQPZnDQe5MKOBtd212phAPKK9SRTauO1uei16lVM3oVxlKaFz7lgaQq2yTWTTiIySCei7qW37UumM0rqyq0FTb2DumOYQ81sidXTeijwrAzjH+E/4UoNkpcVr2ic6qSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dc2W41nH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dc2W41nH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yWeFqVMRebyIXvHSXUhfNNjcs9eft8Ib/p8yK7977Q=;
	b=Dc2W41nHSEpM3R/JcFIqM/Fudz3NBvc1pZmdk4NJ40Ytb8NWD1x/IpCGZjYg6PMttHVRbo
	y+4AjwUXsZbmoUK/Kvkxw/yEQLXeptGKkFCOC3G2z0Q3iRJ6EDoDGH2ttYxqs0QtIYrigD
	C4q4ehB5fRYLucn7mxKiXxGDfIj1XA4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-bhNLah-jNseIdseRh-r5vQ-1; Tue, 01 Apr 2025 12:12:17 -0400
X-MC-Unique: bhNLah-jNseIdseRh-r5vQ-1
X-Mimecast-MFC-AGG-ID: bhNLah-jNseIdseRh-r5vQ_1743523936
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-391425471d6so2541278f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523935; x=1744128735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yWeFqVMRebyIXvHSXUhfNNjcs9eft8Ib/p8yK7977Q=;
        b=rb6X7wB5Bxw3xFYeF1FxklGtfm6ju7T78bgnbUYsTK2Li/v17+6jPvoUUnc9VVIkAA
         59hmsSGmUsVfuav6cuFVDzEdUfxRs5cOFOj/ThOc08NffdydxAL11l8R9lvzo8vzfpTf
         J8McSLbqGHQQJkIzGk4RfSm8Msl9/oWnjmle4RWD7wkFn54K76h9f4n/g6cfsUQU0bpk
         7VpnC2WXHZ0MyG+YzKGp0g7KAQhIxS4kPxyRRqQvNZhnLC3J1+Hh1aRpKJ875+sWTBhf
         ltgETaxjKSXGsxttk27KLcrDElFLRT1VkVsZ/TEufEmHlX3z7Vf142kaAgYp05Q+IaT6
         h6zw==
X-Gm-Message-State: AOJu0YwnH3/ZApbiZsKoYemu1N5GK71khxrTHfZvMPQNEQm/B0u9kozc
	jiPfwWv/mDKW4gbaNqe4F6Sp/rlv7hDDP1rksGrDkoFYscSMzT1KAlpZijfCBVFpSk3X83mNqZQ
	wt/jM/M8/A9VztR2uwa624ZKVvTclG4XIb97t+JieEpPSOLQ1RH9NAJLpz3G4tzsZgZU3r/MSb2
	q2w5JzFhmpyinDuH+FYtDvEfT9xLYWFGek2qrDKNIs8gBncQ==
X-Gm-Gg: ASbGncuPHtXqifKhFrL95a6WekBV6mkrne70GUfR11iCBNxFCdRE3XBkGHsYRuXgyov
	tuyz/ZChJU/4fdK2xme+wMKyWJfh5NxKINAnfq4IU1s4oVEJOTRSVQLdbtZIrxN3FnkDWYhiin2
	jw3OStwfZnggAquMOBaPq+ZEn/8Ga04xdYLi9p8n4MBa2SlfI2eyJV1LXEUyAk6tvNYX2CoVDxC
	gSG5sYIG3OBIXoNcWlt0QrGlds0rclAuikSheveOgQS/yj0q4eEyn08qnHEHFMpAGf/ipHWbcaI
	hNASqc58BV9h5yxWhdNZOw==
X-Received: by 2002:a5d:584c:0:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39c1211394bmr11532851f8f.36.1743523935379;
        Tue, 01 Apr 2025 09:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdiNekii4PSYbxjvDp66z82YdwPHoAMXYlQUesXdMmLvzhLibRLalKupSShxNYAuhAEstwpw==
X-Received: by 2002:a5d:584c:0:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39c1211394bmr11532793f8f.36.1743523934852;
        Tue, 01 Apr 2025 09:12:14 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d900008d8sm158223435e9.33.2025.04.01.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:12:13 -0700 (PDT)
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
Subject: [PATCH 24/29] KVM: x86: initialize CPUID for non-default planes
Date: Tue,  1 Apr 2025 18:11:01 +0200
Message-ID: <20250401161106.790710-25-pbonzini@redhat.com>
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

Copy the initial CPUID from plane 0.  To avoid mismatches, block
KVM_SET_CPUID{,2} after KVM_CREATE_VCPU_PLANE similar to how it is
blocked after KVM_RUN; this is handled by a tiny bit of architecture
independent code.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst |  4 +++-
 arch/x86/kvm/cpuid.c           | 19 ++++++++++++++++++-
 arch/x86/kvm/cpuid.h           |  1 +
 arch/x86/kvm/x86.c             |  7 ++++++-
 include/linux/kvm_host.h       |  1 +
 virt/kvm/kvm_main.c            |  1 +
 6 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 16d836b954dc..3739d16b7164 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -736,7 +736,9 @@ Caveat emptor:
     configuration (if there is) is not corrupted. Userspace can get a copy
     of the resulting CPUID configuration through KVM_GET_CPUID2 in case.
   - Using KVM_SET_CPUID{,2} after KVM_RUN, i.e. changing the guest vCPU model
-    after running the guest, may cause guest instability.
+    after running the guest, is forbidden; so is using the ioctls after
+    KVM_CREATE_VCPU_PLANE, because all planes must have the same CPU
+    capabilities.
   - Using heterogeneous CPUID configurations, modulo APIC IDs, topology, etc...
     may cause guest instability.
 
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 142decb3a736..44e6d4989bdd 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -545,7 +545,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	 * KVM_SET_CPUID{,2} again. To support this legacy behavior, check
 	 * whether the supplied CPUID data is equal to what's already set.
 	 */
-	if (kvm_vcpu_has_run(vcpu)) {
+	if (kvm_vcpu_has_run(vcpu) || vcpu->has_planes) {
 		r = kvm_cpuid_check_equal(vcpu, e2, nent);
 		if (r)
 			goto err;
@@ -567,6 +567,23 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	return r;
 }
 
+int kvm_dup_cpuid(struct kvm_vcpu *vcpu, struct kvm_vcpu *source)
+{
+	if (WARN_ON_ONCE(vcpu->arch.cpuid_entries || vcpu->arch.cpuid_nent))
+		return -EEXIST;
+
+	vcpu->arch.cpuid_entries = kmemdup(source->arch.cpuid_entries,
+		     source->arch.cpuid_nent * sizeof(struct kvm_cpuid_entry2),
+		     GFP_KERNEL_ACCOUNT);
+	if (!vcpu->arch.cpuid_entries)
+		return -ENOMEM;
+
+	memcpy(vcpu->arch.cpu_caps, source->arch.cpu_caps, sizeof(source->arch.cpu_caps));
+	vcpu->arch.cpuid_nent = source->arch.cpuid_nent;
+
+	return 0;
+}
+
 /* when an old userspace process fills a new kernel module */
 int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
 			     struct kvm_cpuid *cpuid,
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 05cc1245f570..a5983c635a70 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -42,6 +42,7 @@ static inline struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcp
 int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
 			    struct kvm_cpuid_entry2 __user *entries,
 			    unsigned int type);
+int kvm_dup_cpuid(struct kvm_vcpu *vcpu, struct kvm_vcpu *source);
 int kvm_post_set_cpuid(struct kvm_vcpu *vcpu);
 int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
 			     struct kvm_cpuid *cpuid,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d2b43d9b6543..be4d7b97367b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12412,6 +12412,11 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 	if (plane->plane) {
 		page = NULL;
 		vcpu->arch.pio_data = vcpu->plane0->arch.pio_data;
+		r = kvm_dup_cpuid(vcpu, vcpu->plane0);
+		if (r < 0)
+			goto fail_free_lapic;
+
+		r = -ENOMEM;
 	} else {
 		page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
 		if (!page)
@@ -12459,7 +12464,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 
 	kvm_xen_init_vcpu(vcpu);
 	vcpu_load(vcpu);
-	kvm_vcpu_after_set_cpuid(vcpu);
+	WARN_ON_ONCE(kvm_post_set_cpuid(vcpu));
 	kvm_set_tsc_khz(vcpu, vcpu->kvm->arch.default_tsc_khz);
 	kvm_vcpu_reset(vcpu, false);
 	kvm_init_mmu(vcpu);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5cade1c04646..0b764951f461 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -344,6 +344,7 @@ struct kvm_vcpu {
 	struct mutex mutex;
 
 	/* Only valid on plane 0 */
+	bool has_planes;
 	bool wants_to_run;
 
 	/* Shared for all planes */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index db38894f6fa3..3a04fdf0865d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4182,6 +4182,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm_plane *plane, struct kvm_vcpu *pl
 	if (plane->plane) {
 		page = NULL;
 		vcpu->run = plane0_vcpu->run;
+		plane0_vcpu->has_planes = true;
 	} else {
 		WARN_ON(plane0_vcpu != NULL);
 		plane0_vcpu = vcpu;
-- 
2.49.0

