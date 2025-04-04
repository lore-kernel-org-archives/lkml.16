Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02421D5BC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743801310; cv=none; b=jfNhI7mDFDghvruu6dck6/TNOO6atGSynqLKaSnFU+hpI/ZvAWjXz4ZYPPGhc7aK2IglvNSRsErKvp7VrmsTraBVdmsRweJAk2X46tVN/6O96G/IE2c3KUzHOYU6xNpiikbHyldK/9YOFKFGjmDRKGOfKZHSDxcXRrMR9I30XSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743801310; c=relaxed/simple;
	bh=lt3v4NByeuFhsRflhATM2AU2H0rLtGPyZ6uc0g0P4aA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JWPFlyvRTd+YHNDqU7vNC+JVTdAAqlAEXhRN7xiG0bJNCJRTh8VEdMccbSxjkaaGVSO5mXxWCO2wIavtFkzz6wZkgdmzv1vY/Y3KPuXH/KMlSGGFdL0rxn34ZNHC4UjHPGLjH+xRIA5n/WZfVh139d8HXZQtxqaNHPnLIgCyfvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I6hKXNN3; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I6hKXNN3"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af91ea9e885so2162071a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 14:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743801307; x=1744406107; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj98VhLI5wUP0/dBD7V9/B8uk5MsLM5FlS2oO+5uLWg=;
        b=I6hKXNN33W6fvlYWWn1oGiSxM3RrDcFoDvq8grXNLQUld+mA8s1zWeg924FpZkYXd1
         s7/1Qfa3FhzA6ERTjNsRhJSW2V3j466Wb9ojTb76tOmWteyZZkvpbRMOh+VDzcSWIZkE
         kyFxyQlgFR0nvn82xlUU4qTa3Gjop6aFKBDrlCCcRQOnfDw/Cq/9+/ew/9JdJg5Q5sTC
         cDZzd04jFIWz8xZOZCHeCb5b4O6VgWxIicjcHQJn1uls4pP+fHRqGKy4kUf3t1Hr9EIx
         RhbZmEDw+B8uSLiOwig5SCG5n4Et7XKmNMWLbKRx4mcOl+Nx2obnGPKS/hlCVPqQxSfR
         JA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743801307; x=1744406107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uj98VhLI5wUP0/dBD7V9/B8uk5MsLM5FlS2oO+5uLWg=;
        b=uNkmDi1l1q2N/mCXPlyOTNizvqde1RICs+iIar6/sVeNbeEcvZ/1ax7JuKWyuq33M6
         fUj+SCV8pFYcV+CvbQkmhHhWqIPhObtSf6ycPEJ3Xocn4KYfwovH4mtpYH2u2+TG9hDF
         2AObP5zzHChlfEGJM3haB8uBYdZlsT6QgDOSOIxNsk78ezMd1b8C0/hym/IgpL7+88tO
         6Moi5nckNrXT9S/QhM+0ZaEmaQJqnInwmNmTYcxijkw8hm0/hp+g34vKKD7doMJJTfXx
         CNHJNz7AE9Gf/0PBK6stvv7hRY714qi6WGfjrYqBOgKlz3/kfb0EBG6Ksfzqz+ErPsdr
         n0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOdRDVrnVjVoOT9M5cSOWzXRJO3S4J3grC34PRqE4/eBKwFjbWWAYvdqChGv3uZTStTQsTG8ySsu7xflA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1vouA6mLtFjBi1UpWFPAYKC3uBjVUehimRADLcy4rJtj8ASa
	VfGbAg6bneNRoNYc8Wyq6DSnL6dQv9iZe5rMakkttC/xR6o4yXwLNL4U0sVW+mzU1IZZc1bvoC1
	uSw==
X-Google-Smtp-Source: AGHT+IFMRINuT3JO84ktvwx/JXf2G4VgNPaO3sJJsL1cqLAvtapdb4dYJmi4mlrlNRrGxzPd+4aTdmn2mM0=
X-Received: from pjboe14.prod.google.com ([2002:a17:90b:394e:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d47:b0:2f6:f32e:90ac
 with SMTP id 98e67ed59e1d1-306a6154f18mr5792179a91.11.1743801307592; Fri, 04
 Apr 2025 14:15:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 14:14:44 -0700
In-Reply-To: <20250404211449.1443336-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404211449.1443336-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404211449.1443336-3-seanjc@google.com>
Subject: [PATCH 2/7] irqbypass: Drop superfluous might_sleep() annotations
From: Sean Christopherson <seanjc@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	David Matlack <dmatlack@google.com>, Like Xu <like.xu.linux@gmail.com>, 
	Yong He <alexyonghe@tencent.com>
Content-Type: text/plain; charset="UTF-8"

Drop superfluous might_sleep() annotations from irqbypass, mutex_lock()
provides all of the necessary tracking.

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
2.49.0.504.g3bcea36a83-goog

