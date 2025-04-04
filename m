Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A021D599
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795591; cv=none; b=RLVbb1fD/b3RmYq2R7cKPimkUiXhNHJ+tVqLXpugWlAf8Kvogt+oaX4KuYuXEGWuMsAyp0HBpD3yKFi9QgLXGEexf1AWWtsdPxRAndlayq6K0wwbVv4PWgKGjJ+0+5qC9MZ8tbGNS0AjJzcKeYJPcAkeHqxu8xJ3RxFzHXt1KGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795591; c=relaxed/simple;
	bh=IYgl0oz7WYCethX5zdLJOxQN9YYu60K0fmwKqhu1/aQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YoY+2gvIU9Xg6n5hg5g4r9tpvyVzXjEmMkBtfO0FakF9MWoLwm1c9crK9dMxByms9vUgei+lSmsalLk37PqyZQhWo4r02tfGK8MJzxEdQUJT12OhlS38thDW2naBYt5laUpkELWM+OL1NSFDBLUmIuSDwdfySCBlSo+jzsmXGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FuMYdILA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FuMYdILA"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso2991438b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795589; x=1744400389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G03Ks9vMONlbd+61V/+Erd91vdrZg3/ZspQO1qdkUD0=;
        b=FuMYdILAQilAMy02eAsO0PfVk2TasLFUoe22iCIiS+0GnjlmAefswNlJ8OFivJ4Ymn
         IiviNgEl/pQ8VjiQklY2Fc5R3MiIUrd2lCEf1/CdsTlVfGdrR8aeGml1P0HVCN+9AdS7
         s0MefyLD9B7HwTZJHL8aO4mfifsWDP8bS6GoP5Gy5c3dVQEPpDJMZjc9UeZ7lHI1+zWe
         rTVUgtMwvL2wxOjJFRXGBC1tG6TJeUhi6XpTwDs1d08VyF0cLhePXqO2I6uEGNU4AeJm
         iK0JAaBTs4AibCDCnAVN1wV0pDVA/MpTofb/QfiKm3BTX1LEAWWLW6/UneNsvGzB0kgR
         wDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795589; x=1744400389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G03Ks9vMONlbd+61V/+Erd91vdrZg3/ZspQO1qdkUD0=;
        b=GAf+GwuddvKkNbkhcnQ20+S1uLIiQNpTD+CMOSGRVJs0/I4Kh5BS/jb/4dasusal7I
         luSu4WHgxW0ySqrHslur2BHw+ecKdD+do5YYFc9jHQgO9WW9KCKXd6x2cKRkZkCxrSm9
         +YmgCYLj0MikP0XK88B+hy+duzBemPSzx8rr4ltpaOJpJ6gMQAPByoiU2vn04/RuYoPA
         0psdpWjDms3r6nV4PHWokcpe4SEUuky+nJ6iEzqif03l5R9NDOe7lBlOlra/AUuhEC51
         5VbTn9VqcsT9WeaBuAWTOwCIMMD27UXdVUwpJFzWsOykPd5gEm1bkqDyXa+W3JcgQm2W
         TSeA==
X-Forwarded-Encrypted: i=1; AJvYcCVATqYH4rH9Y9Yd1Y7BmaV5ut+bChQjOH8WURMwCMkJwq5wJBByRIi33VUvUT1k0szWBVGcAq3dAhl/S7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAWJ1L5o+1YglOiipsQgA6k1+nkV/R6JDLXzoleq52UXyO53q
	eIJydFAjBrz6ad8DtDaso5+DCp5DoscVwRFhi95dGVECX/4v0rON5Dx9GHnUfk0J2DiOckVr2K2
	T5g==
X-Google-Smtp-Source: AGHT+IEW58Ax+7aXM/+czWYm3zsW3qa9UnEokKAJbXbZCPS8kr/NGoPhwa56A0X88mWfGU8rBiSmwQt9o2Q=
X-Received: from pfbhj4.prod.google.com ([2002:a05:6a00:8704:b0:730:7c5b:2e2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1411:b0:736:ff65:3fd0
 with SMTP id d2e1a72fcca58-739e7113667mr5072766b3a.16.1743795588965; Fri, 04
 Apr 2025 12:39:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:16 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-2-seanjc@google.com>
Subject: [PATCH 01/67] KVM: SVM: Allocate IR data using atomic allocation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allocate SVM's interrupt remapping metadata using GFP_ATOMIC as
svm_ir_list_add() is called with IRQs are disabled and irqfs.lock held
when kvm_irq_routing_update() reacts to GSI routing changes.

Fixes: 411b44ba80ab ("svm: Implements update_pi_irte hook to setup posted interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 901d8d2dc169..a961e6e67050 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -820,7 +820,7 @@ static int svm_ir_list_add(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
 	 * Allocating new amd_iommu_pi_data, which will get
 	 * add to the per-vcpu ir_list.
 	 */
-	ir = kzalloc(sizeof(struct amd_svm_iommu_ir), GFP_KERNEL_ACCOUNT);
+	ir = kzalloc(sizeof(struct amd_svm_iommu_ir), GFP_ATOMIC | __GFP_ACCOUNT);
 	if (!ir) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.49.0.504.g3bcea36a83-goog

