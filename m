Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A938198A08
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092734; cv=none; b=BwizGQ1xU9T9B1u+/8S9Q1gFXDI8OBPKBSuiexa7GKuLwQaZGCtjyqJdBMw0wtp/5hSptNe9B3v5m5L7z4wAySjoDteGjD5FNwWEjP6aWTwraOsd3s6nOagr2ehSp6c+IXbiZ1XmC37HC9TdRVB/t80Ws1YvvNjNTwqrN1xP+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092734; c=relaxed/simple;
	bh=/XVoDUPkVMXpMySVKgHf41oApm9urLS04UxPzNfilP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BsT0LWXMuwWl9y4Uxg8jH4ReP7c0thaAXcnFA2/q5AvsWiFL6sP62Wzzg5JahKad2fZxNLIJVMpvvQxg/HzzZDA4/1AiqVJdnbDY11/hJAcOxAydxNtbBtW0SNMaUVZJ4csOxzrH4HyvoVVscY1Mz6I7X3dGgLFyxTINOT7Dbs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DgJZWPsT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DgJZWPsT"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225df540edcso61306365ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744092731; x=1744697531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ja9t77LzVnBbcdFbbm7pXpQan+yLqLsiGwXfln1XZjo=;
        b=DgJZWPsTC6CcjQw1kmfRyxHEREH/8MqgJthJtdA0SmmJhFV3c2LBZentw4I439GXoc
         pXHUOxGrTj1pkG85vIJrHl/1XeftifriuEDFGBYRCga/f0CHPlD+wvk527n2IoAd8pqU
         A9xOpnIzalW5vceyBV3jlloLML34Ud+vmIl8FE0IRiE2RehJi/GjVV5TqVWru4BmbEHO
         fnrSm4/00ZRMkeut59hZeItepTyobpYY4eblnco4PrElq6Gsn+7ZfcC0TlDU6z4xQ3d0
         RYUs9Kf6XGHlcR4O33I9IyhCSQIkGST1cC5uxIJzaV6nY99dBVAfWqkIe/BeVB6I2Dvs
         mk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092731; x=1744697531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ja9t77LzVnBbcdFbbm7pXpQan+yLqLsiGwXfln1XZjo=;
        b=thcBbgxvAhWS3xesuZ4J9I+5shMltX8UAUHPGQhWlISout5TvnKC4SWxjATj6neocm
         4GpWMJZ0Ash5fbz+VzJIk5s/wbIheZcJgxAaSZpHnZmZ0BfIB/BBmOb/RIBY4XAfr6E3
         gH/juwQnQpvb0RZYpVfrGdBiIGeIke57Z8iY23zeqscW/OlJIEbn9UgRB2URcK5g52cf
         1cdbB0VM0Du+CHCbHA/X0670ITe+Gnv8llw/ZJX0pEApNYG4NfqAzVxUT8CTA7mVvSJS
         6MiT3tMDjaMYy/4VJW+yluNpClxtYQk0QI2Y9+5g04HcxGkAOUZm28mlAuByK66kEsSa
         XcOw==
X-Forwarded-Encrypted: i=1; AJvYcCWbhfe74rnVoiIN/6eSG58zH96PGxw8OZXrxKcDwJ4uoqWiCU4MLUKTWBpEFWAo6IEeR4LgR5nLt6caeTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2d5JlcSWbREGoKfBhmC7LgLW+pTmf+/8u+4nOE+FionS3sQP
	Birps2RSvdc5Q8excR6yv42Dno37bP01/AIbXiTYu3IAGD+gVl9WseLNW7sNQgQ=
X-Gm-Gg: ASbGncs012qLbjsrCICiz/N7IE4UcfRaA9hrKK4is9xqxu2mrkgXLnegLhzYGoaBFow
	OkrMZM6CIhbE7Wlz3stefyy0D7TLX2JD0s91zdJE696O+pfCNlUPjzw7BiFA/UVDvBNq+ZtDDSP
	dK8/FrRA6QKfj1qgfzAKaRIXPelMBQXopHXWnAvy/mHB4Tzep3H8P6vnqEFpN7/V79YsLFt0i0x
	9fRurBsMIiY9bwbff+RMW8MkxKWj83I0jGWj7F4dTGYm8vKPVneJ2/RKJv2SJ74YRwD1NKmMX7y
	h5vlNBv7gcDsi7lkm0vncleWnKnGYVDbnXe9kB3gECILKm8kYqaJToIogodihEc8x4ld8eqJLg6
	J9qs=
X-Google-Smtp-Source: AGHT+IF/7Kb27Mxww3xm9QXF7jh8x98TLr2PScPfaDKxwWdwGRcFiMRdb9/iQCiKilLFCYbh7uESNg==
X-Received: by 2002:a17:903:2281:b0:224:3994:8a8c with SMTP id d9443c01a7336-22ab5e0f6cbmr27047145ad.8.1744092731484;
        Mon, 07 Apr 2025 23:12:11 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787778efsm91523045ad.259.2025.04.07.23.12.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 23:12:11 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	pmladek@suse.com,
	arnd@arndb.de,
	andriy.shevchenko@linux.intel.com,
	namcao@linutronix.de,
	benjamin.larsson@genexis.eu,
	schnelle@linux.ibm.com,
	matt.porter@linaro.org,
	tim.kryger@linaro.org,
	markus.mayer@linaro.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2] serial: 8250: fix panic due to PSLVERR
Date: Tue,  8 Apr 2025 14:12:00 +0800
Message-Id: <20250408061200.76148-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the PSLVERR_RESP_EN parameter is set to 1, the device generates
an error response if an attempt is made to read an empty RBR (Receive
Buffer Register) while the FIFO is enabled.

In serial8250_do_startup(), calling serial_port_out(port, UART_LCR,
UART_LCR_WLEN8) triggers dw8250_check_lcr(), which invokes
dw8250_force_idle() and serial8250_clear_and_reinit_fifos(). The latter
function enables the FIFO via serial_out(p, UART_FCR, p->fcr).
Execution proceeds to the dont_test_tx_en label:
...
serial_port_in(port, UART_RX);
This satisfies the PSLVERR trigger condition.

Because another CPU(e.g., using printk()) is accessing the UART (UART
is busy), the current CPU fails the check (value & ~UART_LCR_SPAR) ==
(lcr & ~UART_LCR_SPAR), causing it to enter dw8250_force_idle().

To resolve this issue, relevant serial_port_out() operations should be
placed in a critical section, and UART_RX data should only be read
when the UART_LSR DR bit is set.

Panic backtrace:
[    0.442336] Oops - unknown exception [#1]
[    0.442343] epc : dw8250_serial_in32+0x1e/0x4a
[    0.442351]  ra : serial8250_do_startup+0x2c8/0x88e
...
[    0.442416] console_on_rootfs+0x26/0x70

Fixes: c49436b657d0 ("serial: 8250_dw: Improve unwritable LCR workaround")
Link: https://lore.kernel.org/all/84cydt5peu.fsf@jogness.linutronix.de/T/
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250_port.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 3f256e96c722..3df358008489 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2264,13 +2264,16 @@ int serial8250_do_startup(struct uart_port *port)
 	 * Clear the FIFO buffers and disable them.
 	 * (they will be reenabled in set_termios())
 	 */
+	uart_port_lock_irqsave(port, &flags);
 	serial8250_clear_fifos(up);
+	uart_port_unlock_irqrestore(port, flags);
 
 	/*
 	 * Clear the interrupt registers.
 	 */
-	serial_port_in(port, UART_LSR);
-	serial_port_in(port, UART_RX);
+	lsr = serial_port_in(port, UART_LSR);
+	if (lsr & UART_LSR_DR)
+		serial_port_in(port, UART_RX);
 	serial_port_in(port, UART_IIR);
 	serial_port_in(port, UART_MSR);
 
@@ -2380,9 +2383,10 @@ int serial8250_do_startup(struct uart_port *port)
 	/*
 	 * Now, initialize the UART
 	 */
-	serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
 
 	uart_port_lock_irqsave(port, &flags);
+	serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
+
 	if (up->port.flags & UPF_FOURPORT) {
 		if (!up->port.irq)
 			up->port.mctrl |= TIOCM_OUT1;
@@ -2435,8 +2439,9 @@ int serial8250_do_startup(struct uart_port *port)
 	 * saved flags to avoid getting false values from polling
 	 * routines or the previous session.
 	 */
-	serial_port_in(port, UART_LSR);
-	serial_port_in(port, UART_RX);
+	lsr = serial_port_in(port, UART_LSR);
+	if (lsr & UART_LSR_DR)
+		serial_port_in(port, UART_RX);
 	serial_port_in(port, UART_IIR);
 	serial_port_in(port, UART_MSR);
 	up->lsr_saved_flags = 0;
@@ -2492,6 +2497,7 @@ void serial8250_do_shutdown(struct uart_port *port)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned long flags;
+	u16 lsr;
 
 	serial8250_rpm_get(up);
 	/*
@@ -2538,7 +2544,9 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 * Read data port to reset things, and then unlink from
 	 * the IRQ chain.
 	 */
-	serial_port_in(port, UART_RX);
+	lsr = serial_port_in(port, UART_LSR);
+	if (lsr & UART_LSR_DR)
+		serial_port_in(port, UART_RX);
 	serial8250_rpm_put(up);
 
 	up->ops->release_irq(up);
-- 
2.39.2

