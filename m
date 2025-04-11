Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3610213E7B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386269; cv=none; b=pjFaoXwehPYKeAUW3VcRGuu9M8MrnSc4ZS4TLX0cVhib90PqY4HRIxNh5d9cvWerqGkQ//WGk75P9vzaxgI/0uu2sc+QB/JLYytEbPC4VRrZy1tyE4OD29Bk8CGp4u0K4nDvYuZoSlp86iECR7jqZ4npwDN/whwUJd3LDTvNSNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386269; c=relaxed/simple;
	bh=ucvbVh/yXALhRLORxO86EDtcUDjhXV2k7FhsHq1IhHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPRb/y8sq5gGdnXi8IVLv7Mo5xNkXm1MKoiq8SjRvDR3N6KodGBaIw2AKlD2Ads2o2H/G9gaSk6sk/Pv5RyF850YWJelTBllh9LdczTFJvnTBqFOlmmKorqiaQdG1jG+6APz5YdGM+HbFe89y+eKbBS3c2JIDe3dkrC5g/+VFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WEAWQd6A; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WEAWQd6A"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d439f01698so10228455ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386267; x=1744991067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=WEAWQd6AlZmwszqpr2FdMHOqU8RG330klxdCeKbWOQZ57QkTE7ddQSawMK/9di0qCb
         jrYKhLPt/GL7IkodueJqF7EEf1Ak9KJpVD5Su8U+O+xTx2dJs7HP86tt8SvhdFwQsRTx
         JjD3/Gjp/wSLWWIy81VlYvqLWYhSU2mrKBLz2Tn+86LmC+jXzHxjwBAoTa9RIjS8fGSj
         G/Wfzpvfvzo0GfVSPHOgNGHMPMtOwifcrzrh7jAoqwGBe+xGzu4LyvnPll0MIrd3+Dbd
         V7xHvmPqzW5zy8fhUhcy7Y0DfJkjuk9314SZ3oF2CItb9ZLYpo6WnKl0NuwY7WuEH2Ki
         sgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386267; x=1744991067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+No0irtswkb42oZgjOuCr5NaquvvHMgg0F5193JRX8=;
        b=ZzkvdzrRswMGGe0Lrxe4z9emTWybUl14qVedhh/MAvEJaB+UcwFTUtERSeMBTgL5JA
         RnY63koL9QLlc290gztyAVYDW2oKhxY5WTpp3e6i5nI2hWr4HK73AeaTN4+p09ebq3Qb
         faU+JhfQhDMzY7zGC1rhTPv+sY7u4x9D7YT3EGxjB9EEqUYr517JKK9KkArR1BmuLP7d
         UQ5ZbDdumJfZFPIHXywlgyZyitB3WQ9AytP18m9CHRLkxmzvOJZ4d58IbFnkI8YG1gCY
         WsQ0rZFkKYMaUEoqbsnjH0Pgv7wJRlgyA49kfP1c04bp5fLQPbiywFTz6GlUAJeAmqwh
         40ag==
X-Forwarded-Encrypted: i=1; AJvYcCU+KKMtQJxd+S8Pq7o2/g0sEMB4w3P+0HcSRRAsOskUJeA9RlsORLzRmIpQYDYB3DnVCQTRC3bAXRkveHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1ORjbnDoLVEjeLGBXcQuXI1qquZE3oiabt2TYTcox73GRNz8
	S6dXFkcqZdeGGseuxgifls7TLEK7ENwOFOThRYV9vKzrOK98nsHJ7RvQwL98H/s=
X-Gm-Gg: ASbGncsf93yrqgiJozBLvX/eMNhc6/PS/iw7evEdIDtuP8tbL2kyIXjxD3RTDAHVinp
	hkMZNE3rrjdj+GS4L+EzrIWCwpHMuHrgIrOFaQpnBVhvSPPNDVUXoNMnhqPCvDXJt8JbmBX1103
	IO1L326T020ZJ3znp+H3n4FZj7CUGW3V0dWlXDgl6vq2NC/JKhDl+LuP+/alAbaNYg2V9YPXWCf
	rVcFva/e4aD3AGZJMV97aKx2S6lZ6FGLFEWxKTTDdeIDySyptQlM11K+F6D2tAhy1YqBB84dseg
	QeL3wzh2QIewVIUitwZG2ySx4H+g25Jg7RLQ7om38wcOJgzFqZF7Py8MTMHTKHswj3gz0cIGkfE
	82iqVCsIMnN418Q==
X-Google-Smtp-Source: AGHT+IFHmGeALO9Wp+63MrFrWPOF/pQKiCJFNH3pXYWduOMBqvBFciOLd/8MEHS0nwfjD94ZFGolaQ==
X-Received: by 2002:a92:1304:0:b0:3d3:d08d:d526 with SMTP id e9e14a558f8ab-3d7e4d0c549mr59399825ab.11.1744386267024;
        Fri, 11 Apr 2025 08:44:27 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:26 -0700 (PDT)
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
Subject: [PATCH v3 2/3] serial: 8250_of: add support for an optional bus clock
Date: Fri, 11 Apr 2025 10:44:17 -0500
Message-ID: <20250411154419.1379529-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411154419.1379529-1-elder@riscstar.com>
References: <20250411154419.1379529-1-elder@riscstar.com>
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

