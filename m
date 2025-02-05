Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5922FDFC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752936; cv=none; b=BlBIH3fJvthrFZoy7zSb+/VjPWSLi1EbgG8Bsw8FeA5ojHs6vh8YR5B7QNWDzbh6GZV20EiUi2ZnrOnGJwopc0W/q6o847y9WCiL4qIsE/Vg0zLynOCf7iCAS4TBRd+s3s/FYtYjcXm1WGINz8/7jntJ4adpljVNh3oeFNS40d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752936; c=relaxed/simple;
	bh=fDcBmhqZ/qrJidzZiRoquUXnM2Q7XO2VOwJOytwwuts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ntrB0WdE9I1xOGTH7wzrBoDY6TlET9KGB9B9++4PmHboX//0GFkOiD8zn0b3OZeM+Hhpga0+WCC6VcCTUhSQPxousUubRhGq4x64TA0nqbPpsRgbJnuNGS9k4yUzzx7aieHJu26ruikvJFSM66LXC0/HXMdbdQP4n2sMZ2lPBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UkmeM/Ka; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wR2fL2Ag; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UkmeM/Ka";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wR2fL2Ag"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZFjvYgFZdOyqpk4Dz3sDM4Dy3SD7fTUgVgvsmGTNWw=;
	b=UkmeM/KaL+tKtXqIaIPqVNMNCMNZve/cg61KvgeXwv+1m6zsDRB21nOM0E8yefXScqnCs/
	+Cmv06eIjFuFFFr2kRopAEGLG3RbNrBJYKK4xDMit41Ou3bTgYNEM0HF4mbRTqgXkTlC2Y
	UOf3e8REPK7/GaEqeiZaHvdYlHAlQmTYw+y2NIWHd1BBMcGU0/xG9KDemVtRv06JiQK7ca
	hMoMK3sH7TPNlVL/yDtVhYwH7q2RBwRsvELw3cED2oCtUGiFsKEVgA2iXxfQrgoO4ZzvvL
	4qCZvAQqLwN//jOJNjd2W4y/KruHcyxAa3Q+c16LjfjaXcgu/E1of92pXwmuDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZFjvYgFZdOyqpk4Dz3sDM4Dy3SD7fTUgVgvsmGTNWw=;
	b=wR2fL2Ag4B8S94HARDd3BVQxuEM0gp2sIK7m14t9+GoL4Iiofz8ux0TPiGKrwmaCZZuLgz
	md7X8wNGkGunLuDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 10/12] hrtimers: Rename debug_init() to debug_setup()
Date: Wed,  5 Feb 2025 11:55:19 +0100
Message-Id: <4b730c1f79648b16a1c5413f928fdc2e138dfc43.1738746927.git.namcao@linutronix.de>
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
Rename debug_init() to debug_setup() as well, to keep the names consistent.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/time/hrtimer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 41133ee1e2b3..0d1b8bb66aeb 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -475,9 +475,7 @@ static inline void debug_hrtimer_activate(struct hrtime=
r *timer,
 static inline void debug_hrtimer_deactivate(struct hrtimer *timer) { }
 #endif
=20
-static inline void
-debug_init(struct hrtimer *timer, clockid_t clockid,
-	   enum hrtimer_mode mode)
+static inline void debug_setup(struct hrtimer *timer, clockid_t clockid, e=
num hrtimer_mode mode)
 {
 	debug_hrtimer_init(timer);
 	trace_hrtimer_init(timer, clockid, mode);
@@ -1653,7 +1651,7 @@ static void __hrtimer_setup(struct hrtimer *timer,
 void hrtimer_setup(struct hrtimer *timer, enum hrtimer_restart (*function)=
(struct hrtimer *),
 		   clockid_t clock_id, enum hrtimer_mode mode)
 {
-	debug_init(timer, clock_id, mode);
+	debug_setup(timer, clock_id, mode);
 	__hrtimer_setup(timer, function, clock_id, mode);
 }
 EXPORT_SYMBOL_GPL(hrtimer_setup);
--=20
2.39.5

