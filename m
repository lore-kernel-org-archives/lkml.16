Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45C2D1F69
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753232; cv=none; b=R5MvFGuiLzBEeZ7wzvM7mu5SRMvuUV5i/5CzK5BPpKUDDrcGI//LEkrDNe9dVrIYGa48xDe1D1uyNitzVaUcwjxmy96zmC3w7cZOyzLS1n42ouFEyd/M/eVfMqTzl9YVFaqO1wOGjT4pqtiw90Zg23jM09y7sVGhf11nmr2TAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753232; c=relaxed/simple;
	bh=jm6hdSF9DDHht7VP6n7cX1vT1+eSt1dZthS7BFn28fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNPI5s6AMrTrXp7I5f2VZD27WctJsXkj0JrGCFQN5IuJHyWwCry5hIMs0+3aBrFGxNf9q70AkrsMEtIKC/Bqdp7xt+GPMc1W//7+aFx/0hD9eKTXPKYCg4O/D82u41HgFkFqH5+tE2d/zIrMwWgPPYiTyAPRMXtxpTUV/tozV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PI+FSNa2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PI+FSNa2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748764d8540so1268030b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749753230; x=1750358030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaV+jqSj0N9g0tjJ63kwte2Vfr32gC1ZJfj5xrckMhs=;
        b=PI+FSNa2sIg+sSKqy6Vhg+t+kS7vU/tQFzmzCSRx1GGIA7nYmGq/5jHP54S19YSCPy
         7kyj1d8ELy2No+BhgL7tyFD00Cyc5km9OeyfUFaATs5Gauw+dDnRvG9O71b2O82OOHNG
         GTBJnGnBOEHZ4KnaoUTLaC3/89SnxkTD+ybZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749753230; x=1750358030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaV+jqSj0N9g0tjJ63kwte2Vfr32gC1ZJfj5xrckMhs=;
        b=EjovOvAkxI2Ny4a4XK8SKCNrF/LvGNJ19lfoLXyvUsCPSuFnHSaU02bl63I1kGLER6
         KIQvbyUGJVeXS+/zQpSjk0Qdy4yhgc78ILrC3eCFT7xb5DRppJI6TEO7QSCwvDSMCOUu
         s+CU8P9hpoETUo5wAuQMz84+brNtUGEwiEn+Ba6TTQxIZTTegmq6DqpEUxp2BP3+pu9O
         n4JampAnm04pcfTCQR9/2mZs6ugnxG6Ine56K6k2Kewk9FcuIyCKWtmA8mWy6N5DuFTt
         urogxpq8izDnER1nnTqt1SNLImq2o8Px1WcIUgDqNqvnn1hiWInuLNPX5a02XxrMIx94
         4Feg==
X-Forwarded-Encrypted: i=1; AJvYcCVcF/urqRYQBlO/4EFhZYlz3ojKx+uXlI7uN08dPwZWFxJAiMa6qPrAYw3rZPbNkF/NSOj5J0HH4DOnODU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdMXLDZECGiL4QNL79XgqNjymWlKEY9h9fPPn61nfljJ9EZbU
	pLyDmeQrmFPhjXxN4h6ghkHnk4XZXdVR/9l2Cr7KA4RQ4wYuPQb+TLKdXDH5zNbQTg==
X-Gm-Gg: ASbGncu/wIQJ7laLepNdTfyGHu6pGBPHTDn02+xul8nGseOPx2Zgbl7qe655RF60WQB
	nIy+MryOWEPfMVW2DDBapk764vz6ye7lqfMFgRTWqYVghAlVuWWBa4w8QNkzMA6w3jaPETDbjJn
	pagVrBXm5e3G1Htxx+XNiQsylE1C8jSqj2sXyKd3YeH1Zg8cfUByQtwTbRpqaXyt8viPj0h0Rew
	ajQUOUGKh/Zvk7LgBNlIqh49c0obQPFU1NES7PZsmGvpxbUAXw5o/maew0tGescJqxG75EvpCIQ
	XZJeSkjBxM70gL+gJXH15Azw4qFYlcyIHQQLVfdsflm7q8rYKrJp2xMa0D3D93EvJDCz/MZNfu+
	MASCCrUo9g6PRxTSYMkRW6XR5H8YdqOCX8x4=
X-Google-Smtp-Source: AGHT+IG2s/+PdI46v7+8VWpo7QZIQfG97uZbB3EVU5UKC/wKT4QaRs/Z8qP9FPCmd/a0BvOp9oNa0g==
X-Received: by 2002:a05:6a21:999a:b0:1f5:8eec:e517 with SMTP id adf61e73a8af0-21f8660015bmr12380747637.9.1749753230534;
        Thu, 12 Jun 2025 11:33:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e790:5956:5b47:d0a7])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74890083034sm31888b3a.98.2025.06.12.11.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 11:33:50 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	David Stevens <stevensd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 6.16 2/2] genirq/cpuhotplug: Restore affinity even for suspended IRQ
Date: Thu, 12 Jun 2025 11:32:52 -0700
Message-ID: <20250612183303.3433234-3-briannorris@chromium.org>
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
interrupts across CPU hotplug") tried to make managed shutdown/startup
properly reference counted, but it missed the fact that the unplug and
hotplug code had an intentional imbalance -- that they skip
IRQS_SUSPENDED interrupts on the "restore" path. This means that if a
managed-affinity interrupt was both suspended and managed-shutdown (such
as may happen during system suspend / S3), we would skip calling
irq_startup_managed() when resuming, and would again have an unbalanced
depth -- this time, with a positive value (i.e., remaining unexpectedly
masked).

This IRQS_SUSPENDED check was introduced in commit a60dd06af674
("genirq/cpuhotplug: Skip suspended interrupts when restoring affinity")
for essentially the same reason as commit 788019eb559f -- that
irq_startup() would unconditionally re-enable an interrupt too early.
Because irq_startup_managed() now respsects the disable-depth count, we
no longer need the IRQS_SUSPENDED check, and instead, it causes harm.

Thus, drop the IRQS_SUSPENDED check, and restore balance.

This effectively reverts commit a60dd06af674 ("genirq/cpuhotplug: Skip
suspended interrupts when restoring affinity"), because it is replaced
by commit 788019eb559f ("genirq: Retain disable depth for managed
interrupts across CPU hotplug").

Fixes: 788019eb559f ("genirq: Retain disable depth for managed interrupts across CPU hotplug")
Reported-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Closes: https://lore.kernel.org/lkml/24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com/
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 kernel/irq/cpuhotplug.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index f07529ae4895..755346ea9819 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -210,13 +210,6 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
 		return;
 
-	/*
-	 * Don't restore suspended interrupts here when a system comes back
-	 * from S3. They are reenabled via resume_device_irqs().
-	 */
-	if (desc->istate & IRQS_SUSPENDED)
-		return;
-
 	if (irqd_is_managed_and_shutdown(data))
 		irq_startup_managed(desc);
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog

