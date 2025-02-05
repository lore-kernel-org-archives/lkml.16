Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510C022B8A6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752416; cv=none; b=TEJ19CPIMVPiBNz/RxA+yQzjvZVwNs09S0sf57UM6DhY4boSMZ4GyGnnQXV0X5SNLXvNrzU7Q7A6uHTTIKLEDNGFIOH214vy/iFWv0GbVn6pVeJSvJTShNMIJhp71O8vX7P2rOz+hkOut0FdhswUw6el59eGRZsQKthzDznD9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752416; c=relaxed/simple;
	bh=bs++FyLNlKakLTGUh+bpO8uwb0P5xda1dqZA5sAT1iQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OUfzgSdjp+fAjWXeljDdj7ejow02rjVwFK759D/dGBupoyYquQADLG8eD07ZbVWBYBPa8rsI7FJEjRRMCM+Z0+95ZF274kFR/2ElChr6x3i33/VJnU2ZyXE4CgaEzeH9gKR+Dg9Qvj4qY2wiVNY5Cl8l0ounwdxCBGkAD5altpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MToZjmxN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mRE0TV+a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MToZjmxN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mRE0TV+a"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anQ2OqdKjLDOPXKqxWLFKMkw70YcLhDTGu45hmos12E=;
	b=MToZjmxNjNZ7zAS3obKpBfKbiyarccpNpjHoi+0wvgukjj6qQb0q6ds7BzSHLlceMr1zAO
	6P6c+lzvulU13UrVM7xIHS+uvvpKoWZ7cY782Z+MNXITaCRHqKlg78y85VnoNvNxeEhziS
	3lIzRCVNdkAxfbUKKraLWG5DiNrH/qM5nuxb/6T7/fWfUed84x5HWq6FjMKVnBd0rHmQWm
	8j6jHarF05QFOd6/T0vNg4iyV/45qDNl/0VN2JeElDXFvTTZkGRUnEJOH5j1gNgFIBhYRW
	hkx396QkORL3/O/aeOaQ/M9VzvTokgbobQz5AJvf+jkSQprDLn+Qb4I8Fb8Nlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anQ2OqdKjLDOPXKqxWLFKMkw70YcLhDTGu45hmos12E=;
	b=mRE0TV+aWQUoDSebj4L0yEQlogVCxgH4ORQGMBiV7KRPdggfNT4DrRWwa+qu1do/bEKm6q
	+OWIOnr+JqpQBYDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 04/45] usb: gadget: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:52 +0100
Message-Id: <7239d6211ffb0dff6351d0549d065277f2562793.1738746904.git.namcao@linutronix.de>
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
 drivers/usb/gadget/function/f_ncm.c | 3 +--
 drivers/usb/gadget/udc/dummy_hcd.c  | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/funct=
ion/f_ncm.c
index f60576a65ca6..58b0dd575af3 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1559,8 +1559,7 @@ static int ncm_bind(struct usb_configuration *c, stru=
ct usb_function *f)
 	ncm->port.open =3D ncm_open;
 	ncm->port.close =3D ncm_close;
=20
-	hrtimer_init(&ncm->task_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
-	ncm->task_timer.function =3D ncm_tx_timeout;
+	hrtimer_setup(&ncm->task_timer, ncm_tx_timeout, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL_SOFT);
=20
 	DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
 			ncm->port.in_ep->name, ncm->port.out_ep->name,
diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/du=
mmy_hcd.c
index bda08c5ba7c0..4f1b5db51dda 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2479,8 +2479,7 @@ static DEVICE_ATTR_RO(urbs);
=20
 static int dummy_start_ss(struct dummy_hcd *dum_hcd)
 {
-	hrtimer_init(&dum_hcd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
-	dum_hcd->timer.function =3D dummy_timer;
+	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE=
_REL_SOFT);
 	dum_hcd->rh_state =3D DUMMY_RH_RUNNING;
 	dum_hcd->stream_en_ep =3D 0;
 	INIT_LIST_HEAD(&dum_hcd->urbp_list);
@@ -2509,8 +2508,7 @@ static int dummy_start(struct usb_hcd *hcd)
 		return dummy_start_ss(dum_hcd);
=20
 	spin_lock_init(&dum_hcd->dum->lock);
-	hrtimer_init(&dum_hcd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
-	dum_hcd->timer.function =3D dummy_timer;
+	hrtimer_setup(&dum_hcd->timer, dummy_timer, CLOCK_MONOTONIC, HRTIMER_MODE=
_REL_SOFT);
 	dum_hcd->rh_state =3D DUMMY_RH_RUNNING;
=20
 	INIT_LIST_HEAD(&dum_hcd->urbp_list);
--=20
2.39.5

