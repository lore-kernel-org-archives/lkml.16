Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A54284B29
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403918; cv=none; b=TTW1WVqKWVazeD0ZoBAtK6dsWm+dXanDJXv4e5odbOV64x3Wf100jkaS94vNKZsAk9qx3IFNF07YYUcp32uejB9VVcZ2zmOCZBEzWR4wYwFYgNGbANRPpFM35fBlqQVIVOLV3WDFjO38oSkmZ2sYNxfwAnU1USq0UXpXVStVjws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403918; c=relaxed/simple;
	bh=ucvbVh/yXALhRLORxO86EDtcUDjhXV2k7FhsHq1IhHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6DxdEMxAGv9HZN/zKnBq7RHKSqg6rXokmwbuX2/9aGqIocMgVyGpV7sIJwiMHkqiVD/tdxnHJ/A/2PwtXgr6F+LcUHfw9gys3KnjtlRR4MLs/Xc1s5dhQsKGZtIY90XQBadO3ZNoumKKBxQS+3ZrFkBcxklUKEGKioSltIELW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cXU48zgF; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cXU48zgF"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85e751cffbeso192037839f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403915; x=1745008715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=cXU48zgFWzBRuyaJqPSQBeudmkNcwJzmyHVLUhiZ1tbYhSwFqkga+JDpmeJXgbUC2H
         87zLgsjwR+fwg9W162QMDCtNdGoUEH+Pxle+gYmig2qUIIB2Cn7geZ7BQ0mV2ZA64L2x
         vCbBm95xcBs7zspdNi6IKGYCZcYnIfl5XDZ7Qq2oIEk7LhoRa5yb9jf0gTc6hz//hjXd
         71Qw9mkDv5UaooqQTqSRRSOMozh3Ge+Kc+cnMkbmafAXgIx6PfThNUYbp3/+5Mbx2znY
         CQQc+0BipcYgqRWpY3otAuWEumHd8vigCbubJerkibN4+m7+Bd/4ILqqkGp3t3tcb83m
         sdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403915; x=1745008715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=RGWTQjCbcHWzKqGz9qGwAncSBk3qBhqXC6mCycqXIIuSh0/gywWtnS30WyMwsRvw2K
         kiEaMWTmE4kf3GL7rpc34Qon7d0mvCLZMAhU5ry/PBlk1Kh26BiydORLSNnhjMeMSxeH
         5T1/OD8NXWf6FsscUuf6HXwEjJkkFtJ8GYzoO1DrQbuYH0t/QinKD8TjCQVXOjw8Qan/
         LIFYZoDnqYO+xs/f1aTx53DTPVVEArvcbzwkbie+hwOigULhOnNWghihuPVZh4PHyez4
         47AT0VtiWeIG/EdXQp0SGL1L/Mn6wYT28rY27z/CYSUYfd83XGSpQiBKUSb/WavJu9hr
         ecfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSnXJVV1TRIf0YS2fAgDlN06EtozzvyVgkpbPzyY42ehUeQQW4nXPndvL1Rr9UfIG/dH1llo2i3MkE+fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFxHX1gnTH0p/uecpjIS3e3PTdieHOVwOG+T4bkpVtSM9glBMB
	bNewW/3BMd4eUHDg+bM2h7meLq9SMf19fX0okvjQoaHpIPMyeP3vruIBmsFqnj8=
X-Gm-Gg: ASbGncsCsTWIwE5tNUZQYeU3F+TP8u9XuhGWJ884AcZbg9E1hZiMGpsv4HeGTjj5C41
	nYkC+xWKX2BsknpVKYwz/6ybBeDowlqAmZFfqMtyDN1umSwpCdPV1PzG+sb2QybVnBRw47Smvpe
	Rcmi22ytg/DGxblpjVcrOqzHuKFFfTa0fRb02yIVAO0XEbaFmFE2D53o3OFVwx/UzLGV7P0rgyw
	5OGiJGfyihpWllHJgGQExQNj/ZcCfvykkN8sbc+BVYP0ZAcbHy6p8ONz2tXxvQcjx/PhtD4Aw95
	6JHWM5dPDGlJ4cH7nIQx13cmfLSwHF0cRxjRGu1gHvTampPGRufl5ewb58jtvToJDX2a0cZvwc5
	leubdO8wJES8K9k1n+w9eM+W9
X-Google-Smtp-Source: AGHT+IFI78Dq0uhLXGQ3VPmWnhBpX7t1jvh+2+h32uhUwjru/tDqrj+isW0Bsi4fpyNX4H8KLkVFTA==
X-Received: by 2002:a05:6e02:258d:b0:3d0:237e:c29c with SMTP id e9e14a558f8ab-3d7ec21bdfamr43241385ab.12.1744403915441;
        Fri, 11 Apr 2025 13:38:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:35 -0700 (PDT)
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
Subject: [PATCH v4 2/3] serial: 8250_of: add support for an optional bus clock
Date: Fri, 11 Apr 2025 15:38:26 -0500
Message-ID: <20250411203828.1491595-3-elder@riscstar.com>
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

The SpacemiT UART requires a bus clock to be enabled, in addition to
it's "normal" core clock.  Look up the optional bus clock by name,
and if that's found, look up the core clock using the name "core".

Supplying a bus clock is optional.  If no bus clock is needed, the
the first/only clock is used for the core clock.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/tty/serial/8250/8250_of.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 11c860ea80f60..a90a5462aa72a 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -123,7 +123,16 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	/* Get clk rate through clk driver if present */
 	if (!port->uartclk) {
-		info->clk = devm_clk_get_enabled(dev, NULL);
+		struct clk *bus_clk;
+
+		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+		if (IS_ERR(bus_clk)) {
+			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
+			goto err_pmruntime;
+		}
+
+		/* If the bus clock is required, core clock must be named */
+		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
 		if (IS_ERR(info->clk)) {
 			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
 			goto err_pmruntime;
-- 
2.45.2

