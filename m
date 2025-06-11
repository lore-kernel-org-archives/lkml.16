Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214DB25B1C5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677784; cv=none; b=JzXGnpChLIC/RSncqukTM3SuBT9KWLLbOmyKrWSJ1EM+awtp1t6fh98UAjxbjb09FncsA9wVRPAX+SOyK3cXcoNQELr9/mq6oNWo8243cWBlx2oFzaB1gu0vXR+6+AD+BkhrmcgaESd5rbSYKkNEfCAQRStJbtbSHvxMN4OM60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677784; c=relaxed/simple;
	bh=HU/O+hAQBRCathiCEhtneyg+3txtTnYDWui28f+iNq4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nodz4sFTr/We2qVOxCsxF+dL2shC2ef3SGDddkxe5PLMuo3yOJk0El2cwBHnMklAEebAvZFj2/1oIq1msH+ha/SQq07ERKGPvxI+ETeI1366OlsrQPU5+0BRs1wS3b3nau345YlJxgppl8AHUpXvcYi8kSGGUCkNNsNzan1is7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K6haRCWK; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6haRCWK"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b16b35ea570so202261a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677782; x=1750282582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PIqY5l9QTfLBnGxVH0bNVPmqIZNzodkqRPy8g7rI1YM=;
        b=K6haRCWKfka0gB4LnfmDsj+eWuOP+4xTGOO+EN6DLMmxhRfi37u5gbfvJ/UfmCZt3a
         qCVZ2JoauypbcvpKoHQhInucVDP21kHRLvyXy4WOZ2mTU07YnNXUdTXVWQS0udHKE6S9
         KQWvTu/kgnFVYQfcgpzUPVPfeyiHhsKTbqElF/6ll1B131fMWNO2LofaDVAn+VHi8Jq6
         1vv96eCw8InDVWr5ynLwbjsPegWAnJgbqQZLVuQS5+EyOlBg/2+uSREx0awzMfAtYKzS
         Ds95lQW4oRY79LCX6LANmQ8WyrzPD1mfWNdG9Yfppv8w8Bot9gps2jCmyowXY0HljLsw
         DU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677782; x=1750282582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIqY5l9QTfLBnGxVH0bNVPmqIZNzodkqRPy8g7rI1YM=;
        b=jCjq8wR8TGL74AJGTD5+JYAM5Ga6O57OvSrU9T8b+ki+Uguq9P3VpZnqlJ5bTZiskl
         V8HtPhAD4BYHBSy5W1waS5BxYuD9M0xy1aLf7QeuNNbRNMtOJj7lFiOScZlqbvEJRyZ/
         wHF0QLMXo7qUCUZU97X3iJDVw6pdV9pcEIPctwmPD5BmcdZm5wpiz4CzhKmKTBCBUfQv
         aOpb67aeYgmY4ImlisZLtpKq0Sr7Iz/Fref20KWg/cXm04Yoah8D9MCOuvlh7bF5JT+D
         evsp27NpYRbXpkp24zQ72RQGBPj5GLvL2g/Ftel9AFhTVl4AToC4FKmxP4jIgP2h1Gtq
         My4g==
X-Forwarded-Encrypted: i=1; AJvYcCVQjncjPce3YNPOs7EDH2nwX79f8L3oazD3lRaDIvIkemwA7MDpl6fQKNVAJ5KRr8Mamg0nxrXXzzjGZWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5nurj3/da5HIAvWDsD4EwgK2lz2WyEZ3d6M3WXcV8HjUVExiX
	V9zgruJemFXIUA8C1R8JZYwOvBjErhur8Q+fzT/5ZQKJY+ncubZBpN9NVahB3z0+qsCtmvx0Ehm
	q9gs0wg==
X-Google-Smtp-Source: AGHT+IE4xupnaiqX63lqW3UVbRH6cr7BEnhgz243ASqU8XEvcG4UXXe/TA4G9u/tYDjQoONdqCLDMZz1UGY=
X-Received: from pghc2.prod.google.com ([2002:a63:da02:0:b0:b2c:4fcd:fe1b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e92:b0:215:dbb0:2a85
 with SMTP id adf61e73a8af0-21f9b52c5e6mr536039637.0.1749677782442; Wed, 11
 Jun 2025 14:36:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 14:35:51 -0700
In-Reply-To: <20250611213557.294358-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611213557.294358-13-seanjc@google.com>
Subject: [PATCH v2 12/18] KVM: x86: Explicitly check for in-kernel PIC when
 getting ExtINT
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly check for an in-kernel PIC when checking for a pending ExtINT
in the PIC.  Effectively swapping the split vs. full irqchip logic will
allow guarding the in-kernel I/O APIC (and PIC) emulation with a Kconfig,
and also makes it more obvious that kvm_pic_read_irq() won't result in a
NULL pointer dereference.

Opportunistically add WARNs in the fallthrough path, mostly to document
that the userspace ExtINT logic is only relevant to split IRQ chips.

Acked-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index b696161ec078..fb3bad0f4965 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -42,6 +42,14 @@ static int pending_userspace_extint(struct kvm_vcpu *v)
 	return v->arch.pending_external_vector != -1;
 }
 
+static int get_userspace_extint(struct kvm_vcpu *vcpu)
+{
+	int vector = vcpu->arch.pending_external_vector;
+
+	vcpu->arch.pending_external_vector = -1;
+	return vector;
+}
+
 /*
  * check if there is pending interrupt from
  * non-APIC source without intack.
@@ -68,10 +76,11 @@ int kvm_cpu_has_extint(struct kvm_vcpu *v)
 	if (!kvm_apic_accept_pic_intr(v))
 		return 0;
 
-	if (irqchip_split(v->kvm))
-		return pending_userspace_extint(v);
-	else
+	if (pic_in_kernel(v->kvm))
 		return v->kvm->arch.vpic->output;
+
+	WARN_ON_ONCE(!irqchip_split(v->kvm));
+	return pending_userspace_extint(v);
 }
 
 /*
@@ -127,13 +136,11 @@ int kvm_cpu_get_extint(struct kvm_vcpu *v)
 		return v->kvm->arch.xen.upcall_vector;
 #endif
 
-	if (irqchip_split(v->kvm)) {
-		int vector = v->arch.pending_external_vector;
-
-		v->arch.pending_external_vector = -1;
-		return vector;
-	} else
+	if (pic_in_kernel(v->kvm))
 		return kvm_pic_read_irq(v->kvm); /* PIC */
+
+	WARN_ON_ONCE(!irqchip_split(v->kvm));
+	return get_userspace_extint(v);
 }
 EXPORT_SYMBOL_GPL(kvm_cpu_get_extint);
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog

