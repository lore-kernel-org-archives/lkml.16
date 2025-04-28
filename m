Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BBF211A3F;
	Mon, 28 Apr 2025 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878521; cv=none; b=c2DenH0l+J/8rP9wY50m5NaWdY8o+El2/fh/w1rOrSFhqKKA89iXHmE4vtvhVBiAWzY6akSGs2oG2HxJoXafBkB08FwVobsTAF5SSFyr59+eAjMNxZ725Cb4Usuz6Lsn+drWCcDt85Ap3U2r47nyr+hMtyy+3QMNjWhipdRvL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878521; c=relaxed/simple;
	bh=iQepXZEPjfzGQ/6jgTqtmE1rTQYbFOMAxN/6PqP1pgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtpKXYCnmFhGOfwAoMqymjci55l8pXs8rK1S2iUK9GmFOmEnViUbOyEpZ/dLK6cI5hssJ+UYRnLUj7rNsJhSZNi6fCWDNY08IQ1pxDCRttjqdWeReMkhEOgfviXm6sNWublYZSSx4QU6mEbaXueOAgj0ryOGtgHIMJZwAAE2wks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Abe/g02h; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Abe/g02h"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39d83782ef6so4371066f8f.0;
        Mon, 28 Apr 2025 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878517; x=1746483317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBJBrNw+0Dr8OQS2KdR4f/1hCJGJxhX6fU1gS+2VX1k=;
        b=Abe/g02h657W7I2L8ECkYG4Dq6owLpUKcIMsgkDJFgRppnCdUxqfZAkinc9M5+D+ib
         ThS93pOWbyT93CRIR/Yta/LqOwMRTrglJrH+MWvYgN/+xQ0Q0ImJesNoges6DnBTLJka
         o1XZKS5eUWKF3yvUf/J7jEXzWPuXMa7aG5+su1bgzWNKfRagz5fB5Dwa9d/tTzEJc92R
         CQzu75uLXWlrrAe+z+66f7hgIE77pEogR9OAtHuy3pDtlxM7EQGAejwpYeIJdAN8inF8
         E/q4LQPdQxPQI+lP0m+MHBCZRat/9E9jVRnvzEHyPf+DOGXrQ5ZjUbHv/MQisMDyhEoE
         L9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878517; x=1746483317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBJBrNw+0Dr8OQS2KdR4f/1hCJGJxhX6fU1gS+2VX1k=;
        b=H8Us4UlzvMeUoMETvj5GaArpyz7wqQ0nECZxFrCkWsPkBfqtuVCcfgMsENo9qpk7X0
         /MAfCzt81TPNGszFONb4g78tyHnHhAMXj+scohjSz1p0lIkCR6wBDSIk6GqHIUjqiGiq
         huvlzQLuy4raFdefM+bCmWhm9WOvk/dTSowCnE42q3ZMKX6G/yCzoWSLsVwY8jNEcRPW
         TO1E8erqGWqKJOMl0PJypqf0lCWuNcxS5WmhqYg5qpFjsn3E9/z/SX4JtWNfwWJsHSgq
         huPYmhBkQ9EQ3OF6gMsYsR6H/rnewg3+UxWTTajK96gQLMEI2Oc7tBohu2FEarrvEdVA
         Uiqg==
X-Forwarded-Encrypted: i=1; AJvYcCUorINEV9PU52GTXZY+x79eM3p1ehpZEZRiJeajq0fl4Bk4rsEATRI/4QoX+Yerq28YB7zqx8pUafJv@vger.kernel.org, AJvYcCVUOZCSzIIbHQtslnBO6ZBiLsXuR3Rspo5Lu4uOTxsRQFRVdRzLrWz0vpNhzUNE12TaXgbiTkpNbs1W@vger.kernel.org, AJvYcCX+NMezMxT/6a6B9WOR0ikwEFqbOkpkWnFz88GJwMuyCDy82d5UiKKZeOUQSGIkSZ/z9d+IKxBY96DLqLVB@vger.kernel.org
X-Gm-Message-State: AOJu0YykvJQjhcjvLyhAGy+tMYKA1u4wFCGBCLhloC72s4k6jguKcgyi
	gGouavWae3OFWvQSrUQp+gbGCAC3vsTITAlgvjV+ctj+FHXLQkjhvI7GxyDn
X-Gm-Gg: ASbGncvf9X32lu9QQevxyL1fM5k6DMBf+2FAJzbxEHJMZ73MGoHuqKFTW85P+86G4TC
	l381GbQYnXfQR76mwDtPk2UOGKEt3o+pkRpWaTWxslUkfv8QZOybKSj18FTssY7qzgSWkBnz8HW
	AIMj6/HzJtxqtlV5JUXIQRCUtjiDmgd5o711nLVEUEDiJsZjMweDqOHFZ/fDEnXcCgoX+MQK2z6
	4/DTe+ohlMhARR3NfyONgbU+EGZScTj+7ax5P2ZNcKwnPeCS5dSNggpTOEQyTuI/M3QDL74wU/Q
	X04F4GRy6SvywUAMj+l4feY19lnfbo98eNWCzK/tuuemyExFWZleM8ZeHXIhrg0xcg==
X-Google-Smtp-Source: AGHT+IFLQQB8PIgB47lEoLRo2ST6auOmw+7NGb1XWBuHEDQQ8C9cuB2i4SpjOv/CK3OrWufps8Tifw==
X-Received: by 2002:a05:6000:2584:b0:3a0:3d18:285 with SMTP id ffacd0b85a97d-3a08a558e69mr588817f8f.25.1745878517332;
        Mon, 28 Apr 2025 15:15:17 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm135901085e9.33.2025.04.28.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:15:16 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 4/5] hwmon: pmbus: mpq8785: Implement voltage scale loop configuration
Date: Tue, 29 Apr 2025 00:13:34 +0200
Message-ID: <20250428221420.2077697-5-paweldembicki@gmail.com>
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

Implement support for setting the VOUT_SCALE_LOOP PMBus register
based on an optional device tree property "voltage-scale-loop".

This allows the driver to provide the correct VOUT value depending
on the feedback voltage divider configuration for chips where the
bootloader does not configure the voltage scale.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 drivers/hwmon/pmbus/mpq8785.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index e6a643856f08..6e2325d7f37b 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -78,6 +78,8 @@ static int mpq8785_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
 	enum chips chip_id;
+	u32 voltage_scale;
+	int ret;
 
 	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -105,6 +107,14 @@ static int mpq8785_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	if (!of_property_read_u32(dev->of_node, "voltage-scale-loop",
+				  &voltage_scale)) {
+		ret = i2c_smbus_write_word_data(client, PMBUS_VOUT_SCALE_LOOP,
+						voltage_scale);
+		if (ret)
+			return ret;
+	}
+
 	return pmbus_do_probe(client, info);
 };
 
-- 
2.43.0

