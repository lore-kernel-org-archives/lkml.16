Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA702C1780
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682094; cv=none; b=HeiQowO5U7M2bkBlGCe/f2+SSIlMwJnL3L2jmu663+iB55gfF1Gl9QfJFBKk5ipmo50Luwj618PY9EltwKZG7LNt7eNpgXN1diHgKzHHIiJMbo06Gqd48XAdszbocMusWcykiaf2XpbVd82TqSpPMnY+XlCSAKdGFjg7xkjv33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682094; c=relaxed/simple;
	bh=yZZtRbcWnuqwQyat4VhI1SVpbjBljsz8F13Q0oWxmXQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LO2Lbn85WX3qmQSabAC0HVhSUMDpPN7Ct8iq+QcILdqK6oi6ArwOMr/sgtZ6vYEIgV7XQN2DteJO/A+P7EjG9C6uiu3R89u3rmZDk0kKsihEm9AwUj4dltgi2C0j/6GB/nyXijvymSfNpRxi7tphiOmGIxiO32DG9BS+4xpdHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NM7FSFpZ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NM7FSFpZ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so340393a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682092; x=1750286892; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mEZsLhf6SxJ64ydA6t/wQOktcm5LeFVwzcPjAJ4nCGM=;
        b=NM7FSFpZACrG9/GxFQXCLHBdXshvzL6X91spdB9znvOj4Tn3YdJp3h8NPfhzhvt+fr
         +DgbY3XYSwdtZKtMwL92STSTLFqFP0TjwzSMzYoJC0nzQ5MvjH3Nj5f9VL6W9RpccUft
         alYluvITlj/dx0ADOSiy4xgz4bLn7z7whzfypwN1nvCORH+jdLM5HBc50NYY9AqKXA0G
         ySvJlzPBtgI9vbmUXTw4tR9xnZ5uqfMPnvMyQN1yaOw9Yfg+F9aakmQgDSRNnPFzFw4q
         FbnvZyKR+bTqFbZ5oIe22bSGPtAxPnZjZgomniu7Sk4bN3a7qnclQmGeS2jibHR0RJfT
         Pckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682092; x=1750286892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEZsLhf6SxJ64ydA6t/wQOktcm5LeFVwzcPjAJ4nCGM=;
        b=qrnsip1/SUOsrUw6kFZmQGq7dY/Vq+Lqwa+krZpzNhp1+KOFAY+gC+V4wGy08OBVbG
         fXVIdojlHtRbpBRu3sLdE7zZR3LLyDYAZnzUVIg8pihVWW+Ir6VMp/Akjij5ZO7BdkzP
         7+YpZf9gS3nMc9RM6WImjIPZ/TrHO8UNVbkOWUggHP8D3Lpl92FwWop6WCWlzs7ksHxK
         86hUSYtXbY7knkffTubFT5SAZjY3U+IsTC8Zx+aW7/ffaJvh/1+Yl8aZifmiPBbC98gW
         stEgWzHae0zH1pEsq6Hw1lnHT46LuUywwc6gCCI30B+K99q9p75aDov7scWJKZ4Iv68K
         axbg==
X-Forwarded-Encrypted: i=1; AJvYcCVECKmeycoVYE7w0oqXhd24GkFjvOyZTAO5R0spPd9UVNzG4MKWxirjveiOpuuYdoLd1YLrq3WxKid4zMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVe7pTda5ESRc74VeKO5+B2sN0AxtlAlm5/TiwKn9FmQsubO7
	i/ArKnKATi+KBJVi1if2zniEpLOn8VRvS1kqfEBTjwiDWhnMDhK8ZLryYI9F0VO/XdFacyVlU+J
	4SD77Jg==
X-Google-Smtp-Source: AGHT+IFg24zPNL3KiBl4z/DNOHqd2KhvvGrjl3yLgrTD6GwXkCuqSf7mQ8rAwENd7T74FPlQ31IQOCRlfVY=
X-Received: from pjwx3.prod.google.com ([2002:a17:90a:c2c3:b0:2fc:c98:ea47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2d0:b0:312:def0:e2dc
 with SMTP id 98e67ed59e1d1-313c068d18amr1292249a91.7.1749682091962; Wed, 11
 Jun 2025 15:48:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:47 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-46-seanjc@google.com>
Subject: [PATCH v3 44/62] KVM: SVM: Don't check for assigned device(s) when
 updating affinity
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
2.50.0.rc1.591.g9c95f17f64-goog

