Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9E421CC51
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523909; cv=none; b=InaxPGzCXwMxySuErM4KgpAYlnfXA61meqTvkX216ThHQabSAPmvdpurAUwbG4bz6WtDIHZI+iqzvmXnFl5ZOuYUCNVTEicCy5+UOTRIBDYcchMUbmPCgg29F6vJRDlJ9fN/AdNQr+3DGwj+sLXWliEH+2SRFCbhtgao0jiJ6QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523909; c=relaxed/simple;
	bh=xknqBKrnf/cRf6MzXxubS95UH7TntUJgejhgAFT3r9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm1MhXc51k5s/shbSYKTvlppQH+PmmglC5UzYcaB10SiujsT9ZaRvbkFYM0jTLQ5Q6Pj8N5AIqUTGx1SE/C5ZQhE2AzekutqYAP/k+YlydWVGzaKOI2PCZ/n6E91CbTW/nnnFBISP94YqLlemfyx/7eV4NsZvB+4QRfTqCuEoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Aa1MsJjz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Aa1MsJjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cF+qO0yatMZdwcKNEFIrHdbvxZj7acs2e7VdEaArYVg=;
	b=Aa1MsJjzyG6ZkQS9cDWbySFS0KVmwSAoWjMcqhpg2GRj2O9PNdvrK+CcYW7qOQ/CEqEQ2B
	TnMxpf3jKhppqGckGXLs/0TWwCE61gjEgZTgz0QiJQwVHzOD2IBNrFK7IFl9/OzE/+bJWd
	1KrSU4f+bdSgfTe4arti90NPcsM6hZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-5dEkrn1uM2OS_DE-EgoDHw-1; Tue, 01 Apr 2025 12:11:44 -0400
X-MC-Unique: 5dEkrn1uM2OS_DE-EgoDHw-1
X-Mimecast-MFC-AGG-ID: 5dEkrn1uM2OS_DE-EgoDHw_1743523904
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so35535095e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523903; x=1744128703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF+qO0yatMZdwcKNEFIrHdbvxZj7acs2e7VdEaArYVg=;
        b=heLE86cVLjYSxgbjXWNNTv8GA6YpoeuSxToOZUDl8WBjr050TEPXuA8hcm7tycBINE
         lZPCMYyk5WZl4+A1s8QTHcU9yNjCQwSKCcEY4qJl026fbycLcEY/eXERv7UrcEU0qp+9
         RY6WYU5sDhMP987lDPDBMsjb6yEmo7vfOE3SUJmJXL7eps+tj/L/uTmk8SWYbEKQT3bC
         MNfvrI8nwspgIjRdelfIFQESWudB7XquFrIzzeKM4v5UzqRCF0raCVhEYelFK0M9QaQ3
         ny1iOLrB7WOkxgUX5IgHZQIQ0hk7XNmdJjxgYraMxzyYMEJTho/pkVJZ3owCo/MZ2ASz
         Wk1A==
X-Gm-Message-State: AOJu0Yzlp2/Y7JKChrOmsFLI9DrvCh4Xbs6nST/IqOEQHHlvEFNgibKZ
	tb+AQsLlKXp9Jd5ydtsdYejA42wTdPxW3fxcunu1ixbwSu9KtOkDZ9aPQgHMBQRl8p2/fqrpQBL
	6cgFFpw3USzTHrHs0gD8epAx1Xu3OPQkPB1jmjtz2Qd7YWanRN9wFP4G56a0JELtU/Ij/8sjxp2
	MphFyEomwOdV+r+uLbUpvCRJ2hs9LPsgMmiC07wEaP3QyoKA==
X-Gm-Gg: ASbGnctGJS7D7QKCwHuu0ZbGAWf+UOHd7932lbfHXZ55VoTUzWhv2m0rLyh5ibtmwjW
	kQE/rZnr1KlDbfvCL08P/zO8xVQzbO7cnvMoLAttRBn4rrU7XQ0UoRJGRPOctzAmFLZ9+s9UCmt
	e1zR6h5kJYLEimKoUNyN4Vp2Cz9H7Qj+HbyOonmweq+z4vsMpoJfqPlUQJsaYKXKARpluAvb8le
	AlvUSuPCJi0FconBqkgu0omJT2qk2onR0XSypwJANb6GLiVlQZuEsEKnfpcUdb1f3x45aqvgjzj
	8aWklAIqNwJRIuP+sFDTyg==
X-Received: by 2002:a05:6000:2b03:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39c121188demr8496028f8f.36.1743523902938;
        Tue, 01 Apr 2025 09:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqJ3rJ6+IP5QCotzUgeA4XjgsMo38RrmP0uvZCP5poVx+NlUkpMpatJ7KifS+nAPHv2myHRg==
X-Received: by 2002:a05:6000:2b03:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39c121188demr8495987f8f.36.1743523902498;
        Tue, 01 Apr 2025 09:11:42 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0dcsm14597487f8f.64.2025.04.01.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:38 -0700 (PDT)
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
Subject: [PATCH 12/29] KVM: share dirty ring for same vCPU id on different planes
Date: Tue,  1 Apr 2025 18:10:49 +0200
Message-ID: <20250401161106.790710-13-pbonzini@redhat.com>
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

The dirty page ring is read by mmap()-ing the vCPU file descriptor,
which is only possible for plane 0.  This is not a problem because it
is only filled by KVM_RUN which takes the plane-0 vCPU mutex, and it is
therefore possible to share it for vCPUs that have the same id but are
on different planes.  (TODO: double check).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/kvm_host.h |  6 ++++--
 virt/kvm/dirty_ring.c    |  5 +++--
 virt/kvm/kvm_main.c      | 10 +++++-----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d2e0c0e8ff17..b511aed2de8e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -394,9 +394,11 @@ struct kvm_vcpu {
 	bool scheduled_out;
 	struct kvm_vcpu_arch arch;
 	struct kvm_vcpu_stat *stat;
-	struct kvm_vcpu_stat __stat;
 	char stats_id[KVM_STATS_NAME_SIZE];
-	struct kvm_dirty_ring dirty_ring;
+	struct kvm_dirty_ring *dirty_ring;
+
+	struct kvm_vcpu_stat __stat;
+	struct kvm_dirty_ring __dirty_ring;
 
 	/*
 	 * The most recently used memslot by this vCPU and the slots generation
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index d14ffc7513ee..66e6a6a67d13 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -172,11 +172,12 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring)
 
 void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset)
 {
-	struct kvm_dirty_ring *ring = &vcpu->dirty_ring;
+	struct kvm_dirty_ring *ring = vcpu->dirty_ring;
 	struct kvm_dirty_gfn *entry;
 
 	/* It should never get full */
 	WARN_ON_ONCE(kvm_dirty_ring_full(ring));
+	lockdep_assert_held(&vcpu->plane0->mutex);
 
 	entry = &ring->dirty_gfns[ring->dirty_index & (ring->size - 1)];
 
@@ -204,7 +205,7 @@ bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
 	 * the dirty ring is reset by userspace.
 	 */
 	if (kvm_check_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu) &&
-	    kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
+	    kvm_dirty_ring_soft_full(vcpu->dirty_ring)) {
 		kvm_make_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu);
 		vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
 		trace_kvm_dirty_ring_exit(vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4c7e379fbf7d..863fd80ddfbe 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -466,7 +466,7 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
 	kvm_arch_vcpu_destroy(vcpu);
-	kvm_dirty_ring_free(&vcpu->dirty_ring);
+	kvm_dirty_ring_free(vcpu->dirty_ring);
 
 	/*
 	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
@@ -4038,7 +4038,7 @@ static vm_fault_t kvm_vcpu_fault(struct vm_fault *vmf)
 #endif
 	else if (kvm_page_in_dirty_ring(vcpu->kvm, vmf->pgoff))
 		page = kvm_dirty_ring_get_page(
-		    &vcpu->dirty_ring,
+		    vcpu->dirty_ring,
 		    vmf->pgoff - KVM_DIRTY_LOG_PAGE_OFFSET);
 	else
 		return kvm_arch_vcpu_fault(vcpu, vmf);
@@ -4174,7 +4174,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	vcpu->run = page_address(page);
 
 	if (kvm->dirty_ring_size) {
-		r = kvm_dirty_ring_alloc(kvm, &vcpu->dirty_ring,
+		r = kvm_dirty_ring_alloc(kvm, &vcpu->__dirty_ring,
 					 id, kvm->dirty_ring_size);
 		if (r)
 			goto vcpu_free_run_page;
@@ -4242,7 +4242,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	mutex_unlock(&kvm->lock);
 	kvm_arch_vcpu_destroy(vcpu);
 vcpu_free_dirty_ring:
-	kvm_dirty_ring_free(&vcpu->dirty_ring);
+	kvm_dirty_ring_free(&vcpu->__dirty_ring);
 vcpu_free_run_page:
 	free_page((unsigned long)vcpu->run);
 vcpu_free:
@@ -5047,7 +5047,7 @@ static int kvm_vm_ioctl_reset_dirty_pages(struct kvm *kvm)
 	mutex_lock(&kvm->slots_lock);
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
-		cleared += kvm_dirty_ring_reset(vcpu->kvm, &vcpu->dirty_ring);
+		cleared += kvm_dirty_ring_reset(vcpu->kvm, vcpu->dirty_ring);
 
 	mutex_unlock(&kvm->slots_lock);
 
-- 
2.49.0

