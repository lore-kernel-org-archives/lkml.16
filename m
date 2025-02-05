Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346822FE0C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752937; cv=none; b=g97ERlICbUTNNfnPCvUYfWmFkSYN4BKIaciPID5taH9FGtPVVxgVSL+vDL8/Gt2W26PtoQ+1a+fIuXfyhUwkVzdjbBV0NzJsHfGuysKX0hb6TW3v98wxbIlPwX/2M5/2TzDrhwvLpRXfw5JaxV7W1Q0jUc+Gxj2YKRZwsIye+Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752937; c=relaxed/simple;
	bh=5GhDU9sN6v3cbe2XG4hbFbDBC3f258/TOZBI9Xj+tvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=upeTzRxvA0hdUMYrBIxOfn2On8Q7dk6Q8Z2oUTIHnW0HR0e0hdwU76fgFb2TvysEGTagKG1YeqxelY4P4jEbClNMi5+oErevjK/pDDvPdyNQjJdI+GDoKavoEm8fsj4KtIx2mfL1F44lkaDWfkDkLOogtzgUr9cKhUHgxXt7hR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uY0kNcqK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8faqYeNs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uY0kNcqK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8faqYeNs"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uwa+9n6bh+N30yU/aApOFiTNPXTBa6EgzTEiJlGXx1c=;
	b=uY0kNcqKoxkyYhGcSy0BRKY3KDl+C5O93/1BsGX35O2fzRMMJ4t9xAJn0xzzaeBUko39IO
	ECXcFbGCHByvV6JLa4+7raovxyCgnqXvrPIQM/GOjhACtfo7qtdTjJIC2kWkiCW4ISGQZt
	4Hv/oHFnXOi1YJEat0v2V1saJ/sjIZdgU1X0gV+KC9qONAXgIWLT2KRyZwkndZJfvnU08X
	LrgaJyTKH12vnD8MD2az72clreYnRlYajgxBBg4P+3y5nre8WEuftKQNQ9jfswm+XD7dxy
	9OCJcK10DXoUA5st1R8aJ82/44q4YsO3S51/5lD9bf+eB1sJ8hP1jVnAKiDMrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uwa+9n6bh+N30yU/aApOFiTNPXTBa6EgzTEiJlGXx1c=;
	b=8faqYeNsBYRmbfZMAHyRL2dRIFWg6a6SMsOBDZxlSr/N3ZpX6LTgS+c/acfuHVVLLOfWfc
	LmDepJ9ehTOZFZCw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 11/12] hrtimers: Rename debug_init_on_stack() to debug_setup_on_stack()
Date: Wed,  5 Feb 2025 11:55:20 +0100
Message-Id: <073cf6162779a2f5b12624677d4c49ee7eccc1ed.1738746927.git.namcao@linutronix.de>
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
Rename debug_init_on_stack() to debug_setup_on_stack() as well, to keep the
names consistent.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/time/hrtimer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 0d1b8bb66aeb..a0727a45e8e3 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -481,8 +481,8 @@ static inline void debug_setup(struct hrtimer *timer, c=
lockid_t clockid, enum hr
 	trace_hrtimer_init(timer, clockid, mode);
 }
=20
-static inline void debug_init_on_stack(struct hrtimer *timer, clockid_t cl=
ockid,
-				       enum hrtimer_mode mode)
+static inline void debug_setup_on_stack(struct hrtimer *timer, clockid_t c=
lockid,
+					enum hrtimer_mode mode)
 {
 	debug_hrtimer_init_on_stack(timer);
 	trace_hrtimer_init(timer, clockid, mode);
@@ -1670,7 +1670,7 @@ void hrtimer_setup_on_stack(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
 			    clockid_t clock_id, enum hrtimer_mode mode)
 {
-	debug_init_on_stack(timer, clock_id, mode);
+	debug_setup_on_stack(timer, clock_id, mode);
 	__hrtimer_setup(timer, function, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup_on_stack);
@@ -2069,7 +2069,7 @@ static void __hrtimer_setup_sleeper(struct hrtimer_sl=
eeper *sl,
 void hrtimer_setup_sleeper_on_stack(struct hrtimer_sleeper *sl,
 				    clockid_t clock_id, enum hrtimer_mode mode)
 {
-	debug_init_on_stack(&sl->timer, clock_id, mode);
+	debug_setup_on_stack(&sl->timer, clock_id, mode);
 	__hrtimer_setup_sleeper(sl, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup_sleeper_on_stack);
--=20
2.39.5

