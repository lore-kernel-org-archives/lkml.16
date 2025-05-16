Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBA02820A1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747436867; cv=none; b=QEyaCKDOGIApR8aHy/KGY78GaZUs+dfB20ulTkKOJvtFrJ7reV3kMzHmU2NaYb/rKolYpvD3WhxfLA3s8KV8aChSpWW2cO5qC9aQ2JzCuOdVHzRh9QLPLFYV7lxSvHhYlYOmtXhR2sZ2GlLs0dpkhdVBNOmTxfxuCTIOaMxfvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747436867; c=relaxed/simple;
	bh=LXzlgHyJWhAACXWbAPkfKszMlKXyO2bFe2sK3lMkj8Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AbxU/HvhPy46iQOm98Pkwg4BvLEyG3xKY45djheF+iD1uE+5wW+vSdSr/wA+YxpDcIjnGECQfq0nNd3igdIOFq1MwfW1Cvl8W4aKwkC/Xhacf2yEx98jdHiOakBoS4zKEPkWPn93gbXepsTvlJ1lmGpmRU/p93s6qbHYxNlP3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n04i6Q1F; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n04i6Q1F"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394792f83cso2011159b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747436866; x=1748041666; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+HnZi3oDQ4eOcZyXHAiIALwrX3oRAnjbvkn+7/oMfkg=;
        b=n04i6Q1FjF0oyxPU0NPPY1pHCvagfLJ+q0lPPc7y4T61k1nnWpD8lLB8EhtpU41RYM
         6UGtz3tpghoZAFUlATDEp4EJjc47VNJk20kCZccOQYiA2J+chYUtLyG+cKOtBume9QZo
         6F5lph35K86Vma3/YxP03vWV/tl5rn/LOsBs2v+M1w+ZWXyNgcG0bHf1vd0iPmA03aK7
         RwkbMVsuJy2yTkN99623J9abxmubPEoMV7Qb2CVwtUAmnjocVz2CPLzI4G2pDUArx6gP
         bqwqRLP1aRzlZwjKsZj4aSKwZ6N5mgAS9hMW/tW6MF9xmRvj1f1VIcB9opVw/o9xp1wN
         HZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747436866; x=1748041666;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HnZi3oDQ4eOcZyXHAiIALwrX3oRAnjbvkn+7/oMfkg=;
        b=uJrtVEyfDkfwyaTg5IYA4y4uOjKxd60ni92DNHS2urDDN5iQJify6DbvEf1pdBPNhu
         89187seYSZpUzT1/zPyfM9R7gluvGf05t0FRV3DOBID0mriRkH+XG60JoeIiYQswPdZW
         pBntlmDdIgd7JsEggr3LV9l2XciU/0atLOUVjBat7Mq9bUguXA3y/ZtOD1qJl9ri5qvx
         pGikM0hzN6+5OMInYlC45lEHsMSSpo1bWG4WXm1MdcG4b/t8eK+I5514vOsS7nPN3kuW
         8z48OKe+ZLI2E8K5Awt1MbHcppbBFwJBRK1HyXusGaInjR9cd2KLQpnasd50nXSJ61k7
         SezA==
X-Forwarded-Encrypted: i=1; AJvYcCVJAx125xxb4iCQgEi6kk1npd+NQMw90P9OOYJ60CquesJsOQng7TNDsdmpZ1wLAntg5mDm3x6xW+rk++Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YycadysuPa+CUtaKRmlkDtcht5SJeqf/leh35yOwoUBoh5FlJ9s
	dbDktvwtDp3RtkI7ADKn9y4bTnaXh5jyQB0n3FVdE7Cg6Imtms2W3vP2YMP0MGFAghN2Ts9Qlkp
	Pvlw2bA==
X-Google-Smtp-Source: AGHT+IEGr4DLQ/k+zVDPTA3QzCbhpesiuJ3Rc20pXKhfdxG6vKdbrJk/l1JnNXE3bXTLhq+xJb2nY6Mhx3U=
X-Received: from pfbmc24.prod.google.com ([2002:a05:6a00:7698:b0:740:b53a:e67f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ca:b0:742:aecc:c47c
 with SMTP id d2e1a72fcca58-742aeccc69cmr4693335b3a.7.1747436865717; Fri, 16
 May 2025 16:07:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 16:07:30 -0700
In-Reply-To: <20250516230734.2564775-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516230734.2564775-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516230734.2564775-5-seanjc@google.com>
Subject: [PATCH v2 4/8] irqbypass: Explicitly track producer and consumer bindings
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kevin Tian <kevin.tian@intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	David Matlack <dmatlack@google.com>, Like Xu <like.xu.linux@gmail.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Yong He <alexyonghe@tencent.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly track IRQ bypass producer:consumer bindings.  This will allow
making removal an O(1) operation; searching through the list to find
information that is trivially tracked (and useful for debug) is wasteful.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/irqbypass.h | 7 +++++++
 virt/lib/irqbypass.c      | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/irqbypass.h b/include/linux/irqbypass.h
index 1b57d15ac4cf..b28197c87483 100644
--- a/include/linux/irqbypass.h
+++ b/include/linux/irqbypass.h
@@ -29,10 +29,13 @@ struct irq_bypass_consumer;
  * pairings are not supported.
  */
 
+struct irq_bypass_consumer;
+
 /**
  * struct irq_bypass_producer - IRQ bypass producer definition
  * @node: IRQ bypass manager private list management
  * @eventfd: eventfd context used to match producers and consumers
+ * @consumer: The connected consumer (NULL if no connection)
  * @irq: Linux IRQ number for the producer device
  * @add_consumer: Connect the IRQ producer to an IRQ consumer (optional)
  * @del_consumer: Disconnect the IRQ producer from an IRQ consumer (optional)
@@ -46,6 +49,7 @@ struct irq_bypass_consumer;
 struct irq_bypass_producer {
 	struct list_head node;
 	struct eventfd_ctx *eventfd;
+	struct irq_bypass_consumer *consumer;
 	int irq;
 	int (*add_consumer)(struct irq_bypass_producer *,
 			    struct irq_bypass_consumer *);
@@ -59,6 +63,7 @@ struct irq_bypass_producer {
  * struct irq_bypass_consumer - IRQ bypass consumer definition
  * @node: IRQ bypass manager private list management
  * @eventfd: eventfd context used to match producers and consumers
+ * @producer: The connected producer (NULL if no connection)
  * @add_producer: Connect the IRQ consumer to an IRQ producer
  * @del_producer: Disconnect the IRQ consumer from an IRQ producer
  * @stop: Perform any quiesce operations necessary prior to add/del (optional)
@@ -72,6 +77,8 @@ struct irq_bypass_producer {
 struct irq_bypass_consumer {
 	struct list_head node;
 	struct eventfd_ctx *eventfd;
+	struct irq_bypass_producer *producer;
+
 	int (*add_producer)(struct irq_bypass_consumer *,
 			    struct irq_bypass_producer *);
 	void (*del_producer)(struct irq_bypass_consumer *,
diff --git a/virt/lib/irqbypass.c b/virt/lib/irqbypass.c
index e8d7c420db52..fdbf7ecc0c21 100644
--- a/virt/lib/irqbypass.c
+++ b/virt/lib/irqbypass.c
@@ -51,6 +51,10 @@ static int __connect(struct irq_bypass_producer *prod,
 	if (prod->start)
 		prod->start(prod);
 
+	if (!ret) {
+		prod->consumer = cons;
+		cons->producer = prod;
+	}
 	return ret;
 }
 
@@ -72,6 +76,9 @@ static void __disconnect(struct irq_bypass_producer *prod,
 		cons->start(cons);
 	if (prod->start)
 		prod->start(prod);
+
+	prod->consumer = NULL;
+	cons->producer = NULL;
 }
 
 /**
@@ -145,6 +152,7 @@ void irq_bypass_unregister_producer(struct irq_bypass_producer *producer)
 
 		list_for_each_entry(consumer, &consumers, node) {
 			if (consumer->eventfd == producer->eventfd) {
+				WARN_ON_ONCE(producer->consumer != consumer);
 				__disconnect(producer, consumer);
 				break;
 			}
@@ -234,6 +242,7 @@ void irq_bypass_unregister_consumer(struct irq_bypass_consumer *consumer)
 
 		list_for_each_entry(producer, &producers, node) {
 			if (producer->eventfd == consumer->eventfd) {
+				WARN_ON_ONCE(consumer->producer != producer);
 				__disconnect(producer, consumer);
 				break;
 			}
-- 
2.49.0.1112.g889b7c5bd8-goog

