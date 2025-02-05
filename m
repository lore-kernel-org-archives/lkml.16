Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702B22DFB8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752933; cv=none; b=SPemDFTYHuXDAFKOxXDe3o8AakWVaCsCvDWSwqXZ66PEV1DoI3NaCc4m34AphZIWI75+GCkjG0SjQiLmPIbtzBU4bTNsrksQCuvVQG/t3Sw9sKqYR7BFdiFEGwkHquGRJTdLtgZmq+V98iCSSur6t1EyAWgp1Rt4sFzi2IXNum4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752933; c=relaxed/simple;
	bh=na/hAjFzsnokXQEg3PPS8K8Edd6YzoqjId3VpKJZ4Po=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rk4R8tZa/IURoA9WXJuvi/ClgZgEC33NXkO6FG9mob8Xvr40FjcQR9ljvv/tssmqBED0aX8MEfQX+/l3q74fIniTi/1mcsIaJMTRwSKJSdf2kuEjyK+tLjF8hHliDydY0n8yJ+Pn5+6ccOhCfYp2HAyUILGy1XXym3br4tZyBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QkYZrOLC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rAxa5c4D; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QkYZrOLC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rAxa5c4D"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XFCM4ar/K2wsddwlv7Q77BZa3Td4S1z6hjWXcL8W2c=;
	b=QkYZrOLCeMfPA+P/PdsKVHp0aVK3AcxNQSvjMMCUGEB0kMAUHmhdUOKv/wCBtzFXwKL05e
	aZuBu81YevRHtMTCmP6FRC253CJR+Gz/nwndqo+DbpMffpC4TMyFj+jSy9uIC+hB4X5VXr
	buvDv3RzTsMaDLFqhDgM8PQZ0T7GCtxrx0vR78y5Sjpj4ozva3Qa+ZszCdudtbDFkaVt1A
	k0tYy4yH0P0e3CDRZh08rrnBVwlIQc5AFA0lM9XeVy1x9n5eZuObUlDRDLC2m540RXW8PU
	TYGUTJ39jfgvV5P7I/pE65iu0+f643iD5xMD3Q1OgS23XweDz0Em/RsW9CdxFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XFCM4ar/K2wsddwlv7Q77BZa3Td4S1z6hjWXcL8W2c=;
	b=rAxa5c4DhyAp7V0Dr6xJLVjHG7uwMQVvr3bkKvJfl3lMExNPdFoEDBsalnzWQaYQEUiRAh
	aRxxzCr9HUO/0yBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 01/12] hrtimers: Delete hrtimer_init()
Date: Wed,  5 Feb 2025 11:55:10 +0100
Message-Id: <003722f60c7a2a4f8d4ed24fb741aa313b7e5136.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_init() is unused. Delete it.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 include/linux/hrtimer.h       |  2 --
 include/linux/hrtimer_types.h |  2 +-
 kernel/time/hrtimer.c         | 20 --------------------
 3 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index acae379541c5..242ceafecde5 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -231,8 +231,6 @@ static inline enum hrtimer_restart hrtimer_dummy_timeou=
t(struct hrtimer *unused)
 /* Exported timer functions: */
=20
 /* Initialize timers: */
-extern void hrtimer_init(struct hrtimer *timer, clockid_t which_clock,
-			 enum hrtimer_mode mode);
 extern void hrtimer_setup(struct hrtimer *timer, enum hrtimer_restart (*fu=
nction)(struct hrtimer *),
 			  clockid_t clock_id, enum hrtimer_mode mode);
 extern void hrtimer_setup_on_stack(struct hrtimer *timer,
diff --git a/include/linux/hrtimer_types.h b/include/linux/hrtimer_types.h
index ad66a3081735..7c5b27daa89d 100644
--- a/include/linux/hrtimer_types.h
+++ b/include/linux/hrtimer_types.h
@@ -34,7 +34,7 @@ enum hrtimer_restart {
  * @is_hard:	Set if hrtimer will be expired in hard interrupt context
  *		even on RT.
  *
- * The hrtimer structure must be initialized by hrtimer_init()
+ * The hrtimer structure must be initialized by hrtimer_setup()
  */
 struct hrtimer {
 	struct timerqueue_node		node;
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 47df6f50e12c..6474089f65fb 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1645,26 +1645,6 @@ static void __hrtimer_setup(struct hrtimer *timer,
 		timer->function =3D function;
 }
=20
-/**
- * hrtimer_init - initialize a timer to the given clock
- * @timer:	the timer to be initialized
- * @clock_id:	the clock to be used
- * @mode:       The modes which are relevant for initialization:
- *              HRTIMER_MODE_ABS, HRTIMER_MODE_REL, HRTIMER_MODE_ABS_SOFT,
- *              HRTIMER_MODE_REL_SOFT
- *
- *              The PINNED variants of the above can be handed in,
- *              but the PINNED bit is ignored as pinning happens
- *              when the hrtimer is started
- */
-void hrtimer_init(struct hrtimer *timer, clockid_t clock_id,
-		  enum hrtimer_mode mode)
-{
-	debug_init(timer, clock_id, mode);
-	__hrtimer_init(timer, clock_id, mode);
-}
-EXPORT_SYMBOL_GPL(hrtimer_init);
-
 /**
  * hrtimer_setup - initialize a timer to the given clock
  * @timer:	the timer to be initialized
--=20
2.39.5

