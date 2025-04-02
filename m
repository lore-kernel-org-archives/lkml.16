Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14D238166
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595586; cv=none; b=tuEQVqVzFa1pR6d+MbnIDkfZqYbnaHaaGDqhyUjW+5HR0lq9kqHOcK7/rz6WT/ZYdbx8p7GHa05LSBnY0m4hR3Qx6K4OBQrOsxp5UhGAK/q6NYYHWqGGEPys4C2L6rsbyExwQR0npRVSqz02I1LAH3GGlqLejHBGD8os+yIHlmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595586; c=relaxed/simple;
	bh=7swfiKnH8hrUC9s3SQdoobfGIfZ4drxEBqFdEd8mRQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZszQFDUc9wcAkQBjnJRW1aqXxXuCjrpoXzh9fxMQ4+E4YQCPRnHfIYVC4HkJrz07wuqLFPBAFe78OjSeXKbYZhusGUiz2V1JZr/5S6Yhy4pki1RtRX6S4qpFAC+MSMtgF5dJr2ZNQdrahcwiwaMBECObAZTNgT1kMz1emzCDQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=ONw4wMCY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="ONw4wMCY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227aaa82fafso127842675ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1743595583; x=1744200383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCigWhMrmcJBolyuUgV3lJ1qYbCm1dkqPLc5H/XoqqE=;
        b=ONw4wMCYvnabXnHu9xVJTe8LNJLzjU21VxG+3v49040zDt2maSNIvBIiQjB24kf81T
         EPlnTttvx04oeSx71Uol91DiTJvK58kq7jWpq4De2417pQMZUrlaBI4NiwGMXOO8BVoF
         MZYe52SfU27oZOrIJ99uTiNKw3uOTSc0AvQvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595584; x=1744200384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCigWhMrmcJBolyuUgV3lJ1qYbCm1dkqPLc5H/XoqqE=;
        b=DpQfo1P1RbpUlKWTdTrvyBJwOFCahrF16aSoKuFrvf9giYcRnEuVTaMxLgNdDnHH1i
         Q+RMtN15tDNpRY8SO/pmEPrdoW3x1n3hxy2hwj6ngo4UbV5ZCtK5pRf4zDROteqJioXe
         qwqHipj9gU3lCkgE5xKBBPU0UxCRzurafdtJr5bMFh/W24Sl5ItJyHNTt3bY8BwXFA1S
         zPkkYnfuVOGh6eQqiguXo8ug+Kj+vV5hR27pPb5cJxEwEYrlFHo6vwCwi8WGLI2hZeIt
         Mix9Chm6Ia5F5yepoyZAvxTrf3QHu/egP5+KDRL1ShT0QAytMkEvAM84wtEUkqA5Wo7k
         og2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyEJZR/ePyY7zr16LIt/QlbSE+Q+DiBG1RjY5o7wZXvfVY6ySB0kX14spQsHA0X4RJC91I9z3k93PXPNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzitNkTW1Gn6ZrRgojx7XxxN68brBB3aAPuabQhG8az81SfGIuJ
	No3V3EmYCQb7VhXdyB8jg68HCw3M9g+xKEJT7G6x1GIUautQ1aGB0z/PtzB1x7M=
X-Gm-Gg: ASbGncucb/WB7I+uJLTYBQ4nGpnnPLBL7t3Asw8Kr3m7SxN4xB6TcM4SBNEMVs6hLYO
	lQkUVqACBgTuPwARX3UVHBj1DunNS5D4flvv3OrbWzDsRMIBQZ1AKlHLmJX5aNQm7Taps9/uCW8
	O5Rv4VJ7TMD03ZVk3zCXPph/ZqX/ejbZgnBbYEBuyTP6jRUqIM+PouJacjYKIFPFHOvOS7V8IPS
	RbKjkIcskbGg+msEyf4tvSlZrhGP8eh/v55Cli20oMO696gryFLy3puDWTerv0LI3rNL7e4a8U0
	/2R7D9xPJyulJGF41AI+Eukrp0j+GVU6kxpHlOkqDvANhkJn/5tphFcLfWg=
X-Google-Smtp-Source: AGHT+IH7SJCT5w1JE7ro6lt0SJ18bG6a/eylqAKOqWZO3IB/4aC4Rj6hZeZDRT9PoKTBRqHp6AQqjQ==
X-Received: by 2002:a17:902:e549:b0:224:a79:5fe4 with SMTP id d9443c01a7336-2292f942f58mr212724095ad.2.1743595583576;
        Wed, 02 Apr 2025 05:06:23 -0700 (PDT)
Received: from niyas-desktop.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedd2bcsm106477375ad.65.2025.04.02.05.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:06:23 -0700 (PDT)
From: nmydeen@mvista.com
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cminyard@mvista.com,
	"A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>
Subject: [PATCH v2] rtc-m41t62: kickstart ocillator upon failure
Date: Wed,  2 Apr 2025 17:35:46 +0530
Message-Id: <20250402120546.336657-2-nmydeen@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402120546.336657-1-nmydeen@mvista.com>
References: <20250401090454fb0ccf16@mail.local>
 <20250402120546.336657-1-nmydeen@mvista.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>

The ocillator on the m41t62 (and other chips of this type) needs
a kickstart upon a failure; the RTC read routine will notice the
oscillator failure and fail reads.  This is added in the RTC write
routine; this allows the system to know that the time in the RTC
is accurate.  This is following the procedure described in section
3.11 of  "https://www.st.com/resource/en/datasheet/m41t62.pdf"

Signed-off-by: A. Niyas Ahamed Mydeen <nmydeen@mvista.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m41t80.c | 68 ++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 1f58ae8b151e..7074d086f1c8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/string.h>
+#include <linux/delay.h>
 #ifdef CONFIG_RTC_DRV_M41T80_WDT
 #include <linux/fs.h>
 #include <linux/ioctl.h>
@@ -204,7 +205,7 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		return flags;
 
 	if (flags & M41T80_FLAGS_OF) {
-		dev_err(&client->dev, "Oscillator failure, data is invalid.\n");
+		dev_err(&client->dev, "Oscillator failure, time may not be accurate, write time to RTC to fix it.\n");
 		return -EINVAL;
 	}
 
@@ -227,21 +228,31 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
+static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct m41t80_data *clientdata = i2c_get_clientdata(client);
+	struct rtc_time tm = *in_tm;
 	unsigned char buf[8];
 	int err, flags;
+	time64_t time = 0;
 
+	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
+	if (flags < 0)
+		return flags;
+	if (flags & M41T80_FLAGS_OF) {
+		/* add 4sec of oscillator stablize time otherwise we are behind 4sec */
+		time = rtc_tm_to_time64(&tm);
+		rtc_time64_to_tm(time + 4, &tm);
+	}
 	buf[M41T80_REG_SSEC] = 0;
-	buf[M41T80_REG_SEC] = bin2bcd(tm->tm_sec);
-	buf[M41T80_REG_MIN] = bin2bcd(tm->tm_min);
-	buf[M41T80_REG_HOUR] = bin2bcd(tm->tm_hour);
-	buf[M41T80_REG_DAY] = bin2bcd(tm->tm_mday);
-	buf[M41T80_REG_MON] = bin2bcd(tm->tm_mon + 1);
-	buf[M41T80_REG_YEAR] = bin2bcd(tm->tm_year - 100);
-	buf[M41T80_REG_WDAY] = tm->tm_wday;
+	buf[M41T80_REG_SEC] = bin2bcd(tm.tm_sec);
+	buf[M41T80_REG_MIN] = bin2bcd(tm.tm_min);
+	buf[M41T80_REG_HOUR] = bin2bcd(tm.tm_hour);
+	buf[M41T80_REG_DAY] = bin2bcd(tm.tm_mday);
+	buf[M41T80_REG_MON] = bin2bcd(tm.tm_mon + 1);
+	buf[M41T80_REG_YEAR] = bin2bcd(tm.tm_year - 100);
+	buf[M41T80_REG_WDAY] = tm.tm_wday;
 
 	/* If the square wave output is controlled in the weekday register */
 	if (clientdata->features & M41T80_FEATURE_SQ_ALT) {
@@ -260,17 +271,34 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		dev_err(&client->dev, "Unable to write to date registers\n");
 		return err;
 	}
-
-	/* Clear the OF bit of Flags Register */
-	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
-	if (flags < 0)
-		return flags;
-
-	err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
-					flags & ~M41T80_FLAGS_OF);
-	if (err < 0) {
-		dev_err(&client->dev, "Unable to write flags register\n");
-		return err;
+	if (flags & M41T80_FLAGS_OF) {
+		/* OF cannot be immediately reset: oscillator has to be restarted. */
+		dev_warn(&client->dev, "OF bit is still set, kickstarting clock.\n");
+		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC, M41T80_SEC_ST);
+		if (err < 0) {
+			dev_err(&client->dev, "Can't set ST bit\n");
+			return err;
+		}
+		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC, flags & ~M41T80_SEC_ST);
+		if (err < 0) {
+			dev_err(&client->dev, "Can't clear ST bit\n");
+			return err;
+		}
+		/* oscillator must run for 4sec before we attempt to reset OF bit */
+		msleep(4000);
+		/* Clear the OF bit of Flags Register */
+		err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS, flags & ~M41T80_FLAGS_OF);
+		if (err < 0) {
+			dev_err(&client->dev, "Unable to write flags register\n");
+			return err;
+		}
+		flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
+		if (flags < 0) {
+			return flags;
+		} else if (flags & M41T80_FLAGS_OF) {
+			dev_err(&client->dev, "Can't clear the OF bit check battery\n");
+			return err;
+		}
 	}
 
 	return err;
-- 
2.34.1

