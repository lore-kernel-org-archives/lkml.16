Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9922CBE2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752420; cv=none; b=QQYI+Gi1Vl8msJdyz6gr8OF/RE/lvzleJRHRv4qeBYa88kQandrygfsQOUh8mHR6vE/rMbFMmUapNzAg3voC2Xd1aRxfe3xKm6NMbruEGUsL6Gx11caTtqq/OnwwxWcaOXCxxKPfHdNZOjiWBfqEJaRH1VuzVLB3Fj/+x0aOkiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752420; c=relaxed/simple;
	bh=Q4a7ZQ/VZUrPUfFQFAShzrAtCZcbXulEd3aHeO5DW+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WgREhyRjMkz9yq5I31cKWF3mkvWNoJTmMimlB2V5uow2HP6jUGpUQWOsQRgQzl4sMw2ONlu0uYa1xEWCwBlA24XnX3FVUvxfHFYB3D3qyRN4VfMQbVih5856zgiiAM4UAfPtqKIaQPimfIQcJIvgv2SzEkvF0JulFZcRv9hhIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BGT6oNEH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=duonQ1YM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BGT6oNEH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="duonQ1YM"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBC+KcBMAxMWG2xDcNIn1aNh9m0E4jNVlX7Ii7D1Hm8=;
	b=BGT6oNEHkIoyp5op0wdXmnXlAWMBQO9KdXd88kXRCpnpnPOHi5J2r4SEtLme1IWbt3jjSY
	Un2zfewOduyVuweinJqtSFNl/C4QDU1MtKvf/022y+B8ElCETs9zOxwsYkQzdi7epydNNN
	M5SSZthMQ3U569+inZsIq/G27JnqkxAaNUDZ4suUG0M0qeylSqo5SnN7QU9M5ooiW27Tk/
	J0x5YFIw0VAxTJ9Cucx/hU0iuIfnGhUeWXxBR5LywUc8ggo+hj305TXGfmeqQLrwctU4bT
	9nI0jHorx6KtqrHcOffkuEuKdkNY5WBImWW/Rb+raUWzRmVbNGCqnFWfloHQiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBC+KcBMAxMWG2xDcNIn1aNh9m0E4jNVlX7Ii7D1Hm8=;
	b=duonQ1YMks7+TrLaU/oDQA/hY0ujvlKXpB1lOt98eZJrpS2A7Aswiw3Tat/Bggu+qC/pLC
	17xBnV1166TN9LBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 12/45] serial: xilinx_uartps: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:00 +0100
Message-Id: <4a028a23126b3350a5e243dcb49e1ef1b2a4b740.1738746904.git.namcao@linutronix.de>
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
 drivers/tty/serial/xilinx_uartps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx=
_uartps.c
index 92ec51870d1d..efb124a19c01 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1626,8 +1626,8 @@ static int cdns_rs485_config(struct uart_port *port, =
struct ktermios *termios,
 		writel(val, port->membase + CDNS_UART_MODEMCR);
=20
 		/* Timer setup */
-		hrtimer_init(&cdns_uart->tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		cdns_uart->tx_timer.function =3D &cdns_rs485_tx_callback;
+		hrtimer_setup(&cdns_uart->tx_timer, &cdns_rs485_tx_callback, CLOCK_MONOT=
ONIC,
+			      HRTIMER_MODE_REL);
=20
 		/* Disable transmitter and make Rx setup*/
 		cdns_uart_stop_tx(port);
--=20
2.39.5

