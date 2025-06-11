Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBFA277CA1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682103; cv=none; b=NkhD/fkN1OB+5/oNIObPLEFXPEhMSOML3X0uOqfTVHYt/eyXHzkkD2ROBdGWzZuQOK7Puy9Z+7pXN97G2LDza6adwddhCIl7aNlS1Lk58egR+4yxvtu7Ws15LI1Y2j3k7Ig9lYtJY5e8Dty0HXK/2co7VsjVSLuWgiDpmmMbARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682103; c=relaxed/simple;
	bh=NAxK4l2+eFBLeYnDW4awSCXzYKBMMUzoga23UMMP12s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WT9v30afu/anTwVDWBj4SZ9av/6wgI26e+UgakZhAPQOYxVqZ6bqV1A1BnkMfLVYXZ1chKK0Mi9OEd299ToUIcfOB14UEe66E0qIHj4DRzXdHQ47RZRRcyS/YA4gcQCpRnbonmY9DqB9iuXONYQ60chqwK+5tsRfGtNbDkEUoko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eFUtXOLZ; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eFUtXOLZ"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-740270e168aso253972b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682100; x=1750286900; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4mZdmaSdm4nN9o3kcSmnCQqm8oVomLbyxtnfKwvcz+Y=;
        b=eFUtXOLZhkiugYukRt7lOk6DzLCcuHUOmBCIwmIrEFW/EZIMsvSwUyLukD8mxO6ynk
         FE87xpXMdcQgVcLJw5NbyeuqM7p6cI2hXWEke0ZjIZ7BIwozFfNS0RPU8bdQzi//5U1A
         tu9VaaD5fNcF4XEIC359YPkeJLemG7QkenK859GhO/JZ0LFnrxzzooK8pVTk5V52El8n
         GHfBfQEEn69Nc1dtRb/h7fwPPQZWBLCbDeMIZyqriD3etIBsbzbeB4MpzuODuI4JbujH
         pyz1AK/MiUY3IVWmxbiZFYU3QpNvq5WcBBNBm6oYs0nFXNLeLntUKSkCdJYWTLZ1nbU9
         tjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682100; x=1750286900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mZdmaSdm4nN9o3kcSmnCQqm8oVomLbyxtnfKwvcz+Y=;
        b=a80ewxlJ1mNfNpAplHleOKWJiZwd/Q4e/GNTGIGnqbW2YmfACiHYpdRuLM8E6xZDZf
         cFm0t99xFn1YG5et6bXnNpGOeLipKaG0iiicoAXebcQGmx4ZHM4pgQ6YK0vx5AtbZIL3
         LtkY+EMPCKqeKVwfb4Wc+ztClzT5tCB8e/bJzVrrfn5qlaUQQvQSBpLNHqY3mTPy7tsx
         tlm3mKSe/TANIw47yHJZd3me/+xMejrlvit2xOhQeap6HxZHuoKnvdxyLfOt7P/DN78A
         qETFCrTbriOZtuBMgYHoFtfW5b+x4HQmg2VzyzZZWutf2pZv+KwM/gRo/i4KaBtP/55j
         eKWw==
X-Forwarded-Encrypted: i=1; AJvYcCUaqBFJThlpAMt5gzIBPPfMgpXUn0cP2s6hLpOqgaP39rsLSyh4b43cTky4WEvI8hAHeAviRMB9Lob8/U0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaeQtZlay3bczH/PQyxFc9F8rohH7kSzdgI5Nk5j+xduNPAvj
	ZH78hY2rLbHdM5bXSpgPLYq0Es6ly1MQmgdRt6bgFws9uuoBfaHrSwWGNppKjiUulXoKxGsDYD6
	SPQrR9Q==
X-Google-Smtp-Source: AGHT+IEg+AS8QoF49j7jfT3TPcNYHFW9Ujm+mi8oTh+WHeby3lk+SesimVareIU6PzlpR4BED7xC7oESYEc=
X-Received: from pgn7.prod.google.com ([2002:a63:d47:0:b0:b2c:4d7e:b626])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2d43:b0:1f5:56fe:b437
 with SMTP id adf61e73a8af0-21f86727b69mr7698366637.32.1749682100654; Wed, 11
 Jun 2025 15:48:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:52 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-51-seanjc@google.com>
Subject: [PATCH v3 49/62] KVM: x86: Drop superfluous "has assigned device"
 check in kvm_pi_update_irte()
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

Don't bother checking if the VM has an assigned device when updating
IRTE entries.  kvm_arch_irq_bypass_add_producer() explicitly increments
the assigned device count, kvm_arch_irq_bypass_del_producer() explicitly
decrements the count before invoking kvm_pi_update_irte(), and
kvm_irq_routing_update() only updates IRTE entries if there's an active
IRQ bypass producer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 4119c1e880e7..45cb9f1ee618 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,9 +517,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) ||
-	    !kvm_arch_has_irq_bypass() ||
-	    !kvm_arch_has_assigned_device(kvm))
+	if (!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass())
 		return 0;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog

