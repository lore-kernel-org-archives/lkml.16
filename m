Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236E26A0D5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562063; cv=none; b=XYf+KiXgW6cFS4v277c58egl47x4oDtMG5lAx8nx5pJLEBtNLh18H+gM5UIv2/uQ4s3wgpLf46Y08VeoIsEntuSa61tNBsn54SC5aAH5v2lHm6h86/mHXzvb+6xfGFKQq35BMaGK4cvcoKwGJ6q4RSkfUSApGDAsA1xiXZiJLzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562063; c=relaxed/simple;
	bh=ZFb/3lAGC1g8Y2bFOP1ommZzO1+zHR4brXHCUWjaq1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oXszUVUFXa/YkEZRheK9tmI47jorKynkpKtxj1aPMy9g+9LNkYuHTAjJMyT+ApRdoWw5a1DkQUx/HCaUsgZO36Fv/Y/EjyFp8eQT4AIspnOOAYCi4AAAguLGr40qy3XIxu1sC9K5VggsBmvup/2fi1gGS3aE7ExKImPBn5b2/fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eopGam8G; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eopGam8G"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso955974a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562060; x=1749166860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3a1J0Ub7xM1RZ2MIP5yy6ba1P/0GmNR80DgJ0Et9T+s=;
        b=eopGam8Gu0WO+bBPAdCvCJhAKOZ7ZvX7ovWarAPFqmHMR8WJFaYOTGasFnliISDxmV
         DuHs1v5TNoGsyxG/EEN/q+NsTEHP93vdPR54SPG+GI33pfMMPm8eYHLmJAJBpTRIKBDa
         3oVDt+DTl0XfINyYfpQuCTHjG6m74KeFFy2fqVFSLZ1So2mI8vHQ6bTzwtjeY5n88DQ5
         /wc6vdLa+0bGFr6PMWjbN4I0+OEmaalToX2tmXWu+NE65cTnDV3WImHvZGu1bk7AlunL
         XMBIihQllwH8/xlumiDj3iJ+PGyOM3Jj8jh/InlXESaUdOYLd7sIeP5A2eLNmzMmo/Jq
         PvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562060; x=1749166860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3a1J0Ub7xM1RZ2MIP5yy6ba1P/0GmNR80DgJ0Et9T+s=;
        b=VUNzA31VDCVWdOr4aW0SMwfMVVKrWz7blvJ569vunMnX/al7VObwxY47QoD9Gg0V26
         XU7V+fu8yJgLCdwdSBI9LtxL1ttQRGBFeEzk/tPLfxArSIMc7ohyhDzrVjoWhnB/h8VK
         j+NGeGD/0hwHAMgE49itg+G5zvYrJIG2GziWW1JH1XVc6phBgs6m/YEajHRoVUU+zw8I
         Ybsyh1bbouAtJorPL5ZwIYI+KDzmvt9TfID25ZVzyppAzWOiWoJT1hkUAsDvZfDSi5bB
         GBv9lBle5jPY6n1/1N6USFND20r8JR0lm80ocSnsrlrJwndjSv9qFzFdSHEd6hBOAKPV
         nOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1doK2V5C5TAbpemGQ43euHOrGvVb8NFtx49E5HslFkcYzlO+OD2sBx4CXr8ULbQI+GnpsvWh0zqNx8B8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8GByje6D78WcEdtPD5XubjDtKiaI19u4qVsNVRsWU5Nse+OjW
	Lu0nvxJz0huBf8HwJRJt2Y7Mvd7zk5FxHVmFIhkbuSOfoqccZeUdq6v/xukKzViid6HOXwUdWAA
	Ir8g+gw==
X-Google-Smtp-Source: AGHT+IEP4RsRolE3up+NH8Y9OpUWlzlFJ2wXS8wR9Fo5TGNprPoAZ7Tc/4cyp0Tv0pwH5QbDGJMGN1zZzrA=
X-Received: from pjbsi6.prod.google.com ([2002:a17:90b:5286:b0:311:6040:2c7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1946:b0:235:2799:640
 with SMTP id d9443c01a7336-235396ac9afmr423775ad.25.1748562059798; Thu, 29
 May 2025 16:40:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:10 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-26-seanjc@google.com>
Subject: [PATCH 25/28] KVM: nSVM: Access MSRPM in 4-byte chunks only for
 merging L0 and L1 bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Access the MSRPM using u32/4-byte chunks (and appropriately adjusted
offsets) only when merging L0 and L1 bitmaps as part of emulating VMRUN.
The only reason to batch accesses to MSRPMs is to avoid the overhead of
uaccess operations (e.g. STAC/CLAC and bounds checks) when reading L1's
bitmap pointed at by vmcb12.  For all other uses, either per-bit accesses
are more than fast enough (no uaccess), or KVM is only accessing a single
bit (nested_svm_exit_handled_msr()) and so there's nothing to batch.

In addition to (hopefully) documenting the uniqueness of the merging code,
restricting chunked access to _just_ the merging code will allow for
increasing the chunk size (to unsigned long) with minimal risk.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 50 ++++++++++++++++-----------------------
 arch/x86/kvm/svm/svm.h    | 18 ++++++++++----
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index e07e10fb52a5..a4e98ada732b 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -187,31 +187,19 @@ void recalc_intercepts(struct vcpu_svm *svm)
 static int nested_svm_msrpm_merge_offsets[6] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 
-static const u32 msrpm_ranges[] = {
-	SVM_MSRPM_RANGE_0_BASE_MSR,
-	SVM_MSRPM_RANGE_1_BASE_MSR,
-	SVM_MSRPM_RANGE_2_BASE_MSR
-};
+#define SVM_BUILD_MSR_BYTE_NR_CASE(range_nr, msr)				\
+	case SVM_MSRPM_FIRST_MSR(range_nr) ... SVM_MSRPM_LAST_MSR(range_nr):	\
+		return SVM_MSRPM_BYTE_NR(range_nr, msr);
 
 static u32 svm_msrpm_offset(u32 msr)
 {
-	u32 offset;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(msrpm_ranges); i++) {
-		if (msr < msrpm_ranges[i] ||
-		    msr >= msrpm_ranges[i] + SVM_MSRS_PER_RANGE)
-			continue;
-
-		offset  = (msr - msrpm_ranges[i]) / SVM_MSRS_PER_BYTE;
-		offset += (i * SVM_MSRPM_BYTES_PER_RANGE);  /* add range offset */
-
-		/* Now we have the u8 offset - but need the u32 offset */
-		return offset / 4;
+	switch (msr) {
+	SVM_BUILD_MSR_BYTE_NR_CASE(0, msr)
+	SVM_BUILD_MSR_BYTE_NR_CASE(1, msr)
+	SVM_BUILD_MSR_BYTE_NR_CASE(2, msr)
+	default:
+		return MSR_INVALID;
 	}
-
-	/* MSR not in any range */
-	return MSR_INVALID;
 }
 
 int __init nested_svm_init_msrpm_merge_offsets(void)
@@ -245,6 +233,12 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 		if (WARN_ON(offset == MSR_INVALID))
 			return -EIO;
 
+		/*
+		 * Merging is done in 32-bit chunks to reduce the number of
+		 * accesses to L1's bitmap.
+		 */
+		offset /= sizeof(u32);
+
 		for (j = 0; j < nested_svm_nr_msrpm_merge_offsets; j++) {
 			if (nested_svm_msrpm_merge_offsets[j] == offset)
 				break;
@@ -1363,8 +1357,9 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
 
 static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
 {
-	u32 offset, msr, value;
-	int write, mask;
+	u32 offset, msr;
+	int write;
+	u8 value;
 
 	if (!(vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_MSR_PROT)))
 		return NESTED_EXIT_HOST;
@@ -1372,18 +1367,15 @@ static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
 	msr    = svm->vcpu.arch.regs[VCPU_REGS_RCX];
 	offset = svm_msrpm_offset(msr);
 	write  = svm->vmcb->control.exit_info_1 & 1;
-	mask   = 1 << ((2 * (msr & 0xf)) + write);
 
 	if (offset == MSR_INVALID)
 		return NESTED_EXIT_DONE;
 
-	/* Offset is in 32 bit units but need in 8 bit units */
-	offset *= 4;
-
-	if (kvm_vcpu_read_guest(&svm->vcpu, svm->nested.ctl.msrpm_base_pa + offset, &value, 4))
+	if (kvm_vcpu_read_guest(&svm->vcpu, svm->nested.ctl.msrpm_base_pa + offset,
+				&value, sizeof(value)))
 		return NESTED_EXIT_DONE;
 
-	return (value & mask) ? NESTED_EXIT_DONE : NESTED_EXIT_HOST;
+	return (value & BIT(write)) ? NESTED_EXIT_DONE : NESTED_EXIT_HOST;
 }
 
 static int nested_svm_intercept_ioio(struct vcpu_svm *svm)
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 77287c870967..155b6089fcd2 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -634,15 +634,23 @@ static_assert(SVM_MSRS_PER_RANGE == 8192);
 	(range_nr * SVM_MSRPM_BYTES_PER_RANGE * BITS_PER_BYTE +			\
 	 (msr - SVM_MSRPM_RANGE_## range_nr ##_BASE_MSR) * SVM_BITS_PER_MSR)
 
-#define SVM_MSRPM_SANITY_CHECK_BITS(range_nr)					\
+#define SVM_MSRPM_BYTE_NR(range_nr, msr)					\
+	(range_nr * SVM_MSRPM_BYTES_PER_RANGE +					\
+	 (msr - SVM_MSRPM_RANGE_## range_nr ##_BASE_MSR) / SVM_MSRS_PER_BYTE)
+
+#define SVM_MSRPM_SANITY_CHECK_BITS_AND_BYTES(range_nr)				\
 static_assert(SVM_MSRPM_BIT_NR(range_nr, SVM_MSRPM_FIRST_MSR(range_nr) + 1) ==	\
 	      range_nr * 2048 * 8 + 2);						\
 static_assert(SVM_MSRPM_BIT_NR(range_nr, SVM_MSRPM_FIRST_MSR(range_nr) + 7) ==	\
-	      range_nr * 2048 * 8 + 14);
+	      range_nr * 2048 * 8 + 14);					\
+static_assert(SVM_MSRPM_BYTE_NR(range_nr, SVM_MSRPM_FIRST_MSR(range_nr) + 1) ==	\
+	      range_nr * 2048);							\
+static_assert(SVM_MSRPM_BYTE_NR(range_nr, SVM_MSRPM_FIRST_MSR(range_nr) + 7) ==	\
+	      range_nr * 2048 + 1);
 
-SVM_MSRPM_SANITY_CHECK_BITS(0);
-SVM_MSRPM_SANITY_CHECK_BITS(1);
-SVM_MSRPM_SANITY_CHECK_BITS(2);
+SVM_MSRPM_SANITY_CHECK_BITS_AND_BYTES(0);
+SVM_MSRPM_SANITY_CHECK_BITS_AND_BYTES(1);
+SVM_MSRPM_SANITY_CHECK_BITS_AND_BYTES(2);
 
 #define SVM_BUILD_MSR_BITMAP_CASE(bitmap, range_nr, msr, bitop, bit_rw)		\
 	case SVM_MSRPM_FIRST_MSR(range_nr) ... SVM_MSRPM_LAST_MSR(range_nr):	\
-- 
2.49.0.1204.g71687c7c1d-goog

