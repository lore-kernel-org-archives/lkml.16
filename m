Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5874F22B8A8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752416; cv=none; b=U5/faYAUpTih3GsOON6jlE7u2RD4OuD5AcIBfhymKc+BcEfQYY/JjTjGNoJuLgqtNDujA3801A2BxfTsELFUV3E8au/528qFVF9H6AbFA4rrEK4nBSU5K5RgNt80N4ztFpoc4cygO7/G370hGmo5qQRp0IMvXTFf7p+b8JOkiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752416; c=relaxed/simple;
	bh=7buoS2hvIQvhff3Yp7U/dZPhS6NZLTiuCtbPcmWLPno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dU+NEGHIlojl78T/wPrp7m50iLbsVoGj+x0Bpk+2Q54wwribxZjSBDs1cB6s4om1dOxJIHsy1QZUNGqSFxxRqNUMQfNfC/kUuCNGuJvonzMGE0RP6paQUCTe8txwd2/Zv0+9Ub4VM9mva5Ify2QZDZHhqtlqfFqwyAuiMxmbJ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rHePW1K2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B4MVSsPz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rHePW1K2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B4MVSsPz"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCwDGj+PQtMTAr1XdhZYO4qPeYwNQzR+uHCDb1zQIdo=;
	b=rHePW1K2jxZMN6PM+4jt9l+U/jKEBb6iZbmGXFBvmerHvZW28mYv0tjycsMuXQJJ1UHSUK
	8BWAWTzSdfoGqikN4wI7JmrqsAfMSNuAz+rV9FT9rsRZCJXRSRC1NJAkBjUhBkJoobzK5i
	2oK3L8ql05CnEyt8KrNuj8cZKd1V0m3XSDSo8/RuYkbsy2xWXUBVcslc80juWsETNy0nCO
	GQj0mB+/v+660ZddqRGRTrXuEdTqoLqcSY/+eW+Rs8Z+pNn9QcUJn4ezjS5feJFC7RlFnc
	idS8siMFzGYUIvl0Zy+KGm6sFd5zxPPKtMwwdgj47w1cHyUWp7MyosulbfbhoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCwDGj+PQtMTAr1XdhZYO4qPeYwNQzR+uHCDb1zQIdo=;
	b=B4MVSsPz0/rEL6TgVw5LG8DoFoG2XCUbiMSy1Bu+hEQ9vwgRFbN+QJitf6rbopnBVHM/oV
	HLl92z3McsoIuFBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 03/45] usb: fotg210-hcd: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:51 +0100
Message-Id: <eeabb788995d7566017ebcff6cc2daa8da35432d.1738746904.git.namcao@linutronix.de>
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
 drivers/usb/fotg210/fotg210-hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg21=
0-hcd.c
index 3d404d19a205..64c4965a160f 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -4901,8 +4901,7 @@ static int hcd_fotg210_init(struct usb_hcd *hcd)
 	 */
 	fotg210->need_io_watchdog =3D 1;
=20
-	hrtimer_init(&fotg210->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	fotg210->hrtimer.function =3D fotg210_hrtimer_func;
+	hrtimer_setup(&fotg210->hrtimer, fotg210_hrtimer_func, CLOCK_MONOTONIC, H=
RTIMER_MODE_ABS);
 	fotg210->next_hrtimer_event =3D FOTG210_HRTIMER_NO_EVENT;
=20
 	hcc_params =3D fotg210_readl(fotg210, &fotg210->caps->hcc_params);
--=20
2.39.5

