Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B6D2D29C4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962088; cv=none; b=titVtmseEVV4A8Kdatn+RINhT5i3egzUDinD+4hz0N2kUGvVWJCojx3xuM5aufK3TeiD/Y4TBEStX9PpTF+/j/L9E6DEoO4agaM5KFZjI72cMFopC5P/CqwQPlA7swgcMTeCXycKF0wvEIy73//HqKTDwj28PNbMcRRV68GZsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962088; c=relaxed/simple;
	bh=8SrQ+oKGvvTIJysid8Rxw5XPwDm17oKx2xAyAvAXgIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rw+cjNe/9AlS2behiP7U6aG/0m9Mf21ZZnZqlVWdREFtGPwssWD7sA4q4uZYuLo/tbemajP4s9D4a0XwjiCvNSBjm7uyu5ypd4dLiY8NcX/wBpZJVQOhuScdeDu7KC05yD1SG+ko/lrVfILFVYPTSzOMxsXaz0tl1KwewBy5Z5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHr3OwOl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHr3OwOl"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-232340ba283so4275275ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962086; x=1748566886; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv/wXOYxNnKgHAHyhi8Vk/t+dWw1N4nnlsKYjly3sjA=;
        b=LHr3OwOllnjVG9aOqedKSZrqHyrEllrbqTNIRtZ8TdsqdpNYzu5FkjqDKVEipTHyPs
         ULmN1dX6qxY4vuP+ubQVPI/3ZhC32Ic3Pji0ddzCDH2mN5NVF3xM9dxBUcve+Zu+DU+F
         NhcIEdpbJhh4aLTyZuOyNwNW8I3YfMlr1aiv84SUf80f4I9StcnV5xAcC73QQIzcgVXi
         lbmO6ixSNBf+LFOK+YgR/cdDA8jK+QQEAvVdoAjX4onJXYmEK2K757mgCr+jVuP2OXuP
         d6alL4ZS+CqO5YfBMUpLkHOc2J60TW4nYVO9EInzlye+frHB5S8FLNO8klJofBKJ2uLw
         696A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962086; x=1748566886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nv/wXOYxNnKgHAHyhi8Vk/t+dWw1N4nnlsKYjly3sjA=;
        b=WpgW4E4odPe5vcRawIUGHaHb/ZBpCMS08o9oFU3niIYYJ9gWkzWmV5bpQXa7+Zg1GE
         M6tGmYZLrWnUqkSQVihfGTBurGmzDMNGW4F7sn0l75trT2vyPR+gPGQLBitIs7K+qLIJ
         JS4xM+Rh6VcKnKy2pLPd579naNsGNffJQ758OgiW/kqRJkAte9peG12BYvG0uDe60duH
         t5K3uN9ytVpg0GsVZZpriwEwLd1IL5tqjwHxle6ZcCgkse5eFseK8lyxAjjOEzkfNtVB
         ACA599k5dqPNyNW1BJJ4UbIUFS48XSDatFYUP4IEpfE/aF1xSssOjl1bb/Y7D5WGBuio
         SX2A==
X-Forwarded-Encrypted: i=1; AJvYcCXdp6ZVrEWDl2r0ykhrkVXpBkALsiJ1vNxUW5Sjx5lxqF9HQbHrkw76DhFw+uuYfK/dTWAfxMux4PxQ5aU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/u4r2t4ubMiuionsPgB+7/nmbNPyF6txqN22dFjpWbEZf/97d
	cQhr2bxMxsBxC6I5FEPt9ySGhTcWANg1Ka9qPaVTjwQjG16+FL1XQlFx4FinlaEFlFTXumyYxl1
	lgzGdJQ==
X-Google-Smtp-Source: AGHT+IF3/E0iVH/vlMLWt9XVgizbCsZM8J/q2ciZDlo+jMfmZ18HWLQgxdx78gP0A2Hywms02HUD6gsHXw4=
X-Received: from pjbnd7.prod.google.com ([2002:a17:90b:4cc7:b0:2fa:1fac:2695])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:46cb:b0:231:fc4b:c04
 with SMTP id d9443c01a7336-233f06ba057mr20489615ad.17.1747962086040; Thu, 22
 May 2025 18:01:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:50 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-46-seanjc@google.com>
Subject: [PATCH v2 45/59] KVM: SVM: Process all IRTEs on affinity change even
 if one update fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

When updating IRTE GA fields, keep processing all other IRTEs if an update
fails, as not updating later entries risks making a bad situation worse.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 6048cd90e731..24e07f075646 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -849,12 +849,10 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 	if (list_empty(&svm->ir_list))
 		return 0;
 
-	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list)
 		ret = amd_iommu_update_ga(cpu, irqfd->irq_bypass_data);
-		if (ret)
-			return ret;
-	}
-	return 0;
+
+	return ret;
 }
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
-- 
2.49.0.1151.ga128411c76-goog

