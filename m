Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE8295511
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253646; cv=none; b=pHBGNymtwigln4DDCI9VRPdAOMOgdXM5SIHZqYmrUrr6G+ScoPV2c4uxKrZXrR6k6KmyCWWGoRlytkxzL+6UPaLrIGNppxZjVLZUzfqmvPe+3sPzzcuYpk2XJOU3k3GUVfiej5BHgQ5gaZSqTT9yjLn059KETzImfT52E6eRMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253646; c=relaxed/simple;
	bh=iOjw/L2LdzKNpqb5GEb+HetJkvtlsNT+QM2JmxayPBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgyH+lJPXXirJw+3DrRfSEcTAATQffefL70ij2AJn1pg7i9bokfOYTa/BR0rj/IdIJxO+RUMtRYiJdG4nCUm3MRHjbS1y3V7+x2CUOlfAO43BSZVPYRuVRKYoN2ygUe/geHp26tUEpWpnttVmIV9ghakcOd6jj/hLA8o1+3a3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MEpTVgkm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MEpTVgkm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30c54b40112so210687a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747253644; x=1747858444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+DLk/0WNmRFtLE+jfkyMXhXDn80ukZ0Btmn6RgoyXo=;
        b=MEpTVgkmcrl8FBvNNgfZFKKjpgudIHxWB1QrlABT/9r3hAGQCzGC6JIu9OvS98CAqt
         02d+axAwxR7FL0sxHFMUMhMiuU1uErEAirVaDh4ECs9j9DWO+HI6eta9AY1N385NJyTH
         AUSvCi/Tzwvh/f2g3RFnQQ4x2lvHxW4aEjwek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253644; x=1747858444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+DLk/0WNmRFtLE+jfkyMXhXDn80ukZ0Btmn6RgoyXo=;
        b=gfIwJi97dqx2lXhwHfmQxphYA4Yyj8o8IJDBdtyjC5JtqvjHdO7WG6pDhVmbwoIBs8
         AgSu3EWPEAPs4AHZ1fACLylzKFiNr+TYEDDlnHJd/j17B18qEtFCnJHud/aFx28q89Mn
         aq3o+7AbFepQn6mVkVFq5uvjawGh2fHzcJSfScxXIQqikK8wsa1FVhRJU1SyfIB0D5PJ
         HwChZM3SMDwaCGtqu21DMeSwt5yptz2Wgv0ObK+as7UULuaXc/OCsrBBTDMB3oTwbKhV
         BItZA+WIqTYWLrd3u/UCjZ028mnNfFlY2DWLGWqci6A3qj49EX4ItN4uwrRQsf5qKaTQ
         k1/A==
X-Forwarded-Encrypted: i=1; AJvYcCUgun4L7lsu6jsuVZwdYcbqYOWTclWxM6x4/MwfEY90nKWHpMiMv2eiPyfode971CLlemYId0l8kYxCZcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8APYFuuHNSS9SJRuNhGMFJlwH4aQnC8nq7IdgS9WuwMV+W8rK
	7NAOo+r7y1F7ry7GFjGmf+1KOE/QoIsWceFPZQm+SXh8RuOnw6/zTOT5gEmSdg==
X-Gm-Gg: ASbGncuTwXmwzCOFMud3fPyfzY7GBN2ReWwwpFJYMwAdfUwYkQmAw9WDxMYWZDaiLD3
	HLhBUdNow2BgabHbY6CHfbeZCLaLReCTuY1gp1CoYX01VxZ0iueM5hr1Km90wViENmC5IxIx3l6
	ShPNuTfTMUSOAguQ/hRhPYbLC/P/FdyjV/21YzjPYLKBlE3xPrCxTxsJAPble7xfw1HOlPlLCpO
	EWeCL1y98BWUJS4PkpC/vm0GeR5o8br1rsz6YGbhGCNT5NFMj7mGZOx9rJFMG866X2iRcBLTzbK
	IwWQJtSaUqLNs7IkFPwigdumPhEOlZSwt/XSV0SY4e5qu9N0+PA58Xu9569sIUcHZfsAlPXRXIH
	8S6krAM26b7GiKA==
X-Google-Smtp-Source: AGHT+IGZFiL4L9XmpDyzZLX4fqd9p3KI4CIcbpAvsYEnRd+VkKndNH0NiP5sET//Mo5e7i5NXHKogQ==
X-Received: by 2002:a17:90b:35d2:b0:2ee:f076:20fb with SMTP id 98e67ed59e1d1-30e2e613263mr8527351a91.17.1747253644030;
        Wed, 14 May 2025 13:14:04 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cd06:335b:936a:7dc1])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30e334251f9sm1964490a91.12.2025.05.14.13.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:14:03 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU hotplug
Date: Wed, 14 May 2025 13:13:16 -0700
Message-ID: <20250514201353.3481400-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250514201353.3481400-1-briannorris@chromium.org>
References: <20250514201353.3481400-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Affinity-managed IRQs may be shut down and restarted during CPU
hotunplug/plug, and the IRQ may be left in an unexpected state.
Specifically:

 1. IRQ affines to CPU N
 2. disable_irq() -> depth is 1
 3. CPU N goes offline
 4. irq_shutdown() -> depth is set to 1 (again)
 5. CPU N goes online
 6. irq_startup() -> depth is set to 0 (BUG! client expected IRQ is
    still disabled)
 7. enable_irq() -> depth underflow / unbalanced enable_irq() WARN

It seems depth only needs preserved for managed IRQs + CPU hotplug, so
per Thomas's recommendation, we make that explicit.

I add kunit tests that cover some of this in a following patch.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
Thomas provided a better suggestion than my v1, without fully-formed
patch metadata. I've incorporated that as "Co-developed-by". Feel free to
suggest something different.

Changes in v2:
 * Adapt Thomas Gleixner's alternative solution, to focus only on CPU
   hotplug cases

 kernel/irq/chip.c       | 22 +++++++++++++++++++++-
 kernel/irq/cpuhotplug.c |  2 +-
 kernel/irq/internals.h  |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 36cf1b09cc84..ab2bf0de3422 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -223,6 +223,19 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 		return IRQ_STARTUP_ABORT;
 	return IRQ_STARTUP_MANAGED;
 }
+
+void irq_startup_managed(struct irq_desc *desc)
+{
+	/*
+	 * Only start it up when the disable depth is 1, so that a disable,
+	 * hotunplug, hotplug sequence does not end up enabling it during
+	 * hotplug unconditionally.
+	 */
+	desc->depth--;
+	if (!desc->depth)
+		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+}
+
 #else
 static __always_inline int
 __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
@@ -290,6 +303,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
 			ret = __irq_startup(desc);
 			break;
 		case IRQ_STARTUP_ABORT:
+			desc->depth = 1;
 			irqd_set_managed_shutdown(d);
 			return 0;
 		}
@@ -322,7 +336,13 @@ void irq_shutdown(struct irq_desc *desc)
 {
 	if (irqd_is_started(&desc->irq_data)) {
 		clear_irq_resend(desc);
-		desc->depth = 1;
+		/*
+		 * Increment disable depth, so that a managed shutdown on
+		 * CPU hotunplug preserves the actual disabled state when the
+		 * CPU comes back online. See irq_startup_managed().
+		 */
+		desc->depth++;
+
 		if (desc->irq_data.chip->irq_shutdown) {
 			desc->irq_data.chip->irq_shutdown(&desc->irq_data);
 			irq_state_set_disabled(desc);
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 15a7654eff68..3ed5b1592735 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -219,7 +219,7 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 		return;
 
 	if (irqd_is_managed_and_shutdown(data))
-		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+		irq_startup_managed(desc);
 
 	/*
 	 * If the interrupt can only be directed to a single target
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index b0290849c395..7111747ecb86 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -87,6 +87,7 @@ extern void __enable_irq(struct irq_desc *desc);
 extern int irq_activate(struct irq_desc *desc);
 extern int irq_activate_and_startup(struct irq_desc *desc, bool resend);
 extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
+extern void irq_startup_managed(struct irq_desc *desc);
 
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
-- 
2.49.0.1045.g170613ef41-goog

