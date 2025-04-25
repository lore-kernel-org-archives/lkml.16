Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE822D7A5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562288; cv=none; b=R3+lgV2Z1vX4hD/018ZPuHEr912Gw4Sj0s3Odtm41eWFncrKCgWWspWk4UTiL/+GEBlaUl+vlnY8gO7iAklOCNclDIiHvsPmu53AVUDKYtwlGFyolCU5klVz3Er4HYY1L4+wh/SEj5/GEBjnAQikfc7ejUBmGvAq3GcWhz8T17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562288; c=relaxed/simple;
	bh=tv0pnVWaJtHrzz0BYquZJT7MTq+lCvU1LyD7cIwSf6I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N9Zo+9U54kr6nxs/v2qUEs5W7U0IH5oLfjYJLFXLNE7EtJJxuNyk06AmxpXM1BjBfBtGMGk/cYkzlE0pQ2QeeR2v35ponOVzutlWEMY/IhHcXUsdltC+ECdYj1PB6n2qrjFNcheD2rHfjnHYC1m5tpGitbjDdJ+iogsWEXnJXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ThoE8B6g; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ThoE8B6g"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739be717eddso1422761b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745562286; x=1746167086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeWCY1B62+M/Fjntw9+cQDGMEm926hRurBiLCN1AAuw=;
        b=ThoE8B6go4z0BVsGRPlL343ZCKc6yeB/0V9Xrb0B1hO7rrReNPcDjvVSaz4jKVm6If
         /gRyWKZSMDYWJ/T6EhaMF9GfjJ+YYPFf5PRLa9rrQbUMf4Ik19Nkv+xLm9ctRITg5XhR
         ocxn+gTPOo6+yLJHrPV0T/I2raHQsd1QhCCuRfYs4rUWOr0HLG0I4qE2X6tID9ZJhb80
         06Pw2Fl8fOFugjQAH5GonTfC2jjH6F8+mrnEVzRbyRdZcEhZBADQ0L3xqrKdq7xfU3Zs
         z5hrT/VY4XrLyBEpJ5+EJ61TzoGSUO5kERt6YWDqnV6Fc5wDP6f9CLZmz2qqY2zRfkQv
         x5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745562286; x=1746167086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeWCY1B62+M/Fjntw9+cQDGMEm926hRurBiLCN1AAuw=;
        b=ej1DkNGKFD6BpgfpR5EAP8sIHU/7FFSAs0BvnnPynVmZwbUrRkk3aARHF+A3/iXxTP
         RmWh7CIAy8/Prugp5DbJMbcNNvlC60CsV0d2LuKeKtLdnhYi9C4qi7K4qmMUaj7QK7EW
         k/R7mHAKo8aneqDgazTb/cFoDUYZMZGOIMaK8rbefMm4LDnxWrxIFfs67Yf5b6arGNHx
         o6YdfaUoM7683WTRg0My1Ldea0gdKCcvVTvcoMxyhV5CLc5puqM7ABbD58HXOzEtRLzV
         fTidMKXyIv/jIV8ufUVnyCYtPX15nNWAVUg7OpXX8qDT359RhANtDM+4SPbpQeL9Akf2
         pm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVuUndo8jBmjeuH6XZIZLpCv3JbizfLMOKRnaNj4UHXE2+cxIK5x1vJaUOd6D8IMeqUXvwgjXz2D1hLpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdWzjxlnfCCaF0Q1iDYdQTJ0QvYdyPH5lNm3mHvO6JcJKq3r7W
	D9YNTh5dpUaAWEKJZ1vSgQnbM0EDUn9bLQ4R8II3irqomjrOKKbfSNXk+9e6Hrc=
X-Gm-Gg: ASbGnctgtRL9vzAzq8qHcgks90+DycyPInuPjm4XA977PgADXPhqdPTkayZs3QEFOxE
	+zp/20ZKTnBOOZocZnUEYIAuvrcNG9uUXke8uoPWKU1QzvEgHw4m7wQTGd5RsU++nA78G8fplVU
	0Q8dPuxgvb/Cg/Si3fqC86m15xyxXWfWpWQRmQLfuYk8JFn2GBrbx4vSHvvmsr/PuoW8zRdsrfL
	Snzz5IVwWXEB3GAlFsW8VsgWKb6tT8MNXEJPdXu8JKZ4ywiD2MjVagcWH+eBfi8eO8L3WfdHR9t
	yWFqpp3nKQoFPOvMYvkszjwJTuVkrKSIKqAlbcss+Uej5G4FsTF/KfxfUsGsN3L6fokgEfk=
X-Google-Smtp-Source: AGHT+IGUU5c2ab5jZQ2ErdkhkWRp8Yoizh7Cppa8MaSdmDC9jMUt1JlQkfAwb5jYnPUxO9MHdWrQCw==
X-Received: by 2002:a05:6a00:230c:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-73fd75c4cc5mr1455041b3a.14.1745562285735;
        Thu, 24 Apr 2025 23:24:45 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9fd26sm2414367b3a.151.2025.04.24.23.24.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Apr 2025 23:24:45 -0700 (PDT)
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
Subject: [PATCH v4 3/4] serial: 8250: warning on entering dw8250_force_idle unlocked
Date: Fri, 25 Apr 2025 14:24:24 +0800
Message-Id: <20250425062425.68761-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250425062425.68761-1-cuiyunhui@bytedance.com>
References: <20250425062425.68761-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read UART_RX and check UART_LSR_DR in critical section. Unsure if
caller of dw8250_force_idle() holds port->lock. Don't acquire it
directly to avoid deadlock. Use lockdep_assert_held_once for warning.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250_dw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index af24ec25d976..07f9be074b4b 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/lockdep.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
@@ -112,6 +113,13 @@ static void dw8250_force_idle(struct uart_port *p)
 	struct uart_8250_port *up = up_to_u8250p(p);
 	unsigned int lsr;
 
+	/*
+	 * serial_in(p, UART_RX) should be under port->lock, but we can't add
+	 * it to avoid AA deadlock as we're unsure if serial_out*(...UART_LCR)
+	 * is under port->lock.
+	 */
+	lockdep_assert_held_once(&p->lock);
+
 	serial8250_clear_and_reinit_fifos(up);
 
 	/*
-- 
2.39.2

