Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38749248881
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074616; cv=none; b=rk9D1n+WhaaAejFYqcZk518pGvh7bD5+8cz2iUGy+gRgqqBYFy9YZkuP3KuntwoZKUxUb4nWyvB4uDU11FGfnNzsp7E6pzMhstajznkB31aqgvlvMTdG5GhvqItVKzO+Co6q9ius7OSdv/FWkJJ7zJkDclBZasBqt6UwqYalxQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074616; c=relaxed/simple;
	bh=1dvKWkQFNySml/BHzbZrJRX8AmqHIEGZs05c50PV2XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMtLP5GCP5bmyft/8lefcavVdbsMXblqXfy/nu3S5McukHUn2666NSOA/5Dii1ZFBpbTCoamVbtgRIFbF0Am/FMi4Y8/5GAbH4xL+4W0j7KK1PHQmdv3tLMS7J9/tFG7Ag+APxOtxoDx6f2npaARz+NcQGub9xTpIgaLUXSos/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=S/iqlrcz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="S/iqlrcz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22403cbb47fso53340765ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 18:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744074613; x=1744679413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z87UPzf+MqrJNhVkbVd+0Pk25DzXX9MXWXUg8MGhgOM=;
        b=S/iqlrczzFZOJIYckxgyddYkUBsITzhv+Aw137R6vziZXraAZ+jW/UpvXno2zoTCuN
         QKYrn/7wI4uba96w7hLaxu5Pnwh6FxboF2XalVbHyjfkLi0ke6IwYxfpK85pqAHutZdf
         X5v9txrAGnHGYw+MqN1+YQ6+O7rrIl6aAPPT66aZD3e23pV2Ray9r1aPDs5KT9KhirY6
         Wl9jliIhVLQaZphYsKirx3LQsph1BB5N0i+UCuxNF52M6Oraac3Lg+UqBzkjGXw7p8dd
         hx4w3DsvJJG6ocSgJVPkyjN7QSXjb0u0KfrU7+vgaWDvnFzrb4zHsYgMZrYYsy5YneKN
         rxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744074613; x=1744679413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z87UPzf+MqrJNhVkbVd+0Pk25DzXX9MXWXUg8MGhgOM=;
        b=FTpYN1GAwBDd0FbJ0x/kkzoq4RwICkKobcAc77CaydXaKjMpvBdXVzB1voUWZpDTAM
         JjQVUZP3RLshCMZShBgk7YaPbV+W9o1KbPGp/y8k7/NoaP1P0wFSY7F2+6Rr1vp3IzQx
         nmXnIw/IqR6O1id66PWK35cEereoNhuMvpz9ycdXJVK2G2Lsb2QsLHdrf9VXbxF5HjS7
         am4b5+TvNuB46vdiPWN/dBww6x+8RmZisJwraeYpzhYg3K9HSFcmUoP7uAtSVp7aY1dN
         r4H3FFu+ziI4HDDEUmtbV0Oyae+F8ejQVOle1Nc17BuppRm4PKR6xxGQGc2+3SB8LVDd
         /UXg==
X-Forwarded-Encrypted: i=1; AJvYcCUORoDYCCnSU78biFgktKV7vUXBJ/RemBO9nEr82GCywsA01cMHy+iMK0SefypaFNqLY+ZwM6mYL2Km708=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKFPcs33JbNg4zM55YVnxR3xfss0U63zyotQJn1U0R2y0dd0IV
	L7LR/ardxtdfHMZUgg/vQVV5gjzZBaGfBLMMqc3Toq5j51NMeaygmkd2VbWO2/52G1msdp/W71r
	D
X-Gm-Gg: ASbGnctETFbPCksz6zVWDhAQD9G3Ec10GoM5fAx+q+/ns1uHIlTNsgom8zKiPjwZRvL
	genQeDqfyFMW+/ke5UVg0FamftlUrDFTOaiLRUzkMhaBjCNF93/5H+m8he1PuuesRRWd2ifXb8p
	/xXVvKba95f3Pv909WJ8QxOp1Q5t51NUZI9E3J12GdsVBWhLVbZ9yBj7cfnHt8kEdo+aASvHhF3
	QqIQYVA3xzFjP9qCrX+BFqmJEy4Ri5VFVfqw18JgqD9ZJSsLsIKIHNZ1b4pAjm4lmkmeH538MHC
	4R7xEJIEKMYrZcROcBRFGXyKA0lR8KpPxgbUx6CLO++UGd1m9s7/b154SejHL+WXsPKD8hoSekd
	FqSz1JtiUfVcaSpGfAMMMWqEXhoqzl8XcnwDdGbslwzk=
X-Google-Smtp-Source: AGHT+IELwZdrzCrMgf6MPDTbVAGSrXtw+CM5rng2WwTZHjmvYgfIyEWBDFW2oDHLWFLqwBVWv23EKg==
X-Received: by 2002:a17:902:ce8f:b0:224:162:a3e0 with SMTP id d9443c01a7336-22a8a8ded01mr196113395ad.49.1744074613270;
        Mon, 07 Apr 2025 18:10:13 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:b25a:2d1b:1734:78be])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2f66sm9193728b3a.125.2025.04.07.18.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:10:12 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] hwmon: max34451: Work around lost page
Date: Mon,  7 Apr 2025 18:10:06 -0700
Message-ID: <20250408011006.1314622-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250401220850.3189582-1-william@wkennington.com>
References: <20250401220850.3189582-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When requesting new pages from the max34451 we sometimes see that the
firmware responds with stale or bad data to reads that happen
immediately after a page change. This is due to a lack of clock
stretching after page changing on the device side when it needs more
time to complete the operation.

To remedy this, the manufacturer recommends we wait 50us until
the firmware should be ready with the new page.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Make all page changes delay the required 50us

 drivers/hwmon/pmbus/max34440.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff..0d9cb39a9cc6 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -12,10 +12,19 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/delay.h>
 #include "pmbus.h"
 
 enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
 
+/*
+ * Firmware is sometimes not ready if we try and read the
+ * data from the page immediately after setting. Maxim
+ * recommends 50us delay due to the chip failing to clock
+ * stretch long enough here.
+ */
+#define MAX34440_PAGE_CHANGE_DELAY 50
+
 #define MAX34440_MFR_VOUT_PEAK		0xd4
 #define MAX34440_MFR_IOUT_PEAK		0xd5
 #define MAX34440_MFR_TEMPERATURE_PEAK	0xd6
@@ -238,6 +247,7 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 
 	for (page = 0; page < 16; page++) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+		fsleep(MAX34440_PAGE_CHANGE_DELAY);
 		if (rv < 0)
 			return rv;
 
@@ -312,6 +322,7 @@ static struct pmbus_driver_info max34440_info[] = {
 		.read_byte_data = max34440_read_byte_data,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
 	[max34441] = {
 		.pages = 12,
@@ -355,6 +366,7 @@ static struct pmbus_driver_info max34440_info[] = {
 		.read_byte_data = max34440_read_byte_data,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
 	[max34446] = {
 		.pages = 7,
@@ -392,6 +404,7 @@ static struct pmbus_driver_info max34440_info[] = {
 		.read_byte_data = max34440_read_byte_data,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
 	[max34451] = {
 		.pages = 21,
@@ -415,6 +428,7 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
 	[max34460] = {
 		.pages = 18,
@@ -445,6 +459,7 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
 	[max34461] = {
 		.pages = 23,
@@ -480,6 +495,7 @@ static struct pmbus_driver_info max34440_info[] = {
 		.func[21] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
 		.read_word_data = max34440_read_word_data,
 		.write_word_data = max34440_write_word_data,
+		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
 	},
 };
 
-- 
2.49.0.504.g3bcea36a83-goog

