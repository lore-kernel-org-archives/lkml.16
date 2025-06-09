Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A7B281525
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455064; cv=none; b=OXa+6WwjsEuapAMirvXsWFoYPmMIny3lvvGKIfseBhmvVgOPZ2tY2nIJ1XWbKI5D8aGJrcwZnVX/qPLrkg4UOcSjjZgtlnrw1UN9+ut4019CZxP3Ur5c/IiJijG2oyzs727X/SjYfg9+G0NjSmnXXuMJ4P7X8H4JfIg4OIm7Yn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455064; c=relaxed/simple;
	bh=sh1cGUiYYVGEGi8YqLowXFl/GRJaaw2ICSbcRxFVUtk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJ1UXwwXvMUi8uOKiZ1iLvyTenpIunnQfJJ+ed5lC2rv5OTJiIEM7ni1DQqI88kMW8lQa7LQnx4P6toTb4//96fd3Bo73K1YAXy+gniCb+V16ZMGCxGOJW3RPmNugJG+e6iZOvdQbUIQCZxUO+Nw85ghJuzus8gl1zUTWC8H8FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=grPvD35x; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="grPvD35x"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2352e3db62cso36612085ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749455062; x=1750059862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tf3d4NxJrcGNbUN64elIQLb/pmeQW1fbqHye+etV/RM=;
        b=grPvD35xZq64cksE0uDYky34vJBZ4bByr2m+BlV3839saYONI7H2WaTe379QIXyo+L
         zSGy+12JIA2r3h2umsPDHjPox1dRycrlE3+CxcbBPZS3z5/35hRCvbLQn3NRJnfyP/V/
         HyOrgBjnlsHVGwMMUHGMdBvhZeM28xldjdxh+O06K6gHSfPYHPR32bWcZZDqzQxecuZD
         mMd/CD2K/jf4iJc+XyA7mhOBuOMApCLvhAyTFb7sTckOr0rXPM9S/pOdlBnyopEVw9n5
         eR3BtNegPzUxpVEvyhDIE4bmk1bTs2qLhprpgEowDy9ZrqtYUFkI/gLbViRM/Nqsb2P1
         NSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749455062; x=1750059862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf3d4NxJrcGNbUN64elIQLb/pmeQW1fbqHye+etV/RM=;
        b=d8Nvyy0Bvzh4gOUk9LrBYJ7rsCDbpgcPRiHajQpV89/11cEg4a7B1wpDZDFh82jzzU
         gdaJu76Wp/To7bVa2fts0BRsbQSJLTRyb/a4jXmBe/bpLNvsuBdYFVf8Q22d4WFCK9wj
         a9AjyBnVBZEnNdUMMcHJzSp8fQ152PZNssAnIfOL2I6r6hxF60SFDhviQXxamnDvPmWm
         0SD7ppK9WaclrNLwPy3HXSGcTnMkEl5bditzqnezgo7+bSHt3+aKSvtFd6JmpATQRk7L
         OeuziJT4+u93d7MjoAtxbBVR9BgCNU/Ax37B/h5yp3ZegSBoo3Ux/YhnUSIDSvLDM1z4
         9XRA==
X-Forwarded-Encrypted: i=1; AJvYcCWX2errxIx08EjPxGpXD6WiHXrfKyZm6APVEhgJz7oB3D693xMeTWvz9ci9C53MPb1cR3DcPhqlKPkPmSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzjGkjJ4zwG9G/3hPUDeIbyMWGoy0u8Kst2wrnoCBrxwBdnIN
	z9uHzKmVSdEjPLfk4Y5tpZvWnK4rAX/QqEb+pTsnOcqF08X25ZB2ORl54QFNF5Vostw=
X-Gm-Gg: ASbGncuF+ywWSR+QCqQV/wrZ0GEDyGaeuYS1H1QLdM11LrNN0dcIcVFPcJSOVwYmD3L
	4FG1J3X1HJPP2j7ZkHwz60GgerZUbYdDEeE8NiggIw2th3hmp7eQauLWJ2yCvOU19MyAwaDLiKo
	C789Fdo2nBpFQo9CbKnIYxTk/G0J650s0lJDRd3qK2346bEdfqvvvrI1IoeRwFrIDLkR4bFPPzl
	r7eczt4sJtsRx5FrbI/1Zq3Pt+LEc1ED/z2PpWuLZPtWjYLpucdRNMrZGiCmijAkys5NXP5K6wG
	b99ynFzVqRHbHrdat1Lt5v2Ff9dOACAKEBAbdP8Un4u4wkrCRjDLgCkqrPcKsF4PNgjjBjDr6WZ
	rSE5l6n3gxvEOzIOtMZvu2Vib26yiAPjalz5Yjl71CQ==
X-Google-Smtp-Source: AGHT+IEQ7dRItoYtft7Z73E1bG0AQUocTaShtV8m/XxHYF/+UtJ1i4g9HW/VM1Ga0ii/WT7qcpPUAw==
X-Received: by 2002:a17:902:d48e:b0:224:c46:d167 with SMTP id d9443c01a7336-23601e44edemr172981645ad.16.1749455062090;
        Mon, 09 Jun 2025 00:44:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm48573715ad.72.2025.06.09.00.44.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Jun 2025 00:44:20 -0700 (PDT)
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
	tim.kryger@linaro.org,
	stable@vger.kernel.org
Subject: [PATCH v8 3/4] serial: 8250_dw: assert port->lock is held in dw8250_force_idle()
Date: Mon,  9 Jun 2025 15:43:47 +0800
Message-Id: <20250609074348.54899-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250609074348.54899-1-cuiyunhui@bytedance.com>
References: <20250609074348.54899-1-cuiyunhui@bytedance.com>
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
index 1902f29444a1c..8b0018fadccea 100644
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

