Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77C267F64
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562054; cv=none; b=U1DyLBvJVV+uBwFRn2onDKhyn++vS4voNXI7pIHJQ/gRaXogIsChLd5JO9S4bFqVfiX3Ij2dUBL+LXC846JnB54akOJ6dyIdVkwr/JYX5EFzNjKOXO34sVWBe82qycsQq7+wflmOiM6A1f9AVU8NIDJUfwJgV3p9R9TDjs0hROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562054; c=relaxed/simple;
	bh=NMpozlc+ss875qK0wUIqjUpEbG1y7oMO4uIXzZ+fxbw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BE4UHWub2SGDCCOYAp3q/Cz/UOfOKSheeFcaL/kXbZwTbe+EPEt9CWcDETESHm0j1iLOFgdPYiVw7cwbaSv644vUub0bZRpFyE6CItA8GKaQ0zHyo3wxDueQ9Px8Kae1fM0te1iR+mfqn1Q0NZX8Iz9GO1jLc/arvd+3iioQW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEO4PJKo; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEO4PJKo"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3119ba092aeso2166857a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562051; x=1749166851; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3U6kOnBx1q2vhTYY8N27dofDiZJr3M0o4KlDwfSt6+A=;
        b=LEO4PJKo3vcOVVPly/IqjjQL88b59QSvaVcKngV7J8caai7iW/fkJ2GvguAMqHykQs
         qq3KuvGcSCu8LoiStRU0/+OoJmJj7K5oSplc7jYXRp/WA0nlwV8Twh8kC5oXrSFsy1wt
         UoZO2g5aBagJvpjt+xWyMqlFIMNPwf1y13W2/SkL2hMl+bf7TX+T1g5GlQgGzc/txVW5
         +QS+Zkn39BnS2DrOe9KepkjyKoo5xbN6xswx+6R+Q4F0IdF2maKkBilG1QvYUMsdWNyb
         Vhm1MH9U4BNNqvVxmKi/wHQmyiMeiaIr+5yoyq2be8v8qiL/FNmlOnN+Dtfd9fSnCUTa
         PYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562051; x=1749166851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U6kOnBx1q2vhTYY8N27dofDiZJr3M0o4KlDwfSt6+A=;
        b=uw70MBDR96Sj+ZJu00emjFX4RVz+IlOp45y21logwt3/lFv4ApA6KwtZyDOD0kKB0c
         UFXkAkKS3BsDU/SBVy8kL0BypEvSTk9fPNlenhKpo1p4jQTflEU6XTfMRrSELIdWiac5
         QZBfEp3le6YA97icnZGKMPRAYMc6lwEPEFeTsKvESSCx1iHa6++OjEIkeZO4CkyGDAtt
         WJPW1g7kYSO2a/YfmOmlap5xlKUDKxVBowSNC8smuFG7OB8CrAGJMVUkJONHdh1vCBzt
         /UUkRJlBS6HgT6f/tL5x1vraes6jSJEA1ItZ9zLV4Jgay1csg2+q0sy1KMeTGYnVpi3q
         ziCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHNXP0PE1mdCRLasn/L38RNCkzrsr33E0oj1t+R0CVOaPR6MTXMXDiO+BUnFHGQ5UCRyB3IJlUnNIv6s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2i82XA778D4TxRkRzvafdPqAoP96H5plGdkfL0prbWAkPjxe
	HaC4o0YMjfkF4vySFScX6PERFBCaqRAcqp5DbUvtyaG9t9BYIW6Ip9ukkCthpfpbnJ2ZlO1O1gR
	HKd+/vA==
X-Google-Smtp-Source: AGHT+IFOI3AcdrOSreQhGPi1kh2avodZ537x4ilDYyYFqVyh9QPEJSmEBTDx34aDzyQtf/NUW2PW7hmhSdc=
X-Received: from pjbss4.prod.google.com ([2002:a17:90b:2ec4:b0:311:2058:21e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5448:b0:311:f05b:869a
 with SMTP id 98e67ed59e1d1-312415334f2mr1913449a91.8.1748562051548; Thu, 29
 May 2025 16:40:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:05 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-21-seanjc@google.com>
Subject: [PATCH 20/28] KVM: SVM: Fold svm_vcpu_init_msrpm() into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Fold svm_vcpu_init_msrpm() into svm_recalc_msr_intercepts() now that there
is only the one caller (and because the "init" misnomer is even more
misleading than it was in the past).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index bbd1d89d9a3b..12fbfbf9acad 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -787,21 +787,6 @@ static void svm_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
 
 }
 
-static void svm_vcpu_init_msrpm(struct kvm_vcpu *vcpu)
-{
-	svm_disable_intercept_for_msr(vcpu, MSR_STAR, MSR_TYPE_RW);
-	svm_disable_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_CS, MSR_TYPE_RW);
-
-#ifdef CONFIG_X86_64
-	svm_disable_intercept_for_msr(vcpu, MSR_GS_BASE, MSR_TYPE_RW);
-	svm_disable_intercept_for_msr(vcpu, MSR_FS_BASE, MSR_TYPE_RW);
-	svm_disable_intercept_for_msr(vcpu, MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
-	svm_disable_intercept_for_msr(vcpu, MSR_LSTAR, MSR_TYPE_RW);
-	svm_disable_intercept_for_msr(vcpu, MSR_CSTAR, MSR_TYPE_RW);
-	svm_disable_intercept_for_msr(vcpu, MSR_SYSCALL_MASK, MSR_TYPE_RW);
-#endif
-}
-
 void svm_set_x2apic_msr_interception(struct vcpu_svm *svm, bool intercept)
 {
 	static const u32 x2avic_passthrough_msrs[] = {
@@ -860,7 +845,17 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	svm_vcpu_init_msrpm(vcpu);
+	svm_disable_intercept_for_msr(vcpu, MSR_STAR, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_CS, MSR_TYPE_RW);
+
+#ifdef CONFIG_X86_64
+	svm_disable_intercept_for_msr(vcpu, MSR_GS_BASE, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_FS_BASE, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_LSTAR, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_CSTAR, MSR_TYPE_RW);
+	svm_disable_intercept_for_msr(vcpu, MSR_SYSCALL_MASK, MSR_TYPE_RW);
+#endif
 
 	if (lbrv)
 		svm_recalc_lbr_msr_intercepts(vcpu);
-- 
2.49.0.1204.g71687c7c1d-goog

