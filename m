Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819222F3BE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795653; cv=none; b=AazEFK3IUOHKfAlSo49/ra9FJ34+QWKkDGgTHyYfFTiWtgV3rxhr8hNZXm60xEEu8W3WRDR2jyq0h7LfF8ctMwvlk3/uMmF0wiGA0X8Bg/ZwCLacQtWXBxcqAAnwVELHsAHmDyFYdCLf50hrzP1Ac2KZOQ6alK+FMYRbAaSX+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795653; c=relaxed/simple;
	bh=7/g8u2TqM7J8Cn/U12YGDIH4z8F9epXVF7IH/1LlmGo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YwbsJSNfvLcqUafkiNdCLa777EvaiS0lfAHHFoR/kSLED+CrJDCSawlDf4NakK9E5Gst7L2htKw+yZBxH87OSaHVsHFFBwRnj32yGenqUuIrr8c4/166dr8z0mB6QV5fj+cBhWQwyiFRteIbTpxhBzbK19jjPN1DU1kRni8SsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UE+4Io9/; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UE+4Io9/"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so2930426b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795650; x=1744400450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SjSWA34yg4j7nAkSg9OWc1nxrjTv2EBF262ygp4BvLg=;
        b=UE+4Io9/+SEz4Iv0RtegKSYtIvcGTSQO0yqbJUzm4RF8CtPis9YlL7fax36VeLk9Fs
         SXUTfLWrFoxRGXhwEfNNmybamkhlxgChcHbLghKsVFWFL8ChIZpUIYRQNi+v6+69xOux
         OBAUV/45HPdnMIXnVCuPmPUGmOVz2qqDBhxDT0cHX9pasaPnE2Fi2/GPJfM2gmJp94/p
         p5zDc4LsLq3dn4sQ8qdUnMwuzZb3zidlobgp9BSDY9WbPbAxm488VKV+AKuhm7lTndtd
         S2CzLyRQ1/terZxUjcbwAc/umHd3wMK0kTb6N3JpK3ROBsj4PUxmISBLPgwywfbRe6N6
         nF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795650; x=1744400450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjSWA34yg4j7nAkSg9OWc1nxrjTv2EBF262ygp4BvLg=;
        b=WuFRn9Vjo7W+5eybbwX52I+HIA0Pch4zxi0xt3D8A/awueHtDGpZSnKaZ1PuuBf94I
         liXn0GzvGNUXH9Y3dJQajKownAyC5oZJAKwmvSS9cwFZLcSwDoX8my4XCBjqoJ54TvWF
         O7GFJnp0UYlBbNVI/+zlpdaVJmZp0f1xCVg+zJq5BrGOsjn+Iv11TLCQcjicHKj+dJNH
         aG0OcNgjSvU93p7P1AzXtILRhhZT+JIYYQar3hPE1/yJ+ZfEptmrVGVcCi6yf9/srrMS
         bqP0aHLNylh3ert4tfj44kgz0r5/Prw/t9kniUYJATx0TMUGHE2EdMDJgU4jGE0roZHx
         WWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrMRSl3vCR8LtlAh8BT4DpEqEf73amWF78Nl1XgKB6TOyffEUB9Wz4WT/Y3pC6Q61b4gHRo88nRmiNMHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdh5PP/A/uiWyHkR4UrDAbddOAIkYNPKnUHfh0f3wetGeNfSnw
	37n69MR6rJsv/hoSUWbceTH13u4sLVh3bqqnqy6VEwz1JwQTv3S+gvsgBN4MTxRocQDk5ikZZYJ
	Iag==
X-Google-Smtp-Source: AGHT+IHbhyhf2PL38jR1CfEUWzgJOUIR/lwrsr+RqHeIsaC+HvnuthN2QMdbVQyQ8EZYibpHmZF2PVBlImU=
X-Received: from pfud4.prod.google.com ([2002:a05:6a00:10c4:b0:739:8c87:ed18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a04:b0:736:3e50:bfec
 with SMTP id d2e1a72fcca58-73b6aa3d9b9mr864255b3a.8.1743795650653; Fri, 04
 Apr 2025 12:40:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:52 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-38-seanjc@google.com>
Subject: [PATCH 37/67] KVM: Don't WARN if updating IRQ bypass route fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't bother WARNing if updating an IRTE route fails now that vendor code
provides much more precise WARNs.  The generic WARN doesn't provide enough
information to actually debug the problem, and has obviously done nothing
to surface the myriad bugs in KVM's implementation.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c       |  8 ++++----
 include/linux/kvm_host.h |  6 +++---
 virt/kvm/eventfd.c       | 15 ++++++---------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a20d461718cc..c2c102f23fa7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13666,11 +13666,11 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	kvm_arch_end_assignment(irqfd->kvm);
 }
 
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new)
 {
-	return kvm_pi_update_irte(irqfd, old, new);
+	kvm_pi_update_irte(irqfd, old, new);
 }
 
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2d9f3aeb766a..7e8f5cb4fc9a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2392,9 +2392,9 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
 			   struct irq_bypass_producer *);
 void kvm_arch_irq_bypass_stop(struct irq_bypass_consumer *);
 void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *);
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new);
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new);
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *,
 				  struct kvm_kernel_irq_routing_entry *);
 #endif /* CONFIG_HAVE_KVM_IRQ_BYPASS */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index ad71e3e4d1c3..7ccdaa4071c8 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -285,11 +285,11 @@ void __attribute__((weak)) kvm_arch_irq_bypass_start(
 {
 }
 
-int __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-					 struct kvm_kernel_irq_routing_entry *old,
-					 struct kvm_kernel_irq_routing_entry *new)
+void __weak kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+					  struct kvm_kernel_irq_routing_entry *old,
+					  struct kvm_kernel_irq_routing_entry *new)
 {
-	return 0;
+
 }
 
 bool __attribute__((weak)) kvm_arch_irqfd_route_changed(
@@ -618,11 +618,8 @@ void kvm_irq_routing_update(struct kvm *kvm)
 
 #ifdef CONFIG_HAVE_KVM_IRQ_BYPASS
 		if (irqfd->producer &&
-		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry)) {
-			int ret = kvm_arch_update_irqfd_routing(irqfd, &old, &irqfd->irq_entry);
-
-			WARN_ON(ret);
-		}
+		    kvm_arch_irqfd_route_changed(&old, &irqfd->irq_entry))
+			kvm_arch_update_irqfd_routing(irqfd, &old, &irqfd->irq_entry);
 #endif
 	}
 
-- 
2.49.0.504.g3bcea36a83-goog

