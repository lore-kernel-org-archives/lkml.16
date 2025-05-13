Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311121E1E1E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104161; cv=none; b=WbkaTMBY+0yLGK4ddpWv9bHEi1/Nsyo2RoXyuLMR4EL+pRIaupZtITmiqNdUmhxprW9lyzw1JofrX/1Tfh5zXsUjqdm9u6iQJ5uCQEtXte2qmgfTgb6rGU6xaWPlbVhi2JeZT3dRg+szlI59vwxlmWZiFUCJUOfcM9tXAOxdVfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104161; c=relaxed/simple;
	bh=U3HUF7yFnNEiDperbXxcBPVDrFqRpUKho+wRS7C8/VQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ir07NmYni7Cluk+xwGKablejbMCXL56rndNwiuF2Y2Nu/R1zWza9+0eOdYiEMz8epVyVRSIv369VKimLP0QRnUi+myB0+OaDalPUb1bg2UO9dyf/fJZsphK9An8Vt2e7dsLs8wm/qCdvSEdFUimqnTWyj1o8ax6jgSyzllCJmk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iHi/u6Ih; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iHi/u6Ih"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22fa414c497so58795055ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747104159; x=1747708959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJ//Qz5vc0HabF9giMyr/yKvvCyXTBy5K+QmIID+4no=;
        b=iHi/u6IhduYFn5qxfS0SH6PbHG7UFyUbfoDVOVvvSSFAyGL+viVtCzXrqwhv9u37BZ
         +9054oHTF4H/GKokFNyTueRt1iNRJOxAkLEfJyD/MdJ61c1IqTnhBtsGPN7cSwopwSxi
         zsY0FSGdarPvPVMFKNbigt9eUKlgnGFlCsIxi7jzFfSrCSvPAiLANToEPy2SM8tBgue5
         ZFBS5mJHYHZS4KsBa/9/fDyXJbu6TO0sXpK2BsVd9C0H6VYQt/nmag4ScbHwRyqZshzx
         hIEqxsFCTmidjPi+Z9vDxJ6iEj8ihsmTxodR2ecJdoBP5ZzxkTw6MiQMhIR040fRoAYH
         dkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747104159; x=1747708959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJ//Qz5vc0HabF9giMyr/yKvvCyXTBy5K+QmIID+4no=;
        b=W+sajc/X4ZRvWZG2a4ShfW7XeWE+56FmnhzFRHFQTKjF1fBXSPpz7ML8JLsLQeQ/pK
         om3lxES1CyZvZA+iBFWG9AoTkBp72YkolpcEBJka3KL5c/Zg+E+nBQfbk4Tk66pOSH09
         y8RlJ98Mu6Gl93C5TXxnHnlefZAFqcfpLmNV8/Mx6sTQqcD9PQuuoxxeJKQPj8brPyI4
         jke4LCUzoYz9vWhIoIWCO5dvZSNHGtMG6cBqY7Es6tlDvWQfbG/OAP/9yGURBL1C9sCV
         5pXi0paLXTPTWS9qAXMoj9WN5QnYuwVMMPc/5eO1b4gOcrwBmDkicl5jx5+lpu7VISdp
         yGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXat/+jdue0VIjXtIXETMsjuqqlp/t8+KruirywqSCDSEsCxZuA8Z+nkO+qxIUErh9waMEqL5VDgd5dPxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2aSwDbFT2YkdROzzrO42P3/awZjMe455N6rtbi/8ToKf9CPa
	AUKaZVZs5WnYnWrwnosLR2ZLDsOM9ym/vGcfgLZo0yQjhbWurps6qD0GV4ldhLM=
X-Gm-Gg: ASbGncsk0aHM8KS0VmmOts1D/ljKBYgrkEs+2HXG7wzu1hjMXM4dfr+CTl2SnLDbW0h
	3ZFVy89e49mZLyPNz7+chS6hxM+dpyPAlgnTiQCrSTMsN/oikWRutpuzk2C9nGrvJlZjHZBFgYP
	PL7/nA0UI+RR71hbS1DwKr32OjCNzXCpnFSjArGEMyNkch4PdWWr3QEovX9WLSiSUXPODtFH1Ic
	iSXb0KqSyir6KkqmCl0819xgxvpsr8yuthJGDYXM1v47JAceAsyN8jxMi3SMpa1ZxJBCpnKqDIr
	YXgJoWXTbtJOEnhyE1F7MyD7jMAQ6sEOm2NY6SwhxFtMzmpVA6MKDDJ2D54mR8q7W5QmHzxW9p0
	LSMoXYQKiQwh/CcWm
X-Google-Smtp-Source: AGHT+IG/OqJAMfYi56gF4WSoCCQ1o4lALcvgXARWEyOtGciAj0s3Q0lOLU3fyIUwo37gtqcrz942qQ==
X-Received: by 2002:a17:902:d507:b0:224:de2:7fd6 with SMTP id d9443c01a7336-22fc8b79585mr223387855ad.25.1747104159314;
        Mon, 12 May 2025 19:42:39 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f532sm70592595ad.228.2025.05.12.19.42.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 May 2025 19:42:38 -0700 (PDT)
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
Subject: [PATCH v6 4/4] serial: 8250_dw: fix PSLVERR on RX_TIMEOUT
Date: Tue, 13 May 2025 10:42:12 +0800
Message-Id: <20250513024212.74658-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250513024212.74658-1-cuiyunhui@bytedance.com>
References: <20250513024212.74658-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DW UART may trigger the RX_TIMEOUT interrupt without data
present and remain stuck in this state indefinitely. The
dw8250_handle_irq() function detects this condition by checking
if the UART_LSR_DR bit is not set when RX_TIMEOUT occurs. When
detected, it performs a "dummy read" to recover the DW UART from
this state.

When the PSLVERR_RESP_EN parameter is set to 1, reading the UART_RX
while the FIFO is enabled and UART_LSR_DR is not set will generate a
PSLVERR error, which may lead to a system panic. There are two methods
to prevent PSLVERR: one is to check if UART_LSR_DR is set before reading
UART_RX when the FIFO is enabled, and the other is to read UART_RX when
the FIFO is disabled.

Given these two scenarios, the FIFO must be disabled before the
"dummy read" operation and re-enabled afterward to maintain normal
UART functionality.

Fixes: 424d79183af0 ("serial: 8250_dw: Avoid "too much work" from bogus rx timeout interrupt")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250_dw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 8b0018fadccea..686f9117a3339 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -301,9 +301,17 @@ static int dw8250_handle_irq(struct uart_port *p)
 		uart_port_lock_irqsave(p, &flags);
 		status = serial_lsr_in(up);
 
-		if (!(status & (UART_LSR_DR | UART_LSR_BI)))
+		if (!(status & (UART_LSR_DR | UART_LSR_BI))) {
+			/* To avoid PSLVERR, disable the FIFO first. */
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, 0);
+
 			serial_port_in(p, UART_RX);
 
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, up->fcr);
+		}
+
 		uart_port_unlock_irqrestore(p, flags);
 	}
 
-- 
2.39.2

