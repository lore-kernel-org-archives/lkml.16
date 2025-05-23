Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976524DCE5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959271; cv=none; b=j21mtVXtz/v+CeaKpxKLkTaWTV1DVzVcsab4JSAd+Smlle1tMGF2yBHlsEDxYK8f+pgkj2/p9gKuVy+tLWsDoZ/CONSSc1+cVcMrRhqiInF531pgRp/3kqrGK1Ba97Tv/cIYBGJptUxAJ8OV6GYoKJ0s+HUptGlDjdvza1KmLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959271; c=relaxed/simple;
	bh=6Qm2a1LFIlcob/E0A02V7U1TH9ld9jMpjM/sc3GNeSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTUyf7C+pZTNEzRDnYZlvQfxs885SuZwJHgfwsHdE4r2LXJb4gsjnFpnbEdE1H0Xgn624y7MJDe2aEbsB9TxAjc583takWVIHBkTTA84XCiwXsZvRA8Nfr0HIOij4Y+07LJ2U28ISMSPmNQHnMmEpIz6hLx/YlOyn8r7g4nWThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=aWTIxinf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="aWTIxinf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231bf5851b7so67368945ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1747959269; x=1748564069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp0QRA01GhKZcH3WzS0osTNI00rf/GlEFqf7jT8l7Mc=;
        b=aWTIxinfnJifyOmutpGaWfEDh5V6AF5kYxqBQ810VmoFcDqTicCN2X+kc3QVSEtAGp
         IetlFKPkNV2MY76tJp25i91NrtyztZ/LH7XNfbhBeAp8GB4vTgGPzTLPOvA8sQ1X3qQ7
         G1WtyTtNKApDIpNCEOQIGVUZPuDwMNJzCcWo+e0lwOHx3q5ahbtKGjVFujTKxq5c7e47
         IHj32AAtMFCiz1/MtIrdjs2mRTA+XUbwxAi+qk+fGLdiDt854uOBRJVi/rjs7VNZNTWT
         1oADBeF/Rp0CQap6lLzZpvqqGEm+6yPC5Lr2WSNMnnVtE7Ql/aUAVKXiBWGK4wqXVV54
         5nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959269; x=1748564069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tp0QRA01GhKZcH3WzS0osTNI00rf/GlEFqf7jT8l7Mc=;
        b=vEw3IdUt0TgJBiGeKOekO7D8VLRYvdhrE75C4EE1iyDy05YhQR4blzu6dD8G1nVlGf
         vO0RSDO7YaUMmQksJ+m4hQHGca9r8IfWR+c71C1hx/yKayU4xxPNGLjLHEUyqveuZlQM
         hLsu7QjkoZy1Ky/XMP4ssUBmiXNi0rWxqBL345FGoRgbT2EZx14CUb1PryrjDqn6RTYj
         cBXEH6xQ6T2CcNVGm4ZeWJWPrDcu7yGah2m7ZY7TGLB5rjWlfk5EQZhJeIerrgU7RNTu
         DHjor7Id9SuT0zP8ZsaoHAz9HZPF6LoHdSA7QTViiyfRpR4I2xoDzGFuzDDB7v5yp24o
         sVzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYk5ZxHu8YSGf7wPmaCR3JyaC3wzk3DW3a8oPiGJqOVCd4TiG/kG6K3QiqQEPilgbzC6I2E7L+v4BkeL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9e/FjXA+jsPtcBpIxwmkLccaEDGq8vvNQJP1FyWqgufHfalu9
	naf1sarKb8N3qxivlQtV7121FovK1S2Lkhw5v37GbxY4oI/pChfXJHbQdbelR3Ba7Tg=
X-Gm-Gg: ASbGnct2rWBLPBKg3BVJ/O1ENCLFy8Z6D4M5YNIJ+6ZwYk1cn+pbwuvm6s3HHar57LN
	lGEw9v3eLRfcG6g/u79Gk0DjgqKJaztafzYZsPeiUECKwS89+UWpjFTnuabVCJh9VYOc8DH55V6
	5eGDJjW67vZHkqt0BfUw0gmI9NmKP/gYeLZyobtU4U9K7n+Ded7hSF7vLtnbE5qIxUPxgSDx62P
	6L1TO6CztWvAD1L2odnTs18yYq0pSuWElzifHaBKAMPF1l2K4vuHgJQ/ZclLSygZrdUDmojn5q+
	iyuIVje+d2VWFzM7w/qD0EevaoLGBk+wz9g3I/BoaY3xcYN4e82TIFe+lrnseVMNtzvVrhsxmig
	2N3NeEMAJmY8C7jyytmA+lzfqlc7wxFfjuGX4u10=
X-Google-Smtp-Source: AGHT+IGyriXvVaDtGmLTkO0pmYK5X9MSri1TecWPB1OUf3Ug8GWD5/2TBrkBh+ZgQX8XZ506G6IsWQ==
X-Received: by 2002:a17:903:3bd0:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-233f262a7d2mr12221715ad.52.1747959268808;
        Thu, 22 May 2025 17:14:28 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:10b9:7db5:9893:e976])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebae71sm113650795ad.190.2025.05.22.17.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:14:28 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH RFC] mtd: spi-nor: Sleep between ready checks
Date: Thu, 22 May 2025 17:14:11 -0700
Message-ID: <20250523001412.878560-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have SPI NOR devices that respond very slowly (200ms+) to some
commands. This causes our CPU to stall while repeatedly polling the NOR
with no cooldown in between attempts. In order to reduce overhead, this
patch introduces an exponential backoff in SPI readiness polling, that
self tunes the polling interval to match the speed of most transactions.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/mtd/spi-nor/core.c  | 56 +++++++++++++++++++++++++++----------
 include/linux/mtd/spi-nor.h |  2 ++
 2 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..75d3a4a1c1e3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -714,27 +714,47 @@ static int spi_nor_ready(struct spi_nor *nor)
 static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 						unsigned long timeout_jiffies)
 {
-	unsigned long deadline;
-	int timeout = 0, ret;
-
-	deadline = jiffies + timeout_jiffies;
-
-	while (!timeout) {
-		if (time_after_eq(jiffies, deadline))
-			timeout = 1;
+	unsigned long deadline = jiffies + timeout_jiffies;
+	unsigned long sleep = nor->ready_sleep;
+	int ret, sleeps = 0;
 
+	while (true) {
 		ret = spi_nor_ready(nor);
 		if (ret < 0)
 			return ret;
-		if (ret)
+		if (ret) {
+			/*
+			 * We want to decrease the polling interval in cases
+			 * where multiple requests finish in a single iteration
+			 * or less. We don't want to do it for single outliers,
+			 * but we give more weight to short transactions.
+			 */
+			if (sleeps < 2)
+				nor->ready_sleep_down += 2;
+			else if (nor->ready_sleep_down > 0)
+				nor->ready_sleep_down--;
+
+			if (nor->ready_sleep_down >= 5) {
+				nor->ready_sleep >>= 1;
+				nor->ready_sleep_down = 0;
+			}
 			return 0;
+		}
+		if (time_after_eq(jiffies, deadline)) {
+			dev_dbg(nor->dev, "flash operation timed out\n");
+			return -ETIMEDOUT;
+		}
 
-		cond_resched();
-	}
-
-	dev_dbg(nor->dev, "flash operation timed out\n");
+		fsleep(sleep);
+		sleeps++;
 
-	return -ETIMEDOUT;
+		/*
+		 * Exponentially backoff the sleep, but hard limit at
+		 * 1ms to avoid responsiveness issues.
+		 */
+		if (sleep < 1000)
+			sleep += (sleep >> 1) + 1;
+	}
 }
 
 /**
@@ -3449,6 +3469,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	nor->info = info;
 
+	/*
+	 * Pick an initial sleep value that will get downtuned.
+	 * We want this value to be higher than needed for most flashes
+	 * as it will clamp down to the fastest transactions.
+	 */
+	nor->ready_sleep = 127;
+	nor->ready_sleep_down = 0;
+
 	mutex_init(&nor->lock);
 
 	/* Init flash parameters based on flash_info struct and SFDP */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..27bb4243db64 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -406,6 +406,8 @@ struct spi_nor {
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	u32			flags;
+	unsigned long		ready_sleep;
+	unsigned int		ready_sleep_down;
 	enum spi_nor_cmd_ext	cmd_ext_type;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;
-- 
2.49.0.1151.ga128411c76-goog

