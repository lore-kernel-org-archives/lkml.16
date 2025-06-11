Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705192ECEB8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682115; cv=none; b=AErF/ER3d6+w64Mt1woRc9npXKU1j5vpZ9YGlcA7M9C4n9Ypo5sjXsp69EEBI2A3teF/uvDiVHdKlENoKszpfYdjDvam63+X1dCoh87gcUPtIuoeWVbEuxrkAdqFJfffqb3L8Gk9haFLAOqfNeZuLWF+mOzBK0f7Q5m0wiuCADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682115; c=relaxed/simple;
	bh=oClo+BVpPugtrWJhwqiJOJyGd7gX17MvqJmd+Hb+bsE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JGGtNSScI3g5Q/sE1teVdxfv2bmz5A631ttJACZFEIPcgGSvwcxToueznOkWwICrXkgEn84om6kr/mLEdN+iPqTzIvnB9nO/LnItQgDi3dl2203OoPiXzWwFLmWRcpERX/e6OsrOWMneP0Q9fNkzcdQF7qfItb6ZKhcXWx4h4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OP75ptim; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OP75ptim"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747cebffd4eso233615b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682113; x=1750286913; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wAqMQv4ZCiS/o57gwDnKWsXRvD97E5JGl6V3dBiKRrw=;
        b=OP75ptimfV4GgJxdvKZQ6P3R5KDdhNrkj8rrwLfEhhtIRVFxuLZM9yPBfwjGwz/30I
         kiQ0AUTg6qRvgg4PL6GKAy7JA3oIaLPQ0KKV7t9foQsVjUaCb5QKUxD9Xq9w3eYs0OQj
         0cXm2uS2qiVuOaOHI7LnMHO/3wseKNNiMnu/iKHBzc4GkN1V9KOhsW4b7qeFgBFKYD0S
         jw7mxRyl5vLNbNkEJDaXBH06RUw+86RqGoB6j+7cuNv4QcpUnYHjPS+FqJlVRG9skWU1
         odKsZNu5RFmGyAu/De9iAn6RpLnAjnprRjc6W4ojhGIyDMgH/O196CQINm3f59EvXw1i
         ZO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682113; x=1750286913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAqMQv4ZCiS/o57gwDnKWsXRvD97E5JGl6V3dBiKRrw=;
        b=uISllznRn+8kil0JR+e7oXSBq51RdvJ8ISsvUvZ+lgH6qDNflFxNCvU5WWVESm9TMG
         KRWNgOnwQv7Ke1dUxk053rxxSv29I4kFwDuxrxR6TdxtLD3jNWopydsKwEprXyhkPu/I
         BywD+2zw+yoD0xPRupmM0A5y4v1ZnPW9xYrG2NBDoFPhYFVSkpWSJxbhDGIeJPEYQA4z
         DHvsZ2qDZ60+IUErpHU6zIaTqmbcWfsTDbnUTXlkf8D6H5iF0LdrTQ66Oea6SDtO1214
         8nBQqUaaXRldlBarIIO1B+J8rKeDC9RfvIOroBT+wkSEGw8aJ60vrwDfo2JEC6SrD58m
         DxMg==
X-Forwarded-Encrypted: i=1; AJvYcCV7miFp0F9y5yn7nrGUjvoqXeLq2xpqiLf2VN9yxIaZPj6XnjlljNA5G1Z8YiEwTIW9jgeoOH09DZ4gyOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zIqiJhrf4FUd/rA2UDi63ZbN4E6SZQy6TfvEPA2SAHYZrUgn
	+ON7aY3gFfA0m9H2hGNerHCfLAhSaTHRG5Kid5hB+3taz8DRUBvb3H+12EjEs/Fag+5fNQdKsWj
	0x+zfbg==
X-Google-Smtp-Source: AGHT+IGWXeo6wLxobJN8weuZ+dD2iRb7MDLZVxncM/6se6ioUirEafScJTOie1Jy0cagndCeqMrM68HvN2k=
X-Received: from pfms8.prod.google.com ([2002:aa7:8288:0:b0:746:1a7b:a39a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a86:b0:736:5f75:4a3b
 with SMTP id d2e1a72fcca58-7487e0f2cb6mr1014723b3a.7.1749682112843; Wed, 11
 Jun 2025 15:48:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:59 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-58-seanjc@google.com>
Subject: [PATCH v3 56/62] iommu/amd: WARN if KVM calls GA IRTE helpers without
 virtual APIC support
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

WARN if KVM attempts to update IRTE entries when virtual APIC isn't fully
supported, as KVM should guard all such calls on IRQ posting being enabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index becef69a306d..926dcdfe08c8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3836,8 +3836,10 @@ int amd_iommu_update_ga(int cpu, void *data)
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
-	    !entry || !entry->lo.fields_vapic.guest_mode)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry || !entry->lo.fields_vapic.guest_mode)
 		return 0;
 
 	if (!ir_data->iommu)
@@ -3856,7 +3858,10 @@ int amd_iommu_activate_guest_mode(void *data, int cpu)
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
 	u64 valid;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) || !entry)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry)
 		return 0;
 
 	valid = entry->lo.fields_vapic.valid;
@@ -3885,8 +3890,10 @@ int amd_iommu_deactivate_guest_mode(void *data)
 	struct irq_cfg *cfg = ir_data->cfg;
 	u64 valid;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
-	    !entry || !entry->lo.fields_vapic.guest_mode)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry || !entry->lo.fields_vapic.guest_mode)
 		return 0;
 
 	valid = entry->lo.fields_remap.valid;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

