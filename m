Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA22BEC3B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375013; cv=none; b=MN4yJSEfqICMXcp/VkYpqc8+aRUJvOH3pfhnL46IbL0u+dI+AC0uI6kFbduYYV6buKCnIyzDDH1R+HUM/kiUHhdfV+g96BnZfhgM3ku7cK7ULwDlvqxKBLZsmcXtkOS6bNUXmY+yVmtVSAZBI1ukqXF0zwu7BunLapg1YCxhe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375013; c=relaxed/simple;
	bh=trGJ+81hvgNk61JAyUi09epqF3tLwjd5H58jiE8ssKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s39kCVPJS1qaVy4aGDBa29XNxLwTJlEd9Uo5rO/7P6oLOTwTw9DfbMcSuKW7JqERivyFacqLjacgmDEhNEDsCg5OzI9CRfl4EhqGYGFEwAWN25PLkP7NOl/V4NZjKkrDVEgnnq/OhoZ+WwGUuLfRVEJo9mkRQRF0iFqDN680ud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VOhTDv66; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VOhTDv66"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1648482b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375011; x=1744979811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=;
        b=VOhTDv66TKkL6OctU/gsj7dJmdGEwZOrmzO5sMCTTkNy0Q7p4OcOuqFMPkbVQDXD4u
         kqtu2eShJI2P3vRnO7Y1tRV4Yid6jIoLm8gijuuKbqjNPKr332oBQj4bSa9jTetZhjVp
         PxmxWbG6qiy8awCjGDUHHHd80O4ZZgbKW+G2Zyt5NHlpbKCMQv0ZA8y6BxMaR00/XME7
         U2foyDtsopZ3ySjIYcG2J0xEZlSq/GxjnQY0pxWmyIvu5GSZhdDGg0omFK/W7QaUNwTJ
         c1Wrfy7XbNfl4x8W3VVikgMILn7zLLwCSCx4yCsnuIaT6LWB4cxagKgXTat1e6l6nxrB
         kfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375011; x=1744979811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=;
        b=pTRD6GgMnFkY7BecIeDYEAcWTdZZoQHoKVVavKuL6o71Dla7Dm61buBPOLn094QiBZ
         ZA7jI39FlcND11TzafPR0bCFa1tS+RzsKEmKZahgidWIG9IMs5VrxnpQ5Mik0rMNc1uf
         J9sfv8Km6FQJaR73wH/SbKBS3gSiIyXN2TJbd2SdBksKaW8bkA7z35wkUg6CMJCH6Gq9
         RRGqqJGJT53uHZ8115gEmkJBZw4FG+As0OddSbazd5Udr1PDYArlJLjG2y8c5cFY+dcJ
         t2AFN0xjkGaQuSJ8jk7dkmpa+IEqRaVRzVoT48UuCT7aJ8hqhiJE+P6ibShoHirLyqWe
         GI1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYI4D8Y01Jma5kwGYLVcfVc7gYWBBhTIfaUkyHwm9DFmUlH4yDbUA86ggG7RiwgX4SMb1ayRmUpPSHfmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRMXmFZb7b51B1hk++xEL9JBi/0HO1evb55PgpkmQ5Hqug/Ud
	CLgUmy/A8SEfRP+u1dOAKuoBPFD1AVGjAkhWEIh3OK4JpBRXEJNzTtn70hrchVz6v9ZhvO+5LgG
	jPE0=
X-Gm-Gg: ASbGncsH29vTFrzrkOmeuFOK69S7GazBlFmjm59dXADgIPHw+fd4lyyD766YmKuYs4t
	gCfXEXUDS7JFUJNuBeR+9uTUGjjovSc2UvYRomiD5UV6+O+TbjYRQQOuFMs01pZZ5vDAECQRiQa
	/6c6q9buoW80qlpfSx7GLkJMdu0z4d+xVGbgl8+akvFTX94hIHYYC8BvHwKeze2CFQGTrk6UMDr
	Dx/ALkKTXEa0eWpMs/skyOaU5q2qUwzf+CDFfcbiHyfdvo+9ZhXhCwJEcWzsvGwJfW0Y6i6ambA
	jlrUQDZpXcqpz4Z379cJeYkybYCVCipwKi8dofMYdW8=
X-Google-Smtp-Source: AGHT+IFfX3ot/L43d0QBZxG633pc/hZyXtl8UpByDyVjAeqVDIhCDU73ulTwgr/AGiuYBQtmE0nzNw==
X-Received: by 2002:aa7:8895:0:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-73bd11dc695mr3255714b3a.7.1744375010978;
        Fri, 11 Apr 2025 05:36:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:57 +0200
Subject: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=trGJ+81hvgNk61JAyUi09epqF3tLwjd5H58jiE8ssKI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+LNjqc2TQncoR/fu21kLb3B4nDnpKBpYpF3u7
 K+vKNHeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURUBLEA
 CAC42jhzXF95nwzYaBzqk8pqi2wLrVXoH4PBA0deKY2gEdZoIl9sAOEFMAke8ktBZFrY8zyD3Iilcs
 oByCGpN9m/wQ5S2Ih3Us5gmmwCkWz1CcqvUeMk6aOzqC6tnV+SUW/WHutDoEzQrS+Y3hbbq8SCf628
 TxVPv8tc1AaQc1RRi29L97urd+zi8P2/ucYydlvR0VnVd5BEd9ve7obWrjiwfWA22tckQTsOCO2sAB
 z+j+DbUM3nWqNIVBRj+hlyQOkgxl2NMLlZYfY4uSdJjl42PBffIMp2plpK2m2DZwO2b9LqYtEu33Xv
 qKE/nKDGQK3kUPIQqDkgZpXsg8YdsCSkn09ne3NOpGaw4S8q306wT4gViU2OyQbq2jDy/+5X3WyH6r
 bswFi1Fwgg1sefTSK+B7S/NhI8rhjGYcRxNj7YvLRwGEu2bzNW8KwkcQWYjlF5FAo7lfeuIizrxfqA
 OLV8tKAgl8ncXWKuHgzKKtYqaJzfA2aJXrD6yK5u3U9aNlVe5qbOd3r10sFURDisAhtuCm7fURJqHx
 JC+aHpfgCVZUB/fiWVkYOXBkyeKLsx++ZOoMa2Wi8/mg1CSRWFX0MERFX6a/9stWB7mb3L0L4McAod
 KlRc9GKCciMymJ4QFkvBsy0p0HLsmyvqgdUvtv0sgoLe96aZBCXhM1PiaHFQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The start time parameters is currently hardcoded to the driver, but
it may not fit with all equivalent RTC that driver is able to support.

Remove the start_secs and set_start_time value setup because it
will be handled by the rtc_device_get_offset function using the
start-year DTS property.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b2..d47626d47602f 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
 	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
-	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
-	rtc->rtc_dev->set_start_time = true;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }

-- 
2.25.1

