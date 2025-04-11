Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE429CB4F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374998; cv=none; b=RZ5gu5J1S5kO7rlHFNfI7pQfw/Fug98aUCRWdUKc9AXxzMrc4M1X2GhRSCr7MRPPT9in7oIMWkKBlITpXedgYtTEVCELTzofZflyfJmGWoG3aMBWliPaqH8w3HCDJbZhSXzZou+MnzMnL1P2Ks7svHLl3v9APRVTAsbVUjd3Lmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374998; c=relaxed/simple;
	bh=tyu764S29y/vhFyNtYKo1iTVWCgv8kwvcYIcevIAdQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmzRkTCa/IUh69hst+aJ8C4FaqHWI8qxzWhEtW1dr+0YmmERRMWNWS/xZ3nTuD7peZ8ekK7twPG8MStwuOa/BNFn7hYe0lDd84YqnnJ1o5z5xWezGK8f5GixpHULTOseLlYfsNw5wHCZVCu0k1qfmuH7JFVHA0eA6hOdBmmbxsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y+aW4Q15; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y+aW4Q15"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-730517040a9so2324107b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374996; x=1744979796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IG4g6G6O5d0C+h1ORyM98qH6q+iKpuRjuLFaymrvAM=;
        b=y+aW4Q15vv7HJ9CpRUQFJ3D54yk1u8Ts95MSlXdCdXqEquJ0ZsoCdnWj+45Ju+a8U+
         EHRKCHSi3c2I2bPBfkrJvbiZ98GYnk3escFA6+bZ2STX228J/mVroRimL4DJr43pDdhe
         Mc707kOrIwS3Xd+L+ZlLIC7lljKnwqHMz08UDuvkavGCuJ58PWnzxhZA9dhkZZ8XF1Th
         tzCuteLEMrz1coYglWdOzLo0IdwqvZo7kxjZU7c8XId8qOsEvPW8Zo40T/7VcGbUvoiO
         vPH28CFPgIL8WvVXqVpEs0j/SbjmuzbCs3AbLpXDcsrzLwxEQ+NZh1mRUYwk5otWpbHs
         ApsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374996; x=1744979796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IG4g6G6O5d0C+h1ORyM98qH6q+iKpuRjuLFaymrvAM=;
        b=R9vs5RkjjT6xZKIgtsaeYDn/AH/a/j6CnAfPJyrIGzpO1X/Y4ZBlMu0igqwtVGouf7
         5jeXzJtvDa18O2T0TcM0T5yKsEg2bnB6ISb3gBeuKBZXbclKicuCBk8XJEU3a0h6tgW+
         0x3SRXCxfTRamChb17ZPl67AYjstgO+u2HZW30rVas2LBiaCsDyWLtzMTCcRRCwNRUHC
         DVgGGzRN9TlcEFe0v1oPJu1gypFI3WUJzjw0D/CkS2VoBZI0gXnUM9KI61pNYtUvJLG/
         UzZ3Xo6jte481g9zFcSwlSUd9N5e8hnHd7Ibc7kEkyBev36mQ1aEpZwfQcqkYp4GqTBh
         Z38w==
X-Forwarded-Encrypted: i=1; AJvYcCUHhgYcUi2x0N0hASu8SIgm9Qv4Er93OMSSfXeDTStNytE3QcgUrtp4b2vkv1yslddxJzZPnTzoQcw4f2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8SIk7tZ15VVDTXQ0mkhlVDFG+KZ6EEg5/R2HLQKld+DSKOw6
	W3ZQbMkQfb7ZDW3lx40IVE7jmNU3QHU6/FGJwSqPi57+YjLrusxinpJPkeaXdioW5HvoUHo+v4P
	KT4E=
X-Gm-Gg: ASbGncttzRyvndi3dllqe/m9z0wPRRuyqzRxGJPGiSuDydBGE71mJJOMJyykm5AmoPg
	2lbvNUG1BNUdqaIRDlV7JBiYEghC+dSaQBziDX1mqPECsip1K5wgwbT47p9JeEhp3FQcVzVIoOZ
	/0pg/exL6sGMCc5J+saP+11cpApyfQ5iGdMJD5xJNpEuZvN2Cc6JLWcJ5EvSFuNiQ2YOfob/2Ih
	NLSR5iu/aUSb/WikR/bI8PaYsU46MZfmaREXBXNSG4sG8E7grHhga/kghX26ucf3y4sy5EyhTl/
	6qiiJPKuKUZOD4W14hIz/DSBrcH6pMSD6m5YJWbuNBo=
X-Google-Smtp-Source: AGHT+IFsg0ZCckIXxc+IHljq9KDD7/UlDwl63B9XFgkbLhB3RqdDeYk2J9Ou9a3sdf+9kaQpQwYZGg==
X-Received: by 2002:a05:6a20:6f06:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-2017996f524mr5486935637.34.1744374995986;
        Fri, 11 Apr 2025 05:36:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:55 +0200
Subject: [PATCH v3 2/5] rtc: Add handling of pre-1970 dates in time
 conversion functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-2-f003e8144419@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tyu764S29y/vhFyNtYKo1iTVWCgv8kwvcYIcevIAdQU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+3CiQcNMagXuWDXp22y2fLo6SR/giORhsb2jL
 j0l2Rq+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURTB5D/
 oD+VRGtB9vanDklEZ0FOkM4AmBfEcomkMxEDgrwUagbw2dNBqsBDibhbpl+Sfv8LRErcT0R2SZFxrp
 RtKYr6GJex551wXHt1dKOuzkiwjjkQGGjkiMz+TiZl8EIkrta/RocTjEfge7N4L6OoD5NaFKz55+jX
 DvEoKYEFAoRThw2/D2suWlaWpSHLdghBIsl/klG9QtRORclyp3HujfG0tvxr6jVmK/QGyQoCwf+LqW
 pdAFz9vCGnFBX2sPbt3LKO3Gz8EctYNidjvItdLLiGh35/l+eicEv+l5H/9C/Cxp16Uhbuv4M6M72k
 V+SnyE6EBtp/M17/nXlLAFGA2FhGXsyTJI1JKiICr9trYFGVONewVdRMfBAAx/LNpVs8Iyhyq6AlUE
 fptqtoE5GZ5yngSLsMZxYzyPKrfq0Jn1O71MWTQ/oxB/B0YrrAxAaMyzgT0qni9cNCFO6PBHxhyxJ9
 3PH3bSZZUTYQLp2hq1tAFWNPWVtTRmareCUcNJ5ICuMxF0cyNOeiR0klJxiUOvVNiob/78WIIkHE77
 PDAMkXx5z0Dscs7Vq0qwJflmgG9ccXA8U7czRYuErgYMYtVQYDhMJ6a53gbeMumYFwlK1Z1KGHV+pP
 KLlRSR1FEgbNLnKO2j53929m8ZuE3EPJHDvWf+VXU1F/cbUYSk27vJnWk4xA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Linux RTC subsystem's time conversion functions couldn't properly handle
dates before January 1, 1970 (negative time64_t values). This affected
offset calculations, causing incorrect time translations for RTCs with
pre-1970 base years like those using a 1900 epoch.

The original rtc_time64_to_tm() function produced incorrect dates for
pre-1970 inputs and rtc_valid_tm() rejected all years before 1970 as
invalid, even if they were within the hardware's capabilities. For
example, converting January 1, 1942 2:36:47 is equal to -883603393.
converting it back resulted in wildly incorrect values
=> January 2, 1942 1193025:5:3.

These issues made it impossible to correctly use RTCs with pre-1970 base
years, particularly affecting embedded systems using hardware like the
MT6357 RTC.

Modify rtc_time64_to_tm to implement special handling for negative
time values, properly calculating days and seconds for dates before
1970. It also removes the tm_year < 70 restriction in rtc_valid_tm to
allow pre-1970 dates to be validated correctly, ensuring accurate
conversion between hardware and system time across the full range of
RTC hardware capabilities.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/lib.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/lib.c b/drivers/rtc/lib.c
index fe361652727a3..2014a86499e02 100644
--- a/drivers/rtc/lib.c
+++ b/drivers/rtc/lib.c
@@ -46,7 +46,6 @@ EXPORT_SYMBOL(rtc_year_days);
  * rtc_time64_to_tm - converts time64_t to rtc_time.
  *
  * @time:	The number of seconds since 01-01-1970 00:00:00.
- *		(Must be positive.)
  * @tm:		Pointer to the struct rtc_time.
  */
 void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
@@ -59,11 +58,39 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 		day_of_year, month, day;
 	bool is_Jan_or_Feb, is_leap_year;
 
-	/* time must be positive */
-	days = div_s64_rem(time, 86400, &secs);
+	bool is_negative = false;
+
+	/* Handle negative time values (dates before 1970-01-01) */
+	if (time < 0) {
+		/* Store that we had a negative value */
+		is_negative = true;
+
+		/* Convert to positive value for the algorithm, but
+		 * we'll subtract one more day to handle the boundary correctly
+		 */
+		time = -time;
+
+		/* Get days and seconds */
+		days = div_s64_rem(time, 86400, &secs);
+
+		/* If we have seconds, we need to adjust to the previous day */
+		if (secs > 0) {
+			days += 1;
+			secs = 86400 - secs;
+		}
+
+		/* Make days negative again */
+		days = -days;
+	} else {
+		/* Positive time value - normal case */
+		days = div_s64_rem(time, 86400, &secs);
+	}
 
 	/* day of the week, 1970-01-01 was a Thursday */
 	tm->tm_wday = (days + 4) % 7;
+	/* Ensure tm_wday is always positive */
+	if (tm->tm_wday < 0)
+		tm->tm_wday += 7;
 
 	/*
 	 * The following algorithm is, basically, Proposition 6.3 of Neri
@@ -93,7 +120,7 @@ void rtc_time64_to_tm(time64_t time, struct rtc_time *tm)
 	 * thus, is slightly different from [1].
 	 */
 
-	udays		= ((u32) days) + 719468;
+	udays		= days + 719468;
 
 	u32tmp		= 4 * udays + 3;
 	century		= u32tmp / 146097;
@@ -146,8 +173,7 @@ EXPORT_SYMBOL(rtc_time64_to_tm);
  */
 int rtc_valid_tm(struct rtc_time *tm)
 {
-	if (tm->tm_year < 70 ||
-	    tm->tm_year > (INT_MAX - 1900) ||
+	if (tm->tm_year > (INT_MAX - 1900) ||
 	    ((unsigned int)tm->tm_mon) >= 12 ||
 	    tm->tm_mday < 1 ||
 	    tm->tm_mday > rtc_month_days(tm->tm_mon,

-- 
2.25.1

