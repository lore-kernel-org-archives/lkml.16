Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6612918F4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962078; cv=none; b=N5f2BR51JrCL8u+gr9NpkNArL74smARGs+PuaYA2ULRX0Iv+R7YpbWHGmNR+e0UoX2EGU62Twgi3rkvMQ6IrFAidsGmZapf7UcO6V6/WzmjjMZwPtRSHF3howGVUryfOymT4/GE6Q4M2k6cNPtVDkLyuxKRnGBu+O5DuaMXu1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962078; c=relaxed/simple;
	bh=OTyd4z4G26pTKv/gtSvFLn3KOsoDuaV6Uaii5aU2CKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HrrVirJrvxrrwGh6IhleyqRmR9E6HfnFoB4W2Qz28wR1chuaxb9kYOMb36uPsSI1n0C71hneEpZf3gRH2+sHdsKJctGAqLsZbrPgHwG38wh7xvQd6Y4Ekhha92ST76bN6xdSdRFpdb2lrNCI2dRAsqHuFHgrBfykTU8o3OY+DHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QebTaCgn; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QebTaCgn"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2320502023fso54840945ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962076; x=1748566876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=v1/xwskHEy3a7iwKlZ21odoIzGy2RsxvZsd2bkDzu00=;
        b=QebTaCgnAdCEG8ZT/5OYz/P3ldJeWrienJm9h910NBlbxBoLYrG8z+gdqBoa1aKgBP
         JBgra85HFKiUJRh3mfHn2Wg/X86skXciEmg39xpcqA4g/yr4v1RwdPhFgS5ApFcsexpP
         TT+A3sxX1S76CQ5quMrWBnnpXuJ9ZxBn1pRLQ5Oi/4eEUSJJWPUl2hVmZXY8p9/RzkH/
         PLjo4q/e7dy0xkNYI6qKV/f9hRN5B0p/tPf2ipCb7HYhHDHr6cZHPY4opTqRkOUKw2kX
         8Ch04U1hJOORFwH2/CDIcU/NI7vz+mhWgAXZZyaIhuNeU4gd/2dR1ROEljLuVVk6+NC5
         gIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962076; x=1748566876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1/xwskHEy3a7iwKlZ21odoIzGy2RsxvZsd2bkDzu00=;
        b=Cz14RCulaWdU4zOSm7mwcIoOlIUo99TalVq7qHVgoh3g38G/5M9blFxArSw+F4w/wl
         sXTUNV58imgiMTXl/ZxG+AwA/ZIDf6vIHvO+UNH9luY+LAvX8WuGtJ7Eu3hP9SRgh0oE
         vEQXwEoPYjhF2WaJEKsJ7r2Uhz7HioUM16mAyn0M8TvxMVFgybIkYyFlNdVlWn1Pac9X
         k0DqKr9M8yREmKhOoR3s9p5UKvBkJgg09QfWO4xEP7zQolrPSKAEyajVO/o88hoyoVTn
         zsRQcxOMwkWD292Zs1cse4dHC7f4RE5WfXINiH0shBfN2yTVN59NWOQXchCGGIw/NEvC
         yBwg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8S6yyIOlfj0BuMKR/Quz957KzurskjRRsCtGJGATMuu+RLOsqTzs4HEkbpuazrfZ3PYmyh2MOYH2P34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+Ry7xnN8w39na/iKi//9fv9uqqsEZBKg1efSRCqQ8BQtmS9P
	2h6KARBf1ijzMnAScvmEM5eOPFO2E1ztJ8Rwm55/a+qKaWJYHiKSPe8trNWYhWk94lOTge1K/hB
	ddNHJzA==
X-Google-Smtp-Source: AGHT+IHjCMH4aai/H7vZNCaUw2MuOMj84va8p0PVDKonC3W735IHcQVEgyMS2pGd5RXUwW7ue5Pu6DTe2ak=
X-Received: from plbq8.prod.google.com ([2002:a17:903:1788:b0:223:551e:911c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a43:b0:215:b9a6:5cb9
 with SMTP id d9443c01a7336-233f21be86dmr16748935ad.5.1747962075669; Thu, 22
 May 2025 18:01:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:44 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-40-seanjc@google.com>
Subject: [PATCH v2 39/59] iommu/amd: Factor out helper for manipulating IRTE
 GA/CPU info
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Split the guts of amd_iommu_update_ga() to a dedicated helper so that the
logic can be shared with flows that put the IRTE into posted mode.

Opportunistically move amd_iommu_update_ga() and its new helper above
amd_iommu_activate_guest_mode() so that it's all co-located.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 87 +++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index bb804bbc916b..15718b7b8bd4 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3804,6 +3804,52 @@ static const struct irq_domain_ops amd_ir_domain_ops = {
 	.deactivate = irq_remapping_deactivate,
 };
 
+static void __amd_iommu_update_ga(struct irte_ga *entry, int cpu)
+{
+	if (cpu >= 0) {
+		entry->lo.fields_vapic.destination =
+					APICID_TO_IRTE_DEST_LO(cpu);
+		entry->hi.fields.destination =
+					APICID_TO_IRTE_DEST_HI(cpu);
+		entry->lo.fields_vapic.is_run = true;
+	} else {
+		entry->lo.fields_vapic.is_run = false;
+	}
+}
+
+/*
+ * Update the pCPU information for an IRTE that is configured to post IRQs to
+ * a vCPU, without issuing an IOMMU invalidation for the IRTE.
+ *
+ * If the vCPU is associated with a pCPU (@cpu >= 0), configure the Destination
+ * with the pCPU's APIC ID and set IsRun, else clear IsRun.  I.e. treat vCPUs
+ * that are associated with a pCPU as running.  This API is intended to be used
+ * when a vCPU is scheduled in/out (or stops running for any reason), to do a
+ * fast update of IsRun and (conditionally) Destination.
+ *
+ * Per the IOMMU spec, the Destination, IsRun, and GATag fields are not cached
+ * and thus don't require an invalidation to ensure the IOMMU consumes fresh
+ * information.
+ */
+int amd_iommu_update_ga(int cpu, void *data)
+{
+	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
+	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
+
+	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
+	    !entry || !entry->lo.fields_vapic.guest_mode)
+		return 0;
+
+	if (!ir_data->iommu)
+		return -ENODEV;
+
+	__amd_iommu_update_ga(entry, cpu);
+
+	return __modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
+				ir_data->irq_2_irte.index, entry);
+}
+EXPORT_SYMBOL(amd_iommu_update_ga);
+
 int amd_iommu_activate_guest_mode(void *data)
 {
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
@@ -3985,45 +4031,4 @@ int amd_iommu_create_irq_domain(struct amd_iommu *iommu)
 
 	return 0;
 }
-
-/*
- * Update the pCPU information for an IRTE that is configured to post IRQs to
- * a vCPU, without issuing an IOMMU invalidation for the IRTE.
- *
- * If the vCPU is associated with a pCPU (@cpu >= 0), configure the Destination
- * with the pCPU's APIC ID and set IsRun, else clear IsRun.  I.e. treat vCPUs
- * that are associated with a pCPU as running.  This API is intended to be used
- * when a vCPU is scheduled in/out (or stops running for any reason), to do a
- * fast update of IsRun and (conditionally) Destination.
- *
- * Per the IOMMU spec, the Destination, IsRun, and GATag fields are not cached
- * and thus don't require an invalidation to ensure the IOMMU consumes fresh
- * information.
- */
-int amd_iommu_update_ga(int cpu, void *data)
-{
-	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
-	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
-
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir) ||
-	    !entry || !entry->lo.fields_vapic.guest_mode)
-		return 0;
-
-	if (!ir_data->iommu)
-		return -ENODEV;
-
-	if (cpu >= 0) {
-		entry->lo.fields_vapic.destination =
-					APICID_TO_IRTE_DEST_LO(cpu);
-		entry->hi.fields.destination =
-					APICID_TO_IRTE_DEST_HI(cpu);
-		entry->lo.fields_vapic.is_run = true;
-	} else {
-		entry->lo.fields_vapic.is_run = false;
-	}
-
-	return __modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
-				ir_data->irq_2_irte.index, entry);
-}
-EXPORT_SYMBOL(amd_iommu_update_ga);
 #endif
-- 
2.49.0.1151.ga128411c76-goog

