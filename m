Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030D22173E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795597; cv=none; b=Ajk/zTvjsHVn4dnexSamiQLya6ZdZJaITUGnsx0RsRdzpjLAoHjUTor+P/5Wa35IDv0fi1j8DawlNE6AimCBed4U6guvHv1zlVAOyqct1dDjvgmvkQ+SNB1qHiqxhbig6nmoU60zF3v+Xp6tDNsZdwI9uGWjzs3McLq9+ZtLchw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795597; c=relaxed/simple;
	bh=El/LUiSqQ2qSjpNZ7D93xQ4xLdhReczWf1b9uZIPSLc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sV94odjt9r/I6VjeTtlZ3sXLcMTgBlCEqxXrzWhKb4UFVSyJOVHPy0DoOftWC3g3lVx/SD+7lhlGKz3uajpCOnPecjG53J2nBNqNbO4KY//EHaim4oHOIyoJhFJQl+ViYadFjW88SzaSSWcM/jl86UPLOA7YMfVMkB8wJLPHIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pGmF37eA; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pGmF37eA"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b2a25d9fso1982838b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795596; x=1744400396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9j6UAaWlpuGUtNDZ5PloVVAXeMJcTkL+Ix626QW6lmA=;
        b=pGmF37eAJErsv3HhD+5YGlLgbZ7LcAF50/Pd3TKXyyEnyNvMEp62EDn17SrXXb5q0z
         RnhDFFYMko5LRt+BSGhW0yoaAIqm9spsVdxHuWuiUN9ZPG3tRTJm8v0yywuJU5p62Bpq
         dPiy8/QfqLrETxyrTuFaOSB+XEE5et3TQCDPax6UZ9z9MZrjikC2v2drLWV/WkJdYh5B
         U0Yd1IejSnIQmgmrkW96XbU9sQqKp2P5PI5Xi9fb6c7VM40w57i0EuoJX+l8njSmTR2O
         MkHhIfltgQ1Le6o70CLOx5Ed+xD+80s0QhuFgtiIp5CIXr0nPjSkznROBHcJcTmt1wN1
         aoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795596; x=1744400396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9j6UAaWlpuGUtNDZ5PloVVAXeMJcTkL+Ix626QW6lmA=;
        b=UJj2av5+11FTatcB7w9F+Ft6D+hGFeBNjIjlhm/zi2vZAGIcQIX7j8A9fYaSZM+ylk
         mnsu5th5KKRTdwUEyVyG7UYJJJPF/qWRZP5+v0Ohn+ejC9q3THSVQPXWfia2NFTRpX78
         SEvvReW/lN1wxPmPpNq+IazpyjhKIb+1wO0Tkpb9tm28rGeT+ZHYwiItp680bczwjOKb
         DVPiImnuKeYi7tfj9stiM1loTAbDdUf9yKAzMRJf1uc/Nh0MvCHWbsBuW0AkylY6qeKV
         BeTsx3+c5vJeOh15gYd+WhkYMuRaz/tI2BO7aQ+MDh3I6XQqBcsXjI9otSop2wPirxA7
         6Iuw==
X-Forwarded-Encrypted: i=1; AJvYcCXimjHwmbPDMCr/QLlQVeDD7iTgjW9hrViist+NvBeSnS8aJCxkfLf+xlrsif2bWM7h/0AYVdMqVlBIiAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvU4q5NeTN+SidyOkCk4UzeNiVI5gvEOghj2DEAJuh0+IahZo
	0+1W6zDoSMUZ/DtvU/SrCa2l+7Vra1W5wYMpR3EzlHBQDQr1tQ6e1p67J3c4EjJADMEPUXqIQ6R
	NIw==
X-Google-Smtp-Source: AGHT+IHxE6ieJP/dqM4OtZ03l/OzhOac1l4SZVj083VbfNgDZX7xJqOUlyT5SF6DOaOv2f4SNNau/XxOkn4=
X-Received: from pfbjo41.prod.google.com ([2002:a05:6a00:90a9:b0:736:3cd5:ba36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a0f:b0:736:4e0a:7e82
 with SMTP id d2e1a72fcca58-739e6ff6b10mr4756745b3a.10.1743795595718; Fri, 04
 Apr 2025 12:39:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:20 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-6-seanjc@google.com>
Subject: [PATCH 05/67] iommu/amd: Return an error if vCPU affinity is set for
 non-vCPU IRTE
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Return -EINVAL instead of success if amd_ir_set_vcpu_affinity() is
invoked without use_vapic; lying to KVM about whether or not the IRTE was
configured to post IRQs is all kinds of bad.

Fixes: d98de49a53e4 ("iommu/amd: Enable vAPIC interrupt remapping mode by default")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/iommu/amd/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index cd5116d8c3b2..b3a01b7757ee 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3850,7 +3850,7 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *vcpu_info)
 	 * we should not modify the IRTE
 	 */
 	if (!dev_data || !dev_data->use_vapic)
-		return 0;
+		return -EINVAL;
 
 	ir_data->cfg = irqd_cfg(data);
 	pi_data->ir_data = ir_data;
-- 
2.49.0.504.g3bcea36a83-goog

