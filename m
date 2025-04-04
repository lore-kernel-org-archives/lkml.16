Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA323F420
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795677; cv=none; b=Fq4GGRkizcJGJ+6UFE2GWdYHIDFnizOOsp2lqdk4fl3tuZ0Zfv1Rm5JFL5I5otBVIkK/Q0PayG5HFahA34JJSBos1S0uPHVp/pCPIBgFxuJZjlp6po8kX32Ogk9s1cXuqHLvE7BiJVWvxf2j7pV5sFT1cDkRxSOJsomlSQtv/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795677; c=relaxed/simple;
	bh=bysiSM9qAdo7w3jTZoibNt/lKzOp1jzLwij4XBANYyU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rNxBwkbNXkbIF4PupvtbqceH8KSQ/UejfY452Qtyb6I1MLtAvbS+Uo5tftxMsz55lcLpTUVvAKRH3yxZr+wO2xQ32JKFRiB7M1nFcGyohUsbSTh2zL7t8TIwsMNJojDmAiQ90548I/cQVqhpR5NsuY0BilAR3LeBH8N9+teak3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WkrHZhfY; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WkrHZhfY"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2264e5b2b7cso21471345ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795675; x=1744400475; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PxawxOY/h734lZVFn8ksHoL6g5gCibnUodY00H7f/TU=;
        b=WkrHZhfYe1iUaHMHjDItttTvLzKSkVsJJUSGRvxNkgSWZIl3o6p/KnSb8TDip3Km5J
         WGnwufhyvRwOu6lKJKihS6Otwe3GSyIjHV8KGgfxFJiGBEpOXiGqh278KHE7j9jWreFc
         GYrcys/j7DadpbZX80V04iZLI1ZTFJ/LRPDjvzZN2zPKxsBMphn3EIXUInsi59BQ/WLU
         1QA+AgtErReP3H+/WpbR4D48Anxdghp50PMnfYeVUydNA8huN8kzp4lavDM6JFA793mt
         inRPEDqvOXBZ8VAoWYtcM4QHiq8X5QVFSa6DWpaquHViIy8m8hiDiVUaKCrodGNTJsqr
         zUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795675; x=1744400475;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxawxOY/h734lZVFn8ksHoL6g5gCibnUodY00H7f/TU=;
        b=hSWV6OrEnKwLusvqu2Ng+EfADDLiR+N2g9FBKigr2dIK0m4axGqY2wnZx0YHcXMdH1
         AyywGsJJFlJdHbg6qFx016Utd3HdnjAPtOfxi/NqfRuf3efO1EoCH0mSZfVdCJGihAzY
         0/MRvfywFzcIeokIPol7NLJH2bFS2Qj8+jDwh30M8elG1TYUpoxSLhyFLboA40ZFc3Dg
         2++oKsyglrV6U3fqbxYMB13BL6G/2YHTF0tQUaNeJoiG1OcGZT8sv6usQxbeanIw5Wac
         0nyUbz10ixGaKLaAWYS7MxszeBXZpLHcs4W5oHD1ZH4rJZvO/L8+iR3oEczNAMZZ16Mi
         OcUw==
X-Forwarded-Encrypted: i=1; AJvYcCX9V7+ifPezjchinefPtV5j4srR+XUuBIoh1bcq82Za1viS5rXr5KZpXItfQLqEsuWmv/l5mYrBDJ1TT5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf2qNbYwZuCcE+emNFpWA25bjLAyj+sejNmNSIzACQ1+XChYRP
	8cqH7QyKSZ6NaSyFZNfdWqjBoCKzBMnL+QgdLeAgWcOCnwp4o8oDooipZluxhIXmQtuc1Tw2G1b
	Q8Q==
X-Google-Smtp-Source: AGHT+IF0dzvMV/vshjJPGocWxq0fkVPPJN838E/ImYVh1WQmz0SFa2CAc3x62alWuXzKlUZkk5y4MEI9SnQ=
X-Received: from pfbgs17.prod.google.com ([2002:a05:6a00:4d91:b0:736:56a2:99ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c66:b0:224:191d:8a87
 with SMTP id d9443c01a7336-22a8a8739e2mr55191535ad.26.1743795675258; Fri, 04
 Apr 2025 12:41:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:06 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-52-seanjc@google.com>
Subject: [PATCH 51/67] KVM: SVM: Process all IRTEs on affinity change even if
 one update fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

When updating IRTE GA fields, keep processing all other IRTEs if an update
fails, as not updating later entries risks making a bad situation worse.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 5f5022d12b1b..5544e8e88926 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -857,12 +857,10 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 	if (list_empty(&svm->ir_list))
 		return 0;
 
-	list_for_each_entry(ir, &svm->ir_list, node) {
+	list_for_each_entry(ir, &svm->ir_list, node)
 		ret = amd_iommu_update_ga(cpu, ir->data);
-		if (ret)
-			return ret;
-	}
-	return 0;
+
+	return ret;
 }
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
-- 
2.49.0.504.g3bcea36a83-goog

