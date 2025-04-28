Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF3199920
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834832; cv=none; b=ncQqHOuIsKTlN7E4IFVgNDwvB7gTJVGHSINrYhW99BucZwKd79l3E++Z4Ca9lQzEzgWXV2cv6zlQFMsVpRtdFmkIHE9t+lDOGJancxrURxvaCRTGy8E0o3W3sDgU5lnteTR/ghX1NmEqtCag6slLidbVw8wPMf+V9B1JFrzNiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834832; c=relaxed/simple;
	bh=YRE1k1adoOCNyd6S0WHYWILGjmtkWL6YcPiVGQgrvZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbYADW/NnGQVUd5SRBJXp+L3WCfqa59pVKdeZkx7P2z+kqeR5tN7IiO1E8ex3GnOa/tGP1ushlHR3Qm9kwwYcYR00QHnHz0glDSZv/yA1nTXrMiyFcj/GXplACU84FPPYqIFXAt6/XEKiGWN1dHiK3shuNO7i4o2LyArpR+jWaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iVkPT6Td; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iVkPT6Td"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3210212f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834828; x=1746439628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCKZsecEX6Ld2qZsGyGZSuc7vOgiiSySXxmlfVWnYVQ=;
        b=iVkPT6Td5PRbKwDPTVYJi9dw0Gc10SSNeoWivzjaJL29Uz49eG3aGP9pOhPnKGrlyz
         +yf1cDir7/4nAlwGZhkXjH5FwjvyWlm9HZ/jlhqB4r0WULzqz32N3DfPOe0WL1W/Ef7a
         FTWFe07Nx6VQvONLDyVyhCbNWYzTT0ees0nfezi5Hyj4n/QdDu+k3vXZyRILwQvtKdNS
         6k9eaQsr5xPfUH+UIOtxwriRlA3/IttLxo90vhVuJI2RMfahQnx8AXY0/C9xZkvvtbnH
         GWEdgKAL42WWrKFrDLmimkUKkImuKuG+3cs6l8Gki1r7GZf3aQ5uUiQErTl0dZjZcPsY
         0Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834828; x=1746439628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCKZsecEX6Ld2qZsGyGZSuc7vOgiiSySXxmlfVWnYVQ=;
        b=jMD67fjD9e9XIVE7YyM3wMuQ858H8onqxADmUIMfmzMAWhvMx532m7091USAfnnxpB
         6cIfx4a7eN9FmXbs8vTbik1iStP02ODnngCqC9FtDpMyHgVGxI4umaQ9C11WcBSKJpwA
         fI1ibIPpJs/mpsGGt0Y3fXsVWTY1D5pmw9IlUYLZWnf1Vd1EtV4pE8XCCPlfumNg8TJd
         PG1yaWD+P/XdoTzGQOzkXksBARqBXttFm43BPjBPjwxM8nE/feJ86FLE5ZmwDRPgCz90
         VvnKMIcfXmueN0vzSu1fJdv782QlCCmu1/Dej6U/JnGaB3cWdw4ji29ygvpKcYfHsTdH
         7qJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQ01xkphwnjOwLU9/oO6RERHtFUKjI1FIebKNN0vCWwz/JZOSqLvmoqFRj2IZaDZMOWFxmqoxWwHOrYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmtjHKPCwQxPZ2HPHYkTg0OJE+I/wUhQ3cz22Jf+lzDoXXEFq
	YfhaKGYq6DyJG6t6bIPxFMY932cYlvDDt5kRcFGKOlEAMyYLWXALOucyu17FvaxovL3Dmw+Z1Vc
	cADU=
X-Gm-Gg: ASbGncsFRQCwUK/OOVBAf113wIHB2RYTtrNhStnJBpjLYPNgy9BzQaF4bjFcZccqUpk
	ocr/PMG6F2TopdbSR4558ZRD3xcrIaqXE1s4yo9xCUuVc/kPCW0Bz/Ojvg2+6EajpK3dlLE6E+I
	MwoEhvNUD95aDFQt83jj4j7GCUMMbWr6pghJat8JA6IVcKGMujaPQ6WZO8kKTWIKDcUkL1G3ggi
	wWDEpiv/OoH9JsB/Rm7ZQLFCMV7Tjxt45XXbYyOjMe+koYJVZg0mj2OjTsXLmqrZV1tExXhE5S6
	TqIFU2kytVi1XDb3LmhXNKH6dNStjTZcVmldIW07nej1FUvgPzaTnZC6py9pAQez6OeIf20uqJd
	kEyil
X-Google-Smtp-Source: AGHT+IExS4NUA31fzSOzXsYxBs7XcMFI7Fz4FM0MrAeJpEq6AepdH4YfqTLeZCcONOMt1wdwq62FtA==
X-Received: by 2002:a5d:5f44:0:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-3a07aa7594amr5828489f8f.28.1745834827701;
        Mon, 28 Apr 2025 03:07:07 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 12:06:47 +0200
Subject: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YRE1k1adoOCNyd6S0WHYWILGjmtkWL6YcPiVGQgrvZE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NJnK4sd1o97pVIQoyWmnc8KDC1fQcBvfY289Cj
 q2Wr/GaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSQAKCRArRkmdfjHURQngEA
 CRuk8bNa84SlGxUONMkt8pA0Ql57oaN3Jd7x4XxbAG+Mgk78AoJsR4P7n7ehv2x0/rxAXOS2p1+ero
 El+TVKvnM69JM7FPZQqWTIx4VoY2N0SA4/CyNWIWNYny8VG/uti5Xom1grolZdipBSQkqJOhrpB7Gd
 bxpx+nEXe+NZqONwPZNxIWLzuTE707HZWe17zKxHkYJWRFKa9TxsYy9LJZNCNSR97uC9OUfjRMOJG3
 KICwvWKTBxxHQIW6OFJUADjovqPNpUj0NYiaywMPTVquBEhHYQe7mtW5TjjhbRJcv+ZzlG8lfC7z1N
 uGWmiFI6EQ4ZCPY7AGk2Uk9vObjlLrkVe4mYrn0EFlHkbBFqXlurxlxqJrVojJVfleWxAn6qSl/Lvw
 1k1odtDBgJO1r4snygC8Q+QdRfME9BVCXxNujRcc9OFLgAPwl9pTQbOVs3CwTodsnQamw+q+zkuKKe
 XL+j5v9WNzXiTRF8N484k+y9VdRMdEGsVuv5CvSvt668HfQN33Pqv1ClrRj2ginUVuHKa4pJ4L/xpB
 Cq+j60n6bbiwrFfP6i/O0AjYgYv8vR57ES0lDr1yPRSBvJ60PJdrQICuEOuzjGB2mxQXcamK/ciCOu
 n9CtSHgGf9WuxbBWE4C/e8Vo8IWlTKI/v6JipCCP8EL41qducKPHz8DMDHDA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Conversion of dates before 1970 is still relevant today because these
dates are reused on some hardwares to store dates bigger than the
maximal date that is representable in the device's native format.
This prominently and very soon affects the hardware covered by the
rtc-mt6397 driver that can only natively store dates in the interval
1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
to such a device, rtc_time64_to_tm() must do the right thing for
time=-2208988800.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/lib.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index fe361652727a3f8cb116c78b5aeea74eb90080b5..13b5b1f2046510d1a552473c441b89e23faa6793 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -46,24 +46,38 @@ EXPORT_SYMBOL(rtc_year_days);
  * rtc_time64_to_tm - converts time64_t to rtc_time.
  *
  * @time:	The number of seconds since 01-01-1970 00:00:00.
- *		(Must be positive.)
+ *		Works for values since at least 1900
  * @tm:		Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 {
-	unsigned int secs;
-	int days;
+	int days, secs;
 
 	u64 u64tmp;
 	u32 u32tmp, udays, century, day_of_century, year_of_century, year,
 		day_of_year, month, day;
 	bool is_Jan_or_Feb, is_leap_year;
 
-	/* time must be positive */
+	/*
+	 * Get days and seconds while preserving the sign to
+	 * handle negative time values (dates before 1970-01-01)
+	 */
 	days = div_s64_rem(time, 86400, &secs);
 
+	/*
+	 * We need 0 <= secs < 86400 which isn't given for negative
+	 * values of time. Fixup accordingly.
+	 */
+	if (secs < 0) {
+		days -= 1;
+		secs += 86400;
+	}
+
 	/* day of the week, 1970-01-01 was a Thursday */
 	tm->tm_wday = (days + 4) % 7;
+	/* Ensure tm_wday is always positive */
+	if (tm->tm_wday < 0)
+		tm->tm_wday += 7;
 
 	/*
 	 * The following algorithm is, basically, Proposition 6.3 of Neri
@@ -93,7 +107,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	 * thus, is slightly different from [1].
 	 */
 
-	udays		= ((u32) days) + 719468;
+	udays		= days + 719468;
 
 	u32tmp		= 4 * udays + 3;
 	century		= u32tmp / 146097;

-- 
2.25.1

