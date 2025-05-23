Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61121CC4F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962023; cv=none; b=beNJ/VXwWonyZxDU+uR4jMo0gkOrpjjKHnjjcOhAj5YBGvooWH3sfYiDokhQDE4ro0aNfCWvG3aFEIhB5ZOLQv2Wx2N2PBLLOx/Y8DN+o2fU9GP0CPINPYLz5Fn9AwCTY5KLtD/jfuCkg2/qHm99ZBSoYL08t/0NIaGBJi6vI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962023; c=relaxed/simple;
	bh=aNmoBC5BL5ItcJ/WDwb3zDPcOis7QcSa1BwF4a2ekgY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BRjg1uPKB4g+EiX35/jYHZCdUn53tEhMAzO9yzG+nIg7w4lxKHDLtb/n2bKHFe+3PAjzR2Tj60dZGRRXjne4MBMlHifi5oMrPNkF0mHBUnYY0+PENhQOrVF/tiQVvUJZp7wY5hXRTQGEfGgVAwD9Bc9WerrgxyzQqZ7NzBLSL/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xwQ68Jkg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xwQ68Jkg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3108d5123c4so2086588a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962021; x=1748566821; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RwZHc1ywJBDFGfINHhpI7dwV0ed9uFhVGKRmUUyRiuk=;
        b=xwQ68Jkg2qRiwtI/W7HJPLIhVJ0RpJCnhYlTA4uRnMzAYgqlEPF2ybXPo7y72Q4I/4
         vNlT5aDtovCt5V4RAwjpkSaIB/3HAHP/Fn79a3AprySugLqBZm1EuM8qd2vUpub33ZqM
         DEx03IS9L2rDvRu7aA7CEpOdZg1JtRAWAenZqRst1FRf3OXAMwB6WGY07ZKSlVGdoWz3
         bqx3cG49UGvhWJHpfd3WcPAxcbD4qMf1lyEJhz47a+MRu9JhtQ9WuYT+lTZuOBHfaSdj
         0PgC+Ht8j3XUBNWh7zO0ltKBhTos6WLOzPQWYxS5puiAxPFcO+EFOnhYWwLP4EWh6rQm
         hOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962021; x=1748566821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwZHc1ywJBDFGfINHhpI7dwV0ed9uFhVGKRmUUyRiuk=;
        b=c1Z4Oam5WFjmbxkH1aX9FcU/WvY3n+DHcSo+DVtZqQFJKAvwQpPMUqpncdUV6aq3fR
         hloYlnrcDOrfMZtZmLSn0sZoOI2+0v0hzdGd0jIu2fSe0Rx/k95ID7Hs4OeM9pu1fj7P
         yOFzzGnEdbttYynmEV4oS0BrHiOPgEDhqMBF7UPneqnN9HS0qEI8EMUaO7ICPS6VUzoD
         W5T0pI2Pem+nuzwjbNJWRw86x6Olwk9QDJAylwz2XLF1q+hw8aEJnjT9wCdeakB9GgmJ
         lMZ42GXvaw+4zj6A2PU9MB3zzj4dRDGUjCDgsoGAhfZfDheOZKjEBzibMXMuQjpY6ome
         UhIw==
X-Forwarded-Encrypted: i=1; AJvYcCW6GgdtWSFVaZRF8oSLXyHrbZ7yxXcIVpRBRgdU3sw8h6Vdli921PmsRMN8mTVOFUwbcEab0MGyol6HUIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYeG+5LcsdqvZ9E65AoWrPDJ6TGZBgMYI6ZIE9pVInBANbiry
	kg0ANgyhja+Nz09O7RGkS+48PuxjyDa5dTn4r7+PQU0eEa+9IeoDJ+s1v0Nund8gn1LKmggodfq
	hM6ZdIA==
X-Google-Smtp-Source: AGHT+IFArGigRbQ3xY6m7aPjNKtLLh8N+euULRawZd3DzF9QWqKL/5ofHFtPHZbDhE4jbFVVScTN2jPKnTM=
X-Received: from pjbsg3.prod.google.com ([2002:a17:90b:5203:b0:301:1ea9:63b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35ca:b0:2ee:f440:53ed
 with SMTP id 98e67ed59e1d1-30e83228de0mr33805240a91.31.1747962021097; Thu, 22
 May 2025 18:00:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:11 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-7-seanjc@google.com>
Subject: [PATCH v2 06/59] KVM: SVM: Drop pointless masking of default APIC
 base when setting V_APIC_BAR
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
2.49.0.1151.ga128411c76-goog

