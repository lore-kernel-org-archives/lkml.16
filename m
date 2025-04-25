Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E822B8C3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562277; cv=none; b=e60YXxFP47qiW13mzGcwnQhsEXd5BdZF74kpoZkWF1UdS3AkIRDW9XT7mJj50tVJQqaiUYVqzZSxYZ64FYZZlvq69OGbCjqwp1moOH4QqY09TUaf6oAoLC/r/0JzCbfFjXdwdSt51bXEO8dzPpQfiOqCnFTj3AMETB3lkXL0u5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562277; c=relaxed/simple;
	bh=xjL65vzHaYnd2+Zu9zg+UVvkfoWrRNrqH2KTKvwr7nk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=hQB4haJWHtEIJDVHdd3dqQQ08SSJh9rMggc3XJSKS9fRZsHdMhU7EB/vhH7LpXRqee6cqiVcGptcg05Sm+xv4VQUX2Gyo6634ZGbpLcOtKTAv49Akwr95qoJIjOSZTSeM1R5cLSi4AgvwTteDDKSwoQMYjjLjZz3AmiAbqLT/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Kxf32QzS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Kxf32QzS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1799096b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745562274; x=1746167074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lj+Ua/fxMyjIfoIv2F4j22EXalsnM7wsPJwCRLC9/bk=;
        b=Kxf32QzSezhfjzPDArP+h4V4ys7zLaj580A9T3qP9NuIXWmPahwEpnG2bkQy3slJsg
         yAzhv3zP80mZLhIFnuf8hyqqG7xkGv56OIU9m/gGdrEO/+juG2F8jV361jvHjWWXCMmI
         AP/CUhI+i0Z3Q6NF3m2HtEDkgXNFfrHZXh5dDHJTCeOyA1cu63wIdojws+ORZqzpZAIa
         SsvFFugmFtr/Sfc0oiI9qd4v5lPgmRHsWGoWFmSfOBCWmWB5ZG6bBofTyW7vZQrDPNk5
         LdLsr0ufdjIhtQiCqhVk8H32+1OCHudL6Qp7VWTlRYOD5RFnR1dsVDXheGTtVWsmZhNE
         CyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745562274; x=1746167074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lj+Ua/fxMyjIfoIv2F4j22EXalsnM7wsPJwCRLC9/bk=;
        b=Zsn/hLgLBYZnYIN6T7u5/CE7kthy40vVipZUyhkIPgR7iPdF6VS1wDPIpQAcmffY71
         LqwUanWJKmizJuzH0CzdbYe8RWJTToYmNH/9/Xtpa/VWWhEaXqBhozLzsuAsvnKdM0yu
         RAGGupOfpQPuRNOF3/uALi0C449aWJmtdVWHuZfj/VTFwvWAlrgvyesd3I2gbMXavDBR
         ytCkOvq7Qhs9t351BfYyBYtBySloIgoPC/jjlrQWioDUEPR4btl5hc97HEQtF2Nx0K34
         X9qqk5vMN5IUEu3t1RuLbWfRU1kWH9eWNQtETSLyRACUDSd++ngK1e9xcYd1Lz2B3Lm8
         AdLA==
X-Forwarded-Encrypted: i=1; AJvYcCW4O/qZn0PZX5WcVtEOO6tyMuB2LNmF6lPSfit1qDN96o8jvqNxpH2eTbLG/TV+AYXzdSkxaWTT41pv+PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQdd0UaNviA2SAc61QjBvBUwyTkWGf/hN00jK9x2QoMRsGqzF
	hDfmP58t+svg5Neu67dwM6CgbpbDpn9HyrqTgNvAElhU2ropmD1PjX83nh2slQo=
X-Gm-Gg: ASbGncuvoVpmp/S2wwGEa4Kh4ZSV1zVv7m1kNR6NZvPqzASwpmu8mA1ntTC0oWkafbY
	Kkity4N2x1IYtN+FDo0kwB1G0wZZ8arVVnlUKZ0ica1713CP53XNl/eDxRM5n1fUN4DZi9H5hzm
	g04dgRWUuDI37VIrglbIwC3NajXicPlB6ano65hDYZWivCZSyBSY5G9PPcNIKIi6XtS2CTMd8kM
	OY3Fq48F4qGXSXEkBT61K/jSLspeiJZ8iOyHS01Irz5g8eRrN5g0Me3PfkVt+CvgMBG5A3pZndC
	2nINdCint/6uHl5TWGIvOhiiRMieaDmwfXf54HYtm7zk7B9UpbNTYDzSU9VOUgT66oXFvFCfQiW
	h8y6qKQ==
X-Google-Smtp-Source: AGHT+IEDdXd5kbSoH4Xib1G7dTZw88ksDYgy2jsOxQA8Z6WjXNm/WRbjW/6m3BSTIQudMRJ2BhtnkA==
X-Received: by 2002:a05:6a00:124b:b0:736:5dc6:a14b with SMTP id d2e1a72fcca58-73fd74c0d9cmr1421536b3a.13.1745562274548;
        Thu, 24 Apr 2025 23:24:34 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9fd26sm2414367b3a.151.2025.04.24.23.24.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Apr 2025 23:24:34 -0700 (PDT)
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
Subject: [PATCH v4 1/4] serial: 8250: fix panic due to PSLVERR
Date: Fri, 25 Apr 2025 14:24:22 +0800
Message-Id: <20250425062425.68761-1-cuiyunhui@bytedance.com>
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

