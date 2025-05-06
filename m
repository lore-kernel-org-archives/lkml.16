Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F437279787
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530625; cv=none; b=SUNNNmLXevujDAgLMLQ2Qi6sX3mRp0ac7Z3zZcNO9aVqpjDKeYKP1o8jZ36l3/4Wc1fmAiC4LIyUmqHP+WcLe0koNp5shdqTsiTLvaTFzrI6ocKfd6l3DGbrIVCf1DUZryUodKRog9IReqDCQ/eS3x2awee3hcEu7Bo2PGFf2tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530625; c=relaxed/simple;
	bh=Av1uBZ0UiDSTag4cG1ZoMvZ8Yr00ipFA4jvwEErTnds=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMmnIB1zvu4d5gGwhNDO4CTG4uIV4hXXNzKQ/WpTVTqPFsB9q1+dUXZ419onKQ0u8/ixKz/jDp60HvhpdAU8VWIq7fAtp4geOAEJGJ33K+J2njC/BS4nF01R4Dw82ttPxmsc7glDZPJ5+1YrY16RSH7ma+YLscN2iNfc7nmJXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fEq9TJii; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fEq9TJii"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3035858c687so4108945a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746530622; x=1747135422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsFEelJoZFPGjqC5CS/HFrDUtUzRaRFJEqe02AReKwc=;
        b=fEq9TJiiO2Hu9aA0SLDWlxxe6EUhGygcZil5Du97iWC1VaUcRs2/y1Jldli9J3VNIt
         NnNtW0c7dHiRFjMaYzb4ifqjXMj70M7k4ysI75RqPUQEIacIxTjh4ZW85UbE+/wOeEJC
         2c9rPiQRz7iFK1PjlKYG5SkRJNz/ODkta6M4nqn/ws5rOHJfACTXsh1TdBOZztINjxYr
         HSy9/v1oy7FWPSONNt8+Kk7+Gx2UDyv8uLMwCwvKIY6V5OEA2Z1x/EGOj+/ZopFUOID+
         ebFzPJfLvvKEmEkovo3hEyOAo190DSrgdvpVu0nksYtqShpLSrMVzSkjuCZQElzZ8RxL
         CaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530622; x=1747135422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsFEelJoZFPGjqC5CS/HFrDUtUzRaRFJEqe02AReKwc=;
        b=tJl4d54O2K7RS195hME/hSgeY1nfcJZU4JoHRV8+mpkdoFNq5Xj6UukLdXxZ/moBet
         c+2zHfio5XibnZ7EDMXanhKp03B0LvIN2WpJMm/l92Mus3rHGEGWkbeeWLTgSUygkBHB
         NShuNUy6rY3UO7cHdvaFNXLMKpSopyFHEW6/+EGmeAugMKZGoYejRs4CYuKier0xjKXf
         weHz6F3Lt01ejrdXYE/tYlT4q2t26uAUzmXYv6rzBxWPhzNTrAwAIKNA8nDfKbjys40H
         Ytqd+87RzIWjiAIHYhLIj7cXpgT9zEWFT+52ICgw16lWkTFU94oz/Bqh+Medmgil3PJZ
         8NsA==
X-Forwarded-Encrypted: i=1; AJvYcCXYfJ+IaTBuacPuyJrpb/u2zBV59snNVk/MNLn/s3FLcBgEDOZtWSiGtjO3vk5jwNCaoiG5uKuYr5wJ3As=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkY7a/B6po9whHPr0ZXqJNIElez0+33rKGqEXbwmU8sUOf5lH
	jjHDIkuR+IUFRQtLD/8ETEwTCHnd1Pw8p9TBH26B5C94cc3tGlkRvUsgAWnfb8o=
X-Gm-Gg: ASbGncvxZNhH/EpBLOjCVAHCX43nuv6nS+vWQW2AvN6Ub4VZse2eW2UOglgl17GcJJQ
	n/R1rAjkBMOkYzaKlPAV46EhA2wZ0Y0AAcGtSmQtaI/2sntE8P4O+B8VoMnwmBFuEc2I33ryRYi
	hy1mzJP8ObjjQWJrNRZBg+SnWjp40LNfLR3Q0nYGIVgHTEvYx9cUVw3h2fc0QbdLVXpUIPBeV8D
	MGq20AqcQfDeZT9GFyejeAr3G9zHrde52mqj6w5nrf+/YryiwvkN2UkuP3AB0L9pHtuBFJ6RJ3z
	mAQLijrsox/yahLGmzWjAtOqfidReWXfks+NIBKX85SZwlhh3qP+OQMDazr9YecLAmDlliXX
X-Google-Smtp-Source: AGHT+IGD8/c2V6FEHQXVuQcalLttyvnSCx1zvvLwGRwurqvvghvKHkpqr9RcWbomLqdZzObfVoBOpw==
X-Received: by 2002:a17:90a:e188:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-30a61a7473bmr14100272a91.34.1746530622190;
        Tue, 06 May 2025 04:23:42 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480ea0dsm13630303a91.37.2025.05.06.04.23.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 May 2025 04:23:41 -0700 (PDT)
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
Subject: [PATCH v5 3/4] serial: 8250_dw: warning on entering dw8250_force_idle unlocked
Date: Tue,  6 May 2025 19:23:20 +0800
Message-Id: <20250506112321.61710-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250506112321.61710-1-cuiyunhui@bytedance.com>
References: <20250506112321.61710-1-cuiyunhui@bytedance.com>
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
index af24ec25d976..f41c4a9ed58b 100644
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
+	 * The serial_in(p, UART_RX) should be under port->lock, but we can't add
+	 * it to avoid AA deadlock as we're unsure if serial_out*(...UART_LCR)
+	 * is under port->lock.
+	 */
+	lockdep_assert_held_once(&p->lock);
+
 	serial8250_clear_and_reinit_fifos(up);
 
 	/*
-- 
2.39.2

