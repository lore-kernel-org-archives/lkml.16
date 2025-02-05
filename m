Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEB022DF8C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752422; cv=none; b=uiVwEXTelIpddcCQRxhJxIB8j19dhI8FrPAMsQa88CkZQ1FI/Yj/FpiGlqCQ0JM29nIS0rqkZg1Ua2sqUgvPbPxT1M191b0iVJi+1X7uc7bPSCNw/s4KVphZLkJHRAQXYyD7MnwCrXLqvbtLZYj1BOOvXolmjDbkyl/JEVEqVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752422; c=relaxed/simple;
	bh=UOf2/Y8F8BZf2qeQpJln+jMjEG7auOWl6hXxESuDhWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CLpLOeyFocFU5KbT7BB2UzXNBp0y4ocn0D2iJLWcGo/x4ETnvwpuL8xVBaxm+vljQm9ZkKiS8+nHEhUAYSv0seCfRm7eN6gy6jBWLJf0XtbQrG12QBlgROV6MToiaip3tB6WMe8M0MdU2eFWmpP5r8Cw9RoSjxtmjpV0onnZKTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mGw5uj/G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nCwJkZXS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mGw5uj/G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nCwJkZXS"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CW0ESEBqmHamIsofGrUEsEy7d32I/4w69xlp4Y7u2Vg=;
	b=mGw5uj/GH7UBBP5KLF4N+GG68vBkcuysjyAtfSpy5e6gosvKWSz5eFOkBw/1PVAGGyMrSH
	YLNy0gz0/k8Tr2TiVOZt63+DVW8+p2hiJfUVJ0XiDkH82noWGW6/xNiJRav7gO1ustyste
	bJj/ywCbf0gmnNPjgZsTAnqiYDHF47KQLBHWc7DIGo3zsGlheLMZI98jwFC6WI2yAoXTH5
	XQ6ouNjw0Gr9vPnQkpME2OUhzXMGn8sa5OoiHQj2gAqBFLQpNSYiMHRHhIoFxexJo8DEmV
	1Vq72OIaNH4xOq66CnDVzMDYTvGPHCUoJnn34Y+JLeawulv32ly5Xb7bTthiAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CW0ESEBqmHamIsofGrUEsEy7d32I/4w69xlp4Y7u2Vg=;
	b=nCwJkZXStepwo68UPAjUgg8rKosGrN+1ZVQZH6iRXbrcx7qrj21jQZhTWtJpJlPWr80bUY
	APkoeAPnqyE3K2Bw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 14/45] rtc: class: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:02 +0100
Message-Id: <22f3f087ddbab1708583033c07c3b7fb17810110.1738746904.git.namcao@linutronix.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e31fa0ad127e..b88cd4fb295b 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -240,8 +240,7 @@ static struct rtc_device *rtc_allocate_device(void)
 	/* Init uie timer */
 	rtc_timer_init(&rtc->uie_rtctimer, rtc_uie_update_irq, rtc);
 	/* Init pie timer */
-	hrtimer_init(&rtc->pie_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	rtc->pie_timer.function =3D rtc_pie_update_irq;
+	hrtimer_setup(&rtc->pie_timer, rtc_pie_update_irq, CLOCK_MONOTONIC, HRTIM=
ER_MODE_REL);
 	rtc->pie_enabled =3D 0;
=20
 	set_bit(RTC_FEATURE_ALARM, rtc->features);
--=20
2.39.5

