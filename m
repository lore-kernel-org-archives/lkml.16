Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFE28D8FE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596268; cv=none; b=aXy/y5Rg4HRealcBFqKGWyuRG0Np98UpZgeVMXOOeXHf8ByB9GHmYdG+ex+Rk0hyqqeMsIa0Du1mdbRMjGHskZ02H11AFUAOErTrJjvbHcLKgcQbSYSbm5t1w4c/yR4+IMwIDqHWIj952hTwh15rIrnCtMqcQASeGDbn6Kw7lXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596268; c=relaxed/simple;
	bh=9VEAvtUsud2CGs9vlrwfusz06B+7ZsvAKB7oC960uWQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OcRKl/bNFIHXq73IePPOn4G9yyplDkE2OsoQc1fFjPKb/GhrOBrRqcV56bySvwDVz+iTftB3o0s4FKiFpi8UAO/fNqqwqVPPCnli1JFHjuGQpea6ZFNV8VLjzwnAloN5Ok2w9Buha3gO4YHemRw1a9JVnptDVQib67aULG2liVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ziGyi8Ma; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ziGyi8Ma"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747d84fe5f8so3448880b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596266; x=1750201066; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sgbdhI3yd/wQ/3cQ73eXvLbLWKSkDV545uFxsAvOoCg=;
        b=ziGyi8Mavn6a6PdpdzWGfFzc3CBeFRC3BGD2s3dVd9sJlC5ZiL9GRhM/S69ZWV655j
         ormtFGCto370krwFDKu/iWosSmSyfoRdrDh/p188J77npgoe6EO66htmdNC7hNUgvNKF
         gF3JomtT6WVwMiWTIBwtHu2J5a87LpsfqE50wsu3UcBBRLT+eqFPHLS1e03dUNOh3NBR
         xU+1zW5iLQvFZHEPN5UOHgtykctpNvEwtiamJDPmGzO09nPt/LADrwEp6UxxgdXnY4El
         XjL/Asu+IhBcj+bvH6xEV65QLReNca0W+r6cX4r36zIGBUb6/agntTRjXyWR638m8Zv4
         1u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596266; x=1750201066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgbdhI3yd/wQ/3cQ73eXvLbLWKSkDV545uFxsAvOoCg=;
        b=YkGxxAuhmR3Zeo7iME34Ztuu+z0kr+nH4zs6lG9Rzw4cU71/5Vxzc0bRdFDCptipd5
         hC5dW5xbHjyU1v33PxcwW6IdKg48IX/zbwhXvb8yGoB5zZfjzLZMvswT8UYbGs2Vgwjh
         Ttloel1oMUPZC07CdMpfIA/LlIalkAIbSurWWrDJb7/hPwPRUGwa1sIm510MtrRbDTq1
         baQPgNN24haX6ADqQ8cM/bp8l/2zvcmM6GwmFguujBFXNeCuBPu3r+ikvu+Jkmf1iOo+
         /ReF/2qhAmTSprQCqA/aQoQaIKZbZ6//XLB882ZH+Ne1hHuucOjVO+MeZ3Wh7T9w1gdL
         9QcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmNYZNjY1W/Xv3b497eZgb+/TiEFkJYPwM0viBDGRL+pzxA9Y6mqpvK4EiG4kzPDarHgbc+VaNEU6Ez0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jmnhBSBqqbZaYyO4Ube2PAqBGsMZlapFEhzmmCLc02jTKTpQ
	k846/vPn99d3hM181XQ5OJmsdbWmzw4Ma/zFfAILAcGAJrCUZtRi/xtPVg2rdJkBDNepjcCrnMP
	e4Pl1qQ==
X-Google-Smtp-Source: AGHT+IFoj6QRzLKrYLLSAJQ2LmKp+ObVPY/ahIVkPm5UND4Cxp0AWwCGUQGOuOLKDbn2xQa0z5KnVXCOFdg=
X-Received: from pffv21.prod.google.com ([2002:aa7:8095:0:b0:746:2897:67f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d92:b0:748:32cc:eebc
 with SMTP id d2e1a72fcca58-7486cbd9035mr1442926b3a.17.1749596266499; Tue, 10
 Jun 2025 15:57:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:08 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-4-seanjc@google.com>
Subject: [PATCH v2 03/32] KVM: SVM: Don't BUG if setting up the MSR intercept
 bitmaps fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

WARN and reject module loading if there is a problem with KVM's MSR
interception bitmaps.  Panicking the host in this situation is inexcusable
since it is trivially easy to propagate the error up the stack.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 262eae46a396..f70211780880 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -945,7 +945,7 @@ static void svm_msr_filter_changed(struct kvm_vcpu *vcpu)
 	}
 }
 
-static void add_msr_offset(u32 offset)
+static int add_msr_offset(u32 offset)
 {
 	int i;
 
@@ -953,7 +953,7 @@ static void add_msr_offset(u32 offset)
 
 		/* Offset already in list? */
 		if (msrpm_offsets[i] == offset)
-			return;
+			return 0;
 
 		/* Slot used by another offset? */
 		if (msrpm_offsets[i] != MSR_INVALID)
@@ -962,17 +962,13 @@ static void add_msr_offset(u32 offset)
 		/* Add offset to list */
 		msrpm_offsets[i] = offset;
 
-		return;
+		return 0;
 	}
 
-	/*
-	 * If this BUG triggers the msrpm_offsets table has an overflow. Just
-	 * increase MSRPM_OFFSETS in this case.
-	 */
-	BUG();
+	return -ENOSPC;
 }
 
-static void init_msrpm_offsets(void)
+static int init_msrpm_offsets(void)
 {
 	int i;
 
@@ -982,10 +978,13 @@ static void init_msrpm_offsets(void)
 		u32 offset;
 
 		offset = svm_msrpm_offset(direct_access_msrs[i].index);
-		BUG_ON(offset == MSR_INVALID);
+		if (WARN_ON(offset == MSR_INVALID))
+			return -EIO;
 
-		add_msr_offset(offset);
+		if (WARN_ON_ONCE(add_msr_offset(offset)))
+			return -EIO;
 	}
+	return 0;
 }
 
 void svm_copy_lbrs(struct vmcb *to_vmcb, struct vmcb *from_vmcb)
@@ -5505,7 +5504,9 @@ static __init int svm_hardware_setup(void)
 	}
 	kvm_enable_efer_bits(EFER_NX);
 
-	init_msrpm_offsets();
+	r = init_msrpm_offsets();
+	if (r)
+		return r;
 
 	kvm_caps.supported_xcr0 &= ~(XFEATURE_MASK_BNDREGS |
 				     XFEATURE_MASK_BNDCSR);
-- 
2.50.0.rc0.642.g800a2b2222-goog

