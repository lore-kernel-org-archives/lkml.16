Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13030221F02
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795599; cv=none; b=Zr6lrDy0akdZQvAZVmncDMRIdZNskldVwJCNAOrcK/7saBVonnbm6qXKCad651/1jR/c2iXdJtcTRskcdcfv8ERABaoA4zhzHfMsuwf72E7ouCSuiS/UxxqCFlrMHnrBJgg0MFGkC+PUcL2dHZVtegF5R8++0zje4zjTuHjDFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795599; c=relaxed/simple;
	bh=GCCtnDomY+lLuf5+xII3/z6zqPIPK391FSHfxII0HaA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YOVolOtGNY7jsENa8vh5EVTJfAezLIF+MudJsCzn3JOeXKSWryl0RWA3Cv2dOZj3sIJ5krIRh8ghaL8mlL2C/zocdQMWYvjaB9afP1j9hFeTUQtshRMqsNMDlAAGhKdRLgNk/WCa8MNsvdgXZm9qE1ivAm0OOIDyL85kkuZqAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N1DGtcBz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N1DGtcBz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3032f4eacd8so2299812a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795597; x=1744400397; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wBBmYaZBofsgLugSeNOxbYqcOo/hzEiN1pKLRJ98ixQ=;
        b=N1DGtcBzZpRbm+lZ0QBi87cktItxx/yY+eVgQPV/2zdsZyiBi3pQXbtMmL893VEvgv
         1WHxRO1iz+HWjdO7FzktI1e0R8wvlSShLC2vmqJPR8nDhqcSgUaW6zFS8xEPOV3XrVjo
         Bve36Qe+CYyWqklDuUwQv3IN3lRldrVcc4smuuX+JrOfoEGbl74d/nqP9V13r/toaZsX
         Yqvs2dseKjCRXSOFUgXP4xI11CeORwGS/Nu0YTBDKQVWeNSskqZzr6ZxxNmSLYAuBXFI
         xUB9gVzpA989cbUTt7agWcqxsjR6aB7fDLWGfI1VogbUeUitgJAbKv3RLImHTMUdoImm
         35ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795597; x=1744400397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBBmYaZBofsgLugSeNOxbYqcOo/hzEiN1pKLRJ98ixQ=;
        b=s1m4/OZ7NGmEMrSe+2S5EDYtKtF1GCpjoaGbJCjAKVI4mOKO6IeZ1sQZ2TQzXhxakn
         5Nw2F3tt5QQScUZW+Zwy2NU1q3WPbI7ikCBBrOXRA1tyxqelYv3F4KFT9MshPDyhIGif
         3i7S/TL+ynhUFj148LR6XszyiyDmbQoWtVXmor5Fd5nWjxcqXKDUC+J61YMEvL8wGP0E
         UonmKfN+XUCgnTocl09c6MQW6kUtTV5c9hKbHT3tT95GXQXZjQMwAIL+1mKcAtQH169F
         opiRW059PFuLTOAYHO6hmInK1SHFwuRWFGMeHXuHgA+HeI1DhZPRWB1a8fu8PusP+ddo
         R71g==
X-Forwarded-Encrypted: i=1; AJvYcCXQlNziOuOyd7yf26SR5IHNbqmzAmM5Nr/zy2vA0TQJytD5JIGIk2LqX03LK8XdpQtMgwLB576XsRbkK5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+R3ftgMpTFbFI+mnHzPW6BDG9NcHBinjWsfP2oYUCJS0Q3PQJ
	hxI5il2Ou6qppvyoCV/zHPwSeBhsdmj4/di0LPhEJUNW47HocbOqWyYwcnxcyE5NKjsm8+eutvj
	mTw==
X-Google-Smtp-Source: AGHT+IEBvDLqiwZ4BM4ogV2kWH9PVQzEHSq6D51X+1Q81b5CZqFohRw+cIfM1ejZIuAlzQtHAHcZOhjh9GM=
X-Received: from pjbhl5.prod.google.com ([2002:a17:90b:1345:b0:2ff:8471:8e53])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540f:b0:2ee:ab29:1a63
 with SMTP id 98e67ed59e1d1-306a611253fmr5033572a91.3.1743795597468; Fri, 04
 Apr 2025 12:39:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:21 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-7-seanjc@google.com>
Subject: [PATCH 06/67] iommu/amd: WARN if KVM attempts to set vCPU affinity
 without posted intrrupts
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if KVM attempts to set vCPU affinity when posted interrupts aren't
enabled, as KVM shouldn't try to enable posting when they're unsupported,
and the IOMMU driver darn well should only advertise posting support when
AMD_IOMMU_GUEST_IR_VAPIC() is true.

Note, KVM consumes is_guest_mode only on success.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index b3a01b7757ee..4f69a37cf143 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3852,19 +3852,12 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	if (!dev_data || !dev_data->use_vapic)
 		return -EINVAL;
 
+	if (WARN_ON_ONCE(!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)))
+		return -EINVAL;
+
 	ir_data->cfg = irqd_cfg(data);
 	pi_data->ir_data = ir_data;
 
-	/* Note:
-	 * SVM tries to set up for VAPIC mode, but we are in
-	 * legacy mode. So, we force legacy mode instead.
-	 */
-	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir)) {
-		pr_debug("%s: Fall back to using intr legacy remap\n",
-			 __func__);
-		pi_data->is_guest_mode = false;
-	}
-
 	pi_data->prev_ga_tag = ir_data->cached_ga_tag;
 	if (pi_data->is_guest_mode) {
 		ir_data->ga_root_ptr = (pi_data->base >> 12);
-- 
2.49.0.504.g3bcea36a83-goog

