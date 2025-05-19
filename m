Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576B211A0E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680926; cv=none; b=Nw4GND1K/Iv8Y2AeW7D91P+bETFXyMLScMExrTEiXwZ/UAbGe9mfut2bFKBrlkZyU6O9tAG5hCjtSRg0WFOKZFKYhHbebMKZXA+TeFwkJzVrK9rEkPngQbyz+LZEHUqcAhIOIt3+TorIMKkPqX5CQGapCERxvB9htj23XAQuWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680926; c=relaxed/simple;
	bh=0kgGSVpa4vF1VM/Tm68ip0ARKg16qtEPfsv+8/D7xvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uIgBuqCdx7vmZ+OcbDbskyY/yK5hzgK7YtgOumuolf1P7bL5mMXXjqlUvXjN3fKlyGti6SEaenQsU8sporPXTPnjUnmSRmsUZhOK0WptYJK7tOwKY2rZcFB7ZZKMTtPfOYxb+2lnQVsygM185DgtdUi/83Pck0H0eDcm3CnRE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hCaOgk59; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hCaOgk59"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e9e8d3e85so3209422a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680924; x=1748285724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+VBvSn0/1OEly0dhJhpJ5/xbewUf32J5agAZ9eTZnMo=;
        b=hCaOgk59U49wmSFx3wTSCz4I0DbWkzyfCFy7KZm83tBhq4KrFF1B3wB+YpcvKJH8pG
         tVZX6REd3W8J7gskhQ4sF5iWUEOPgWjceUXBf7+u64PFOxeVNksTlsy1cBA14VI8TppC
         RZ/2sM4XQ6WYSngvGIFKId26tGWz3lu6vGErU5CIFubuwm+6QZvqQrmobTmGo2rUFeMV
         007T3Dl/67+3N+VA0CYoYHo9Q5RIss5/xGrc4KuKlW4SYx/jjI4QrVAL80xRVgeXKME3
         aCxZKydP3otWuTt27ePpFd0RlFUrGj4zSlzwDl55kGLWcuW8H0iaQIcLrxOu9L55kkgM
         vufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680924; x=1748285724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VBvSn0/1OEly0dhJhpJ5/xbewUf32J5agAZ9eTZnMo=;
        b=qniWf9YJy7dDYmLp+3n5lookpPK1Oq/WY45xRfqBb4i5DD+jiHoJrcpE27+YKXTLE7
         yVHnpM5p5RS2tpLwc8SY7wvmdOU+qrDqpwInz8nduv9+PvC6ZQem2ZdzxotsTAMjkoFv
         PQP7NzBcRPSkJ/09fWiDqR2z3RU1G4dntawO6N/gVmO2VJtoo8/+vjxm6OZidsPmEb4b
         hPSiF4/ze/M1ggyx0YUQlIylNAVlR6sb2f6xwov/a9QT6YuABcHSW2I1ulWBudBoGkmF
         9iz5PQ9FqlJ9t4w3jADhBmyI/SR5TfYDurn+/mnqWpu2JXqmDIP/nUlZStmJ1n0ub2Vh
         dHMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOzbnctna6LTGUutBI34RjknuQkKIDDRJkfuDmQ6DSf+OD6OTkumlWtGjv/7/6BEdHHqpT0zuoeC2+kQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw68Z97KgLY6WZ+AvbsY9V7lIt3GPOtvjxNQof9UvdHDG/iah/3
	pPAZnlxtnlVFRsRYlsp6PRrsCuxmk07K/5nMLBjevbDtbjyaUinfAjACWZy026XiY1RsHTmDFp6
	Ydayg+g==
X-Google-Smtp-Source: AGHT+IGXg/F9gxTP1pqaycZUwOUHp+ak6N7UkX/Xq88IlBNICngR1I/Ww9ctAKD/SX/RDw3McfSZyBJElK0=
X-Received: from pjg13.prod.google.com ([2002:a17:90b:3f4d:b0:2ea:9d23:79a0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c08:b0:30e:6a10:bb41
 with SMTP id 98e67ed59e1d1-30e7d5a85c1mr21315362a91.27.1747680923944; Mon, 19
 May 2025 11:55:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 11:55:05 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-4-seanjc@google.com>
Subject: [PATCH v2 03/12] KVM: Initialize irqfd waitqueue callback when adding
 to the queue
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Initialize the irqfd waitqueue callback immediately prior to inserting the
irqfd into the eventfd's waitqueue.  Pre-initializing the state in a
completely different context is all kinds of confusing, and incorrectly
suggests that the waitqueue function needs to be initialize prior to
vfs_poll().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 42c02c35e542..8b9a87daa2bb 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -256,6 +256,13 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
 
+	/*
+	 * Add the irqfd as a priority waiter on the eventfd, with a custom
+	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
+	 * underlying eventfd is signaled.
+	 */
+	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -395,12 +402,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		mutex_unlock(&kvm->irqfds.resampler_lock);
 	}
 
-	/*
-	 * Install our own custom wake-up handling so we are notified via
-	 * a callback whenever someone signals the underlying eventfd
-	 */
-	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-
 	/*
 	 * Set the irqfd routing and add it to KVM's list before registering
 	 * the irqfd with the eventfd, so that the routing information is valid
-- 
2.49.0.1101.gccaa498523-goog

