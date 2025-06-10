Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925428B41D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547364; cv=none; b=WppOK720ZwyK5Prg8KPiLteGpVGEl3UfgFpAcjdUJ53CPasR7+OxBB0BdNG0me+olzPJkvQ8vz8RBkfvMe+wKoFZBi0Hperd3XOV7qcLyNjbKua5R9Z99HOvtdJgizRv+tegVzDTM4HhLeRwOcCI4G1jTfq3r4q8f4pR6fkDDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547364; c=relaxed/simple;
	bh=qGjOULSQfrhZNYJbcbq9J/bx7G4cga14Ksr4xHqMKco=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BkdDx7xTo4Q/gCRf+DDa6QqBKtnMHbAh07sExOFYE9+mROpXK2oCVGLVUlSBhqTdS4Tq/y36gDd7lkR9/LYmF8usrb+nLtlPddZO0l7E5sOd3iC1iSaqROqkgzNclG6LFp2afJ/qj12NYxSbVooe4uaSP04P6Qb4bBZPvpn8V5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X3zOLXdP; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X3zOLXdP"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1fd59851baso2965793a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749547362; x=1750152162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MgSetHRD9od3OJ7iz2rDkPKMWGhLjKM4sQsvvkn2HM=;
        b=X3zOLXdPj/USKfWtKzO5pYLFm+lJFGmkp9XClStqWELox/zcQx1K35/1udJqlbgqO2
         WXBYIYoUHZ6b2Dr9oDhLKYUHQwlU55NsGoPaj+r1MAyzH1wTSe+qvLZiPkaHdTfnlKp7
         mfaEsSlS00ytd0g2svs9I1xDEKRH4XpWW8JHDEQMkHIVbFjyFCIZ5Q/DXQC+UAwoXQFA
         ZYy4kLrSELXNATMnzj8ls2ceagWOXTRvmO03xv2fydjWkz6/TQ6avrGsq30MwFHLgDOR
         NG1mmRuM8tlMLAOZWTv4QBsoPxWcXigX6NQgtPitr2nuOyd8gofilrbTriAc8/W+nJQI
         aksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547362; x=1750152162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MgSetHRD9od3OJ7iz2rDkPKMWGhLjKM4sQsvvkn2HM=;
        b=uGmlNXKpeJBa0vhkpfS6d/E0KFwBD29eTrjIF1Ru6/ggdoKjM1hjpsNGKpTufgzKqx
         6A4wW8kMcYoiCSe5Afa4k1KuUVd1q6o4oERIqMDhP8sKl4iDTsibYaxT6ivyNB0BFx2U
         wFcni/k7d7RG9xympIDFkGJyg9zJI9AhuFYMxf0YVXjh68xfhC3qaEQhB4kzpQqggORq
         pxeNARWEAv65Z55v7p4NIgSQuEyqaRoGTuecrenq342PmHAZ5f0PAIMU6OiBJE4ehyXR
         zBuaP+vtmfBpkjdf2q3HcNeDTH9k3eCjLJSnQvDE0wKihX160a91bb1gMxUGfPS6J0WP
         sWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUt0xi6HZw6zQTSv93WIKNeYGmD5rx+bx8Aw591dIvJy1XzZujyuizkQfjmO86N3FNXXPv30QNHajA1mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fnphEIC/1bp/ul2YDwbF7WNHBE6z3Is7/+3xyWiRt0e7O6lo
	IJkYuFXJh3Yb8UGm6wSD4z/2TW11EonIU17UIgJyrc6NU5szvhUScRKgxK6s5GCipto=
X-Gm-Gg: ASbGncuUOGoSdo0o55CijBLx+uYaZEJ524sLLBRh3FuNAXVrva3ab5ebgl2FrVDnRX/
	xDYDrP7mRBvxBExppUvlSi8O58PWCzeFmX6kIBsP7NFwW5keeVW9JZ4twV4MUp8v4xOCCkHGVXq
	xWawvq4qX4L1U5qLtvwpoMaLPbbr8zzYW2cdgIMJEGgVeZoZZqbG/e9bqddvi+v1j+wEh6qM3Vs
	h0/XMu9OoYX2N/5/tZI7GjNgn/LKv0k/dADH/xY7JZ9pI4Jb2xme4hjrjGy5UVh0e1+hBOCWW/h
	OukcbidAYourWUsxhDR8SkS/rErgbaa8wI0cYRynrLLPnq2MOMBQk/BVzGUuLx6H22RtxveRX0X
	GVXLIFt0AfiA7p4Lu7sv71L+WUTTOFjISghZQuY8cuH5Y5zlmnJNI
X-Google-Smtp-Source: AGHT+IGZ6kCTpPTdoYwEBrEfm3L6AeIfxAzFF36vrkgy3DUS4kpMxoV+uz127U6xDCaxRl/X5+hdwQ==
X-Received: by 2002:a17:90b:390e:b0:312:ec:412f with SMTP id 98e67ed59e1d1-31346b3fc52mr28602435a91.14.1749547361546;
        Tue, 10 Jun 2025 02:22:41 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9ebsm66968605ad.106.2025.06.10.02.22.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 02:22:41 -0700 (PDT)
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
Subject: [PATCH v9 3/4] serial: 8250: avoid potential PSLVERR issue
Date: Tue, 10 Jun 2025 17:21:34 +0800
Message-Id: <20250610092135.28738-4-cuiyunhui@bytedance.com>
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

When the PSLVERR_RESP_EN parameter is set to 1, reading UART_RX while
the FIFO is enabled and UART_LSR_DR is not set will generate a PSLVERR
error.

Failure to check the UART_LSR_DR before reading UART_RX, or the non-
atomic nature of clearing the FIFO and reading UART_RX, poses
potential risks that could lead to PSLVERR.

PSLVERR is addressed through two methods. One is to introduce
serial8250_discard_data() to check whether UART_LSR_DR is set before
reading UART_RX, thus solving the PSLVERR issue when the FIFO is
enabled. The other is to place FIFO clearing and reading of UART_RX
under port->lock.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250.h      | 13 +++++++++++++
 drivers/tty/serial/8250/8250_port.c | 26 +++++++++++++++-----------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 18530c31a5981..b3fb8a550db35 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -162,6 +162,19 @@ static inline u16 serial_lsr_in(struct uart_8250_port *up)
 	return lsr;
 }
 
+/*
+ * To avoid PSLVERR, check UART_LSR_DR in UART_LSR before
+ * reading UART_RX.
+ */
+static inline void serial8250_discard_data(struct uart_8250_port *up)
+{
+	u16 lsr;
+
+	lsr = serial_in(up, UART_LSR);
+	if (lsr & UART_LSR_DR)
+		serial_in(up, UART_RX);
+}
+
 /*
  * For the 16C950
  */
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 07fe818dffa34..0560df9b064f9 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -764,8 +764,6 @@ static void disable_rsa(struct uart_8250_port *up)
 
 	if (up->port.type == PORT_RSA &&
 	    up->port.uartclk == SERIAL_RSA_BAUD_BASE * 16) {
-		uart_port_lock_irq(&up->port);
-
 		mode = serial_in(up, UART_RSA_MSR);
 		result = !(mode & UART_RSA_MSR_FIFO);
 
@@ -777,7 +775,6 @@ static void disable_rsa(struct uart_8250_port *up)
 
 		if (result)
 			up->port.uartclk = SERIAL_RSA_BAUD_BASE_LO * 16;
-		uart_port_unlock_irq(&up->port);
 	}
 }
 #endif /* CONFIG_SERIAL_8250_RSA */
@@ -1353,9 +1350,8 @@ static void autoconfig_irq(struct uart_8250_port *up)
 	/* Synchronize UART_IER access against the console. */
 	uart_port_lock_irq(port);
 	serial_out(up, UART_IER, UART_IER_ALL_INTR);
+	serial8250_discard_data(up);
 	uart_port_unlock_irq(port);
-	serial_in(up, UART_LSR);
-	serial_in(up, UART_RX);
 	serial_in(up, UART_IIR);
 	serial_in(up, UART_MSR);
 	serial_out(up, UART_TX, 0xFF);
@@ -2260,13 +2256,20 @@ int serial8250_do_startup(struct uart_port *port)
 	 * Clear the FIFO buffers and disable them.
 	 * (they will be reenabled in set_termios())
 	 */
+	uart_port_lock_irqsave(port, &flags);
 	serial8250_clear_fifos(up);
 
 	/*
-	 * Clear the interrupt registers.
+	 * Read UART_RX to clear interrupts (e.g., Character Timeout).
+	 * To prevent PSLVERR, we can either disable the FIFO before reading
+	 * UART_RX or read UART_RX only when UART_LSR_DR is set while the FIFO
+	 * remains enabled. If using the latter approach to avoid PSLVERR, it
+	 * creates a contradiction with the interrupt-clearing (see the
+	 * rx_timeout handling in dw8250_handle_irq()).
 	 */
 	serial_port_in(port, UART_LSR);
 	serial_port_in(port, UART_RX);
+	uart_port_unlock_irqrestore(port, flags);
 	serial_port_in(port, UART_IIR);
 	serial_port_in(port, UART_MSR);
 
@@ -2423,15 +2426,13 @@ int serial8250_do_startup(struct uart_port *port)
 		}
 	}
 
-	uart_port_unlock_irqrestore(port, flags);
-
 	/*
 	 * Clear the interrupt registers again for luck, and clear the
 	 * saved flags to avoid getting false values from polling
 	 * routines or the previous session.
 	 */
-	serial_port_in(port, UART_LSR);
-	serial_port_in(port, UART_RX);
+	serial8250_discard_data(up);
+	uart_port_unlock_irqrestore(port, flags);
 	serial_port_in(port, UART_IIR);
 	serial_port_in(port, UART_MSR);
 	up->lsr_saved_flags = 0;
@@ -2513,7 +2514,6 @@ void serial8250_do_shutdown(struct uart_port *port)
 		port->mctrl &= ~TIOCM_OUT2;
 
 	serial8250_set_mctrl(port, port->mctrl);
-	uart_port_unlock_irqrestore(port, flags);
 
 	/*
 	 * Disable break condition and FIFOs
@@ -2532,8 +2532,12 @@ void serial8250_do_shutdown(struct uart_port *port)
 	/*
 	 * Read data port to reset things, and then unlink from
 	 * the IRQ chain.
+	 *
+	 * Since reading UART_RX clears interrupts, doing so with
+	 * FIFO disabled won't trigger PSLVERR.
 	 */
 	serial_port_in(port, UART_RX);
+	uart_port_unlock_irqrestore(port, flags);
 	serial8250_rpm_put(up);
 
 	up->ops->release_irq(up);
-- 
2.39.5

