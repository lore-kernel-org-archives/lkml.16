Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F416229B16
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413597; cv=none; b=ImSQ8Xym8nreNJmh2EyqUX2gdvWR5ldjqGWb1kVbWi90U6aOM70H6TPXU1ToYK7ty99Pl/UZ/mwluQ8rb+vFxiLTXYoWZsJFD0owk642vCJzy3VYA/3+biqnIhgRUegl8/k/nskdC48A8jw5hXhQBJLRmg5P3L4QxJWcPDyD7j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413597; c=relaxed/simple;
	bh=sh1cGUiYYVGEGi8YqLowXFl/GRJaaw2ICSbcRxFVUtk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kH/7lXKriaRggEoE51pGGDZT/n86TW61ew5PapyiSQAUTDJDSZl2vL/yWGXY0zEYNFPV10Ncw6eyY6zVu5S3SdbC/2frAQbrH/gLlpwQ+DFglXqheeIvTOSN74NukKoetTbUNVCQhxRa/X6/dF8UGFux64ydvLRgXa03SjB1zjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QhbjGgX4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QhbjGgX4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23446bb8785so38527935ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748413595; x=1749018395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tf3d4NxJrcGNbUN64elIQLb/pmeQW1fbqHye+etV/RM=;
        b=QhbjGgX4fiBmX5P9KVykKiyVB88EhJgWGY27uWUonc1g2hwGg/HuVpZcSbh0gvI+/f
         fohlZWwZFVuHl0cLlC4KxpGe6jmmgfyexUaccS8AFAJgjX1Wr9YA8SUxZ0nqenTew5ng
         WFpw54iG3Lp8xosOD5mOuHocdcZyRPJB4rdhMCqnoua8z7RApiDI5lKF5lAk+I2OntwT
         3oXf4W2S/YKnFUA4faw3NijOvtQgs4rvHNH5K8b/A8isFcSWzQ9XVDhWbP1+aFH7efbq
         udtAdsrnO63k215nYXJuFp25oDYB3vA8qNglqQQ58wYwoZ7zVwLpbP+p/1DBl8TxBrhl
         sSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748413595; x=1749018395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf3d4NxJrcGNbUN64elIQLb/pmeQW1fbqHye+etV/RM=;
        b=Xq0LsO3Y3wEVEJYXU9/KBw0e5avIHFJONQ/tN8pb/2FyiBflBC9854uTmgHc/r1EMX
         ArssD8uzGz7OzbDFM9b3CTZR3muo69gJrqYlWRJUx4q52efQgcKU9exoj29Jxgeqpcho
         Lqj0m9VdcllLhbk/r0Nt52XIAxOg5l/OkrQ3Af2DzR5q7NL48Ds7czt1l1QRBKgtV2fd
         l3DUo8puWU73YwAtfRW5cnDRByqlxR058LOMTGbn7hXOMlIoPd0mxMOFniw87tJPy1rP
         ETDuzqIauVZ70JGmoc+WHr7OdgKSwHnNs+uY8CgoZd8U9pI6xq8aT4iNjYhns0TMnz3N
         DuGw==
X-Forwarded-Encrypted: i=1; AJvYcCX5CvwhCI6WRNGC4+4xOYadxAskb2ZQSwOQDD+CoQOstp+y5wKb24Q/ha9zaTsPIjAY9802y/JqjsE6RAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWmoT3fhBGkgz34vNkxMhCt3aG5yot5Xb/n9SmvTGAbsWWkvT
	MBg3zocIaY8sZjAo/OERjX+B8kUvEGO+58gomq97YAARqXf2H04caa/fqixvBLG/4G8=
X-Gm-Gg: ASbGncv8wBdoij8sKuJisOLY4CFZLK8KPFr6R1ViPXGT50nlYlWx9o6c/r0Dr6hCv5a
	/iuxIe+f0m3k7cMxwSuqNfyXH7IPuq882SJRANYeJepHFbBoMTGNKsJZieouEFO7NaSJxH/1FPO
	44qo2s0T4Y846+GguLIFAwIQbHqGNz6/C8JpWdEruRtaQU5gWxKtXac32NtxCgC6jxLnh4J+BmV
	hz1HHjTBAQctiQLoW4nA0I5ztkzKPGkvLC8a7tKSHylc5g/6KxGb8keOA7vJgBjEmYN4QiG0E1T
	g5jUozMWCs1XyFo/LeroyRzTONjYYQ6Bx2FwN0ul4XQs5q5nElHvpbakaBY/8Tnqt4nFWqevNHc
	rcQAbCmvMkw==
X-Google-Smtp-Source: AGHT+IHMwV9pu4i8J+GgFkOBOpyMXF805fnm3igvxyjsK4pKznBH1Watf3hetuV0tb6o3s9sRcJvDA==
X-Received: by 2002:a17:903:fa4:b0:220:e655:d77 with SMTP id d9443c01a7336-23414fcd21bmr292803245ad.36.1748413595413;
        Tue, 27 May 2025 23:26:35 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35acf6dsm4619515ad.201.2025.05.27.23.26.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 May 2025 23:26:35 -0700 (PDT)
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
Subject: [PATCH v7 3/4] serial: 8250_dw: assert port->lock is held in dw8250_force_idle()
Date: Wed, 28 May 2025 14:26:08 +0800
Message-Id: <20250528062609.25104-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250528062609.25104-1-cuiyunhui@bytedance.com>
References: <20250528062609.25104-1-cuiyunhui@bytedance.com>
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

