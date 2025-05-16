Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D0280A2B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747436864; cv=none; b=LwBhweqws+b49LooWewiP4o8o+nrSsEWPEaGdLfWN94bHk3e1ZaNbaVwzMKAs9lMvVPLwXvam2SIPktTnUH4LqcDnClbw0m1DAPu58jrX6tSEc40wxRboBTUG97Nw3Kudv09/r9UCre2+u5eoXGqPQXJYLgzWfvD+7Y3wtIPxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747436864; c=relaxed/simple;
	bh=53lKZIp0QEDIxAnbUsZj0HBAIqsGZWy+CnuC9aywW/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hqFJ/kRv4QWpI0QmCRn30iZlMGWxVWU/2p4NUpWOiFbDF+szVQ4f+i2Y5AU1YACmG27v61S/dDD41izgIoTY6o6m/qaPnlHYF8N5NRP4WitAcReIlc4YgQFWnR/rKcix7lgwT7CixFYug8kjHyt4NRCpSo/BE3khLs9GprPi6cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1SJwF6jV; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1SJwF6jV"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740270e168aso2422455b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747436861; x=1748041661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NfgqeidfxQ2kyf1sJo8U3YZ4JNEzadROFUB65CCKoYo=;
        b=1SJwF6jVGsvJoqd7rhdiq8l+du2JROSxasleJXx2a1zJBqZXLji5/fkOVoQd8NqSxH
         pNbdrk+mTqX9TtvCsHE9HjJx4j4svaV/P+xtnm5hvPCBHWSCe+8YF0ryxYnvVk396c7P
         HqRhRQUNx4qcWu4S8rhczJaraF8RFGo49QbbzrwurKLMl/mra89bohu8veF+4h79eTtg
         aRCSabpnOqgoyKNFKPk+nuxLMYD3KSBxT7XUxuY/37Txi6a9jsNwgpHMKs6QCiP74kor
         hQtv0ZfL9YKNKqgbmc27MPeh6w3DYczy0gSFLlu1Sw4zg+pwyaniaaaC29hA6smVkhGk
         1gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747436861; x=1748041661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfgqeidfxQ2kyf1sJo8U3YZ4JNEzadROFUB65CCKoYo=;
        b=ijUJGHkBhaToVI8wjrHINtRVKKVEk0NcpN+J58pDSGXbyRmi7HSOjk3KkjfRG3Lr/D
         HfXQV9fgm/v52TVJT5c/2ltQWlwd4YYWfJea6BYX2dE0IylxfLMmXkyVJqvFOJQPkYMj
         BR59AdHMa2GG9MMYbAFqkVuGd4PgmBbMQ+wcvAY0a354qhiod0mbHZprU6lpltWXwfqw
         7Cvh+GyMIyV4E+94pwJgzeUdBwPKRElnxVck4mDNFuuMA1GTCeC11IMici6ILJWEqbSg
         e8L7sHtyb5ga8exLEVUr/xLlro16fZ6KesA4SjZR0MXA5ah7kFXCiZZIxgQ1SE1OwKTK
         rT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHSIXDvYxwA0nsLRnBDRuSqkQ+3nl9tE0aptHGu+tvGBkdJSpT7HLwMIexe+pRt0iVJqcsHiibeMSzWic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrLUsjp+xHr9HJZaYZXzFHDU13Jm5XKgRk8pouexYVoHJ/JtP
	jnkMWCA+ss8KMJ9YhJoceKkTxWOQYjLVQUh6e/EIFw/kCoSMe1sPOq05jIi246FZbDEl+i9oewj
	sP2x9LQ==
X-Google-Smtp-Source: AGHT+IEpuk3JhFswrcOYHhuNZFtNFDjaC6SxgeOCtP19MsiXoVMuiAOEkn9SRzfq0mcswFVBZevjQHeWqN0=
X-Received: from pfst15.prod.google.com ([2002:aa7:8f8f:0:b0:742:aa0f:2420])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac6:b0:736:32d2:aa8e
 with SMTP id d2e1a72fcca58-742a97a16bbmr6249072b3a.6.1747436860987; Fri, 16
 May 2025 16:07:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 16:07:28 -0700
In-Reply-To: <20250516230734.2564775-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516230734.2564775-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516230734.2564775-3-seanjc@google.com>
Subject: [PATCH v2 2/8] irqbypass: Drop superfluous might_sleep() annotations
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

Drop superfluous might_sleep() annotations from irqbypass, mutex_lock()
provides all of the necessary tracking.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/lib/irqbypass.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/virt/lib/irqbypass.c b/virt/lib/irqbypass.c
index 080c706f3b01..28a4d933569a 100644
--- a/virt/lib/irqbypass.c
+++ b/virt/lib/irqbypass.c
@@ -90,8 +90,6 @@ int irq_bypass_register_producer(struct irq_bypass_producer *producer)
 	if (!producer->token)
 		return -EINVAL;
 
-	might_sleep();
-
 	mutex_lock(&lock);
 
 	list_for_each_entry(tmp, &producers, node) {
@@ -136,8 +134,6 @@ void irq_bypass_unregister_producer(struct irq_bypass_producer *producer)
 	if (!producer->token)
 		return;
 
-	might_sleep();
-
 	mutex_lock(&lock);
 
 	list_for_each_entry(tmp, &producers, node) {
@@ -176,8 +172,6 @@ int irq_bypass_register_consumer(struct irq_bypass_consumer *consumer)
 	    !consumer->add_producer || !consumer->del_producer)
 		return -EINVAL;
 
-	might_sleep();
-
 	mutex_lock(&lock);
 
 	list_for_each_entry(tmp, &consumers, node) {
@@ -222,8 +216,6 @@ void irq_bypass_unregister_consumer(struct irq_bypass_consumer *consumer)
 	if (!consumer->token)
 		return;
 
-	might_sleep();
-
 	mutex_lock(&lock);
 
 	list_for_each_entry(tmp, &consumers, node) {
-- 
2.49.0.1112.g889b7c5bd8-goog

