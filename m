Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA952836B0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747436871; cv=none; b=JRlS3TEMJMRaPJpl4NKf1RB7IxAwVNRzaqRIVnyrCXXtcwzriozqi3omfd/HkSWfktcQbsiWKZJzua0OpKVhoahVvIbsKQVF/cXfN4hJkBkCFHtorWzVqyWcon0DVTzyOVRCSwAjq9R7L7QOy/+wSLMcqEaD1kzyTDUIBiY6CbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747436871; c=relaxed/simple;
	bh=3eV70KuPSBCjK3Otg1fXvhrN4aUAqOQEKnpjeLf+MLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LpMRqv7+h1DE8zY3jC8Y/M99RDVV8+T4ve7Xn6zg8NGM4tRA1BnXnaXs9yrjz5nAm/p2yF75XtTUIaCsbc6Hm+jmd3g/D7Pg2njnoDf4dPBuWENSzUC+ga4jbr1DZ8CUBdJqZSHFSNCk0eZbLAm2oDmwyaqDtR8A5viING/RQj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+hE2Wjf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+hE2Wjf"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e8aec4689so864679a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747436869; x=1748041669; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PToc7yVowqyTNBLhp6IJYYBJ3tIDF6DyMy5BFKXkP80=;
        b=p+hE2WjfdEAe1Ti02a6SlYDd04rA4649+me6OC/OD0O5mxHQSZUXOmjH0/Q2LCwkQS
         uJ4kn9MlG0dboTJEHLHQAM9yaGwZMRdiueHHHGf8A/1beknFBtJKf+NnqC9wiXbbZHht
         KHBjyXHFLtXVjyDxlRLD6nAELgpFyzZhy2qJZS3WQHhdYhYZfM+/V5CRMkCYwxD/XTOw
         vkPBfdmF7f4lKKVTj6BkjT9FsfWEjuev9Fr55XakyqYYZkaRYjBmX99C7lkuc+ct5G8P
         ryxerNEG5NbxOuDEGNebh6oZ9j1h3ya7pR3j8WE3hV2w09bK4XG1JACdD+5ooEal4rz3
         wK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747436869; x=1748041669;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PToc7yVowqyTNBLhp6IJYYBJ3tIDF6DyMy5BFKXkP80=;
        b=nfPAR4EaJXGzsX1zi8LlaroN+kP+Wr0cvf9DOXQ4BRBQnF/u6BCIT9tmXIsG39k4xT
         saCTY2/uLokdMtnS4pAfYYkGRwOycDkUxmY4hAbJ1pzqmmqu+kU6p14p3bxddyirwJbk
         TGm4CgFWfUts6LhPayqnj9tN8DTNCJWTjXkqJTz1qDyIunUKlHRSzfit0/jwz5168SJE
         N6O/3gGIDv7mI8ry0V5Z2QsmV9d0k7tx6jGpu0V4cCJGW4jIDzIAgkkKrhXEflu0J8ul
         ccYkCHd/ZLpkg/ZG+hiak+DUop0tiUplStKransNqZzOWypH8/KPEfk8l0zDwGTG9WH0
         i9oA==
X-Forwarded-Encrypted: i=1; AJvYcCWaHk0yY86SH0ZCtj4J7DFI4qM9XFmHjFrTwOgpglfbdvYBGHM9hsN/0t5MrJ6UCFJhV4Qz0r78pNQ0QAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmkNsNC/1UnA4rCNqywKAGRz5J0kfa0Qb41iTvdx2Efx2rp7A2
	xVVEh2S3ExdtIfbVjtUk4uJ7GS/nkNxyI7GRTojBQQDo4vxtX9E1n5BktnWwkKvFF+4R4Y3TfLY
	ZxE9xGw==
X-Google-Smtp-Source: AGHT+IFMqF17coq6lIynvImodo9GEBI80OqIy5QNctbeCRw4yO4mG2Xb1BFvJbWtlWRj5T810Vi94FLEzzA=
X-Received: from pjbqj4.prod.google.com ([2002:a17:90b:28c4:b0:308:861f:fddb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c05:b0:301:6343:1626
 with SMTP id 98e67ed59e1d1-30e7d4f91ccmr6639663a91.1.1747436869330; Fri, 16
 May 2025 16:07:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 16:07:32 -0700
In-Reply-To: <20250516230734.2564775-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516230734.2564775-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516230734.2564775-7-seanjc@google.com>
Subject: [PATCH v2 6/8] irqbypass: Use guard(mutex) in lieu of manual lock+unlock
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

Use guard(mutex) to clean up irqbypass's error handling.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/lib/irqbypass.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/virt/lib/irqbypass.c b/virt/lib/irqbypass.c
index 6a183459dc44..828556c081f5 100644
--- a/virt/lib/irqbypass.c
+++ b/virt/lib/irqbypass.c
@@ -99,33 +99,25 @@ int irq_bypass_register_producer(struct irq_bypass_producer *producer,
 	if (WARN_ON_ONCE(producer->eventfd))
 		return -EINVAL;
 
-	mutex_lock(&lock);
+	guard(mutex)(&lock);
 
 	list_for_each_entry(tmp, &producers, node) {
-		if (tmp->eventfd == eventfd) {
-			ret = -EBUSY;
-			goto out_err;
-		}
+		if (tmp->eventfd == eventfd)
+			return -EBUSY;
 	}
 
 	list_for_each_entry(consumer, &consumers, node) {
 		if (consumer->eventfd == eventfd) {
 			ret = __connect(producer, consumer);
 			if (ret)
-				goto out_err;
+				return ret;
 			break;
 		}
 	}
 
 	producer->eventfd = eventfd;
 	list_add(&producer->node, &producers);
-
-	mutex_unlock(&lock);
-
 	return 0;
-out_err:
-	mutex_unlock(&lock);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(irq_bypass_register_producer);
 
@@ -141,14 +133,13 @@ void irq_bypass_unregister_producer(struct irq_bypass_producer *producer)
 	if (!producer->eventfd)
 		return;
 
-	mutex_lock(&lock);
+	guard(mutex)(&lock);
 
 	if (producer->consumer)
 		__disconnect(producer, producer->consumer);
 
 	producer->eventfd = NULL;
 	list_del(&producer->node);
-	mutex_unlock(&lock);
 }
 EXPORT_SYMBOL_GPL(irq_bypass_unregister_producer);
 
@@ -173,33 +164,25 @@ int irq_bypass_register_consumer(struct irq_bypass_consumer *consumer,
 	if (!consumer->add_producer || !consumer->del_producer)
 		return -EINVAL;
 
-	mutex_lock(&lock);
+	guard(mutex)(&lock);
 
 	list_for_each_entry(tmp, &consumers, node) {
-		if (tmp->eventfd == eventfd) {
-			ret = -EBUSY;
-			goto out_err;
-		}
+		if (tmp->eventfd == eventfd)
+			return -EBUSY;
 	}
 
 	list_for_each_entry(producer, &producers, node) {
 		if (producer->eventfd == eventfd) {
 			ret = __connect(producer, consumer);
 			if (ret)
-				goto out_err;
+				return ret;
 			break;
 		}
 	}
 
 	consumer->eventfd = eventfd;
 	list_add(&consumer->node, &consumers);
-
-	mutex_unlock(&lock);
-
 	return 0;
-out_err:
-	mutex_unlock(&lock);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(irq_bypass_register_consumer);
 
@@ -215,13 +198,12 @@ void irq_bypass_unregister_consumer(struct irq_bypass_consumer *consumer)
 	if (!consumer->eventfd)
 		return;
 
-	mutex_lock(&lock);
+	guard(mutex)(&lock);
 
 	if (consumer->producer)
 		__disconnect(consumer->producer, consumer);
 
 	consumer->eventfd = NULL;
 	list_del(&consumer->node);
-	mutex_unlock(&lock);
 }
 EXPORT_SYMBOL_GPL(irq_bypass_unregister_consumer);
-- 
2.49.0.1112.g889b7c5bd8-goog

