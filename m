Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26F2376E1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591087; cv=none; b=rXSn8/8w3WscjN6SjylX1yu81hRqpd86CbR4Ry8uWn/wqrWjWmn/AjeqaEefOolfsaNBiwNF8kEf2NzvrWJ8uBBauhwxpQgJszAxlaqF8inMkxhrGS/hqevDAv3zGFjbByv4L6DOIF8zKKNeTwSUHdDveXYPdf16etmcLG9F600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591087; c=relaxed/simple;
	bh=UlOHaAsiVzggi6F3jr2SNdC4VdtkMhUHdURJ6+cg8Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSPU9I2ige87ek+n9DfJBaBHQJlHD8QidwNjZ8555a0yuIpz1zQ27azl2eShHt4VPTbIRh+Helm+6VuY07xnykIArYtURUd/ANVFFs7waXcXvGchLpFI+ktH3VkbDvOkz1IOOm0EVYdJICdc7FrvFwbjolJt06ZR7LZNYsxWw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p0IDCcNw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p0IDCcNw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso62705305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591083; x=1744195883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=;
        b=p0IDCcNwtOxC9LcVVs7OPu/1mUGdYZ7WkXERa/QV6ThExhVI2VFDXJAHqYQUM23j33
         Ty+36KO3GKZ6FZzrimSkozsKIzuG5iqPCv5iTAFM6wISYfSWLXHl3P8gQLKThX+Chi4s
         MCNaOC5i4EieHHuRNml8cvWZl1Hw4L0ZLUNwbD1/uGSWPYAeKo7wOGi2VjBlG7IlVdAo
         edwXpCESN+nW46rddXOX+y4m4rxdFnkXaDrYo50qfbUlWdPlNVsTA9EQvibkjOpXIarZ
         oyFEvDHrP+L4ZuR/dyJOg07vSYfqE/vv95/Xr0y+Eir1YufLXVfOV1lon9wpB29fLjwj
         8F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591083; x=1744195883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFtC+GCOO+I5SDhaRJmaaQ+R6willulIqE4aUY8W/W8=;
        b=ff6r2udlV+K+yEjAfPOQ22+3HKp/JXD7RnRv6tmlyvF4bK1hdc0+XR3ufVJZYeN2kn
         HuIL88kFCVmzCKiS13nkLuXoXB736xlYndcC6ryre765T0p/24pbmn6nto9OjnmLCG17
         673VqucZ/He/lYvIOSZD1B75YcG5Tv/TME9l+Elhf3l6rmnQFZs0KhlQ0qqTN+4XVz8z
         o5JlEXSv2RZqRd9Az8UwCpbo7WQH0OujVpBGXIobfmDcSYVQ2p3RflY+LF7K5QZFp1QS
         Q5HxU7kAOcHdQeBz7Y8xY6bdfBGNSS/omHlOF3kkpFnDXp3FIntMkNM16aSdSAWJ9nNg
         WCVA==
X-Forwarded-Encrypted: i=1; AJvYcCXMxJMEgE4wEUCUl+qwyXlebWYn0bo0LWDLFUKN27eWFeEP7ecNAn9Gdi3DY+6tJja/qzEppe+XW/7iubQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5lJ/NHAzyjYqIT/J9mEigq2E5J5SlPFf0+Y6GAbSuLJLPeFsf
	+j6eHdaHuDjSD9ciyEkr+Lau5HdyL7PEInuCeiIKPu0yGY99eTcLA6whp+GYrSQ=
X-Gm-Gg: ASbGnctQFWll4YdVHAsl3S2Vz9hAzv7EZZC5tryL1PT0Ot91qAXeFfsji7LGBpXqOgO
	9/zpZsnO+wPVzwH+0VJmbS9YEE2H3nENbQ8vVSX0IKJ+Gq+BR7P4UzzLVSDfWqCukHQ0bCmq3V4
	6iWrDPW4qWDs5/lV+kPvcSYLmNBvK8gRoE1VI3+naQ7dvT5XuqsdLi2AaF/R0WMoRPHWcbcPLO6
	S9Ice4iwq2R/kLypm5jhe8COof0bwCIL1mPnyZCe68DSD1jybJgd/5t7SEqP0QaDiV6/m8nrBWe
	i3POoGJC2dapW3CDZKB4PAUfX82UUsWb4X0fZrwawZtZU/sM
X-Google-Smtp-Source: AGHT+IHOeyatznfz5QQNNvi0Wvd10HZ133vP0ZyLTaBfjufR3sET+MdtTaPLpYSIiYEYd4aCYgoPOw==
X-Received: by 2002:a05:6000:2913:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-39c1211fed8mr12507155f8f.55.1743591082782;
        Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Apr 2025 12:51:00 +0200
Subject: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UlOHaAsiVzggi6F3jr2SNdC4VdtkMhUHdURJ6+cg8Ac=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7Rak9MG2ZQ9wzFG+COaaFPM1OY7zFQL8XoFY8klb
 RxD+gCmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHURdTBD/
 9kUNtbI+e7So11TmUK3hsKh9djqbup6vkAx8Pq68W4fj/BeAMNMd7T9IP5jFDOwwx4PykLAxN6JV6k
 WDxPv/TQp27p8s4T3Bt+Ofre6hh+YAC1yYvJeNx+8cY5xGEQlSj7eIU5yOYz//M83I6OKVJXNPM+He
 AC/z0hj9Gx6AT3DGH3xCNHZKLPY97mqcg7cOxK24/ZszybgGmHBxG7HID+XO+QonhUBRRt9OeSmz31
 CZuMipCh20FBQcLYz3n+JFMEQMbaCOkWXSaiBtziSjBXM9CV7l2KKSkkGL26T8RE77rMh+bf+VCcI8
 SVoEB8xItBDQK1HJmd8DwjjK+UqV9EK0VLm1uwtDOH+IWZmzYXKcXexfPLHc9oHcjLxebstsfM7etp
 qS9Byx0psLWQbS2cgGDhD3EaTF074h5uHg4CyTA24CYE7E5AfxeaPB1eLgyeVsXTZf+DuJPEzowVw9
 cZj4Y0zmqEPte46Vbq+2ELMEDZYpDL4yNSVHVYJjoMB9nPvdCPfKIUFxTiDQmR0tl8z6NyZq3Ozz4d
 m8EV1ehPtjgAPlX4gwTN0RolroIOhAFs9mfYsYxzPO3kYn4kMZTSX6HwJIlQXrsz/0Rjm5zppB0a1q
 +701CD3lM+r7hRswQPjXMMpuzB7mmerc7tQgEGAiydtikIs0A46CFJ9mgv5g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
despite reading correctly through sysfs. There is high chance for other
platform to be impacted by the year offset handling issue.

The hardware RTC registers store years relative to 1968, but the driver
wasn't consistently applying the offset when converting between
hardware and Linux time representation.

This inconsistency caused alarm rollover failures during device
registration, with the error "alarm rollover not handled -22" in the
logs, causing hwclock commands to fail.

The ioctl interface used by the hwclock command requires proper time
range validation that wasn't happening with the inconsistent year
offsets.

Fixes the issue by applying the year offset in all operations:
   - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
   - Subtracting the same offset when writing to hardware
   - Using the same logic for both regular time and alarm operations

With these changes, the hwclock command works correctly and time
values are consistently handled across all interfaces.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b2..ba52e225dc8fa 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_mday = data[RTC_OFFSET_DOM];
 	tm->tm_wday = data[RTC_OFFSET_DOW];
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
-	tm->tm_year = data[RTC_OFFSET_YEAR];
+	/* The RTC registers store years since 1968 (hardware's base year) */
+	tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);
 
 	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
 exit:
@@ -119,7 +120,8 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	data[RTC_OFFSET_DOM] = tm->tm_mday;
 	data[RTC_OFFSET_DOW] = tm->tm_wday;
 	data[RTC_OFFSET_MTH] = tm->tm_mon;
-	data[RTC_OFFSET_YEAR] = tm->tm_year;
+	/* Convert from tm_year (years since 1900) to RTC register format (years since 1968) */
+	data[RTC_OFFSET_YEAR] = tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR);
 
 	mutex_lock(&rtc->lock);
 	ret = regmap_bulk_write(rtc->regmap, rtc->addr_base + RTC_TC_SEC,
@@ -165,8 +167,8 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
 	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
-	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
-
+	/* Apply the same offset conversion for alarm read */
+	tm->tm_year = (data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK) + (RTC_MIN_YEAR - RTC_BASE_YEAR);
 	tm->tm_mon--;
 
 	return 0;
@@ -200,8 +202,9 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 				(tm->tm_mday & RTC_AL_DOM_MASK));
 	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
 				(tm->tm_mon & RTC_AL_MTH_MASK));
+	/* Convert alarm year using the same offset as in read/write time */
 	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
-				(tm->tm_year & RTC_AL_YEA_MASK));
+				((tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR)) & RTC_AL_YEA_MASK));
 
 	if (alm->enabled) {
 		ret = regmap_bulk_write(rtc->regmap,

-- 
2.25.1

