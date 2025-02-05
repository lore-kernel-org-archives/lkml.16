Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8BF22C352
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752419; cv=none; b=SVDLdAlDyNERIJcKiEYXzdrJDqx64CG3vWCr9jPe55L3942r+ifNQTcbj2sbzVhXlhy+s9D1ABD/LlOPLH7mEPiO/h5qtIVOSgcs+gfKMmzMPzrO7zBUhetI7ERWvGKGRi6a411mc3rblRKe5KSem864+jcyhtkmBBCxGueRLqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752419; c=relaxed/simple;
	bh=MdE5Oc0zQkfPEaggbeZfhJJ0D1rSui76rgQV4fDPqHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fv9yRLkejJLlUZdxPcgh9+MIywnAbHthoIiM3A3Y7I7ZM9S7PStXqr4xl+ftjZLzDXCrv8lid9ZjNEY0Lm1eiHvc/6Jndy98W4caNhoJ2dm3OXa14oS6HcUnL3PRWUK8cPbA9QcNn4c+kTOSXdosMvovQRJr5/7s705BbHiHqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oakE9sDj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zq6TlPPG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oakE9sDj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zq6TlPPG"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aymLzRvTqHP52Femiu3bof1zUOr5zJIqIQJDmVQ6QkM=;
	b=oakE9sDj90y/JJI0p0YEMyiG4vQipCBr5uUGrSfKI8hlMaH8T2GsbGGlbGqxB+IbrFXU74
	78R7CecczeL8s6KbKvwSHclx85oJU3FQ62OOFkatKsdkPF4DPvGIBLLaPJywtABgW6Mkkv
	yiFw9NsHpIAPTNwRTf4Ji302U7XqTJW83RZCx8piaBfGJefScVxvzqB46fvc3dAXdtIqXv
	F+y94OTSjNhNMae7EaBP80fUWkUaQGxBaGsNWI/q9LHjPu884fEXolyoKgtV+2Nrg5Dx7r
	uBYxG3jvlVQct4bdcTO06w0Zqy4RSKitEqPvqWwGcBp8x/RkEWDBpETDvIWLUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aymLzRvTqHP52Femiu3bof1zUOr5zJIqIQJDmVQ6QkM=;
	b=zq6TlPPGElu/1SP+aKvnfFtP5hbXQQS56GfFQLjrWsrgImC73cGfwlu+MB+vSiR22My7yN
	BKrKVM3ZZX9gXKCg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 05/45] usb: ehci: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:53 +0100
Message-Id: <d703731ba61d1901c97758a60ccc3c209d21de0e.1738746904.git.namcao@linutronix.de>
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
 drivers/usb/host/ehci-hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 6de79ac5e6a4..6d1d190c914d 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -466,8 +466,7 @@ static int ehci_init(struct usb_hcd *hcd)
 	 */
 	ehci->need_io_watchdog =3D 1;
=20
-	hrtimer_init(&ehci->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	ehci->hrtimer.function =3D ehci_hrtimer_func;
+	hrtimer_setup(&ehci->hrtimer, ehci_hrtimer_func, CLOCK_MONOTONIC, HRTIMER=
_MODE_ABS);
 	ehci->next_hrtimer_event =3D EHCI_HRTIMER_NO_EVENT;
=20
 	hcc_params =3D ehci_readl(ehci, &ehci->caps->hcc_params);
--=20
2.39.5

