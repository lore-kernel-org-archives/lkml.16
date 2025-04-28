Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2418DF62;
	Mon, 28 Apr 2025 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878502; cv=none; b=TVwc3X2Xuwp9GC7IcdI6bXRnu4FHWLK0Km5FRvMwxLMxksN7hovCWCGW7yOHiOi77JJVG6T70cHOKdvsK+DSPTEcKKwthj4qZ9ugXSQ+CMWFK6y8HzLCx9Rd9p9K+k6lYsTrSOdvqin8QFWOuBA4uSE5K0LnQkYMMxJDnD588+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878502; c=relaxed/simple;
	bh=1lDrsqYRmC3Z6v3LandN67Y7bF97CqlXz7uzwRNAVjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFYs5PDafe84cm1NDJ19iGzrWrkrQxH7rN4JovwImuTxjWGJ99qpq6SzBWTY4Hl5MIOp5W2vcA2UpnymWsw8nyP2b/WiLwqS4EjGV3cIR+RDoa+e8CJlNgCsA5o4jj10jIHSicdCHi0sNr142Q6W/NEcv1Ko/rMXXk3/ehmRiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5DGEYH6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5DGEYH6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ede096d73so36573685e9.2;
        Mon, 28 Apr 2025 15:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878499; x=1746483299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51MosBXA6OVB4D1vQIwO+H46ch/ElgK+oqBBoq4riWU=;
        b=R5DGEYH6dqsk/S4V/ICAznbH6UtoAnztHuTeRviNNi5E1tV9ajLqhGBfpQS4JdLujq
         JLG8lkG3xVMQ7tCG/3TuaJeEk+7UdpGa21IikxAC7JyLQXQ8f7hLk+7CmQ6GZKoIR9x5
         xp1JKXqL4zR7wftjiyoX8pBZSrjBO9Usj9OReyvzi/L3OLy4+Ztu0fYLK0I8bQZBGgoN
         GgTbvBFj0YHbszwJAsKHEMyKHE7e0SffJz0Fuu0MDc5ED+C+PB5JqCunoXZC88j4gC7q
         Aj1RyeGCXcEY+MB10usElIHPdBDVngsgAYBnzV2rqMSoQZrZ2OAbGrn7f+b+hhW+QbhJ
         0PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878499; x=1746483299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51MosBXA6OVB4D1vQIwO+H46ch/ElgK+oqBBoq4riWU=;
        b=YV8QZCTovzFIDX1Uv4uM09eGxrYMlxWsGguvlPAPbjBDh7hyBO32HHfPDAqKiSl8Ra
         lW+2r/Hp2AUPmQE8RG42DmE9IakKkVK4wZlZL2rrFgc/ZqHJhhTyhR0ayOlnzKe8Mk5N
         ULArLfylHU6CYrCUKWOGhKFYOOqHgXyRW7x9MBTTOR6g+nUP5xRteXojSB2EUBqDeCTD
         AdfMMQsWa9YA4dM/lvO9vzpq7Ijlni21+GS6RcWSFG0wn3uA+CQWzLhOot/zDgjEZ68c
         ROMTqjRz9Jb9xW7ot+Q+B73IENUgUNYzV+yOBGhVzOBb9c5V2TdpEu8rcTpXGnSvY6N0
         FOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg+dZG66nAF5+S6743yKTW0eT5aNPHFDZD3AGP4DrvqazJHZB0f5yC5uB4MnQ7qtnmQ4yr4+UfOc2QjY1V@vger.kernel.org, AJvYcCXJwwB65W7WtN7KE8oJKkSWSCM3YW5h/7z/YWErhWEYTjMmy0KA5wWx3uWKf1l9MIq9mKxOjjqB5H6K@vger.kernel.org, AJvYcCXmjHdrABbsp0OA5NP6bj5jgowBq0BHmVFicFLIF8aBJPL4YCO+uBUbun8G9pXCpxqVhIXM7qtQaSSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTnx9NhGHKJXtHaPNNTaz1XH2VaULuP630lQ0zsLXHD1WbS8cO
	whZ14jW2riROODVR7oF4IJO4OcbomYvc+3TNLsXmVtLfQyyFZRixstfFtWks
X-Gm-Gg: ASbGncuFJ2GZKgfrluyil9Vk7Rlf0eCie2lEVGb75ktDL3iFwKEWEEn77eq/894WJ29
	MgZogRWqIQVOHcLitDbn2zVru77cqfteW8ZhdXEkuspKdllJl1AoVkFs4lwowVIeevREZDmaMbE
	5C6Twfcc1hdldFiLIzc1cgr5n5oVqrYpP4AuRxB8jquKzRU1nSHIsSg9uVXlyq2oiWVHp38N7ae
	EkRhMv+SkdYprzmdLVDI2xPyOipJzX2fCWe3BIGGuo0pUhdQftrO9Tmpg5lePPFFQ+IjfdxnYAv
	sp5t1OOKHWN9zp/ornfV28fQtoGOoHb4XnFyZYjFeOeU56RC6GrIpD7bBKcQsv+5jA==
X-Google-Smtp-Source: AGHT+IGpcLREo3ZYIdFVoC5dc+wPnocuQekSuXMfOtRr933kywRx+20sytAeani2HnLcEplXVGjCsA==
X-Received: by 2002:a05:600c:8712:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-441ac8577d0mr8041945e9.8.1745878498815;
        Mon, 28 Apr 2025 15:14:58 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm135901085e9.33.2025.04.28.15.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:14:58 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/5] hwmon: pmbus: mpq8785: Prepare driver for multiple device support
Date: Tue, 29 Apr 2025 00:13:31 +0200
Message-ID: <20250428221420.2077697-2-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428221420.2077697-1-paweldembicki@gmail.com>
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
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
 drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 331c274ca892..00ec21b081cb 100644
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
+		chip_id = (uintptr_t)of_device_get_match_data(dev);
+	else
+		chip_id = i2c_match_id(mpq8785_id, client)->driver_data;
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

