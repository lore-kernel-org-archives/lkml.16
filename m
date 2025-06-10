Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBCE26E716
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596308; cv=none; b=IeApAygdDMEeMO7BdHBF9Jr9RcVxKu+hP89b8JoJjUJA9g3LR3krlqN58EXoLvCD4o/06w8poj0u6VDsozWO8QclCYHpMvUVFRclSA0LMcgFrWRN1SSEPC6kuTKGShF6ViZboEpFwd12uTLVpcSJi9GgxOAd6n7TPbC57IBeDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596308; c=relaxed/simple;
	bh=c5jtKerqKCl4XHYQy4zQoY0B/Fac2DEBJ4FzYctBNv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HmWu5Tri/G62SdaX3uj2XWvWoWVKB/dPL8Hi1BJPS6AzqieDSspK0kJROEA0GL61/pj/JFG7lP8QRNlBGCm/wDUk+DMuHJlT7sRG9fXj2PnWv6NMZK4IsezHL5wLW04MNpmUPKymVghtBh+KNfMcN+Z83P/1XI/jqIehi0YLPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WEC70Sw6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WEC70Sw6"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235089528a0so1985945ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596306; x=1750201106; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ngowtUk0pmcEMi5JuRIJTHwRoFQ1ps0rBy51903B/GI=;
        b=WEC70Sw6l2/trSw5KHeqyRbZXI05VN4Q4WCWggSf3r7fAxicEdDtyWUkiq6UzlPJBw
         5NSdu3ptn1MRLK3VboDghQoMZdmcqAY6i6WoIrvjzb0p5Cr3Gd+0SClc1nbposU9e3sx
         zMaqPCaI7OBM98MxbJEvIk3oqyEXjTGB0SBcxL0VtT9YZPFJL1Vmro0KqejTHbhEB8l1
         g9BvbIAuOYb6M2y8uWnh1h/rrID8F3FfdV7q9rskQ6PWpzNRFRvfYH1JTaoD0YXaVPCA
         pLEidnBHfinYSn294seyDfH0gkhH86IoEHEtdP5w6iuxjRmdxIwsWMZRnY2AltVC3Kwk
         8Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596306; x=1750201106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngowtUk0pmcEMi5JuRIJTHwRoFQ1ps0rBy51903B/GI=;
        b=lc75fWwrYaRwWUs/LwncwUNKM/M6G8A7ZZJpyY0eXuaN8ejEi5X+KkTmnjqETI4Lwz
         LeKy0EZhdwWulO4on3JCSKZx0PeePIxLUm52PZy3SUQof/V0BmvYHIPZl0WWgA3+a+Zj
         u68LeWcbYEdxcb/eO1+NPJ664+FttgkU+elj9+BhHWUoEmllqChwoofE5hSosUjGtV63
         1RhAqMANYAD/hV3yqTir0PnH6rtA2GeardDlTqeR5cbH7h/yrgdAynXc/cEsQm2jCzcD
         IH9iz1U7AfZ5G3U+ldT9drRiIrIQKHc5Nrt6WncaC4xpsUZJi9kPew7dzMT7QBvvptOa
         uawg==
X-Forwarded-Encrypted: i=1; AJvYcCXUPP/JXoKsE4DLLkva3EaQvVt1QqSXEzKK+c7aZf9T5DvsN2YMTpfUIJmc5eJf/EzAHY2SumbAbe4bktg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5t/aLrrRzCeNw62h2q9xlYxhD1desAqTqwMzphSBmbvkjhWA
	xn3yB8DuYv3Ndi24+DGS9jJYMn3uZ3y0B5tcygOY/hMEMitapsvR3MFGGPFi1phheZDaHAnUltq
	rFHtpUA==
X-Google-Smtp-Source: AGHT+IE8f4mjqFSxcWHB/Sxh/pqjjROaBQQ9c1q90hSKtUQsBQheucaQE9iY6C+1XXLQyaspE5G0Cxh4kFM=
X-Received: from pjbpx2.prod.google.com ([2002:a17:90b:2702:b0:313:230:89ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3908:b0:311:ab20:1591
 with SMTP id 98e67ed59e1d1-313af9711a2mr1372038a91.15.1749596303034; Tue, 10
 Jun 2025 15:58:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:30 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-26-seanjc@google.com>
Subject: [PATCH v2 25/32] KVM: SVM: Move svm_msrpm_offset() to nested.c
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move svm_msrpm_offset() from svm.c to nested.c now that all usage of the
u32-index offsets is nested virtualization specific.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 23 +++++++++++++++++++++++
 arch/x86/kvm/svm/svm.c    | 23 -----------------------
 arch/x86/kvm/svm/svm.h    |  1 -
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index cf148f7db887..13de4f63a9c2 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -197,6 +197,29 @@ void recalc_intercepts(struct vcpu_svm *svm)
 static int nested_svm_msrpm_merge_offsets[6] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 
+static const u32 msrpm_ranges[] = {0, 0xc0000000, 0xc0010000};
+
+static u32 svm_msrpm_offset(u32 msr)
+{
+	u32 offset;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(msrpm_ranges); i++) {
+		if (msr < msrpm_ranges[i] ||
+		    msr >= msrpm_ranges[i] + SVM_MSRS_PER_RANGE)
+			continue;
+
+		offset  = (msr - msrpm_ranges[i]) / SVM_MSRS_PER_BYTE;
+		offset += (i * SVM_MSRPM_BYTES_PER_RANGE);  /* add range offset */
+
+		/* Now we have the u8 offset - but need the u32 offset */
+		return offset / 4;
+	}
+
+	/* MSR not in any range */
+	return MSR_INVALID;
+}
+
 int __init nested_svm_init_msrpm_merge_offsets(void)
 {
 	static const u32 merge_msrs[] __initconst = {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9e4d08dba5f8..5008e929b1a5 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -195,29 +195,6 @@ static DEFINE_MUTEX(vmcb_dump_mutex);
  */
 static int tsc_aux_uret_slot __read_mostly = -1;
 
-static const u32 msrpm_ranges[] = {0, 0xc0000000, 0xc0010000};
-
-u32 svm_msrpm_offset(u32 msr)
-{
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
-	}
-
-	/* MSR not in any range */
-	return MSR_INVALID;
-}
-
 static int get_npt_level(void)
 {
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 91c4eb2232e0..a0c14256cc56 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -666,7 +666,6 @@ BUILD_SVM_MSR_BITMAP_HELPERS(void, set, __set)
 /* svm.c */
 extern bool dump_invalid_vmcb;
 
-u32 svm_msrpm_offset(u32 msr);
 u32 *svm_vcpu_alloc_msrpm(void);
 void svm_vcpu_free_msrpm(u32 *msrpm);
 void svm_copy_lbrs(struct vmcb *to_vmcb, struct vmcb *from_vmcb);
-- 
2.50.0.rc0.642.g800a2b2222-goog

