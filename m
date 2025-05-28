Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF03595D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413584; cv=none; b=nDO+uZwq+AzV28KVxK2ui2j+OfpHKtlIxnZFbrCyIHlW4bwGArJdOXKhK99w+fDlKWXSTexza0+lrHVGmMSzASHHS6y3Xi8iniJSdy65oVXT0T7raXp4gasCd5oJaI9r1J+vVJpMS0mbDavJ424syNmscrV1bT6j2yW+rx2sQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413584; c=relaxed/simple;
	bh=kVXBJy2waXc8Zm3U1zeBkK0QCDtIv0VCdcWVejgqIaw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=LciZjwCwlsGIJfenW3TnDFLzMQcrwf0fg+36VxN2CXsRqpPZCZISIBeaJKgo5ygEH9AnSSl5MSNSF+MXlJUFQxuYsUxUVNWF9HnD0NILosUXCSO0b8IupajYd8CKUdkm/TzWCzC6M+kDO06hlwWgxKVsVUqtfKxG6q+LHarkIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ewSpP0y/; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ewSpP0y/"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2c4476d381so506577a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748413581; x=1749018381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJQtmBORsLul2V6MNygZMp10lRlI52BK+PKHssMFRlI=;
        b=ewSpP0y/zWP6dzyhIJbggeIjxYShxz9NcHfqBwijmiCUiVlpPSEUZscjH3SXlKHHaP
         jwuKUo8j8vUl1+OTjcce97wf94Dlb/RZDU8dMDiiGfI20QzMh8+adwq13Vt7+/H+KDaZ
         zh0o6vIBJuHWAuz8jIH3p/H5mbbjJ8PIx1ByguzXqIVk6hcnqR4Oq2Qio5/S8Hf+KE2B
         yngoFAhIVy5dPjBD3nyJa6wdxqbvJ+wuyHg6yNtVgHofiYoBzuRVtwxvPjWVBGiiqXNd
         oqAxY3d7Zb5NBlZV1lF63Y1B6exbZsRzjVL45dmJLAbgjocS8135RRnYCVLMX6DbPjoR
         7PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748413581; x=1749018381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJQtmBORsLul2V6MNygZMp10lRlI52BK+PKHssMFRlI=;
        b=No7wc32nENavvhLBOhUA6MtNiKhFKztJo0AkqR6jP8Q/GebS/U56e42QKziZxQPDvR
         DvUY6lul923CmzLqqccemosNUDV19+QSd2BZLjzEOzuQwh4Jkmfu0RLiZAk2634O6qoM
         Kyi0K1L2kgyI9Oi0J9pYNqSXrvFfTpPoJMsAjz3/2AUnjlf/WIGy5smNDTQCfr/aqwVX
         afMHS2q3/ZGtT60uKRNFISghcJdBpuu+84fHRNRC43evNSKUt5hT4bbi23aUYT0000FC
         drrTIkrT0sENtKuw1f8kVV+8yJ0lyhrRh2njgrIWMeG7T1PwCoH3Mau2KfJz82RkV2Qt
         bWtw==
X-Forwarded-Encrypted: i=1; AJvYcCUa4UFtR0Jbv7q6/irJBvmVA54xNMqMNCii51TNSGwE2Ze5yFROVRd3q5Io0ygiW07hLQQg53rUhIV64B8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRe4/8bERLz0tjWKciVbNSInjePhW8vcb+YotWBdOy4JS2Sqj8
	vgHnQZF9cNy2ZzaiRkgRevJX298w6aosEZu11yEviB4uOFkXtir69YqDuucpmPbEMgc=
X-Gm-Gg: ASbGnct090hTbl+oI4cAq/12Sx0IHVgcm7qbGgNPVcWhbZW4IoZf9Wxbzp5H9IcLSYR
	+XcHDxjrgYTxSeRCLhfEgZ+8o4LZSHgwoDpTHRMqGquxHsXhBfnMjdi1IIVxg38uZZmJ46MugDX
	Q5o+RcA4Rqi8yfchwQjCiQj93kXJauwEKG3Rb+KuIrie2h90M1ZaGxGl/S6uZ6scaRmLqngaGHF
	zBGNUcJmE03mO9iGXh3uY830gtxJGcJKWaLsg4lGIQITsJsjTve+DyAydoar7mDOquFxCZ/zsea
	50yncc2EiAUPQYpGuWwSiIk3sORT0K/9Ab3SJYP9lDqrLVl2sEimEcSM57Zbw0SRylPpI5bRW7v
	QGjyll6q4HQ==
X-Google-Smtp-Source: AGHT+IG1r91+7tI2/CIrBwPliEl4ShQJtjrlA4mz6gCB/b9+fF0Qvdsp0MdfXtmq8J21fWN5WqE8Qw==
X-Received: by 2002:a17:903:3d0b:b0:234:6b1f:6356 with SMTP id d9443c01a7336-234b74b4c95mr53731085ad.22.1748413580666;
        Tue, 27 May 2025 23:26:20 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35acf6dsm4619515ad.201.2025.05.27.23.26.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 May 2025 23:26:20 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: arnd@arndb.de,
	andriy.shevchenko@linux.intel.com,
	benjamin.larsson@genexis.eu,
	cuiyunhui@bytedance.com,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	jirislaby@kernel.org,
	jkeeping@inmusicbrands.com,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	markus.mayer@linaro.org,
	matt.porter@linaro.org,
	namcao@linutronix.de,
	paulmck@kernel.org,
	pmladek@suse.com,
	schnelle@linux.ibm.com,
	sunilvl@ventanamicro.com,
	tim.kryger@linaro.org
Subject: [PATCH v7 1/4] serial: 8250: fix panic due to PSLVERR
Date: Wed, 28 May 2025 14:26:06 +0800
Message-Id: <20250528062609.25104-1-cuiyunhui@bytedance.com>
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
Execution proceeds to the serial_port_in(port, UART_RX).
This satisfies the PSLVERR trigger condition.

When another CPU (e.g., using printk()) is accessing the UART (UART
is busy), the current CPU fails the check (value & ~UART_LCR_SPAR) ==
(lcr & ~UART_LCR_SPAR) in dw8250_check_lcr(), causing it to enter
dw8250_force_idle().

Put serial_port_out(port, UART_LCR, UART_LCR_WLEN8) under the port->lock
to fix this issue.

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
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 6d7b8c4667c9c..07fe818dffa34 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2376,9 +2376,10 @@ int serial8250_do_startup(struct uart_port *port)
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
-- 
2.39.5

