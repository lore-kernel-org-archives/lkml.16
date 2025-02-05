Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D19231A41
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752423; cv=none; b=fFblnXRDR0nC4tFz7h6ZFgxsgMOKvX8SnwzXHy5OFaf76wfT/Uigu+D2xJBkUGuVmVbcBH413uyONfqiawdAXCqYdFdUQ9WZ6/bLek8pVOL2CymN747PsSWhWiR9GCXtrxYEDBeYXEGKAJrwe3cGXXN6EdIpSGoU0SCZ/iS7GWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752423; c=relaxed/simple;
	bh=jZqpz2l9g6hmV5ODIy3KvrappbuokMR0nWeWwI6Jk9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FcNu57eTCF4UwxGbt37tiQk9W+6lVE/GuNx140fLw/QFpP7UmLISO7f0UMOIdKUbGnzOZ7Qy1eEoDwUaUOkTVMwgJRKgkmP6SYK7RF6+8ouhFCLIUGE3wVfkgh7z8F8Pmylf9A3ZagQQuATKQBb8f/iPoo9SgX9+C9mO3bc4SLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LAzD2AW8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XkIL1LAy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LAzD2AW8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XkIL1LAy"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7LqWuuUfDm3xRsvF6tMM6TaXD7gQmWW7bF6UzLZQBc=;
	b=LAzD2AW8IUJGotNhJE08i4pLx+36lMPq4euqFhd5fOtEHhnmuCiaxb74/vgmC0l8QwPSEd
	UR1WCXCb2nLDH1OieR8bNAopFwV4FpUN0eyzEaG73SOFBVU5hRwCmBSssd1VNNs6qcEMuY
	fhIXp9sLQCjEl/OZIuR5KB3nJs1kdmgACcBqmqsAK6cOZAXdaqrramIQAggFIw7gzNejJ/
	+MVf/w94oVeA+BL5bnwXL10qkKsApLe6zRSrk6TdBdVDioxDhIyZgRCgbkwAbkupuQi75y
	svvtArY1pENz2lcr7TRufozepnNLsbrG3zn7aLWfXBsXxZzDIYC/7aam9qIXlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7LqWuuUfDm3xRsvF6tMM6TaXD7gQmWW7bF6UzLZQBc=;
	b=XkIL1LAy1u4ZAYpoe8mAgx/xWrJt3PAYJGEmLkGp4FUv8MyjflV2Dfo6lfuGd9YiP45UYm
	Ku7e4d6Q0XKOv3Cg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 19/45] drivers: perf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:07 +0100
Message-Id: <471ea3b829d14a4b4c3c7814dbe1ed13b15d47b8.1738746904.git.namcao@linutronix.de>
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
Cc: Will Deacon <will@kernel.org>
---
 drivers/perf/arm-ccn.c               | 5 ++---
 drivers/perf/marvell_cn10k_ddr_pmu.c | 4 ++--
 drivers/perf/thunderx2_pmu.c         | 5 ++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index d5fcea3d4328..1a0d0e1a2263 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -1273,9 +1273,8 @@ static int arm_ccn_pmu_init(struct arm_ccn *ccn)
 	/* No overflow interrupt? Have to use a timer instead. */
 	if (!ccn->irq) {
 		dev_info(ccn->dev, "No access to interrupts, using timer.\n");
-		hrtimer_init(&ccn->dt.hrtimer, CLOCK_MONOTONIC,
-				HRTIMER_MODE_REL);
-		ccn->dt.hrtimer.function =3D arm_ccn_pmu_timer_handler;
+		hrtimer_setup(&ccn->dt.hrtimer, arm_ccn_pmu_timer_handler, CLOCK_MONOTON=
IC,
+			      HRTIMER_MODE_REL);
 	}
=20
 	/* Pick one CPU which we will use to collect data from CCN... */
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn=
10k_ddr_pmu.c
index 039feded9152..72ac17efd846 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -1064,8 +1064,8 @@ static int cn10k_ddr_perf_probe(struct platform_devic=
e *pdev)
 	if (!name)
 		return -ENOMEM;
=20
-	hrtimer_init(&ddr_pmu->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	ddr_pmu->hrtimer.function =3D cn10k_ddr_pmu_timer_handler;
+	hrtimer_setup(&ddr_pmu->hrtimer, cn10k_ddr_pmu_timer_handler, CLOCK_MONOT=
ONIC,
+		      HRTIMER_MODE_REL);
=20
 	cpuhp_state_add_instance_nocalls(
 				CPUHP_AP_PERF_ARM_MARVELL_CN10K_DDR_ONLINE,
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index cadd60221b8f..6ed4707bd6bb 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -752,9 +752,8 @@ static int tx2_uncore_pmu_add_dev(struct tx2_uncore_pmu=
 *tx2_pmu)
 	tx2_pmu->cpu =3D cpu;
=20
 	if (tx2_pmu->hrtimer_callback) {
-		hrtimer_init(&tx2_pmu->hrtimer,
-				CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		tx2_pmu->hrtimer.function =3D tx2_pmu->hrtimer_callback;
+		hrtimer_setup(&tx2_pmu->hrtimer, tx2_pmu->hrtimer_callback, CLOCK_MONOTO=
NIC,
+			      HRTIMER_MODE_REL);
 	}
=20
 	ret =3D tx2_uncore_pmu_register(tx2_pmu);
--=20
2.39.5

