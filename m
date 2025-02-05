Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28822CBC7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752419; cv=none; b=sQQtxnqBhesMUfuixrvF9cQp8VGqguLpttfqhaMOmztpDGRN5yvl4QLEwHuLQc0Q9ztzKDeewwQado0pJFXuK+bim82ynP/CmwQmVb/HJmyzq34plJwCehMmltQdpThpSGVvmdmbl6gxCdeRq7MiXsZCVybUosKa59FZXnptknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752419; c=relaxed/simple;
	bh=iGrPhhoAmhPQDdVgEDOvn7z16eITKBaj8o51XTSb/cM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nODqJzU6V1LlS59Ss5W/zBGGEXlr7j+/ggS4oTUjyLvn8NaW4+PL8Exns4hqlX+HOtIxM+BobmovK4wzrDr5t27DZ+1oeDsgQj2SpjqzeA12COlpn6fXtfHaENbB+jjeZNOfKHgUhFQGd3j/nxnVpebwZqVv/PSu0ui6AWkui34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JrR/Cf/J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8S3e1+sO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JrR/Cf/J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8S3e1+sO"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8tmDpiTulXdtJ4633D0bCX9FXcWcVx4uSb+Z50myDk=;
	b=JrR/Cf/JfnQof4OQuDwVYUtHpyp0BbktbvVZTYkk1l35JmtpttIgJo48HIrRqAJfwQACjB
	hSwRdKMEImw/E5CaloQtJU7NvF7jSG5nsE2AGq2gQCK4PU7hoUe2vtGc+QOurct8GmN79P
	nlloDn/SsMVo72F4TFYgl7vC88rpFsxEQJ960vAuiLJO72MeuqdG3VRE+XUj5NxtsD3Axb
	TrkHP3W4cpx0FNwBShBwo/efnY9fZz2Z+He3r/EFfvM4gD9TyosL2460tQjHH8OplKwGDH
	cd9Gxywr9aVN3SuFcKZX6iISiiKGDAjxS6b4PzgVe6TWU2wwfUSFm9NV3lP2+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8tmDpiTulXdtJ4633D0bCX9FXcWcVx4uSb+Z50myDk=;
	b=8S3e1+sOeNmU5ffO+OhVdQjUG0lBQbBgRK6Q41FQEY5Q1p6pXgH35xOwTXx+FzumEUSafC
	N8R4O9w7JIGAkoDg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 07/45] usb: typec: tcpm: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:55 +0100
Message-Id: <7fd2a1f72b3833e1fb36f56f2b28a08c1e64f47e.1738746904.git.namcao@linutronix.de>
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
 drivers/usb/typec/tcpm/tcpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 47be450d2be3..ebe076f01675 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -7722,14 +7722,14 @@ struct tcpm_port *tcpm_register_port(struct device =
*dev, struct tcpc_dev *tcpc)
 	kthread_init_work(&port->event_work, tcpm_pd_event_handler);
 	kthread_init_work(&port->enable_frs, tcpm_enable_frs_work);
 	kthread_init_work(&port->send_discover_work, tcpm_send_discover_work);
-	hrtimer_init(&port->state_machine_timer, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
-	port->state_machine_timer.function =3D state_machine_timer_handler;
-	hrtimer_init(&port->vdm_state_machine_timer, CLOCK_MONOTONIC, HRTIMER_MOD=
E_REL);
-	port->vdm_state_machine_timer.function =3D vdm_state_machine_timer_handle=
r;
-	hrtimer_init(&port->enable_frs_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	port->enable_frs_timer.function =3D enable_frs_timer_handler;
-	hrtimer_init(&port->send_discover_timer, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
-	port->send_discover_timer.function =3D send_discover_timer_handler;
+	hrtimer_setup(&port->state_machine_timer, state_machine_timer_handler, CL=
OCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
+	hrtimer_setup(&port->vdm_state_machine_timer, vdm_state_machine_timer_han=
dler,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_setup(&port->enable_frs_timer, enable_frs_timer_handler, CLOCK_MO=
NOTONIC,
+		      HRTIMER_MODE_REL);
+	hrtimer_setup(&port->send_discover_timer, send_discover_timer_handler, CL=
OCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	spin_lock_init(&port->pd_event_lock);
=20
--=20
2.39.5

