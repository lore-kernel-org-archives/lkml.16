Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4B22DF8B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752422; cv=none; b=YRmS+qyxqKQTbaHcWOQbKubecEKaVm8u/qlVPh1FfaRRtHGdx+tt5r/IS1yZJ8wt5ZCTlVPpE22IRJesGeNNWZ1VbV3K7rJX9jcgoZBacuyUR6pqhByHQP7B7jHF8zKFvgtp9fo0kkMf6evGwg0WbhEx3bVzg2i0DmUtAXpQBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752422; c=relaxed/simple;
	bh=RTIcDntORnBFrbDoWVtysJhweCd9AWB6YdVlqPE5F74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kzTwRUJdeh8mraPjdlpFHDRzfTNw5qCkfeMN6LdIbWkVCfBZvdRBrCOiZdPaXHkKG5i+P8AXaFukQpXm3ndfj1Ih1ITL7gOrnVmgIGNZy8bYBuF4lgmaL3E3BpE2TsrFX8WdZw62v2Mi2Ug4u8V6lnULKueEV8WfEbFvGc7/U38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sndaKmj7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xi4PryLz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sndaKmj7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xi4PryLz"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/u2BuUTSqZdVlNontfYSEOv3vBWRyRQQTr0mOU7iSOc=;
	b=sndaKmj76O6kopgISQg4rdRQWqKlg8IzIg5BkfpkBSOuWk3J2AyxmrQyYN2thNyonJf35J
	dAJTLvG3vX1Tk0HK8PF3+3yFAq8kocVKtETgOqeCZoFF9xdUteBNqWfAGf4FVusq2s+wgz
	AUdAIc7v+dg5A8GX/ZPrJ8I7v9ekf6WwTfKzZsqmZm5anBuSjg7v93vyFxA0UpUQDuUntG
	s2zDvNtoRhGu3PMt2R1A9nM7crzhi9z1Z+yt7+lucPzAvXZncFX/DEjf+PiH5Ybwvtqp+5
	lf9zVIvW8iOCNlANTOcdQ6+hPYMM/ehRJijsIheG8PoDXDg8H52TWW1LS/eiQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/u2BuUTSqZdVlNontfYSEOv3vBWRyRQQTr0mOU7iSOc=;
	b=xi4PryLzXyQoli5D06kvqqKbpKC1XFA0oNI3kEVbEvLFVQd0ITG22DaNxROqRJD8K40rkG
	udm4jqSh46EVlVCg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 13/45] scsi: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:01 +0100
Message-Id: <c951a5966e134307b8e50afb08e4b742e3f6ad06.1738746904.git.namcao@linutronix.de>
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
---
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c | 4 +---
 drivers/scsi/lpfc/lpfc_init.c            | 7 +++----
 drivers/scsi/scsi_debug.c                | 4 ++--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c b/drivers/scsi/ibmvsc=
si_tgt/ibmvscsi_tgt.c
index 16d085d56e9d..9e42230e42b8 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
@@ -2922,9 +2922,7 @@ static long ibmvscsis_alloctimer(struct scsi_info *vs=
csi)
 	struct timer_cb *p_timer;
=20
 	p_timer =3D &vscsi->rsp_q_timer;
-	hrtimer_init(&p_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-
-	p_timer->timer.function =3D ibmvscsis_service_wait_q;
+	hrtimer_setup(&p_timer->timer, ibmvscsis_service_wait_q, CLOCK_MONOTONIC,=
 HRTIMER_MODE_REL);
 	p_timer->started =3D false;
 	p_timer->timer_pops =3D 0;
=20
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index bcadf11414c8..d1ac1d1cec3c 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -7952,11 +7952,10 @@ lpfc_sli4_driver_resource_setup(struct lpfc_hba *ph=
ba)
 	timer_setup(&phba->fcf.redisc_wait, lpfc_sli4_fcf_redisc_wait_tmo, 0);
=20
 	/* CMF congestion timer */
-	hrtimer_init(&phba->cmf_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	phba->cmf_timer.function =3D lpfc_cmf_timer;
+	hrtimer_setup(&phba->cmf_timer, lpfc_cmf_timer, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
 	/* CMF 1 minute stats collection timer */
-	hrtimer_init(&phba->cmf_stats_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	phba->cmf_stats_timer.function =3D lpfc_cmf_stats_timer;
+	hrtimer_setup(&phba->cmf_stats_timer, lpfc_cmf_stats_timer, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
=20
 	/*
 	 * Control structure for handling external multi-buffer mailbox
diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 5ceaa4665e5d..fe5c30bb2639 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -6384,8 +6384,8 @@ static struct sdebug_queued_cmd *sdebug_alloc_queued_=
cmd(struct scsi_cmnd *scmd)
=20
 	sd_dp =3D &sqcp->sd_dp;
=20
-	hrtimer_init(&sd_dp->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
-	sd_dp->hrt.function =3D sdebug_q_cmd_hrt_complete;
+	hrtimer_setup(&sd_dp->hrt, sdebug_q_cmd_hrt_complete, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL_PINNED);
 	INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);
=20
 	sqcp->scmd =3D scmd;
--=20
2.39.5

