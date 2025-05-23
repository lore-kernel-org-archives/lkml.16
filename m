Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185B27C152
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962064; cv=none; b=qeTOSuDeduSSvSzWXi3P/XaG0gr3/zqFPnxuOUeMopQe4cN0dNTVYu1nXxAgA7k9IRqzE1Fo7vaRp6Jhxesi56cMUKyOOUNiro4QMU9Sx2lE95bO1hRzZ0VxqRG5dgiSPHmQ7bqeUKRQe9w/fJyFLygQNxIbVqAzwKcEMk2oSrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962064; c=relaxed/simple;
	bh=CjEiv3EBSt3Kbej2hI7WprWBZwegAM8tmmcYdNo1npY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xse83FLfGHlRVA7dYMsH9L6aiuQzNhmq0GS5SzjC3nX5Df+HmOS6wC/0VSGChGpTuFBLFmux1mmzgTRVWXegTroKM6qfA7DWpiMQsulfCvDFsNHWsTOKqibl5xvYK/ram/IkWi3PD9HfVOa43iCIhGPkd0ZIU/c6ZtseeILFNp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yanjyWes; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yanjyWes"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af534e796baso5345615a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962061; x=1748566861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I/V/wUMCmixrEnIVNqfJcxmN2QXnsdAPP3QKe6AvyEw=;
        b=yanjyWesW8oYnASX7ORC1Y+kgyIlvj3Szpvv0I/7s26pPS9maYlAQzsvu0wTrpeyJ7
         fhK/i1TVtwapjuoHMPeMZiM84XzLM9vjCoph4FSl2v4j9pUN41dKmesltGRVK1efKptP
         qzKNf+Y/VtzGdXyc5Da1SxVZTKlOVtKrc0Mnug4TEC6bhkAtojJLZqGHv4he+iZu1Lne
         BPogYHD5AB+pu05F8FdEznv3VwhVNSAbI095ZAsqWjWe70EpM6KSZT1UDqP2QnZjldJx
         GNvISnsdKYOmQ+lL7kkZugZ0AxIJB76ufTwO6HG6ZQ0wsZYEaOuQR1CwFkai+JEawMgN
         yRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962061; x=1748566861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/V/wUMCmixrEnIVNqfJcxmN2QXnsdAPP3QKe6AvyEw=;
        b=K7pGbm356jD4RXkhbanhw+7NPVJxCISp4DhauesVGqfuQy7LQ9sXAXQ0dUKyCjWt43
         RSocREbGUltL+69TuXv+2RxNPlECzsaTRmXWEceG9payWJnFEX+MasOh5NWhYEixsHM3
         mjzdSOu+/c1PxhSByvKxNAUhbfG1+eEGh3lv+Fakg3J6kxrCrP5TAs5PpAoijO/lqjZA
         kmZIPxV4QNwL9RjsvbczUwafJVjhla6JJ4pL4uINc9aQ7gyK+s6F6BRQw8Aa0N2RMpgE
         FxMQiuKxmX17nbC5wZxin5R2KGlR5O0nJzvwJ7M/O1rrC0JqMgCv4KU8gyPD2SLimwXu
         17Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXU3j9mGIgZizFp+JrfELuQdZdM0bW7SuklsmL6lmdqrq9hN4hFlYaREzEJz4rEDOjO1aOIybbSbADa56E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwskKV0X3S4oupCauSqxysopVsKyddsedC0IKabp12mccE5E6SU
	mZnrzfHCH634AnGSqt1kV1ynXmZKibBFd9IAy65X3rtMgpTeb9UTmDx36arRIR/Y4QqB796soqP
	gNmMtTg==
X-Google-Smtp-Source: AGHT+IEotc86oF2PtG/8v7ATzTs0oMnFmKSHoNnIFngKOe27XotzUkoD7+iAiHXRlObAKnBtxXNE1dwWSgM=
X-Received: from pgbcr12.prod.google.com ([2002:a05:6a02:410c:b0:b2b:2ba7:184f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:748e:b0:1f5:6b36:f57a
 with SMTP id adf61e73a8af0-2187a6de22bmr1225154637.39.1747962061182; Thu, 22
 May 2025 18:01:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:35 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-31-seanjc@google.com>
Subject: [PATCH v2 30/59] KVM: Don't WARN if updating IRQ bypass route fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't bother WARNing if updating an IRTE route fails now that vendor code
provides much more precise WARNs.  The generic WARN doesn't provide enough
information to actually debug the problem, and has obviously done nothing
to surface the myriad bugs in KVM's implementation.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c       |  8 ++++----
 include/linux/kvm_host.h |  6 +++---
 virt/kvm/eventfd.c       | 15 ++++++---------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index f20b6da30d6f..b3ce870d1d91 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -606,11 +606,11 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	kvm_arch_end_assignment(irqfd->kvm);
 }
 
-int kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
-				  struct kvm_kernel_irq_routing_entry *old,
-				  struct kvm_kernel_irq_routing_entry *new)
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new)
 {
-	return kvm_pi_update_irte(irqfd, new);
+	kvm_pi_update_irte(irqfd, new);
 }
 
 bool kvm_arch_irqfd_route_changed(struct kvm_kernel_irq_routing_entry *old,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 27c7087820cb..ee79b1167e02 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2406,9 +2406,9 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
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
index 85581550dc8d..a4f80fe8a5f3 100644
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
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
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
2.49.0.1151.ga128411c76-goog

