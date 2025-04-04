Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166822D79D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795644; cv=none; b=psuOzhBkaAYhGas685kVrddfO2LExQ+wPa90PXzja4tSMj4Ytj9q9r8PrTWtZQD7DHfsrIn8rEq1ke8tt2Vi4ZOhjbifCQvSfjOEib8qBY0FsXobxb+zv4DpO1FwEVTi2ZtaDTXmp3e178H5Tg+xoBzrbic5/z09qWjFNqoCVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795644; c=relaxed/simple;
	bh=NSXiAizTL3IE0tHV1Xvoqym6aO30iQa3+NNj5eRfrOk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZXrv2zyQLzkqMSULELhjLENL2MTEafKIXwefwLCaeX7dw4u3ZzlDvuExdKXAIF4FflQYPJq9qzQHdlFdORu3cjZSeVjEKQPXaJ5RGCp1eGBrI0lQPAnwH5pbvzfamC6OoJAmP3eFPNWtgDJE/7dcVfMyRg3AVTf5gyfZ0HXhRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y3AZY5Pg; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y3AZY5Pg"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736fff82264so1863154b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795642; x=1744400442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4tJsBeG4t1G+TPijwvZhdI7bM9ZuzjVrHlwd3hub/NM=;
        b=Y3AZY5PgV+xWcumpNe9bf9R4aCotdPjQwxL0h7WAiUe8o8krSrcXjpo9XkeWvEDcXr
         oWXKllbnWpZJk4zGCLDplLQGM9a1u6WZNF0gBBjPvmlG6vzzpyr4VVIjNHQIpvQ/VeHb
         M4rpVgTMMW0e50+neZFRkS9HFe6KcTIqAioFUHyZuSR91A+bXZx5Ymbd8WgI3IbJDm8X
         7CZXC5UsCIFVEJzF8WLb5oR7b3F+pn2qPCf95PfasGgZpbsqadqNkCkrWVoRDW9Y7Y2k
         vEDcCrtg/76wD7dv0G9tG0Nj1dDkG5UN5Hnirt29keZOCvCsEZAmU7cp9/Tz6ejLKDuA
         ictQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795642; x=1744400442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tJsBeG4t1G+TPijwvZhdI7bM9ZuzjVrHlwd3hub/NM=;
        b=Waut+RBwo3HMymn5g5BE348EnT1hKHnXpTIIcjxT8LS7mfF/uX+Q0wn/EyOClMomau
         sZFNohJC5E/sMukRzYUjnc57Su1cRoYlz4bsUiBH7T/4ZJtwOQkMn74hEGlDtVbDMi06
         JGMJwgYjX9Hry/bK0PFZAA+9nKCL5iMhmJoeOZ736oF0huyvljrwOClCuK8uFHYKvfAc
         V/JMgpMA6xuUXrJjYIaG6vPBwHSp7EDz+ZClx+p1he76AmHQ7aV062ocnAAFLYaNFWAN
         +GwZ2RDf0P5hNngVRqikAvvQZB/g0c6y2eeb6xYTlH1xnPf6U8CUo04OiCD6Al6DxNSX
         5nwA==
X-Forwarded-Encrypted: i=1; AJvYcCX8XO7pkzgDJ3FHelsMfN1vtJrz4ZW4T1WJy7oOXKepVkSJciB/eTiyrrAyw5NX4aNNye4ttVe+jZrw0p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRgXcYrjXfOPvZQr5fl656sVi8P7I1h6FUOvYeiwSRVpS6ccL
	jTVfirq0gfJCSYjzSb+OmMWCMrMFtzrWbgdRsUyqr8DYmh5vnMuiiZZ0sLaXkE0BCaDrUBJALc6
	1bA==
X-Google-Smtp-Source: AGHT+IEScd25fZRgSV6IjIzWui2u8dQv3YbcYlwFjvNFPD/+/iSxPK7V9mIz4jseM9arXmR9ykpZDrdm3xw=
X-Received: from pfoc24.prod.google.com ([2002:aa7:8818:0:b0:736:a1eb:1520])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3996:b0:730:9637:b2ff
 with SMTP id d2e1a72fcca58-739e5a567admr6139702b3a.7.1743795642377; Fri, 04
 Apr 2025 12:40:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:47 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-33-seanjc@google.com>
Subject: [PATCH 32/67] KVM: x86: Nullify irqfd->producer after updating IRTEs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Nullify irqfd->producer (when it's going away) _after_ updating IRTEs so
that the producer can be queried during the update.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 52d8d0635603..b8b259847d05 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13608,7 +13608,6 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	 * int this case doesn't want to receive the interrupts.
 	*/
 	spin_lock_irq(&kvm->irqfds.lock);
-	irqfd->producer = NULL;
 
 	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
 		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
@@ -13617,6 +13616,7 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
 				irqfd->consumer.token, ret);
 	}
+	irqfd->producer = NULL;
 
 	spin_unlock_irq(&kvm->irqfds.lock);
 
-- 
2.49.0.504.g3bcea36a83-goog

