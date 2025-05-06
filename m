Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C0A27AC5D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530613; cv=none; b=nJYf/z/FNdbk5f4RriTdXCRd7jCMcYFV0l2n/ZehUuiwXeKLUjo0MK1Z7H+o9/FcyqduPo1UqIl1gGMhCEegnRK1+DZNw7AU0MbsyT7np1c9b0Z041pjaY9y7bRHGlC/Xf/QQpDkXs7SA6y02X7F6Pg7VciLu2bzcG8yHYqfjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530613; c=relaxed/simple;
	bh=xjL65vzHaYnd2+Zu9zg+UVvkfoWrRNrqH2KTKvwr7nk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=RVDKO6WH/GKHkMHik4leuITQFFnyey9M4MbrH2/edMYcgVY119A5eIi8CKMirpUMqX425IGMabj3f7FveX6seoB93rbjRvqtrcOBWDvAMqj19iOkQp6BdEgTWgFqyUeqguQLsEDLlgnvMjznvZh3GFwsCVh6+ZEEnMpeQRE/lDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eRXQ5XhT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eRXQ5XhT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3035858c687so4108813a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746530611; x=1747135411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lj+Ua/fxMyjIfoIv2F4j22EXalsnM7wsPJwCRLC9/bk=;
        b=eRXQ5XhT6sobBVK6SdyeCkzoJBQY+Uj9EA8VYsyVTDRZ2E6zgvPcYkMdkcbIqipQuF
         RktkxhUk+zROq9iv+XmdDDxaqWZS3bjVcS8wRH1fr2InH1XyXJECwWNQvF6ytCtUz0zu
         zFyO5J6sppKI7XThFy5Fj+A1plCuyhMyJC6aUUEPBY7ReH/O8U/bi/fjE2ROGaLn12wj
         RZLXHXLWKHY9SSsr+q+oBnXLF5YFvCirU9d6rD1ESqmMHCl1OoSMd+OJFisG4q6i2f9e
         o3vgeGI1SyACrluZ/+z/Za4ZxZxi6Ia9N2+vc41t6hn5NpGIFjRd9FcY8FdnxkYMYlE6
         WPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530611; x=1747135411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lj+Ua/fxMyjIfoIv2F4j22EXalsnM7wsPJwCRLC9/bk=;
        b=Y8iK2h0B1I8h/vKmdrO+BD7px9ME0pYosq0FOxPzgWMbUd7imSFXqUZ6tuemTkARv2
         S+Gwj1oHd+gOSulC2iqko0QFZnHpzovM3TKCACH8OP/z+H2+854wnN49ztSPTcSXSdqH
         IRWSO8stREPfUyUydFS7S4LR1sf0WIsZhQNmZrTlDJUItC/gsiJlKoW1yOfuqse7d5ws
         DO9UXxI5HATmeCAch5DOFZLZ8cb2/+8CbM5FZBQlhoqi5wLvOdrCugyBKO141906jnDa
         /QIexi+P2FrFxbh77FcAZKT0PyFAYEPj8Wq8vPoCHu/VOHeB/UVELdv/fAAdnKpjmSN5
         hTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+aDBvG0j98m7zk8V8vVKXlRiiEY3+IjwWIRYrO5CbHbOA5FT0Usd5WTbkm4JiNmfg6t+hvfYAMJWixkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42mk7SGweI1nDTwDXFUx7bgTROHbbpL2IeMExk4PPS+MXyB4G
	bCmRFE8DqlcUd1tpGEsKIFfY927xw5TBsB45kGpKWpW/5p/6Fl7x16tINGiskq8=
X-Gm-Gg: ASbGncsuFtQ9YzdZ0ZDIj4SBljvFe2dW7YycsZO8ZPKmJQ76yG39leu/3NwkYcuj1/s
	23OHvUO5j0uhCKcC+ve96MKBIZhAQcU+HKISmWquspwualZLIQgbnU0CReyjMOTbNqftr3DpTtn
	yLDYmVZW7T6t0o96Vq1bjpZjetXAzC1spl/XCFs73aL/xHYNHerX10BlrCCwzSuULTfLG5rmqRM
	+Qmnvk13a4y9xFU6SZFhhGUqt4sPXf1GcM3F5PRvQFFY3e+9Vu/C1ykN7um5g3mxxWUghaXKT4y
	VDkdHwhsFq9xXCgkeqqUY7cFrFWJm8SPmJuR0dpsNqQT7+Kl+zFf+54mVgeZObgTxmSWTTkV
X-Google-Smtp-Source: AGHT+IEOXeQAPiRigAJRM+ag8kVULH/CPzkxnG0tEFjbXvabNNYE6kFbgeM+fhK2lrsDJD43flM35w==
X-Received: by 2002:a17:90b:2703:b0:308:6d7a:5d30 with SMTP id 98e67ed59e1d1-30a619ab240mr19584577a91.18.1746530611028;
        Tue, 06 May 2025 04:23:31 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480ea0dsm13630303a91.37.2025.05.06.04.23.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 May 2025 04:23:30 -0700 (PDT)
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
Subject: [PATCH v5 1/4] serial: 8250: fix panic due to PSLVERR
Date: Tue,  6 May 2025 19:23:18 +0800
Message-Id: <20250506112321.61710-1-cuiyunhui@bytedance.com>
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
index 3f256e96c722..a913135d5217 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2380,9 +2380,10 @@ int serial8250_do_startup(struct uart_port *port)
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
2.39.2

