Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467322D790
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562293; cv=none; b=chS8b7GiSGoda+TVbIu17gXSqeqJeNAEDSAt4gASVc3fEYoYURGNSh15lh1qtCN+YLFERKPvaE+KPo0BylSxubLrwp0XdPF5SfCpW/8qgVMx02Pc6PoE9Yl4AjvawY2oBPYm2iAOtcas+p5OqcsqqFCubM5dtD9twxCWbEBj7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562293; c=relaxed/simple;
	bh=LQ95Vn+tu9HRCgEKYvi6s7BkWHtV8kryNAYsYGrRkI4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ck7jicaTBij8YidR+TpASun4a/YElhYz+iNQ2bFY5BYw7/bVGCAUEqLzEL0x8s1ZDqryYInC92uWEppnVAgCSo6MDP3hIP48FpOTonpkZOcrAA6p74io6Vat548X/6Y0Yi/TkOKKIb1eBlEH/10Xvz59ubSlb1dOvKHcG2hG+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=d0LbQN7i; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="d0LbQN7i"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736b98acaadso1831891b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745562291; x=1746167091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbKfQhlrgV1dvkptAfP3aiGbVJaK2h9Q5oUHug4Z1q0=;
        b=d0LbQN7iFuV7MwJuAyX1niiaT0vljgraw4OKPbUNwE7EhH0b5inakDr+bPATwhCqQI
         rakuHVXQw/6f5VbKnFPj07mm1FABtfRIUgA12bl8I91qHfQqDu5KiEp/BtPCMQQ+TMnX
         ZF+1osSegoXMwr2MapldNCYAwo4JhZJF0L6/iOFl7V+IMV5xQbdXVQwXNOMhySKC1lIy
         39jGbuTDahMwrIRZcdgLyWnJnH1nRkKbucmRINa5DGf/bEAZEYY3Ou5sMBzLcBtpawyI
         CLBtVPKrlwpr7YPuLxgbXeWs4N1li6VND7Y2445C8lgiTAxX3RbGD0homdt5UVz9ShLt
         Kjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745562291; x=1746167091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbKfQhlrgV1dvkptAfP3aiGbVJaK2h9Q5oUHug4Z1q0=;
        b=VsWpAQJ1rlwF1tTwIHS9ff1QdniS6sK2XxGaDYOYQvOt8GPkNrNuFJ7dWimY5o07Lf
         rhp+N/sZxlH4h2GoalEVA74LoOtysq4I2eo2wgMb1Ii5LB/GA9mHLlfG95mZIKWgFdAP
         TfGMV+AmtdPGUPMmUrFmpt793F75JaSzOttmW0kACAIYeVYATQ3YkKSMvxi/wnGn3p6c
         +g1RGXjbdV7b6Nf0IHIDViDNfqH9lIKq482nacBSdO/t3R/cHaWdV7//oUZifnIcxgD1
         JWp4VgwtlA0LfYkrI+5XVNhcevLPCpXsOZkF204lH7h+wuIFfRr1ai5r+6rPUtj0O+Y2
         rlOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJlpfWwWO+eDGIfDpYozcMMu/LDiPuBrFIKjlGm6bNUyYQp9I79q6URrhXoZXFthn9/31vKZ7Pvagw12g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoyNNJ5jOho/CQMcymmY0pys2Pyb8MG5za964dEprZsBp0lYRm
	RGnPrpp/MbZCxWU37n4blarwAJSHDWGIqysOLLOW5V9GwQrGyjlJYt8s8kVEF1s=
X-Gm-Gg: ASbGncvyX+J2I/xCEVdEPw7Ro0l68RIqMRKbe7ndRrz1aDVSUXGYYACPRDiMOvS4Y+0
	tLxQpauvCDN7wF1DlN+N1QkdZaclq7ZXEOblMNfB1FcLtKYPmGwSMfrDZURSvxcE2SUZ7+aNCNf
	WE3LBrBmb7nX79K5ElQODBYEoiPUXM9XaGGWdOF1y1t2PJmPEXGwqHLZUzj6xjZuAQEcIm1Yg9L
	1Mr9TSnmj2MjebJFpzRDoIUDZQZj6w1QxnN8gCutVU4COxVmL/9VY9oJ4O8N4vRS8MA3ZO6cbFz
	bk11eWPvuZQpSbkHRZGKAMcbluYMyZ3UPr7vNeSCU/9OlbCrL+t2sSeO257RVFfIVOhIoYg6NFs
	NfpoZCA==
X-Google-Smtp-Source: AGHT+IGcbZQtP6uVVePTGOPuBjQ8FV59Z2pbuXebZ/lw/iyZ/2Hsb4J6vuN0bZPf+LViOoXHP7YXbQ==
X-Received: by 2002:a05:6a00:230c:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-73fd75c4cc5mr1455328b3a.14.1745562291301;
        Thu, 24 Apr 2025 23:24:51 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9fd26sm2414367b3a.151.2025.04.24.23.24.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Apr 2025 23:24:51 -0700 (PDT)
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
Subject: [PATCH v4 4/4] serial: 8250_dw: fix PSLVERR on RX_TIMEOUT
Date: Fri, 25 Apr 2025 14:24:25 +0800
Message-Id: <20250425062425.68761-4-cuiyunhui@bytedance.com>
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

In the case of RX_TIMEOUT, to avoid PSLVERR, disable the FIFO
before reading UART_RX when UART_LSR_DR is not set.

Fixes: 424d79183af0 ("serial: 8250_dw: Avoid "too much work" from bogus rx timeout interrupt")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250_dw.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 07f9be074b4b..1e364280a108 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -273,6 +273,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	unsigned int quirks = d->pdata->quirks;
 	unsigned int status;
 	unsigned long flags;
+	unsigned char old_fcr;
 
 	/*
 	 * There are ways to get Designware-based UARTs into a state where
@@ -288,9 +289,19 @@ static int dw8250_handle_irq(struct uart_port *p)
 		uart_port_lock_irqsave(p, &flags);
 		status = serial_lsr_in(up);
 
-		if (!(status & (UART_LSR_DR | UART_LSR_BI)))
+		if (!(status & (UART_LSR_DR | UART_LSR_BI))) {
+			/* To avoid PSLVERR, disable the FIFO first. */
+			if (up->fcr & UART_FCR_ENABLE_FIFO) {
+				old_fcr = serial_in(up, UART_FCR);
+				serial_out(up, UART_FCR, old_fcr & ~1);
+			}
+
 			(void) p->serial_in(p, UART_RX);
 
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, old_fcr);
+		}
+
 		uart_port_unlock_irqrestore(p, flags);
 	}
 
-- 
2.39.2

