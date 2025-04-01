Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726C91EE001
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545343; cv=none; b=AnTLcO+hD2uRoP2tQsKZXIqJPP4zR9KFzim7+Jjv0mblZ8m5o8DdGVOVI7FhMUZWW0djtdIfKmBU+TkABLoPptrlb8Fae3zY/0ipQahcpbtBkGprAycFA07m3ZkGC0iMB6WX1QqutJanlUwHtlm2ccq+s5VwChA+XWgcebQUEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545343; c=relaxed/simple;
	bh=F2irayqFiA+06W7UlypZ45WYMjmFezH5XaTYt6I7igk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qEiFHJrTBKtg8ntW+JMpC2Yc6OflsyWPWx5/bzqh/P9n2viyi1FKVXVnqDMjLlv4oZbMn67q3XsH08w8xUXtde9BG8pSdq9VRFdoIA0NDRWrYYY5YFrbt8M9lYpxXABs5UMxfsuy7iJ8g5R9XTNf5pgCXzoLbky/mXZ+XTg8RM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=iEalUEa3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="iEalUEa3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22622ddcc35so46485785ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743545340; x=1744150140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IC5zcpvAJCNs+Bt0DZadLm9NNkS1wOhanMDfhuUEzNc=;
        b=iEalUEa3Ob83Ju3EJbHMHvovDvkxoJ6FzMeJZ2Iq39Rsed3bNtBTsIZECL5jIKZPco
         NwWblWzybXxwc6ENBQerBYHvbgYLGTpVhLSMsimQF6qt5m5+D8Ggktq+1KcO4WqxhytM
         SV9zW0dRHo1dqZDl7V541hPu0OeLOOKFaqFfcmsNs8XZLIhxdXbW2RVx1sbCj60YF552
         k78mCdxN+5RzBpL3ew3yLBUF7MLWEDFte9Ob4h/3uhsBq7WlxN+E4J3Pe/LIQUL6R0mr
         BbphDpE4AmprLTwsGULNCB0iajEE7UDUtc+t4rmFdAaAzwpo7gKDpkz7ZZyUQd4xDvRW
         7i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545340; x=1744150140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IC5zcpvAJCNs+Bt0DZadLm9NNkS1wOhanMDfhuUEzNc=;
        b=W96320wC3U7mVss12SCVpFSV/XzXDT6qVPZu/RqzMsYn9A2SToI/SFKvIcnRpaZnqb
         HpW3E+rqb7OjcXAiREuzVPCbDzwNcFrCe/vuQaih3pXa2by15fAnW0lvHi3R76SMJaxo
         YSI6Ygo1es2R4fPRFLRn/2qMk3vQJ4udCfBjOD6bAqS96LNyPi1R/CQwMb+VDlNPVo1V
         h0Qn2gPiANOZr3+4dfphmBtpU1Flwj3YRTbhbQt6VRVSXttxKV3/CqCcnu4307ILbT3v
         fMLKsfHi2p91Dh2EJvKBaVg/GQ9qK9c7lVR4GsGTyEZxsrNMGiYxKtYLiiZ/TtjTgskM
         ZTEA==
X-Forwarded-Encrypted: i=1; AJvYcCUnFWGfhfQWTfj0gXX7oKqJ5uQnm94rLrN36d4pQcnNFLMJDVRWoU7Wy9pKpnZu24alUr2dZkbItMjvo5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCdglpIgpbWcwZEvSOQKvGQtMRX0ksbHceLBGhvCIZGoPgklD
	sEPfNULsLLPeG88tKeGfJhzH8mqKWlsDHjGMNglhRuPw56hxgHfCeM3Sy17Ot7w=
X-Gm-Gg: ASbGnctqtF1ex76+WdJ2AqNIalQPnzxIj9DGHAmBVldXH+bRoR857spOSdOG2yPVJrr
	ZdLCa707ycwNmTDM56TgQ3zUZxw/tfC311nNIleaEQjYd6J7xm8e0zvPfmMjf52ElxLo2ByNoY6
	CeE6BElJ1HUZF9YHv1NsnauskEH83DvFf795KDdJW0v9fh8k4HzhxYVeQNxfIloflaCCwzqGRZA
	WRjZK00oFXL+h+IYrs2+dPoLxnrh+TPWEAGfXrvxulX5ELdlQHX4382vuZPMz5qpq09H0LMAN1s
	kyP32V97t5Gcdc28nhnGNeCsHBbFlG8YOO+R5p6Wpb01k6VNjP3CwRPL083VMQmJOS2SDMY61Ez
	R3/dc3QGrzEGtL8ivszIWj+JDj/U2tUw=
X-Google-Smtp-Source: AGHT+IEsKGFq8XosoR42ePJJZp885KNvK/OZl4LnVRUa6xNPORGUuQA4QQaQDHkKMxhvZjroNhQaFQ==
X-Received: by 2002:a17:902:ce8e:b0:224:1074:63a0 with SMTP id d9443c01a7336-2296c85f3c5mr1434595ad.34.1743545340470;
        Tue, 01 Apr 2025 15:09:00 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cfec1sm94080475ad.118.2025.04.01.15.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:09:00 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] hwmon: max34451: Workaround for lost page
Date: Tue,  1 Apr 2025 15:08:50 -0700
Message-ID: <20250401220850.3189582-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When requesting new pages from the max34451 we sometimes see that the
firmware doesn't update the page on the max34451 side fast enough. This
results in the kernel receiving data for a different page than what it
expects.

To remedy this, the manufacturer recommends we wait 50-100us until
the firmware should be ready with the new page.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/hwmon/pmbus/max34440.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff..ac3a26f7cff3 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/delay.h>
 #include "pmbus.h"
 
 enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
@@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 		if (rv < 0)
 			return rv;
 
+		/* Firmware is sometimes not ready if we try and read the
+		 * data from the page immediately after setting. Maxim
+		 * recommends 50-100us delay.
+		 */
+		fsleep(50);
+
 		rv = i2c_smbus_read_word_data(client,
 					      MAX34451_MFR_CHANNEL_CONFIG);
 		if (rv < 0)
-- 
2.49.0.472.ge94155a9ec-goog

