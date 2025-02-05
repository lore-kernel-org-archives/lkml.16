Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9C22AE65
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752415; cv=none; b=BXE6DatrnuTh3JHC9PBgedKMwd2jMkJDNb5U+9BMxyLgK/4Ady5AE33CnMJphYBE5tBoUABYcH8zDtJMiN4rloJU+xzz0Wuotdc6CvkEexpvs1TsZQMq4SA9BVK8OK/sDXdU+dSitS+lQ1vN4/bhVy9S1McR2lFguXVwRjrOxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752415; c=relaxed/simple;
	bh=2QkopcxSVsihhtL+HI5REQhGAsAQRxi1I9Mk4/idtPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OsorQ+77DHoQtcXJIJz7MVYxyQSe41ZgZI5DnUgmghxWNv6LK/qYvgT3UPvxjOsbLvs3qFJ6A3qgCRfW5IQ1ORxi+DVFmrUm2GyivvgqDG12HTiol8t7wGEO83CpnTdt/2UpWASbuqor0Yef+M02p35l2XC/0qVF5/2LlhyOh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SO5WQ+WH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FpEOMyxE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SO5WQ+WH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FpEOMyxE"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu2DSWa2V+5romI/1bVWHgy7xKCyeyZi3VXJ8hhJM+g=;
	b=SO5WQ+WHWIblCQ+LegA0z15y+sohwtjDJT3JtJ6RpwUJ8wuvNreUa3jHNB+2aMVNMx1Bx8
	mMvqVye29m9tKLkGrfskX6wg6F2F8DQdJXltYzSt7bhAMnjSDBaJLyesDBqT+qf4ZgioOS
	y0UyYHQfZRc35tV+oMRBs8XBHJldU0dZ1VNNKFd3ZHec6fZjOKGtO1iRnB0RAWUuklEUH0
	FdL0CeeqHzDt9MRHP/4DqZjm5bpPppQ2WgxMLHBI9CFePPxCuPCrcWPFhcH/ITa5eg6LG9
	IfbB3kdo+z9txyeO8yEHfXh59HzfIcUXr4LfGV6TtLSl1m3ZxY+2epNIJ0OFlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu2DSWa2V+5romI/1bVWHgy7xKCyeyZi3VXJ8hhJM+g=;
	b=FpEOMyxEC+PzkN4EBpmEQrmsZnWgbISCq8vfTj7fABVWQN3fizUmWfHvkjs/pMD5E/0zze
	IZAgQOLnEgZf9qCA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 01/45] USB: chipidea: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:49 +0100
Message-Id: <a6e43ac5a90f975343e1cef2d8346b4697ec0473.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/chipidea/otg_fsm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index c17516c29b63..a093544482d5 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -424,8 +424,7 @@ static enum hrtimer_restart ci_otg_hrtimer_func(struct =
hrtimer *t)
 /* Initialize timers */
 static int ci_otg_init_timers(struct ci_hdrc *ci)
 {
-	hrtimer_init(&ci->otg_fsm_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	ci->otg_fsm_hrtimer.function =3D ci_otg_hrtimer_func;
+	hrtimer_setup(&ci->otg_fsm_hrtimer, ci_otg_hrtimer_func, CLOCK_MONOTONIC,=
 HRTIMER_MODE_ABS);
=20
 	return 0;
 }
--=20
2.39.5

