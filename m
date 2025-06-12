Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268029B77A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753230; cv=none; b=jltwiCwKY34LQLaOStpaEbtsWRt7NZSWDCxFjfUMzC9+5pqyoHDGQ4gQNH9jkRQIvddQlAbsb9g10n3qgFOMqH38TWRnMVQjGHpmO/0zrrDkJQUSLr/5pfHQyNlAwbsClYrxSCth/s4hE4t/q2jpZvrU8Bx07kh8dUihiJXf+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753230; c=relaxed/simple;
	bh=haFgvWLLKNrwJaBpLIU0R+weECSTNAekip7enpQmJnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgQqdVBSzVqSXXOjPapjbG19A+GKbjiuyjVvSx9lWl3i/Nd84lkTV1gv8rkFibAJwX+dUEg8d1X1tVIjz2vBvOMBAGrtAae5Hz7WnxdkjTCtWCbqD1wGzh/WqOVm/NAC+PPKzVydPFybaHZCl4DfAsN6G//+dpWRbbzQNWK8ZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NkCYD2PM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NkCYD2PM"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1249341b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749753228; x=1750358028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml0lKVPVybvP0N92BPIyS7ApVn3dLoCM1ruXROi1PdY=;
        b=NkCYD2PM8sEXhP63suQDGobmqa2mU13nZRP5DriqljXz55u4ojTU7KtuBwGw6MaSlk
         433/2ADFKtnqjoJhZrFgKndHETXlNf3Vt8G7Hxu+yuYj0BQda1hiyDC/gnkZKqNaOj4P
         sRJsNW3bPvBLsoqxRdekXOQEwQUnXHWq7u91Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749753228; x=1750358028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml0lKVPVybvP0N92BPIyS7ApVn3dLoCM1ruXROi1PdY=;
        b=MWR8mEB+FbrQy2lKAZAtY5zN+/JWNIgCly8CQoVVG0N4MtVXFmEu2SDdZWYvHcNs73
         9tdvCou+yqYTMIhFGvEh5QaAExJP0KxpVgcWp0uZLu/2+tZTELzPO9X6qulgE192DMIq
         rRJJmLO9yNa8g8woIl8NPe9yWulbKOfS7P8n/rFFG3gZ+u0ywag9tqWtelcpCi40okWK
         TyupjUePIf2pRFl7I25tIX4gquKHDIpZYoAdVJhpsLIUPWgCfeHBYxvkHXjGC6H+7Gz5
         Jsoi5TqgiAqQdxqOffFkOskAAaHT+OmE+Yxo0U6u8t0r757syNbJrrpkjk8tuTPkGOhY
         IISw==
X-Forwarded-Encrypted: i=1; AJvYcCUhEpne4ICIHWK0420/V61fR51ebE18bDMX8LJqrdhPgElxwwsCecpmbeVwD/G8eajMHRUJn4JwSJN0vmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcS2wvT9117HUsqEkRoTYJo/b7EJHse5w30dkaWMJYTNGBO8ud
	TmuNoGGWm7RoXZSP7PE3DaO+aMX6fyhwSxSbTQmny0sugzESB9ZPGj2A9Eb00u3NTA==
X-Gm-Gg: ASbGnct00Oscz2M+5Od22bTNQQoi9+yDGMglk9p9KMVPhtLnZVTR7urNsMqO0LLEIsy
	j9dGJBI9GBOi2SmnYIVGcORD17+ND/LHZ9lua2DyUdOfI3w+SVUUz3HyW3MO/6A4MitQQOC1hv0
	gNDrpzivNgMKhTodhn36Tt9Mw/1fLacgZqSOcnpRvdHPX0KxBeCWzfzhqJtGnfY9kekONdSitAx
	mokVuBu/F1oX8CDvsEZQMy+h+H/1S4TwTD1sXWsIqLiuzVPYWV9ptXmeDG7lKC8NLJDFiauDQAC
	GNFzLB70Sz0t1jYDf92Ss6DxPrvgjSvwIh6R59aHcnRUEsJBcdxv1NXsb6qnxeJ7zZtD6fMS2kN
	uMslVqfQ9xhP064ltbJqHlJ3i
X-Google-Smtp-Source: AGHT+IHln2HYr+WrcVg3RtojtpX6fOD0bSEeNgI9uoOtgX11XC4EPkgbC5OMG3J+OgA4Xhp+fJ3BPg==
X-Received: by 2002:a05:6a00:2d8e:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7488f6e49f9mr406585b3a.1.1749753228440;
        Thu, 12 Jun 2025 11:33:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e790:5956:5b47:d0a7])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7488ffed070sm41340b3a.14.2025.06.12.11.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 11:33:47 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	David Stevens <stevensd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 6.16 1/2] genirq: Rebalance managed interrupts across multi-CPU hotplug
Date: Thu, 12 Jun 2025 11:32:51 -0700
Message-ID: <20250612183303.3433234-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612183303.3433234-1-briannorris@chromium.org>
References: <20250612183303.3433234-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 788019eb559f ("genirq: Retain disable depth for managed
interrupts across CPU hotplug") intended to only decrement the disable
depth once per managed shutdown, but instead it decrements for each CPU
hotplug in the affinity mask, until its depth reaches a point where it
finally gets re-started.

For example, consider:

1. Interrupt is affine to CPU {M,N}
2. disable_irq() -> depth is 1
3. CPU M goes offline -> interrupt migrates to CPU N / depth is still 1
4. CPU N goes offline -> irq_shutdown() / depth is 2
5. CPU N goes online
    -> irq_restore_affinity_of_irq()
       -> irqd_is_managed_and_shutdown()==true
          -> irq_startup_managed() -> depth is 1
6. CPU M goes online
    -> irq_restore_affinity_of_irq()
       -> irqd_is_managed_and_shutdown()==true
          -> irq_startup_managed() -> depth is 0
          *** BUG: driver expects the interrupt is still disabled ***
             -> irq_startup() -> irqd_clr_managed_shutdown()
7. enable_irq() -> depth underflow / unbalanced enable_irq() warning

We should clear the managed-shutdown flag at step 6, so that further
hotplugs don't cause further imbalance.

Note: while it might be cleaner to also remove the
irqd_clr_managed_shutdown() from __irq_startup_managed() at the same
time, this is currently not possible because of
irq_update_affinity_desc() -- it sets IRQD_MANAGED_SHUTDOWN and expects
irq_startup() to clear it.

Fixes: 788019eb559f ("genirq: Retain disable depth for managed interrupts across CPU hotplug")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 kernel/irq/chip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index b0e0a7332993..2b274007e8ba 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -205,6 +205,14 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 
 void irq_startup_managed(struct irq_desc *desc)
 {
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+
+	/*
+	 * Clear managed-shutdown flag, so we don't repeat managed-startup for
+	 * multiple hotplugs, and cause imbalanced disable depth.
+	 */
+	irqd_clr_managed_shutdown(d);
+
 	/*
 	 * Only start it up when the disable depth is 1, so that a disable,
 	 * hotunplug, hotplug sequence does not end up enabling it during
-- 
2.50.0.rc1.591.g9c95f17f64-goog

