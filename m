Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2926526AA8F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562063; cv=none; b=vDuO+WyuuU4F86ujLQW+ctzP313hp7XsArPFxO8dpRNLyErCUpe4V5SLf9d4VsZpAKUT9A4HSMTJuxiQFPKlO3ZdCZrStJIFnQDJfBwe28StjI3Ftgh+6Vtr7O+cB0KqMn1XTGlQFDd9UatN4mrIU22I2157uJ82uFJRwg/MArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562063; c=relaxed/simple;
	bh=uAvpkJ1kh9zyVF8zsh87KKvNUaHxXqBUn9OHKPL2zxs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KuHoKuPRbHjkc+daKNPPxJqWJwLGJWP5tjvVXftQQ1M2UuWCjTAJvtim9JDo7vPJkNTXiPfC6juS1M/EhG6xM1WQ4XFtAu5PNa48S619K+//63+q++VxHA+um3suREKrKh4xWtxb+t/1teUPNBNqUZfpst0051PAbnuJZXOXznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zh6fn9cu; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zh6fn9cu"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742b6705a52so1911641b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562061; x=1749166861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Tbq754Ngub1Qv1FsclXkkiEsExVwCE+OzSUyYEWmCng=;
        b=Zh6fn9cucIS1hJrs3BlYoAlDSJYk5fFFXnw3ncJlIUUlpskoX96vwt0tYqipovwbp1
         //OxisYaPRRrBqFfFx5vKtA/DnHZ6dpWLxhy/seIIXIMAwMdtlh6Q6pT6K+uRTBGYOel
         Ldg+iUAPsnj62jwYktexEGnbDQtcnNaDaYDx/0FoEyP8cJiMOvnJ7wH5dCqHFGxxMA3/
         Et84y0hsUCDLE8pR8MT45Uve85Hyo0WdVtXcO/PRBgAnvHSJ5Yvz6cQ3SGuNuC2wrt1n
         zojejrZzc5YBl/Xk0CzJQVGH13neoBmtoJXWqjltWppt3ki7c1fBnOfN2GcQmxKkS6ff
         U7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562061; x=1749166861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tbq754Ngub1Qv1FsclXkkiEsExVwCE+OzSUyYEWmCng=;
        b=sQHCH4Yl+4yuDzw7RoM1hYWtQz39smMxEEoBYeOusd0fs91/uLMIi/ulygnt0AVsV1
         l6qTxCKfzrpUondojfl2gJaKwZE25PDg93clwQ/Gf+BEzCqza5BbCb8B4Pq4Qu/nhpnM
         Luu7RJ4/0GEM1y/PA7eks27b2FsetY9fvZBmYGJjUZwtbkHzhjukp9zc3Mr+bIEj9SBG
         cPDlgelQaKaEBiLzdgVHu0sVdhNGIGEVPHfMfQGJ+YHTHdA3GdBNJNiQ1pGxvaSI/D8j
         yLx9aGqL1+d4yFmg/NgUCba2Bo9EeiWie5+EFmxPH7txzMQyipmavMenZgQVVNVx29dG
         wnXw==
X-Forwarded-Encrypted: i=1; AJvYcCXCh3KBmOHycTtl/sBF2SuT/3YBNe3XH1i39hrkFxZGp7fPNgByxYWBlFoetjgIoCIg+wm9IoTXBGDEcyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgskCInJMxsCjOLY3Yt48Q2YAO+QRVO1TCE4LJQrRVEudA9MMT
	uteFImpWUYEJ2v5wnvox/1zY7LVDs/ufbd6aS8n6V/dG61sHsjSma8OaeCtNseVnl8/1/FhZ9m0
	l8uZ7Ow==
X-Google-Smtp-Source: AGHT+IHsxkwYTOeBBNW9rzUAUGeHbr0ESRWe2CQWLtpJV7+H9jhCssfj6CJS4wpx0wj5vMu8jxd8n2ceNv4=
X-Received: from pfbgd11.prod.google.com ([2002:a05:6a00:830b:b0:736:47b8:9b88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e8c:b0:204:4573:d856
 with SMTP id adf61e73a8af0-21adff4c279mr304380637.4.1748562061484; Thu, 29
 May 2025 16:41:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:11 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-27-seanjc@google.com>
Subject: [PATCH 26/28] KVM: SVM: Return -EINVAL instead of MSR_INVALID to
 signal out-of-range MSR
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Return -EINVAL instead of MSR_INVALID from svm_msrpm_offset() to indicate
that the MSR isn't covered by one of the (currently) three MSRPM ranges,
and delete the MSR_INVALID macro now that all users are gone.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 14 +++++++-------
 arch/x86/kvm/svm/svm.h    |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index a4e98ada732b..60f62cddd291 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -191,14 +191,14 @@ static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 	case SVM_MSRPM_FIRST_MSR(range_nr) ... SVM_MSRPM_LAST_MSR(range_nr):	\
 		return SVM_MSRPM_BYTE_NR(range_nr, msr);
 
-static u32 svm_msrpm_offset(u32 msr)
+static int svm_msrpm_offset(u32 msr)
 {
 	switch (msr) {
 	SVM_BUILD_MSR_BYTE_NR_CASE(0, msr)
 	SVM_BUILD_MSR_BYTE_NR_CASE(1, msr)
 	SVM_BUILD_MSR_BYTE_NR_CASE(2, msr)
 	default:
-		return MSR_INVALID;
+		return -EINVAL;
 	}
 }
 
@@ -228,9 +228,9 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 	int i, j;
 
 	for (i = 0; i < ARRAY_SIZE(merge_msrs); i++) {
-		u32 offset = svm_msrpm_offset(merge_msrs[i]);
+		int offset = svm_msrpm_offset(merge_msrs[i]);
 
-		if (WARN_ON(offset == MSR_INVALID))
+		if (WARN_ON(offset < 0))
 			return -EIO;
 
 		/*
@@ -1357,9 +1357,9 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
 
 static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
 {
-	u32 offset, msr;
-	int write;
+	int offset, write;
 	u8 value;
+	u32 msr;
 
 	if (!(vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_MSR_PROT)))
 		return NESTED_EXIT_HOST;
@@ -1368,7 +1368,7 @@ static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
 	offset = svm_msrpm_offset(msr);
 	write  = svm->vmcb->control.exit_info_1 & 1;
 
-	if (offset == MSR_INVALID)
+	if (offset < 0)
 		return NESTED_EXIT_DONE;
 
 	if (kvm_vcpu_read_guest(&svm->vcpu, svm->nested.ctl.msrpm_base_pa + offset,
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 155b6089fcd2..27c722fd766e 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -677,8 +677,6 @@ BUILD_SVM_MSR_BITMAP_HELPERS(bool, test, test)
 BUILD_SVM_MSR_BITMAP_HELPERS(void, clear, __clear)
 BUILD_SVM_MSR_BITMAP_HELPERS(void, set, __set)
 
-#define MSR_INVALID				0xffffffffU
-
 #define DEBUGCTL_RESERVED_BITS (~DEBUGCTLMSR_LBR)
 
 /* svm.c */
-- 
2.49.0.1204.g71687c7c1d-goog

