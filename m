Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D322E407
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752933; cv=none; b=abvGR2Qdr8iVgLQncaexXz8jEGNi9zF7u7Z+9E0PS3UFvikUGxX4u/ir05tm+VB+gDMphvWki/JA19NCNXEVCZ33QiO4ag8a1iiJ20yOfrhuESt8k5ZTus4SbfTTFm03avs2cmd03qo9v8Thvn1cAnl2Q9+JEK0R24S1lj8d2Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752933; c=relaxed/simple;
	bh=jNJyj0CmjgIZBxhm8UGgodqFgnXApNi+GwIdxlp03/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=djyIZyzeGs6o0Z8R46Wvm2/jJIGg3dr5GzHG3Cr8YJIHGTgPORyEy9Lt8TsXE3Lq1OsFKq4zmlMR7c4uyGQBElKZRn9wSUufz6jonyD/DSf8NeBdERt2bEKGfleqk3tdV7Wh7GQvAFfkczCt0UdOL3tBceP43ULncwnGrFl+s4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dADXBaFn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bFa2z+s2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dADXBaFn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bFa2z+s2"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xafKbg34kTin3ke+HGxG7rhs8q8J+u9c5I1wTLCtxg=;
	b=dADXBaFnwIKKMg3AvupJewb3FjEKfliEZxjqphKhLu3XPC6beZ9cOKtE84Z+r09wUOZxMA
	MZw6DYde56of1135BxTMCy19bRkj7NkgSqP9cCGGy4+RlgyZWCVlEB8emf8MwihYXJeAc8
	HAn1nE3cA5F+ZnmyRyc6/J4C3mv2Juok1yau49TDaK7cWIaAQRqcLCZE7VsG3CLKVhJkTb
	H5XuCfuZfBY/n9FlxEFuxAeZvWnOeeqSLJtp/vEDszb4pWwgzsNqdMaOa6xkDQp4PczIso
	EAAW73Vv2MNkFGoyXTcx39A/oc8Th+sVGmqLeEhaVAAYY8d9rr6QvIyIxHdmQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xafKbg34kTin3ke+HGxG7rhs8q8J+u9c5I1wTLCtxg=;
	b=bFa2z+s2/10aOhKDmpPD2fG44vydBL3IO71n611giKAp4Z8uVlORVWKcRGNqKF0cBNZ+yo
	v1IKWW929LlRoTDA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 03/12] hrtimers: Merge __hrtimer_init() into __hrtimer_setup()
Date: Wed,  5 Feb 2025 11:55:12 +0100
Message-Id: <8a0a847a35f711f66b2d05b57255aa44e7e61279.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

__hrtimer_init() is only called by __hrtimer_setup(). Simplify by merging
__hrtimer_init() into __hrtimer_setup().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/time/hrtimer.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index d3e02c771b39..728075f5c9c6 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1597,8 +1597,9 @@ static inline int hrtimer_clockid_to_base(clockid_t c=
lock_id)
 	return HRTIMER_BASE_MONOTONIC;
 }
=20
-static void __hrtimer_init(struct hrtimer *timer, clockid_t clock_id,
-			   enum hrtimer_mode mode)
+static void __hrtimer_setup(struct hrtimer *timer,
+			    enum hrtimer_restart (*function)(struct hrtimer *),
+			    clockid_t clock_id, enum hrtimer_mode mode)
 {
 	bool softtimer =3D !!(mode & HRTIMER_MODE_SOFT);
 	struct hrtimer_cpu_base *cpu_base;
@@ -1631,13 +1632,6 @@ static void __hrtimer_init(struct hrtimer *timer, cl=
ockid_t clock_id,
 	timer->is_hard =3D !!(mode & HRTIMER_MODE_HARD);
 	timer->base =3D &cpu_base->clock_base[base];
 	timerqueue_init(&timer->node);
-}
-
-static void __hrtimer_setup(struct hrtimer *timer,
-			    enum hrtimer_restart (*function)(struct hrtimer *),
-			    clockid_t clock_id, enum hrtimer_mode mode)
-{
-	__hrtimer_init(timer, clock_id, mode);
=20
 	if (WARN_ON_ONCE(!function))
 		timer->function =3D hrtimer_dummy_timeout;
--=20
2.39.5

