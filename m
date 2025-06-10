Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBD28AAF9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547351; cv=none; b=H8rogfUhXDaDcHBcf8auPuYiR4BdVrz2p6lFeprsxcw7cyZ0INRGg8eJDi+UXqRUkfTAhKYvtMMNSMWKB47Q1v7QEqEoOZZ8lMqV103MxhFWSmvFGktv4Ajb2/t6dPxicqWe0f55RrLxwF/h2MuHUp8KCt18JSiYpVo70Uub/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547351; c=relaxed/simple;
	bh=Yay0E1IktJ5U3dv9Jr5sXBr5qazP/zu1WzMA4ShslGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJ1pDnjyzmMQgpTURMU8c6vbGXbmri100mTBPmV0e+BC8gWW3OoA7qDLGHfLDHCVIsjz43FA49V4QA1xzzcGwo6M8GxRjvrraGFp1Ed2XXgOtnQK3JrzVLnTwQPb+3brhAuacqgCb4OYdesI4xzCDKbxkqaY8c79L5fyfQK7pUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jVFiiOF3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jVFiiOF3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d366e5f2so59196185ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749547348; x=1750152148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inkjt4Nq2XV942wyB2oCSN3ntPshT/X6vryIjMwcT1A=;
        b=jVFiiOF38oqLjJUReNTGhqSFrZZPEFMTginsQDmkYe2OyS1Rjv0O6n3784AmpWp2rY
         pSnmlsUzdoVTwZDYZZjw/7IXKBpdWIG5pLa74sAG97KQxLNk+TN05KAG2hUayyOkMq0M
         4aGsGiJkvOTCG6rh/pL/D+E3B8+bVCrLQaPHy5ipZJ/e9XAAbdZkMWJNzI/jpjNvdEJx
         boMy8AUZzLsft9eDXqFnkB0R3iV1s8NTb1dneAo0u7zzgrDqbiBoT7k1zPaxz9FHOfNZ
         mGvZvSvUOqUEeMvW199o98XZN28o6Z05+dV/TRCD1ukzilHlg52A3zgX9eKSpAoWyfYZ
         0JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547348; x=1750152148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inkjt4Nq2XV942wyB2oCSN3ntPshT/X6vryIjMwcT1A=;
        b=PnXPLggrwtVyJHDJJteluStCv6tlyxYOd679qkqgTy01ZBgQUbsIiAP/og7in6Q3em
         PUQrUE1+TC6x5e6A1ZgJrYCozjPcL1wWkEw/oQVFrkXUABDTWGsxW5nxoFuNQuJ4z2Bu
         hKUPqRd5yB65dUIXv1TUFS5vIVL9/QDVKJSfm9jkt5aoOB32pAN1BTffyBcbkUPUAQFY
         NWmqT1BYtbAizAdewI8rz54neaqjs6IKBaQh1WjklkmibD2JVcsr4GC8zFDCAbLEGmk6
         dnshc2zHewVIeBX9in64LiOGipuf8p2fInRcFB15OsGzO2UtvgKks9LRjskPHUaK7VDO
         9y4g==
X-Forwarded-Encrypted: i=1; AJvYcCVvl1/oR4vgkFw9jtC/vN18113VnECH9gDLgdrj3ggcz+DseJd6ZS/olAaE+wsCg9oqK0hjC8VdXhcsbSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNASNAhRr10HTzOkBCfIUb4plI2wcBnc0NaYNtdz/ZcLRIEYG2
	yS3O5qZqAjPVUlbouXC+xEDrSLTyr9Ut96CnZBb40pTYNaV0UY3aXULB4XzCHETZi6g=
X-Gm-Gg: ASbGncvn0ciXJCGquMQ17p1K7ieIFghfQtJR7PRGfRcNESE41+/8FSgrbelATlgV0jZ
	6ccWKyu5O3ZA8mA8pFHNSTdH4ln4HMq1bTKsI61JgeDuvhJM3d2FypFmIzFJEzI9PX1yIfe84TA
	0SMFNzyWT6iUIUscBRRbPXFG9a4i16YvUl5B6A48Q9iYE1OU5P507YZl3JsjCX0XvYj9tQOJEAF
	D5bwP3Nol3o2HEcBkbSfD00/6Cj3JBHDWSDVutHr91VwxSR/2xY0SdAgIXCU+cKmFPbhQDKXFy1
	uFg1Vq9pRRSWAwjl6OIFOnAw/nbnRa9ZzTQUQmiWLslxccpv6hN5HCTKVfMtyd1AX8ZRznS/Tl0
	zyJKQB/nWjN4adYZjwO7cG/3C87l6BdRiKu+BSe4glQ==
X-Google-Smtp-Source: AGHT+IGF1wKkfYtuiimtR/p3LIkqw+9S8l8lvSXg9Z3PNzxGl9/ZZMkReEoX7Hs9Ut7c8jSVbeCQjA==
X-Received: by 2002:a17:903:22c7:b0:234:b123:b4ff with SMTP id d9443c01a7336-23601d08686mr221662445ad.21.1749547348162;
        Tue, 10 Jun 2025 02:22:28 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9ebsm66968605ad.106.2025.06.10.02.22.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 02:22:27 -0700 (PDT)
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
Cc: stable@vger.kernel.org
Subject: [PATCH v9 1/4] serial: 8250: fix panic due to PSLVERR
Date: Tue, 10 Jun 2025 17:21:32 +0800
Message-Id: <20250610092135.28738-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250610092135.28738-1-cuiyunhui@bytedance.com>
References: <20250610092135.28738-1-cuiyunhui@bytedance.com>
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
Cc: stable@vger.kernel.org
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

