Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CB28A3E1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547370; cv=none; b=S3k5Ihjtpjv8Yb8/id+5bC8qC8D+jZfDbz3oK2OJaXwr2emrU8h45oL1ouTi5XY/7uNk1GO/kYmr3qQDel4gItcy5iq2XvFL1qWBzFl5OhOQUMPwoZ+cLZIjnIqAzZeSjMv2+SlvYqax9d4KisGRQ0zou2w6oppAxqFz+Xn9B04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547370; c=relaxed/simple;
	bh=DzbUGvSEz9fXtmlVmzQnGoE1SPjPgfLt2lNAwCzzejU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AYb3c1dghG6/uDBKAuDUIbrh6dTbrB0bGpFE8J87YjYUqbllMn25erIsIga6BA1fwUrIhycbpva9lGxvgr1xLIgtWAvcUsIH1F/hF8dxHnBNqwKv/ztq/Ve/5ueEWAKjvWAX0RhGzT/RR/LkrdhexsQ1YR1Orkycoqa13pIsaZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MNC37Ilv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MNC37Ilv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso3766479a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749547368; x=1750152168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIl3jd/zdjxk0DCEyY2ZK8PBBrmx2B/ph5KlqW1T7PA=;
        b=MNC37IlvYU6eRoRLZ3arnZ6GlpV6oXraHAenZG4laW8R96idorpAit8LEPgVpQOnrT
         0BRnUPQsVWvV3+pHIQvvXr+Js96tGHZhxO2b/6y2YOzJrg0JkW97oTNaeHxLrp0bOquc
         6W0UxuN8ZWYkA4evXWcMimlu39ITPbqeSkjH1PrLBi774JYXGK1X6xQmLj2x3RxZD/fz
         pgQpRk185M/FDR9p1P/fYgijCy+ikztZzfUKhGQdBCm5GU2qZv75lsanFm+Z/H/hSPaq
         FV628Sjsa12xVmjt1ikbfSQB+VQ+slPguDxXE5m7GyOrWP924fxJkLq8CQdAxOnlfpIQ
         PLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547368; x=1750152168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIl3jd/zdjxk0DCEyY2ZK8PBBrmx2B/ph5KlqW1T7PA=;
        b=slBA0C812IwnMXYiuu0gZQQ++M+c3McZeTiGjXTxeZp5+jCYNsHGtqVdO/mUlmFtAt
         MOHUn7S8s5UymGDLbmqxqEuVOYcpc3ruvYdZvsxIno9kvyop8GRnrrGWwednJZ98h25q
         G6lvnsa93bQazKqCR2VTumgPlJah+FwNpEfVPA3Ij9rG60G60yItWDR8uYFXgRZgJPbR
         CNFhNCtMVeIpjyYSnXeIjbbrXeHuJ3PX59k64lWL5LnK/qTIUTfaIiF/VNx0OqhZrBeb
         UIsl7Mx3ae9Y9fpZzWE1dWQDX2EwPBgM3T2cB4ownjmMnWzF28blnrMZ6sG6m0TItzNW
         nQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhV1Q2CGGGwYPJwQOKCWUfq6e1fWq4QDPNYygKJ6KWffGDBJsInFSLzCP1/0ohbpcJTqhWMxYffRNu2DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzROkqpYLsBiRphdFjEdiXUFnVBL3PR/qETcXk01tRJRiaOjRAi
	6H27XNZ0hO2KItp5QmtlNcb2yTVy1dz153xCRciM90yT+Ghvtq9bDIgWNDcGm0z19Ig=
X-Gm-Gg: ASbGnctBqrfrSrQ+0qvKcX0XmhI1RGFY5rDu1FrThfteIjaHtnweHyd6JnRk4RjN5C6
	7JsgqA7td9b991ILP4gTsJVY9KnJyZT4l+NfrWB2/wlL88EQfANRZegw9la/ukz+bXO5id08QvV
	Rlb1qBGyrL1zU3mgcWVwxsEbdMCmKDY1dHZSFVWOHZeqXyZ92Ygfrj0lnRraKDfOXqIG/0r1JCB
	5BmXdWN/79E43ynxjuCbbhB8Mk7U2mCr6Z/mOwcPPsprewFioqbsHYzzdsCrfFuXWZ49aKlg9VQ
	WWxo5pN6vAXSSkMH0Fq6bu+AE29kjXElb1bBkA4gFcWq5E9GBDeGNmUyUX/5UEv+JSF2WdRxYyX
	Z3WPUF0zZ/IK4Lh36LAkBpFUS+Uk3XcFdiwB9Ws7iIg==
X-Google-Smtp-Source: AGHT+IE7oP5018f+7id9MCmnywhwE2pvWciy02cmVcTCGl4f70NgKZt5UeEuXcYAHe0aQ6mb0oXMyg==
X-Received: by 2002:a17:90b:538d:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-313a16cf863mr3112140a91.18.1749547367955;
        Tue, 10 Jun 2025 02:22:47 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9ebsm66968605ad.106.2025.06.10.02.22.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 02:22:47 -0700 (PDT)
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
Subject: [PATCH v9 4/4] serial: 8250_dw: assert port->lock is held in dw8250_force_idle()
Date: Tue, 10 Jun 2025 17:21:35 +0800
Message-Id: <20250610092135.28738-5-cuiyunhui@bytedance.com>
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

Reading UART_RX and checking whether UART_LSR_DR is set should be
atomic. Ensure the caller of dw8250_force_idle() holds port->lock.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250_dw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 082b7fcf251db..686f9117a3339 100644
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
@@ -117,6 +118,9 @@ static void dw8250_force_idle(struct uart_port *p)
 	struct uart_8250_port *up = up_to_u8250p(p);
 	unsigned int lsr;
 
+	/* Reading UART_LSR and UART_RX should be atomic. */
+	lockdep_assert_held_once(&p->lock);
+
 	/*
 	 * The following call currently performs serial_out()
 	 * against the FCR register. Because it differs to LCR
-- 
2.39.5

