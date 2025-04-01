Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549320D4F2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523893; cv=none; b=LAsRuzi8rdThr6KSs55XG3kXiO7g2Fe8GJmlYHhCy/gQMwCcXbYPyIQumM/AlTgAfpOgfZWUVh+RLRW5M/J88EkKFpyTxKvXKJOXYS5RK1+BskkFr1NGPdsZPYgSeHTMFimTvQ4ohrDuhH1Q+FgSIH5ToHUn8t4I0fW3EbFnYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523893; c=relaxed/simple;
	bh=ZfkfOM480M1YBqKpC2/kM72sR6VmePA1K6dauSV8B3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dC9z8ohrKR2hm3FwVCiHlD2bXNAixvsRNdPzyHBDjNE0CV5J6pCC9gMOfEqDhCYz8BwCABN7wCeDg7AkI9wQHITVL/xlBn4//fLlEB6mVggFflUIYJuqp3fdYR10JPg9RA0Z0RacHNnpFAJIf5s4XDHroRXIvfGJ0mlTVc0SgO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7QbLDvG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7QbLDvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KsKBW7BEHbNNA2EQflKemABN/u2ulObIcmH48WXDJ8s=;
	b=T7QbLDvGMwg8nESFawk9kYozEVXVPArJoRXUQfXRNPfb0X7R2I6gDB5qUnOBS+u1HUziPp
	rHKiNZ5BnvMppSh86Ht5A6+XVyr1KsOLQSFb/i/0Xr2qcwJrsFvKcW4j2kt9jWHNgAPKiJ
	ew98ApazTF3fin8qehlWIzvhh1jHeWQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-jmiAbRM3MyuUNgN_LlSP9g-1; Tue, 01 Apr 2025 12:11:29 -0400
X-MC-Unique: jmiAbRM3MyuUNgN_LlSP9g-1
X-Mimecast-MFC-AGG-ID: jmiAbRM3MyuUNgN_LlSP9g_1743523888
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so40935915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523887; x=1744128687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsKBW7BEHbNNA2EQflKemABN/u2ulObIcmH48WXDJ8s=;
        b=tnpGB4fINEJadzVZQ9rytUWO14CqT0jqGomcbscpy/+381XG2vCFIBaRx6GA8CXwRp
         a18XiKk2OkLJyjVp+A6ibPRDEYDRA6TYgBdnUyIT9GEY4svhigzWoSyenvXIcjzakR3x
         OxfJKfVKYKBjLcXMWHNWLO58LlWnnIo/3dw52tZiZUpQ8K5l8BJNRjF6ZTai2AC8m4xS
         y6XQmAz4o1ysSWHLnwx83HyzX0Cd8Z7fC4nz3j7qAKZV4l0T4Z+tWKCrfEFfZCoW5V9o
         KuxoRaz2HIOBMv7U3LjMvC7QOcIXep9q1hM2L+xvQbTWlhE6bG0+D9ULnXbEI8wH18+D
         fxlg==
X-Gm-Message-State: AOJu0YzUneLDkgyzqkqEFPnlEPHspnXc6Oysd540/QdLPYRCW1duj/x4
	91qq6R6KSH1GxAA0foKYMCIRaLwnHtYeXz+XpyokyRkVvcFVLnvOaUj+aPqC7+ZMNFSe2zQNF0v
	rIR8C6e2eHSHGtrm8brlh/qW/iTij85JevVGAnTst5+6aKwE6GNYSaV4SDRElNhbaJY4377Vce4
	dUzefyAgW5a7us5e7KXxWt0yY0UewBeeB2v0C06nFSxYuBpQ==
X-Gm-Gg: ASbGncvt+AwEmLQqqn4+PmcsiDIhf1q5ilk7AB3t17whRZoG/GtPYSg/ORYWgzdKm3G
	8PgrMLw4LrDDjhp7By+yijkhFwS5ZfCxF9vlckg9jwZKUfnWbXemm+62TOHoboE6I66vWArJw/Y
	cvngnnMuQm6EhaIuKDov+k9v6TmqRzq7V276eL6jwbAbxXEy/P/hSV1c2Uq6hCieoJwiQatA3cG
	90DOrQruSa3klEWYtz5Hf/3XawKL7ROA4SZmlbTjkWZsHnkH4pElVBNNpg8yOdB9b4NGM6qzVyy
	TCObO3khsmG3LOEwKQLPwg==
X-Received: by 2002:a05:6000:2410:b0:39c:142a:35f9 with SMTP id ffacd0b85a97d-39c142a35famr11329201f8f.10.1743523887505;
        Tue, 01 Apr 2025 09:11:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUBBONFMxXubuB0rFZnmFR8I8IBPlykXIOGysFwqjq21RAjnf88FJ3fTcF64SWlqgmRjwgcw==
X-Received: by 2002:a05:6000:2410:b0:39c:142a:35f9 with SMTP id ffacd0b85a97d-39c142a35famr11329136f8f.10.1743523887070;
        Tue, 01 Apr 2025 09:11:27 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a9d2sm14476457f8f.43.2025.04.01.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:25 -0700 (PDT)
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
Subject: [PATCH 07/29] KVM: do not use online_vcpus to test vCPU validity
Date: Tue,  1 Apr 2025 18:10:44 +0200
Message-ID: <20250401161106.790710-8-pbonzini@redhat.com>
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

Different planes can initialize their vCPUs separately, therefore there is
no single online_vcpus value that can be used to test that a vCPU has
indeed been fully initialized.

Use the shiny new plane field instead, initializing it to an invalid value
(-1) while the vCPU is visible in the xarray but may still disappear if
the creation fails.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/i8254.c     |  3 ++-
 include/linux/kvm_host.h | 23 ++++++-----------------
 virt/kvm/kvm_main.c      | 20 +++++++++++++-------
 3 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index d7ab8780ab9e..e3a3e7b90c26 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -260,9 +260,10 @@ static void pit_do_work(struct kthread_work *work)
 	 * VCPUs and only when LVT0 is in NMI mode.  The interrupt can
 	 * also be simultaneously delivered through PIC and IOAPIC.
 	 */
-	if (atomic_read(&kvm->arch.vapics_in_nmi_mode) > 0)
+	if (atomic_read(&kvm->arch.vapics_in_nmi_mode) > 0) {
 		kvm_for_each_vcpu(i, vcpu, kvm)
 			kvm_apic_nmi_wd_deliver(vcpu);
+	}
 }
 
 static enum hrtimer_restart pit_timer_fn(struct hrtimer *data)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4d408d1d5ccc..0db27814294f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -992,27 +992,16 @@ static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 
 static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
 {
-	int num_vcpus = atomic_read(&kvm->online_vcpus);
-
-	/*
-	 * Explicitly verify the target vCPU is online, as the anti-speculation
-	 * logic only limits the CPU's ability to speculate, e.g. given a "bad"
-	 * index, clamping the index to 0 would return vCPU0, not NULL.
-	 */
-	if (i >= num_vcpus)
+	struct kvm_vcpu *vcpu = xa_load(&kvm->vcpu_array, i);
+	if (vcpu && unlikely(vcpu->plane == -1))
 		return NULL;
 
-	i = array_index_nospec(i, num_vcpus);
-
-	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
-	smp_rmb();
-	return xa_load(&kvm->vcpu_array, i);
+	return vcpu;
 }
 
-#define kvm_for_each_vcpu(idx, vcpup, kvm)				\
-	if (atomic_read(&kvm->online_vcpus))				\
-		xa_for_each_range(&kvm->vcpu_array, idx, vcpup, 0,	\
-				  (atomic_read(&kvm->online_vcpus) - 1))
+#define kvm_for_each_vcpu(idx, vcpup, kvm)			\
+	xa_for_each(&kvm->vcpu_array, idx, vcpup)		\
+		if ((vcpup)->plane == -1) ; else		\
 
 static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e343905e46d8..eba02cb7cc57 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4186,6 +4186,11 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 		goto unlock_vcpu_destroy;
 	}
 
+	/*
+	 * Store an invalid plane number until fully initialized.  xa_insert() has
+	 * release semantics, which ensures the write is visible to kvm_get_vcpu().
+	 */
+	vcpu->plane = -1;
 	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
 	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
 	WARN_ON_ONCE(r == -EBUSY);
@@ -4195,7 +4200,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	/*
 	 * Now it's all set up, let userspace reach it.  Grab the vCPU's mutex
 	 * so that userspace can't invoke vCPU ioctl()s until the vCPU is fully
-	 * visible (per online_vcpus), e.g. so that KVM doesn't get tricked
+	 * visible (valid vcpu->plane), e.g. so that KVM doesn't get tricked
 	 * into a NULL-pointer dereference because KVM thinks the _current_
 	 * vCPU doesn't exist.  As a bonus, taking vcpu->mutex ensures lockdep
 	 * knows it's taken *inside* kvm->lock.
@@ -4206,12 +4211,13 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	if (r < 0)
 		goto kvm_put_xa_erase;
 
-	/*
-	 * Pairs with smp_rmb() in kvm_get_vcpu.  Store the vcpu
-	 * pointer before kvm->online_vcpu's incremented value.
-	 */
-	smp_wmb();
 	atomic_inc(&kvm->online_vcpus);
+
+	/*
+	 * Pairs with xa_load() in kvm_get_vcpu, ensuring that online_vcpus
+	 * is updated before vcpu->plane.
+	 */
+	smp_store_release(&vcpu->plane, 0);
 	mutex_unlock(&vcpu->mutex);
 
 	mutex_unlock(&kvm->lock);
@@ -4355,7 +4361,7 @@ static int kvm_wait_for_vcpu_online(struct kvm_vcpu *vcpu)
 	 * In practice, this happy path will always be taken, as a well-behaved
 	 * VMM will never invoke a vCPU ioctl() before KVM_CREATE_VCPU returns.
 	 */
-	if (likely(vcpu->vcpu_idx < atomic_read(&kvm->online_vcpus)))
+	if (likely(vcpu->plane != -1))
 		return 0;
 
 	/*
-- 
2.49.0

