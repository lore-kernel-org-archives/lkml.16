Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85A25FA3B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682032; cv=none; b=Zg0cb3oTbVRcYYLadQopnb0N1xtcCJ94ckYZmnnhJzqhjDhK5ffBEAKKMiazy8SHMimfDCnxOu/64TfWlS3dIV6er7bGtQlnD62u191jO3lll5lwzQavFXHICleuqM5+04ZmqPZIjyCt4B6nJnmj9ogtu+jQSqR/jGhBrvTrpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682032; c=relaxed/simple;
	bh=7dV5E2YpVOyJ/Kux4msTi4WlqyseKzQyRpwCMdx1kug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N7ae37ea4wJ5D+cKgd5xhWWzJ8LLylvFAODl7B3w57wWY91xU+bo7gmihqJ80Tya42snkTl/joBhhIBy7cCwdM0ING5iQ9odtD8dO2/SuRv8CIwbruqeQPUUDAg3QoYPShZ1LgEn/IjcrhWs6zpYkvPGFO7iCzKaH8pONvRO6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eSzhSMhN; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eSzhSMhN"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74880a02689so83476b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682030; x=1750286830; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bQMxbahOoMV/Ka2zZMRG3HjDjex4nqWH9a70Z5WrrOc=;
        b=eSzhSMhN2XfBZIhN91P+dCDUyZPad7Czz243fAUONzBFoGvn/ERgH0m/fKXJxlQHaf
         dqr2Qq48QEJmbjKf8ZLsVMKJlt+5DGBFlrKYsKSxUQ13WhnwTz51nkZ2q9xE48GcYNHb
         Bo5UTTjcNfh4Px2od7Xkz/12kv4BzqBdf8sDj6T+gmoiMm85ntjRSCFq5O/02wglTjNu
         Afs2Z9GB9AMfPBswHdKkOE/SelVMrKtwsq8qJDz9PXk8AwET33f1ED66ajjQhKVGjdMH
         HJD1MqlulACs4uLyX9x9sYsFY2dXXq9+bCL5hB1clAm8gU2qQGzrbShZWkytEiIU8VPf
         SoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682030; x=1750286830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQMxbahOoMV/Ka2zZMRG3HjDjex4nqWH9a70Z5WrrOc=;
        b=oTqZ+YVihRqcMktcznqTogj8BLRilMBWlMtAIkHC18Dy3gI8sz5z0XxN0hbEuoernq
         cEMrBTq8pBUmMjp00rYMcySTt9PJ530IkrZnyxtlMVicrNMt4NVb1CqjUfbBM1AqSZWF
         hT7zaa6HP9tJrCEB+/j3spZsswH24ZPwOwGqKwYGGVjEViFMOCvwROuznQ8u3auepoNa
         TWd30FSmlHgEk8YnHrFFABZXlNb4OC6J5HXfUimu1YHoCruARL+OgYnTI5WuntB6cZ5V
         oJ8PKZfMyRxiXQTEG74E2U/80Q74PuajFjuTjTt4A6Tydht1Eok8IkUrCugtLf9B99gJ
         /xdg==
X-Forwarded-Encrypted: i=1; AJvYcCXaLR2TmuXzTjOSFnz5OaRKRRq53g7nmwsnz0iEQwNDfuGKSEwIvfHmZJYz6oStpdPJlUXqr7Ap28qpYQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZt4qvWN8kzvBnjBP9ZZvCAIfBBLwHvEFz7jHGLBk+D6Vwaoy
	/wDHRaN9AyGZH4UpOsrnPJehn3Gp9PunTOpfb/tfNeoBjRo7/cIRTXgPNU+oEMnPV4/hW4s+DBr
	C92FE5w==
X-Google-Smtp-Source: AGHT+IHU4UK6dAUOCbwJWWrdH0PtCWdxR/jj188N0b0b6EvIJsVmByJnhGgC9nFYnYfLkqG3Y4MI9nywi44=
X-Received: from pgar4.prod.google.com ([2002:a05:6a02:2e84:b0:b2c:4ef2:ca0e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9a:b0:21c:faa4:9ab9
 with SMTP id adf61e73a8af0-21f866f2d2cmr7405522637.22.1749682030084; Wed, 11
 Jun 2025 15:47:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:11 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-10-seanjc@google.com>
Subject: [PATCH v3 08/62] KVM: SVM: Drop pointless masking of default APIC
 base when setting V_APIC_BAR
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Drop VMCB_AVIC_APIC_BAR_MASK, it's just a regurgitation of the maximum
theoretical 4KiB-aligned physical address, i.e. is not novel in any way,
and its only usage is to mask the default APIC base, which is 4KiB aligned
and (obviously) a legal physical address.

No functional change intended.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/svm.h | 2 --
 arch/x86/kvm/svm/avic.c    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index ad954a1a6656..89a666952b01 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -260,8 +260,6 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
 
 #define AVIC_DOORBELL_PHYSICAL_ID_MASK			GENMASK_ULL(11, 0)
 
-#define VMCB_AVIC_APIC_BAR_MASK				0xFFFFFFFFFF000ULL
-
 #define AVIC_UNACCEL_ACCESS_WRITE_MASK		1
 #define AVIC_UNACCEL_ACCESS_OFFSET_MASK		0xFF0
 #define AVIC_UNACCEL_ACCESS_VECTOR_MASK		0xFFFFFFFF
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index c981ce764b45..5344ae76c590 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -244,7 +244,7 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 	vmcb->control.avic_backing_page = bpa & AVIC_HPA_MASK;
 	vmcb->control.avic_logical_id = lpa & AVIC_HPA_MASK;
 	vmcb->control.avic_physical_id = ppa & AVIC_HPA_MASK;
-	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE & VMCB_AVIC_APIC_BAR_MASK;
+	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
 
 	if (kvm_apicv_activated(svm->vcpu.kvm))
 		avic_activate_vmcb(svm);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

