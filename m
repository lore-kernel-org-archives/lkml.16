Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43672296D00
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962082; cv=none; b=ZXKOir5dm0cnY9NA7TGkGz0wH+rbPNy+6v4OWmfgveh67JKF6BCeLBSmpD61z3Y797weWeTjVuerlANYXRbAl3mzG01zH/yPWVayvLHCDaG70od26I/l2SUXxjl9p4RAV7OnLFvl4qu/kHyh9Vzu1NQmUOxnW8PHMd310/qkeKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962082; c=relaxed/simple;
	bh=hkXL8tIOvSpgs8BbYZ/kSqxwAWQJTMH+qltnqmcm2m0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H/C8Nl9zKSUKvrkfvv+QHCjhgmv8nBRp5DLekvooLunfqenmGL1fmmSFj4a+Y3M855yKPUpACN2Sl1CjGgC2EDo2CvBY0Ih6phu2sfkyYHxosLHmN5fUfJwAh3OJZqNbve+0hnWef4kbdkrItCzSqoVKKmDn5poEa6v/4oGWezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPeaDPIV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPeaDPIV"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so6784570a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962081; x=1748566881; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YWgBZPn6hQ/WyvsMJWVblHWlgsDadk9OyN3hzX+dlyw=;
        b=PPeaDPIVlGUV/NvxJHrMkfgXuoHJgyNaLy7bOFtD5RVaDwqObS1zFpGoHXDIJT+LYe
         WVOBIo/NFHwSBVzDfz4pAlfIKnafDxmgDjOEwxU3/+J/XKp/wTuYA0srL0UsLtdSXWON
         2Y1LTBpCKUdofauX7ae+b1cujL4Rnzb7JAvWJt3uOHmFnUxBdioLqp6Uw/TFzO8xPat2
         RYjoWDSHa7iZOc49mvicX3jXgcUyUkmfZjflVND4T3XRSx+9uKWKqsR1uF8BaMMi5PDU
         cGFH6GJTqHSWKL+BNH9aLFsKHGqjgJQreP3i3mR8nh3E93mEgkQnCVLP7MzZsuvq3dSS
         ypoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962081; x=1748566881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWgBZPn6hQ/WyvsMJWVblHWlgsDadk9OyN3hzX+dlyw=;
        b=i/oa8nTcggc1886+dHguZOgCYytRoE3+4/kkhGuzXJPp9F6KgeBh7kDM+MWTWlhfeT
         1LYPLTvcWaz56+g1KDJTD6VL0z9NEM37iYHRT2LJPCf4K6yjimEzSmsWSUe4ASbt4oKL
         OcgzB9IxDlUv1zsgzSeGPjHBmIFnN4QwnwbLbwqpryD979pdfN66TVb3g+WriNBeQiDP
         EH/3+NW1vmUNwIJw2HGb4yEsfJoWCds9cKkzomy7sXt5OIBEda5QT8yWmpalV5LXhFry
         CuNp0kyKRTDvJktpa3JoSKCL44gUKgfeinI67bg0D0KvWA7rx9aT1UYYNyertMhRrnjb
         tdLA==
X-Forwarded-Encrypted: i=1; AJvYcCXmN69mAmxgXbkn+cz9fk5ylu31stnTFzpq32HL2bnyp9rxlD856K/qD0vl+OBYKxx7QJFnyd5bSXjWTSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Wsp3lRPhL50XtXF/3+K/HEL/Z+R0kX0L2H0dk98s/xwTW37t
	BF9Pyh5kMFEJJ3pkiO2NrdAopDfGPVSOj8Gi1M7XwXbxr4SijIgBTbb4tGgRLXYTcdv3wfe8fk2
	U9TccuA==
X-Google-Smtp-Source: AGHT+IENrNvN8kjYKcc8X8f5fjuZCrY8RjRuwJA8T06sgnoEuhkTZxv+Y0xj/vx377YeaaqzuMYjIUVGtfU=
X-Received: from pjg13.prod.google.com ([2002:a17:90b:3f4d:b0:30a:133a:213f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2749:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-310e95f3481mr2198254a91.0.1747962080822; Thu, 22
 May 2025 18:01:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:47 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-43-seanjc@google.com>
Subject: [PATCH v2 42/59] KVM: SVM: Don't check for assigned device(s) when
 updating affinity
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't bother checking if a VM has an assigned device when updating AVIC
vCPU affinity, querying ir_list is just as cheap and nothing prevents
racing with changes in device assignment.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 2e3a8fda0355..dadd982b03c0 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -847,9 +847,6 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 
 	lockdep_assert_held(&svm->ir_list_lock);
 
-	if (!kvm_arch_has_assigned_device(vcpu->kvm))
-		return 0;
-
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
 	 * interrupt remapping table entry targeting this vcpu.
-- 
2.49.0.1151.ga128411c76-goog

