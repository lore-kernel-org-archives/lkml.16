Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDCD280CD9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403920; cv=none; b=N0vdqHXYJjO8eKkoP7HVSMRA1Lna/70OGz4yXQM19uvp0y7KfURdaQtKsxVaJ0fPovKdgcLE289klSu25lY6nTIcKA7FR+EcX82iCeCrNpNjfMWaVbzagfZh+5y2AWXztgPfyC87n4evPoznWaEFDY87aQd5es7HBFk2reKk3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403920; c=relaxed/simple;
	bh=35gorawSDcrg8QbS+s+M/Qi8sq0tSP1dR9KzDN+4gxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlyDsiisVI4KlkDpZ4a0S8U3NOJ7imN9urhuUs3TGSv6ju1hGcOSDXFxnJ1falRNLX1BPn4jv53oYerPDFChnaOO+vQ4Jw1U8/DCZqBXo9kDmWb2t6hqVQEl/RO82TJrL5EvKr35qUtDl7F5TahZqKJk2ARIX+7mwGo6G2WGoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eDwCSKKl; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eDwCSKKl"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85d9a87660fso205313439f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403916; x=1745008716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0009F5O9wljpHFhP0qBedRkQq+IjHXl/vgFyYcghGBI=;
        b=eDwCSKKl/5z8nIEBA/pV1BfH8SeYUk3ObUlKL4xujOgbaJRP9qho0RlaXicddqh+GQ
         5vxEDS4ErnL5gXD957jHRgN8BP+Y4GqAWb2iAFYenhL4IO4nDSbHJqSMVvcBAzZFjROE
         fArPH4wS8xz/TZcU80V02Nrb7myqz+b2roQ1Na3HFIFwjC7NIzVc6S888rfccQWA7uI0
         VNuHmmRemuUysfFQjq9TE7ebzWE+Ye9NO5pcWX7QbZD4WFNz2U1mBinx6Ti1UBqzZkzu
         sMQmKpTdzpkp1sjjv90/0iso8M4pDKn6I/+AjGJ+4yp4dJYKpqkfviz9gZK0TEjcOrRl
         L+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403916; x=1745008716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0009F5O9wljpHFhP0qBedRkQq+IjHXl/vgFyYcghGBI=;
        b=UEuOK+gJIe303Q55exlhEWAU34zEW2+tNkHpZMblByxJV6DrynXhWBhk+kWQT5fBrh
         LZFXNnMdBoO3V4w7yRS/SSxfF43XQ88gkANiU9EFoLB8MZvaN8u3dxrPQhoQU3MiKoTc
         3uW7jzzyGA3zdEowB1kSjQvf88aIcaVB5u6M+M/VK+V4EYwY1MnYzyvTM+miNRdr3Qmv
         1wJkvkb6HvA7rge60KfG9xUfsG9qMzHvDvrwI5c5MGlLhWxgaLPnHvWMj5XTULs9/T6Z
         rGE+LLNmcLxYaFREYWGjfNShCG7o8LikUUqDYFa7CS4F20QdZ3r4xFQe1XyzaEY8+HVY
         V68A==
X-Forwarded-Encrypted: i=1; AJvYcCUCNEwsXkG4uK0tMOic2iKAHWZAbN3tHcGPfk3bOrTupPkaR4fZh/C4VANtbDCBAF742OWE/H3LQoHLxk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxFAToGW4nCFLL7sa9EtxlK/NRRQJgQE5Rw0lKha/LFkNoqt5
	khX60dxXAD2v6gDN606BzbJPATAWJdcH6J9SSwd7msmdF+HnNpXmhCVxLEFuVWs=
X-Gm-Gg: ASbGncsmOaWHBzmkO2ZF/oEeh4cADHkHj/kLiMjzWuvcWupTF4pt44efMXRGe9ko5xM
	I8daXpWy8F3RyptGv82xJ4GsWgvLLjUHs/7tkiEczrF8+U8b2y0z84a3gZ7MKGARPVUQ4hlrWFv
	k0fJ+1c9X4lEDndHMUMfLv+1jrCNZjCrt3guBn5mqGGCyobT/bis9BttaJ7q3eorHduAjtUmUOf
	EJF6kDMu7CXlJMbELd85A5XUDpDQCY90BHyUmdbkHvKzSJr/T4zD2cS+w6NXxKW5MpMniiabvcf
	8dIuwc7RmWGS307CT8bDw3SrXLUKCs9eATNRC7fH4xOg5A79nxmkXp74dDh7V1dLSvLxnJR9jnH
	fCYtfr9XtfM6Dfg==
X-Google-Smtp-Source: AGHT+IGqHP+A8bUdxXLeOSya2xG9dcuQXpXzTMzOhzOj4n3d6/OcbE382cLJQUug9NIF/T7vU4ELFw==
X-Received: by 2002:a05:6602:4816:b0:85b:35ef:b1fb with SMTP id ca18e2360f4ac-8617cb63bb2mr542148039f.2.1744403916511;
        Fri, 11 Apr 2025 13:38:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andy.shevchenko@gmail.com,
	dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] serial: 8250_of: manage bus clock in suspend/resume
Date: Fri, 11 Apr 2025 15:38:27 -0500
Message-ID: <20250411203828.1491595-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411203828.1491595-1-elder@riscstar.com>
References: <20250411203828.1491595-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save the bus clock pointer in the of_serial_info structure, and use
that to disable the bus clock on suspend and re-enable it on resume.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/tty/serial/8250/8250_of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index a90a5462aa72a..d178b6c54ea18 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -24,6 +24,7 @@
 
 struct of_serial_info {
 	struct clk *clk;
+	struct clk *bus_clk;
 	struct reset_control *rst;
 	int type;
 	int line;
@@ -138,6 +139,7 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 			goto err_pmruntime;
 		}
 
+		info->bus_clk = bus_clk;
 		port->uartclk = clk_get_rate(info->clk);
 	}
 	/* If current-speed was set, then try not to change it. */
@@ -299,6 +301,7 @@ static int of_serial_suspend(struct device *dev)
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_put_sync(dev);
 		clk_disable_unprepare(info->clk);
+		clk_disable_unprepare(info->bus_clk);
 	}
 	return 0;
 }
@@ -311,6 +314,7 @@ static int of_serial_resume(struct device *dev)
 
 	if (!uart_console(port) || console_suspend_enabled) {
 		pm_runtime_get_sync(dev);
+		clk_prepare_enable(info->bus_clk);
 		clk_prepare_enable(info->clk);
 	}
 
-- 
2.45.2

