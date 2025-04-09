Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC801E5205
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226543; cv=none; b=iqBWYXQVBoeK0tWYvG57KRSwi49OL3UO+g+xHp90G0xJbrwL1Gjpozrk/AFln6AB5o97SGtFZbsgiTdCHCs7ivijEmJJ71lMikzSIg96t0VyNPZzzJWiWwpHPg/+9gmr1037l0AOV6pbjJA+ec1ITnuehUCkMW/j6xTqpI19Muc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226543; c=relaxed/simple;
	bh=Y2ilGHMUTXCya8rzOvmKtYifGjbu9RYpGCgzY3UBtUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiUwrgdfGV3+V2aH8HrEFuautRKb3cCiNX+3NxFRqmZ5X+nCpTl8uSYmisNneNxW1PZ73POciF+595lJbDIj0xpRxaI8kcdr+xMKatVLale6e+t06zUhzV1XHh1tpM86N494seHsEaBxQh3SbaJ2eb1d+KbmGqUgqOsZVGFYsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=OOh8qPm+; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="OOh8qPm+"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86135aeca58so3195239f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744226541; x=1744831341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNl26J3HRC4XsI0NsNHSQT2PLx01D+6pAV6deX3HHJI=;
        b=OOh8qPm+gkBB5ONASPmYgWUk7rIRRWcuu7szi2KIo7zL1XpyN3WXyaZzUcvPcZPU75
         /W0VEEfCaPUyFuEkD/41Z8vxA9Thh5yRhqeoC/lxCojgRMWptqrfJv4iiYVh53pcg1FC
         +hEXY8p/ji6Lrp0pH2V/4j5kxiCYwGXrATfIOVTw2MSNVPK4plgAvGB/9mUv35rqbcHJ
         4DkG5gxM9xNm5mFQApzf0Ayra1feJPARhYCVKuZr7tflKgXiZB4Qo3tldGOtf6o+vOWY
         EURl2c1IrTyS8iP4cU4eMqx3MJ2G8z+2WouZTLn+DInbQgaG6xd4u+1DuK4+9vPKsQZS
         PwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226541; x=1744831341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNl26J3HRC4XsI0NsNHSQT2PLx01D+6pAV6deX3HHJI=;
        b=hFKxWzaUeoo7/3WajO9H3ztptZ63JBNVQ7AI7dDc8Lf/NMe4rMiWmGocWCxX0RLi5r
         1XOHd4RNFgT0B9ZppwTSmkCVp/Y6MtpaJtXA+k12TQZETdaXgSLs2sDGOCzeyUPZVYTZ
         ZQfao/CKa0+RN8toTf/QoVOhF0Q8W0ii23QY7B5ewlUwnUmJOSVaVFk2meZ74NeAFwc7
         A/biS0SurulMGuC69Bbn5mwOaFVbeKBvK0E7UevJFk7sEfvDFE/VCK81/o3XXS+XrYyB
         D+4SGasXH5XDX+927o3k+rZ8ywLgYecCwtdt47P+V5YKIzjFKo2KVw0T9ylFhVk7d4qX
         zw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxMu50NFjWl0SLV+Q7J1o8Pdvfcm35hw/F8qT0BDj3KhPYrqS/ONvHn5Tp2q5EGoZSUSBwZ+IVDf21fbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzN+jgL3/qPxD/6OFp2T7fAIILfUJnh/gmtKrPTfvMbj3q21S
	hK/njjAuBIgNqInFsoEj3CixQ1HpKIDe7U/Rr3QxWrJQ0Kn1pL7N7XWM6AwaDT0=
X-Gm-Gg: ASbGncu/myS08fwj+IDdI6rsj/tW4BKHLcQ2W7+7nA8MH/vPHDICGIqTlavphsfjl+M
	8PqgBqmlQSLpbWnew3HQI2e7POWBn2uCty/osvmcoyHMeVDThEY51FscnFOocMIAjrV/klg7cGV
	u1bG2Z4qQawr6SaULjgf2cJWb/WgX7S5t/aRz0IolVlTawQ5bFDrVUjHKZwfN/8vqOXoXJtjH6H
	qDeJS7I8nJ424x9IGyM6k0y/1ewDrxBDtP2CFZJQOH8TnuNm+28b8SMcujQJ3BAz1CgOVox88ej
	yNj0lry043yGwDd+ehPg75RH9icfnRX7O0kdJ4mlXach6KdSPUPqqCdXFkULdAWt95CTCzLQKeb
	SyxXNtvxI4SP5F+yiFpmiWGdE
X-Google-Smtp-Source: AGHT+IHad8+4ZGmSEydVvWi93B5NhjlEAMlDrR2UwaWJMa/MsGHo4UvOCZSyheMgn+3uP3r9HQq5+Q==
X-Received: by 2002:a05:6602:7210:b0:85b:4319:2a2a with SMTP id ca18e2360f4ac-8616ed25080mr12867839f.6.1744226540652;
        Wed, 09 Apr 2025 12:22:20 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf81bcsm373459173.10.2025.04.09.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:22:20 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] serial: 8250_of: add support for an optional bus clock
Date: Wed,  9 Apr 2025 14:22:12 -0500
Message-ID: <20250409192213.1130181-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409192213.1130181-1-elder@riscstar.com>
References: <20250409192213.1130181-1-elder@riscstar.com>
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
v2: Update logic to more check for the optional bus clock first

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

