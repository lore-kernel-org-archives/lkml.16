Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4023CEFC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795671; cv=none; b=l+FH/7cA28DMVKfjrl3UqZrk2efIf+G3/WJWekFynqA0qGafnNfQDQyGaXk9miIM3gVufGL4kwmS8dU+d+DUOHkKTqaKs7v042BgYHVvXSckFiPOTeCqVJ5zXOCOJpq8GjHVzx06BCluxpO6vmS2tH3Qu0U//sAPQnzgyGXyhyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795671; c=relaxed/simple;
	bh=Jfmk9VzNRAADpmMGwdwa2xyHxXIJHx3CDbGZTsxqH1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LKLUoGiDbuyhhJFrzlSW/fNIjSjiWPdkuIE2qRjtC4/q91T8lNWE+UmSm/tqXQD+DsyReCZOZbyWYBt67LH2t0K4k47qcVnL7ubOG6biB6MjL1zuDPNgAgwDG12cIrOOY3HOxEb2cfcXCxSI+O92RJDZESLyFc7tJ7tUGxcISf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NCQmVOih; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NCQmVOih"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso2992735b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795670; x=1744400470; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8P0F5+eRvzI1lxgpOCwvPttxPqLphUaIWfDndZq8iLM=;
        b=NCQmVOih0uFjaC3BZm4oIoGms8lCTgr7CPB7ZBCfkMX/jsgiI54Inp39yCveA01mra
         3XqKGJtIRuDCWOnYfm7j1FUPHA4feu6YJpl++1iZQLSzT3k22Fzp2yQOhn9Xkv4UkA5l
         tlTPhEm/QIPRsgwFcKNlI66rmWUUaqEi/57mr4lvkHT8uHodfexgtdzbn2GrBzynrmTf
         HgZRU4QdkYIDdEuRCKgaIimDTmEpnmdYLCNZXLamD+Ob3KtEWEahgjmEayYzNPxMmOPY
         SmA8SKAHdbc+aBAyWO0m4LZfZsrQaEods+8U/3PTfHUUY51SEDDeu1NKG16Xr4fY0w02
         JdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795670; x=1744400470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8P0F5+eRvzI1lxgpOCwvPttxPqLphUaIWfDndZq8iLM=;
        b=iFlc27e+eSsM9HryGFxk7+IfJ7/TTpLl0EcQATbyDSLh7Igc7YZb9m3OvEYgGBlBQG
         aMtV5pWvoQWHdu4cm5pMbJzCE2MGtRoje1vHpQitVloohorBk1V8ov9tYxtE41tmyHKX
         n9shzv7ZjJctDyHR4+ju0JAUhakEfJDH6w2iboGSf2JcCc+3u1pm0JeCjoUgelQ6sj3E
         P9MAcET2N3zDtuukg0FHfpYxToZ211v4bHEFcv1FfN3kZWE/LT4Qwdo4aslx3FkSRokL
         lD0zqmni4btLi8/xxKRG3rrXWXotQ1LdwPhocYVtjcWwiAVe/LKLTMgZ8bqCnyghsx2h
         aCeA==
X-Forwarded-Encrypted: i=1; AJvYcCXJhzucFAAb934a0/4IC3PNRT1irogx+vXAQDWOf8w4cFvnwmxw3Nq14CMbGzUM+kZhDHO3g5g/ZMU3Wfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx75yuhQybHofp4KESaebRca5zwY1oipjkMhASytSWIhVifFABF
	Xp7Wu9ckjNdSzAH4CQUx5gCR6XvDZJzDMoKi5hEzpNo6+t2hMVTc4XTEqhquXVTk0JtsJ6cnTQY
	d6A==
X-Google-Smtp-Source: AGHT+IFM3a33R0/JqO8ZtaGkbV0mf76n3eZC+Ea2CS6FZilzIUeDNAaxDWzQnYTCiWaEXSrdeYzp/CG211k=
X-Received: from pfbho2.prod.google.com ([2002:a05:6a00:8802:b0:736:b315:f15e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8893:0:b0:736:4704:d5da
 with SMTP id d2e1a72fcca58-739e7161560mr4999839b3a.22.1743795669704; Fri, 04
 Apr 2025 12:41:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:03 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-49-seanjc@google.com>
Subject: [PATCH 48/67] KVM: SVM: Don't check for assigned device(s) when
 updating affinity
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't bother checking if a VM has an assigned device when updating AVIC
vCPU affinity, querying ir_list is just as cheap and nothing prevents
racing with changes in device assignment.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 04bc1aa88dcc..fc06bb9cad88 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -857,9 +857,6 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 
 	lockdep_assert_held(&svm->ir_list_lock);
 
-	if (!kvm_arch_has_assigned_device(vcpu->kvm))
-		return 0;
-
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
 	 * interrupt remapping table entry targeting this vcpu.
-- 
2.49.0.504.g3bcea36a83-goog

