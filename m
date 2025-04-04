Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CC23CEF8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795673; cv=none; b=uWHFACiacm5zLu9EjORTQrCxFpKfeO4kqno4ea5FASqHxGF6jaCefKLK3QnNa7oLYUEk/NOCgtnsBO4IrdEgytJOlrB1Oc6Whkq3br5116mvJYKb2pCpDB/zt0BmsfuLYcdl+z9q5FcL+kYO8UfWRCs4wpT6cYh5PnHj161l3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795673; c=relaxed/simple;
	bh=KYPkJmO2WKGa6Hqkv2jcYDUkv0LZapz25ye+QSx983M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PZl20tAQJXfAtMWMCUcGK0jzFpq/r2rWKKnvkAdliOv40JyY7CyDDD9zqEFeqPNYgwQlhJakE4/zfR2y91uKE4WKGEk11PgYHjnT0cLK9B0JbZ4Beyebm0JO+ptEHT09inevHvjWGSJ4mAgu0Be2OM7A9gHmyHZsZUbxAx74bNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=emZHNJ4B; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="emZHNJ4B"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-739071bdf2eso1813844b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795671; x=1744400471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BuUmn/v/nxN4sDhjuaKZdNs4Kj9VqwHUaANP0XC6c7s=;
        b=emZHNJ4Bgx+OH+ONebVt6qqPMrMZOspA40S2cgRxABBCl5kNVYE+36Xm4TnuhvHrO4
         NGhQ8eVaZKB4m8b5/MidNdMgq1OQXxfVthYmQhDoN+LJ5mx0yCaWHLof6yaMC4/T/CGr
         njlCZbdEBVWIV18/1MQKhCclAL2ntNrDNL5c055zPjkEaNqKb915HHYPuJOmMFpIsVfj
         w+ROL/kzIajjWBWBFrmLnTklHjyUEiZncCp3Nl4sL8PR6w1fOHHLhJbGmXUJQfdTSKDQ
         WJHAkVualMB/8lwGJ5Kh/xpR0PRMzBAdJw+Ntbq9+z+TVbJyk9DRsE3iRVyew8TI9mVN
         13ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795671; x=1744400471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuUmn/v/nxN4sDhjuaKZdNs4Kj9VqwHUaANP0XC6c7s=;
        b=kqclurQI4DYgi65DSKn+dW7mPRsChqHsaXJYu3MlFKg5UWZ7z48g3wJstcYqXtZITc
         APVAXCUjfVEvxiMGq1idGzeeKUvPo8F/p8OHI85e8fDs7vhZHxHww4T74xBl/DFUGNvk
         9w0prRs3YVM5x25TR5JHcGK6MlFxsUtHbk4IN54JOMJRwHtGCszaQ3VJr3i+doZt4jx6
         vYLf/0UxUJkPZwVJ8y38McPz3z8j09H7vud5wDNein+ksTZJC54ce9WxmRhRoT+aER1d
         2Y5susc7ne5H1nVdkseP/shXDxWy/0PcaRUSiWwZn6VW4a53+dMQXjzZynhJRn2XmzHs
         Z+5w==
X-Forwarded-Encrypted: i=1; AJvYcCVGOi+tuRZ4X5q1OndOvSz0WmP4obrWRv/YH0nLhkQub6/q++ktYaMUDuqKFLHxUwKoTQaqwk2J1sns3cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+XvR3zfo5EorRraj9NhvRVmTSPddYCvuI8X3yPZ22tv7NljKI
	WXbucgOtK84TRDho/0osyd94IPmj3x0MTgMQMktlbRZ9too8w0DHnRvWUGsbisorBSaAgkv7Emt
	vcQ==
X-Google-Smtp-Source: AGHT+IGn6VyFDYgNExRPxop+TDl4ttE1iIR8bH26Vp9Pjy1Orp1wUriDPA6oU50ESKKN1WjXv/GYXHS2yHo=
X-Received: from pfbjw34.prod.google.com ([2002:a05:6a00:92a2:b0:730:5761:84af])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4653:b0:736:a540:c9ad
 with SMTP id d2e1a72fcca58-73b6b8f82e9mr711650b3a.20.1743795671518; Fri, 04
 Apr 2025 12:41:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:04 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-50-seanjc@google.com>
Subject: [PATCH 49/67] KVM: SVM: Don't check for assigned device(s) when
 activating AVIC
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't short-circuit IRTE updating when (de)activating AVIC based on the
VM having assigned devices, as nothing prevents AVIC (de)activation from
racing with device (de)assignment.  And from a performance perspective,
bailing early when there is no assigned device doesn't add much, as
ir_list_lock will never be contended if there's no assigned device.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index fc06bb9cad88..620772e07993 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -741,9 +741,6 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 	struct amd_svm_iommu_ir *ir;
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	if (!kvm_arch_has_assigned_device(vcpu->kvm))
-		return 0;
-
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
 	 * interrupt remapping table entry targeting this vcpu.
-- 
2.49.0.504.g3bcea36a83-goog

