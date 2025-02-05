Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C906522FDEA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752936; cv=none; b=lLhh4UOMDaSLkTIj7+YJM2qwKfe5it0iS1zOkbPHghq+/2cWP6HdAU7k5/fgQjDyL/0MUCvXING6NFW5nL0sIanyRVsfAHgkR6Bg1wemMu2+KmiasyLQmYmGpmcOvb6ELyfZNBnv3ZGu709Fu1LswselcC2p/fYpbjOBVkceXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752936; c=relaxed/simple;
	bh=NRsQMtHAxux8mUFb266+cSZAvDQmkpLFuni3XbFcN48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BLfucbqCL6oGJooWPhMUioavAb+PXYgxNtRiL0F/VRxZPhWxSAQasIRULm3r62y1swoeekcCxlpAdlfCz1ACkuZqic352fzGgoBXubszmP87WoPTBZZArzw8QrKrFw3/fkPbHhflHh0ccZXCuu6z+D0JlrajImw165FCdiw0U4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XVsCiou7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r2hQzJfT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XVsCiou7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r2hQzJfT"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZRPl2WjO34dkEQpdwFayeYtHrAzaKEJ+22yEExGnk0=;
	b=XVsCiou7qNRno2V41PFKn6Dy2l0UPhzBHjx2mzuZy3wiFNXHF0QQIRGakpx59VrtNOL6Vw
	WqQwo1BCqoy8HMYFb3ghiw9t4rAaK3mgcPqqsyWyj/S5FmhN7MGrvtXHfxrTTPqojPIdYW
	znrKKugLHyLqIkJVLDfc8X2Fz1KhJQegQDCD0rpVYmg0bQEUDzOqwp6ZdkuUgDXGSgeEIw
	T1crhGEf11x3iojg8bHSY6wn2DRzU/u1nKXxykSQuXsjuQ00YFHBtQOsjXiIy6KXi9xXFK
	aMTFyeDCAqJB3bJAXN+WKI/m1oswfdr8XI0OCcBTsSAVW83yUDEdtCZsv3E2cQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZRPl2WjO34dkEQpdwFayeYtHrAzaKEJ+22yEExGnk0=;
	b=r2hQzJfTgYIgn5Qdd7GbIhioQNdSep+ojXl8Cj0ghODZCFUEGuZwOqpPu2KlKTLsaTsox/
	ex9PKttB4Oocq2DQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 09/12] hrtimers: Rename __hrtimer_init_sleeper() to __hrtimer_setup_sleeper()
Date: Wed,  5 Feb 2025 11:55:18 +0100
Message-Id: <807694aedad9353421c4a7347629a30c5c31026f.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

All the hrtimer_init*() functions have been renamed to hrtimer_setup*().
Rename __hrtimer_init_sleeper() to __hrtimer_setup_sleeper() as well, to
keep the names consistent.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/time/hrtimer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 4878a2c7e4bd..41133ee1e2b3 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2021,7 +2021,7 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sle=
eper *sl,
 	 * Make the enqueue delivery mode check work on RT. If the sleeper
 	 * was initialized for hard interrupt delivery, force the mode bit.
 	 * This is a special case for hrtimer_sleepers because
-	 * __hrtimer_init_sleeper() determines the delivery mode on RT so the
+	 * __hrtimer_setup_sleeper() determines the delivery mode on RT so the
 	 * fiddling with this decision is avoided at the call sites.
 	 */
 	if (IS_ENABLED(CONFIG_PREEMPT_RT) && sl->timer.is_hard)
@@ -2031,8 +2031,8 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sle=
eper *sl,
 }
 EXPORT_SYMBOL_GPL(hrtimer_sleeper_start_expires);
=20
-static void __hrtimer_init_sleeper(struct hrtimer_sleeper *sl,
-				   clockid_t clock_id, enum hrtimer_mode mode)
+static void __hrtimer_setup_sleeper(struct hrtimer_sleeper *sl,
+				    clockid_t clock_id, enum hrtimer_mode mode)
 {
 	/*
 	 * On PREEMPT_RT enabled kernels hrtimers which are not explicitly
@@ -2072,7 +2072,7 @@ void hrtimer_setup_sleeper_on_stack(struct hrtimer_sl=
eeper *sl,
 				    clockid_t clock_id, enum hrtimer_mode mode)
 {
 	debug_init_on_stack(&sl->timer, clock_id, mode);
-	__hrtimer_init_sleeper(sl, clock_id, mode);
+	__hrtimer_setup_sleeper(sl, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup_sleeper_on_stack);
=20
--=20
2.39.5

