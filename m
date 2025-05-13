Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB961D6193
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104145; cv=none; b=OIIr204NmhmlrFvxYep/qfFANrVh0cwaa43ClLYy/gDsH55HnWWyXBpnTZPEKJZDmqG4ie8UgQJ5t4mFjHsvlFEj0mFBT9VAsiC0qdQ2A46kXK07QZA0jEXJSmVOtWCP3l1dCUl87XAQJEgjG3W8KGY+pbafngVH3MIcPTdibYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104145; c=relaxed/simple;
	bh=da6Pc9E70vMnwT+sqxSBw2bVddnFGheA1SAIMSEZZlk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=FZI0cOHduiw1k2NfWtTBKVLAg6tVya/nNipgCDBhJiR/7HRVw1XamsLxCyn9I+ERDAqBNGY13/fdTiP7FBgEBHJwrzTeQYZFOtSdukSA8oPgwxiSfP82tbbG/rDgrV/OcqJhw+k5vT09dq5BXrf1WlCa4zhZNdM0MVSK/VAxoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SIZ7Zwfj; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SIZ7Zwfj"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso3608714a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747104142; x=1747708942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6h53d7TKTYZX5cIYR7FkBNGJQP+h56ZvGpdNG8rCQsk=;
        b=SIZ7ZwfjZyUhDqKjhNmDxqalYTpsFDAqrUbaiclG69RSNI2I0T7qj90NB57+RHYi1v
         pdJS2/YIdrpjn8pUwU5EXyC9N1Sb5CuOYvne1YjPAjWshnwxJViDcl7ntj1kuUzAg8mg
         SVUSObQEeFsmtcAxYlDghbs5sSvFkmJz3yXrh0okjwdeXbArFniAM6V/bpRD1uIqK2mb
         PBfwwQx9rA4YmVVIuVFgRLczdvKNQPAiuO/waTseqEBtr7WTV3roxjpwtIlAIorM6b2t
         EPldGHaktaw/ZTToQkhWq9M+wy35Nctv3ypOGN5qePOLvslFJDasS5m0MhiI5wbt2ntQ
         DIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747104142; x=1747708942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6h53d7TKTYZX5cIYR7FkBNGJQP+h56ZvGpdNG8rCQsk=;
        b=qqvOPVpouHhtbcyEhQoL0iHLbtR9VqxY4GRYep6Ihw0CYjFWdS+ZG/zxVfGekof25w
         Stx/x0cYflHsHQ6SY3U6qMxgNxfM72CRVhZKbomrle8J/chWF+R+eJk5biLQ27vWNl+Y
         UYjhLQ0GZCaEi9AeSeyiLjSEWh+Gqx4U0GGEFmCSfd0Hbp/pGIHfo23g3Zl3qKvnI0Ji
         mJ0fshj/Mf9rzF8opdq5Kbu0L7wstiQ5gg+z8UvO4Vif8jhnxRoDO3M4cG8duKYs83NV
         SrjHMNdmztyrhf64o9iHJioqjnf3cDGjcHO7YNRyhMr5g8cRWKFd8gEuJytpUchR6ezQ
         9dXw==
X-Forwarded-Encrypted: i=1; AJvYcCWfyMnNh2b6ATnmTMcWqQVvjaToYe55FWHT1YVRdrhhGsHafnxpdOv5TlD9UjgZKSed8sIo1o+DxGibNg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7kkGBzDLmCSVJNZFrpEgzSce28UoxZIjKmN+KVE2c/7qN8eP
	VMaI3AJq+ExakOcFwzvV+S3mNxTFybtoAqDJAF8jQlSPlXU/N3wk1zzKBrJ+IA4=
X-Gm-Gg: ASbGncvJ3ZqShEB/n6Xu8lV1daKpeJXucgMhmHTuR/qGStebbrYaAYYmQcmN1OWVG7X
	nZYt8T2o9D88+hunlodKn9vUahG+a51wDG53QcoDhpDw0/0SRF4MSktJo06Wv9s9xLgGapbM5P1
	Xle9AEI79RqoDpMJ3u2t3Dv0rPPphG7R4FJGDgECZArFBrg0Rh6rlPLFC1VeuctM4YF3dVfuN5J
	Jxo2oByeHQmrvRdAcs6BNcrMY1HIUs75OaiK+YdExwPHbouAo9kYD+99mOMa74D5ib2s5WgmML3
	PU8cDQETBvgvvxMIKE6TwK1g9Rm69guH8VtCQKVnP2kbIeODuNV6LOVgnKS4V7txkg47tDY0a2a
	7wNVXYg==
X-Google-Smtp-Source: AGHT+IGo8QgnIg4KYJZJnVjbuUtdMnxdMqy6OJqFeZZZohVYifVYMNTDsoehOJv9z6n7y4RRXTSHTA==
X-Received: by 2002:a17:903:2444:b0:22f:bf03:8dac with SMTP id d9443c01a7336-22fc8b5856fmr215345725ad.26.1747104142354;
        Mon, 12 May 2025 19:42:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f532sm70592595ad.228.2025.05.12.19.42.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 May 2025 19:42:21 -0700 (PDT)
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
Subject: [PATCH v6 1/4] serial: 8250: fix panic due to PSLVERR
Date: Tue, 13 May 2025 10:42:09 +0800
Message-Id: <20250513024212.74658-1-cuiyunhui@bytedance.com>
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
2.39.2

