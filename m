Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C4622F39E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752249; cv=none; b=N8jE3mNXULj0+Izbnyv/kRXCbb+jRDBSu2SJZocqxjF4l9oa7QR+iyD/A4kytGG5lM3HWluhz/4LcbMw3gvaGM9o3KYMKAyawyuEGbNQUElnTsxzQHqNtK6TrQDk0fz4QMjTHNRiPJPUZ5W6g0MlV7fT5J+uyqxXHI+PjuffaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752249; c=relaxed/simple;
	bh=Q4vk5D1wDmsBdUltdmNYprQX1rc+kKtOrEa6qf6kl2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tf9koYxjyxqr/MJyTe/z3pObEkP3mZvs6/PbZ9fZHyNABvVcUW4wVvQeCnZ/8W1PFfzAOuIf92wq6hHaeiA1b+dGjjeM2oI7ojLsgeDisVsCMiLxONLaolLyZnshquGCZWAS2UfBDB8AlO/KfMgPccfO5ClphGZsEMBmtYdQBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LEAYRWop; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5QZrjDOY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LEAYRWop";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5QZrjDOY"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfC5OCWs8G351UT8EZKOWgRxOfS/WPv9BXMb+HW3OEM=;
	b=LEAYRWopDViGeBhtmP9Li+zktwD92F03UrlJ/xFDnqfG7XVvs/YlYpARxLpTIux4Rv7WkQ
	oeDkFxVpMD8iu14F8zsLUBDsko2tv5ztCpY+EhmNY36XVZMxsl5aFIQFbBOdZt4UlHZW9G
	V3w+Tgu1hfAaETaiTcA5+J+z9vzBEZtzWG1R/6WGOHPslh9Dy8hHG6BYp/WOu+Uk9EBMJl
	gW/UiCPdHR47o1X6P47wXMdfpSoyhgEmci3sKuBMUgRgN+6FaOWaAo1XzEav2qSnDPKsar
	Dqy7jI4hAf+xF6cQWO7oJnoeuIoCSkDdyPRXn17EutHfjemE5jlsTlyNW0fLtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfC5OCWs8G351UT8EZKOWgRxOfS/WPv9BXMb+HW3OEM=;
	b=5QZrjDOY3Ze3nfkh6sLLKfwS/TkF0UdlZD7HlmLKS98DIN7SpT0fDf136y/n2FLPyAq4he
	feUJmCdhjiTfqxBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 22/24] igc: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:42 +0100
Message-Id: <baeaabb84aef1803dfae385f6e9614d6fc547667.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethern=
et/intel/igc/igc_main.c
index 56a35d58e7a6..fb8c89479142 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -7086,8 +7086,8 @@ static int igc_probe(struct pci_dev *pdev,
 	INIT_WORK(&adapter->reset_task, igc_reset_task);
 	INIT_WORK(&adapter->watchdog_task, igc_watchdog_task);
=20
-	hrtimer_init(&adapter->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	adapter->hrtimer.function =3D &igc_qbv_scheduling_timer;
+	hrtimer_setup(&adapter->hrtimer, &igc_qbv_scheduling_timer, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
=20
 	/* Initialize link properties that are user-changeable */
 	adapter->fc_autoneg =3D true;
--=20
2.39.5

