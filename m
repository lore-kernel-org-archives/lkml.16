Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30506236A8A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752428; cv=none; b=g7naS8UX0ZeXAzsIP9TD5cvkSpenIghc5f7Yjb7tU8RPBEdvy2npEi7tjpwgRZ4sD/sMBPFKjXVH0r6bkeet8LJQIAeeqnTzU6wPTq+sWaleDCTc7/YFtSkgWW9I93JetS6NHoaG6zqkm6TalkcEe1YOfmfn83iA0AaDtjy1MPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752428; c=relaxed/simple;
	bh=mgqcCX6BM96yb3Bl8K0m4m+eUi5M61u//7rwqmwiyxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Owgs3OdDaSCRcjugkRXfg33ZphSvknI9PBA576nmsZpv3OExiqTsnm8JEkC/cYDCm6AKKqAfoomkUwWivNejoJbJv3yEFvSZsM4kFBPQkxSlPGdD9yNQEhkPDkJtSBfAQLYD8gWzrvqswvkYMm6pyrdaJqZNPJ6Nj9HRKA+cn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=slzoVW+6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SqewLaHX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="slzoVW+6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SqewLaHX"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gdb8JDczRno+JM4eSptWKwnjmZDpWhwZ/3dSo4UPyXU=;
	b=slzoVW+60ryVYQXErtqvsmRm/jMawb9A6N+kbs1+qleVKfj1qIZB8faHirP3OD18vt3oAp
	f7bTb80I3zvx+jaXDPCYoLpFbGBZjt70vqV+I1NAB6BcEy/L5V73OYYns9kH2Lwu4ewmbg
	vy8gC9INp29QM05unoY2ke3fWQkPh/D7p1PaJmFSQapnTz00gVZ1PY0aYgMm1YsD6lsSyO
	dQeiUxo0Dy5Esc5WcKJC0ipUTAOIj3cGwObuN/v+vGnMqVb+CmbBZKf0vrM47njdteUsr9
	vCSbwc+bEj9XO24z/TwyJLBldwIu2xU/EIOf1Y5R6pQHQQrqIbsFnXYojsKgMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gdb8JDczRno+JM4eSptWKwnjmZDpWhwZ/3dSo4UPyXU=;
	b=SqewLaHXU08fKchbmi+nd6S4j0lUSPnF4WCXpqIgPvQ41DIn63MAqBTlv0vWnbsAscwD1y
	xWalUql2PkVdskAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 36/45] drm/i915/request: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:24 +0100
Message-Id: <4fe658e6d8483e44d4fff579bc426e627487f6ca.1738746904.git.namcao@linutronix.de>
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/i915/i915_request.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i91=
5_request.c
index 8f62cfa23fb7..ea0b8e7e4828 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -293,8 +293,7 @@ static void __rq_init_watchdog(struct i915_request *rq)
 {
 	struct i915_request_watchdog *wdg =3D &rq->watchdog;
=20
-	hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	wdg->timer.function =3D __rq_watchdog_expired;
+	hrtimer_setup(&wdg->timer, __rq_watchdog_expired, CLOCK_MONOTONIC, HRTIME=
R_MODE_REL);
 }
=20
 static void __rq_arm_watchdog(struct i915_request *rq)
--=20
2.39.5

