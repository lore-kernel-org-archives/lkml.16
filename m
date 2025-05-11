Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C52F2E;
	Sun, 11 May 2025 03:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935848; cv=none; b=Y9KiZZpJ7+GEnxpWxoAROtqgufEiuyxxB3s2qDNEY4Lw5we1//9eNzlW2v06F6mev9QuuWiglLfZQLyPObzdfwtzqtZeGNJKHBwFUE6g8ZPq/7Omz4pBY7KSr8DZtm/PgyiMzFjfZJ8V3tsjgic4iQxA6JrLNh92YOySAUBVNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935848; c=relaxed/simple;
	bh=f11a/87d/MkxjGBfwqmJZV3iTC4m7JH+7y4sSV73jJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTSxOWAS6aogAyGWU+aJRzhp4szFcnwkM6jQ6V5I9iHSBdtwgGcwmoOpRD943L7rgDbqTsgWVO9kPRNnn+1o9G6TTaArCfjz0BPbtelbjnoqOFOnZcGUd7NfoFdB4fKlkDFS4KDMrsY9bQwiARW5mFrZV4b9sH/r0dgfiRIDSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/noOkMA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/noOkMA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so3055724f8f.2;
        Sat, 10 May 2025 20:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746935844; x=1747540644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGnjH1P5I0kLHDjAZ4ysHop1/OwSpLWxJh9YdNqBtVk=;
        b=c/noOkMASm/wdcWc116SnGgN8aKPZ3gQkLh9jdA1tY1ZeL03lCsn8NAjfbD7Mf6AX+
         oyFAjDuxAy4REoXP0ifaOWQwzYejy0StEosxpIVl6wnxRteWGM7MCl/y52/wnhFsyY/p
         F0PBnm8DaEWlDB1yUYO0Rto+gVjtaf3bfTu5JDjiqSZ8XoqAKBZAqRgk23/VzzNlhV6p
         cS7t3U1rWY2BmsoAbrkEC66pz+NchC8Ia8jvBqACccnuOSKXjY4JD1iPAuLw2z3bk/hc
         hdGhwH161tCz65i5N9G5XVfPP07RnR6SaI5JNmQVIA+TCW+ljEeys0gU6H4YXaM+pLti
         Kv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746935844; x=1747540644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGnjH1P5I0kLHDjAZ4ysHop1/OwSpLWxJh9YdNqBtVk=;
        b=QhJO1uhJyz1uUZgfaiwXpHsbAA+xBA6YERP5Rvr4CXQblviH/EtI6ieRQQLMQvZt1J
         zZgGleh59xxRM37TFHPzg44nlDy5fWGOlJj5BV6BqnSYn47RZChjAzobFaBX3zbcEUYB
         aPaoW4iAheNtRThrM+6R9TjWP0hbIuWOaxo9jJLJz965GV3KMoYbK+CBKfT0bqN0RpMM
         z4JWsU7rvzoCm3iuHjiRKQdsDBMNgk+LbmQThJUUMx4wPNdAMeKJMe7He365t0r7CY9p
         ZkG+lJgHF3iY1FP+hHw9S5eTbMrdTtS+FoUp21FdX27nxVX8R/DaNK9bFBH+Ue1CGQ3Y
         F1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhsPPACsbuKSylR+ktv/UuXZ13W6tsQeS5pyb7IU8PR2baavyjjiKx8XrO22U4NH8IBMmCALkFcv31@vger.kernel.org, AJvYcCXEQrl0gUpSDqlEonvINPqH8xAgO6cuvQWjJmKLVVtyzxNor2eXyCCm2uPMSYs0HIFgrTCXHiIrBjaZTiYL@vger.kernel.org, AJvYcCXkbSmAPmplyEs6BblsfRmna5L0X/fO8Y9InbDnV0pv1M+9UA0lCnEFWoxkQmHxv6wTFh2pTfRZaIgA@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhnN+/hc8XDfLcLhRCKa+iWtLzILt+OYaI8XwBxPb+8+HQH4C
	2BPeUrkXtp+mLl9N1V2XFfYYKmKFi/waRBA1wKgSqQTzp6jg2fhi75nUtZLC
X-Gm-Gg: ASbGncvpesPSqJsP3Za9OeZqRVozHQtXu0N/YAUQFGUXPMz3PVKzsCDe8kfaRMO/+Jg
	VyKEtFeQqdrn7yYkujY8IDbUb2DYf7cx4xuZc6eO/wUyXb+8IiUxuGZVYAQ+YHjU/yVkEmDRT40
	s+PJyRQhScLE6D3r5i6twH7/xbbfZcSimz4+ktpG49KsLkUBH4bip0xbspLPD98nHGzghvBP5xG
	GgHkYtY9zi4rSrTLhWjMTM4723ESnJbc3Y8zlW4vGL3ucTZiCblsCBx4iVtPuLFGDYrz5mfXzhE
	OsmUJ0rEkNLP60y7CqgVcLjkMR2hlXv9LRWu/aV7KT6l2DyX4THXJ5hqhIWnEPm5LhgwRQkDJ0k
	/
X-Google-Smtp-Source: AGHT+IEAa8DunPvrHQ8yJJ8v4GjnsSw6eFmxwkbwHnHoEfsD2xzSNIHeco505OqaSmbYjeyfZGe/AQ==
X-Received: by 2002:a05:6000:2088:b0:39e:e557:7fa with SMTP id ffacd0b85a97d-3a1f648865amr5940049f8f.44.1746935844226;
        Sat, 10 May 2025 20:57:24 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm8163963f8f.92.2025.05.10.20.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 20:57:23 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 2/5] hwmon: pmbus: mpq8785: Prepare driver for multiple device support
Date: Sun, 11 May 2025 05:55:45 +0200
Message-ID: <20250511035701.2607947-3-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511035701.2607947-1-paweldembicki@gmail.com>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the driver to support multiple Monolithic Power Systems devices.
Introduce chip ID handling based on device tree matching.

No functional changes intended.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v4:
  - no changes done
v3:
 - replaced (uintptr_t) with (kernel_ulong_t)
 - used i2c_get_match_data() instead i2c_match_id(mpq8785_id, client)->driver_data
v2:
 - no changes done
---
 drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 331c274ca892..d0ac294b4bbc 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -8,6 +8,8 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
+enum chips { mpq8785 };
+
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -53,26 +55,46 @@ static struct pmbus_driver_info mpq8785_info = {
 		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-	.identify = mpq8785_identify,
-};
-
-static int mpq8785_probe(struct i2c_client *client)
-{
-	return pmbus_do_probe(client, &mpq8785_info);
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
-	{ "mpq8785" },
+	{ "mpq8785", mpq8785 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
-	{ .compatible = "mps,mpq8785" },
+	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
 
+static int mpq8785_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	enum chips chip_id;
+
+	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	if (dev->of_node)
+		chip_id = (kernel_ulong_t)of_device_get_match_data(dev);
+	else
+		chip_id = (kernel_ulong_t)i2c_get_match_data(client);
+
+	switch (chip_id) {
+	case mpq8785:
+		info->identify = mpq8785_identify;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return pmbus_do_probe(client, info);
+};
+
 static struct i2c_driver mpq8785_driver = {
 	.driver = {
 		   .name = "mpq8785",
-- 
2.43.0

