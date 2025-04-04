Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950C24EA98
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795693; cv=none; b=Bj1LRq195Lhpgch3aXAFbMUhjMefPGkb9lBVGM5ZqfG0fseWaskYVYrKsb1NH4vEjEhdpqNTNWahUDyM01qdBQXY5Iux6gXuDJCNGfW0xt60QYnGBcWBjiI4tjYY43MhpM5MrTb4sxQaihckDAVE8dMl/ltolFN45p+VihtM8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795693; c=relaxed/simple;
	bh=LM/a78fswUxarIaB9yJdchQ9AVFZwyJ7vf9uPLLFAxs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJQOkA3f59m+Ss6T0zHINYceP9xC/bfDnkFoJBOOEy6iYI1IksMR6DOc3vrN+Z/73n5V5Z++kTwTNadp7tdZKhRnTGC5v0IBeqjmyngdBRrMc2io/TfKB4T4mepeR3ukB6aGOzjGJcOWg1ujqvO+xhw1b1Wn3QDTAyjZteou31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IsVNqCQr; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IsVNqCQr"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7369b559169so1803642b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795690; x=1744400490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WUo/P/nbSyKSB7hDI08Ajk4szbLYpfhAgRQ1J5OUkMU=;
        b=IsVNqCQr+F3fdQUnityMBvVU2Jl2S0/RjIgEADXtzlT7I5ZvpQ3e81+BbkKJJZSMEc
         8/5i4ww2Af+xLJ2JWrryZoHNYNR+CWuZZbw5yU/9kR/cIF/xEm9tnKB5EbB/m7eOM+Zr
         t9Nbx1KR3I8D9c9a/gUJ0nvge/qq3kC3t0UR5MadRoDgwaZhDDgwBAG5rIACDRzqL5GB
         FtUA/C6LugbqUQ8Trgw/KhwQ2Vvozcro2VqHe47vecLWKfkhvMULWEdMCCBncTfDsDCQ
         wDhQ+PAbSECCAxTlRKN1ZXXqLvWf/5LCK1J74ZF7S1/K9sBFpJsOT/JDwxT+OBUOA5FN
         OXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795690; x=1744400490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUo/P/nbSyKSB7hDI08Ajk4szbLYpfhAgRQ1J5OUkMU=;
        b=Q2uUuLMMecOWTLV4PKtYDbuxoYaGizuqc8KvoMJuFDKBYCynHsSgiZSEou+Igb6wxO
         dKX3UpwWImIM9MpnfJRy/gseYnuLGqg9SIxN3m/gQ+dK3pCs88DeJ/9oTao1l6Prtt4l
         83UQ5iqSunyMm118JXbKw4Jb3HV/CM/QmcG9taKzV/ILXsuwXJgIHIyi8QVeB8qGO17E
         W1Xudfoho9eBA6+UjxLz7gVZYIGUf7kdVYO132vCJuWMR7IUrPb1PC93Tg6ccWGTBkvx
         7ujsqrwUyXgSutP0gK7cZTviTAT4i9JCiJeaplhlSRidYufgGT3HeakBg0t1e096Uzr3
         M/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0yaxmODvduvfCCx7HCvgiSKq0/g2tTOYhkzhI0zYKj1Kkq0dedbpuJtWzEpY4Sn431SWqlIBXJbhRag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5RkOoamXWFJoTusra6ku30C8pdcos85GiAk4UKo2kuCycK3X
	VQ93eE6vTArKUQOAtgdbIoCOmcMxng0LqurhAllIQTpdpz0DDCRBE2h8Zm/YFXo/wSL4qbXmWxP
	a+g==
X-Google-Smtp-Source: AGHT+IFrffkAJKPjpzU/UB+RZgd+9eYfpIMh5YaMNutNyipzajp2Id7VaNjJc8C8Wc5drn94Lg1LW0x5Xkw=
X-Received: from pfbld6.prod.google.com ([2002:a05:6a00:4f86:b0:737:30c9:fe46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:130a:b0:725:96f2:9e63
 with SMTP id d2e1a72fcca58-739e4b7b2bdmr6930633b3a.24.1743795690483; Fri, 04
 Apr 2025 12:41:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:15 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-61-seanjc@google.com>
Subject: [PATCH 60/67] iommu/amd: WARN if KVM calls GA IRTE helpers without
 virtual APIC support
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if KVM attempts to update IRTE entries when virtual APIC isn't fully
supported, as KVM should guard all such calls on IRQ posting being enabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index a881fad027fd..2e016b98fa1b 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3793,8 +3793,10 @@ int amd_iommu_update_ga(int cpu, void *data)
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
@@ -3813,7 +3815,10 @@ int amd_iommu_activate_guest_mode(void *data, int cpu)
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
 	u64 valid;
 
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) || !entry)
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
+	if (!entry)
 		return 0;
 
 	valid = entry->lo.fields_vapic.valid;
@@ -3842,8 +3847,10 @@ int amd_iommu_deactivate_guest_mode(void *data)
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
2.49.0.504.g3bcea36a83-goog

