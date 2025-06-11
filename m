Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815EC2EA486
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682099; cv=none; b=nv8FSKTSPV+DSBaWVtHGxEF0/e4MFbiKyZt0Chi4zm1G0sLJ7dglwibj+Is4WGe5Fz8XfkJfIaTY1jQw4DnY3eaz5iLl6sKToiVI7Zhq7huiArkke2phkAf1omVDBnR8PGzoWzcszB6dm+zfwbb8Ylu7j40sE+Svwa26a6rlU5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682099; c=relaxed/simple;
	bh=CIkDX4NeyEz+bCplX5aJPQm6IavTLLLziMyDsf7mnvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pV5l2UoyQYCfnL5Sbtm6ikSmLgSLH+nkmFuuQwKaQ1tzgDINNeP90Vzh+Sk1IvYvwkV26rSfzvSXih6aon4autrcXujBjKc4S9RxdET2nfOkKgNCXAv/T9nAzI7vYCwwGmpvZWOLytq8u4Rac3Zwp/pmJJQbdr0zJWoTm/l5TQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XChpKgnA; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XChpKgnA"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31315427249so372577a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682097; x=1750286897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OBsMBd1i0baUKewPQxLHxyy7sMDVTDzHxDH7w12EKXQ=;
        b=XChpKgnAAMM21SVqJo313lhNJC+wF9I69bdi/oPDKYQOardhOrqTCcztifo7GITQzq
         Lflh62btwNvZCWVdCKN9NOPdy+FpDIMU4aaBlZjzml6uFQqVkIXwjwd/T04KvOe/APlQ
         Xwxzlp/MhXZOTSvz1prBL5+S0DGWNu17X/eNsIu8+agmiIdIcPNq1TDfBQVYNtuWkrZJ
         Lo0r3QgD35Z7qIHAp5RiQlw78aRDUaJfy+c/mgW0P/2ejSQH3qv7WGfEFjw/Ofo23LCq
         4U1YArk0mCiOKXrHSk5NgCFZIgVHPcuD4VD5Mb0ewgrjJEJ3FD/rOvfNNEhRu7OV/8a0
         KbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682097; x=1750286897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBsMBd1i0baUKewPQxLHxyy7sMDVTDzHxDH7w12EKXQ=;
        b=PnbCSsKMwQsgIXkqlydDYz1wOrI2y+07qRfvFZYeqTTKoWx3K6uKzhnT9PUxG5hd26
         4hUtGkCojZFQbESAV7gmFej0ADgjYc93UEAyNIYS9nAc0nPlJLsBUOrcX1Xl3SChtcmY
         dK180aXY+3PvvnR4+x6yxJw5L6bTIzM9vbHIyvN1lLJ6dt6H0YkKmNF0cFfk41AHIEfk
         29lJwMzUZC4f0gGkyL3nainUSsCc4mejxf+vabyHsFxFXYL1sHzj/I/fIz88DFfwunlk
         IUlct/NGLEzOraZ55s7Wby64Qr+gyYKJpYHqKeh4QG7lnTbeJEaut7xI2Opy4SDSNV6W
         sZRg==
X-Forwarded-Encrypted: i=1; AJvYcCVE0yjOIXz13OEg/e7BVrTaFi5Ru6Soao/hiT4WF7NjouLs3adx3lLLA3vpLgCzDlZo3gdthHgOP+g7btY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RdlX+IBwdshfmbZl29EFqlcbQgy95NYXVcNePDjLjFz+SEYI
	IKfPzotMuMY9NhR5135JU+1LuXDpGLRqEZDJ3YzhjYFZFSkTyGQWBH+Gv1kcXF+vrDJPLp3RtWb
	m0kedlw==
X-Google-Smtp-Source: AGHT+IHBEy8+OKJmY+A4zi/3hTeqSjfA/ttP2bWoyN5/kshTJAQ27HG4vGJt+llsgPQtOFs3CpzMzSvtcZQ=
X-Received: from pjxx16.prod.google.com ([2002:a17:90b:58d0:b0:2ff:6132:8710])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e8d:b0:311:d258:3473
 with SMTP id 98e67ed59e1d1-313af12a361mr7057487a91.13.1749682097123; Wed, 11
 Jun 2025 15:48:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:50 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-49-seanjc@google.com>
Subject: [PATCH v3 47/62] KVM: SVM: Process all IRTEs on affinity change even
 if one update fails
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
2.50.0.rc1.591.g9c95f17f64-goog

