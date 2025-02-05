Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289122CBFD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752934; cv=none; b=biiNKHWlU2VzBiZYvxD+moI8p8b+UUvNnOmN2EY1nPc/dHdcDp87SSLCDrh0cRWpf5xzZGmLyy+XR7UE/4Bw1pCyQSze3HAZqT6TqgnbDGehZeJLmTPFVZ8pnZz9vznL69CfOSxzBmJkEGhz9Ayw9V0oN/OBT3udR2rVI+XUDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752934; c=relaxed/simple;
	bh=uougq3/FUtqV1XHwUKvJ/joSKsfLnLLJbKj8mBdKhjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vu9nQZ1vOdncptZOCvN3yN+xgcpFSeROISDyZf1r5TxRfCTn9yMnOLxkVa34x8ExWZhf3DxmUFvm3pr4qXEv4U0UyPPkKHU2DVfAeSuHCch0sMEOlmMGIfivZKhYscCFkxfVlaOQ9ypMo9fMmxcTHLf2UUIZRSz2n8OYTEb0UTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1/drSwpC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P8iWmkSa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1/drSwpC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P8iWmkSa"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6ZVgDThNK2QaoDis7kdyvcQ2GvPmE3KD8IQvqO4Axo=;
	b=1/drSwpCBHg7uqfkVJwDi6tWQ70xIshv92hUXGpjOK403TT7aplHZP60lx78o6IiGqgFU5
	tjP+N1C5riunzhYkcU4h5avykDz7qsuXBfYGj8DNpha8vT8kATlSTFIHPXVyhDeaQPFV5N
	SEoGApysc6eDMRFksgxfvZ3WYsGsyqIOv+98BM+rDnEXWM4FAxkvRVyhxhZU//CkhQRnsY
	WaViW+pyV9D07nAhGQWya2kl8m72P16VHewiKix0Ett1DD/EuxVj3aYDkHy2dDKnNieegY
	xm+/nMkITrAeOO/H62VgNwPHibtNUBqm9OPAT8I6z117NYiTU7jYy0XsbAILEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6ZVgDThNK2QaoDis7kdyvcQ2GvPmE3KD8IQvqO4Axo=;
	b=P8iWmkSarjF2avKmzZq1xuHRctmeBSx/44VE3L9JkdDR+14vK1OKYU0QCnb/JJbzp5VHXo
	OgP6fNxDGnqrcjCw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 04/12] serial: xilinx_uartps: Use helper function hrtimer_update_function()
Date: Wed,  5 Feb 2025 11:55:13 +0100
Message-Id: <af7823518fb060c6c97105a2513cfc61adbdf38f.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The field 'function' of struct hrtimer should not be changed directly, as
the write is lockless and a concurrent timer expiry might end up using the
wrong function pointer.

Switch to use hrtimer_update_function() which also performs runtime checks
that it is safe to modify the callback.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/xilinx_uartps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx=
_uartps.c
index efb124a19c01..fe457bf1e15b 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -454,7 +454,7 @@ static void cdns_uart_handle_tx(void *dev_id)
=20
 	if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED &&
 	    (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port))) {
-		cdns_uart->tx_timer.function =3D &cdns_rs485_rx_callback;
+		hrtimer_update_function(&cdns_uart->tx_timer, cdns_rs485_rx_callback);
 		hrtimer_start(&cdns_uart->tx_timer,
 			      ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart)), HRTIMER_MODE_RE=
L);
 	}
@@ -734,7 +734,7 @@ static void cdns_uart_start_tx(struct uart_port *port)
=20
 	if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED) {
 		if (!cdns_uart->rs485_tx_started) {
-			cdns_uart->tx_timer.function =3D &cdns_rs485_tx_callback;
+			hrtimer_update_function(&cdns_uart->tx_timer, cdns_rs485_tx_callback);
 			cdns_rs485_tx_setup(cdns_uart);
 			return hrtimer_start(&cdns_uart->tx_timer,
 					     ms_to_ktime(port->rs485.delay_rts_before_send),
--=20
2.39.5

