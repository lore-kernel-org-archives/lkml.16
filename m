Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1521B9DA;
	Sat, 10 May 2025 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868869; cv=none; b=g0dNV8N46Yy+57S5eXM+2AhTGhuoT4a+OC1RhLcD2gQka9biP+QH2Yik5nggyO6YhXhBKzL1i+vzBnSiGJYqTsjis7OXbbY3aHlsLXrOQL2UswUzCSXmqnp8fGtkwpklFeO+SiIvfivpm25pOUnMhh1DbsVEYjd1oJqx88+KyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868869; c=relaxed/simple;
	bh=SXXrqczKba4FzvxUVUTR/B4Bli6tiLO+krXW3xSylt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzjOnJeiGMu/Me6K/Xv1BdZQ1rVx8pE/mXNMUtxP3SAwd9ZjNhvMqwrzORwpLQ9qRwknL6+oht3mY9LCMNyUhZ2b0iWIfuWCqxsms6aFJKb92PDsWvU8nllsdJr3UvpbbooMQdrjXfW5B1sTDuDF6GqKg1Noo9LUSpSzpvnZYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp2ELD92; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp2ELD92"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441c99459e9so18437535e9.3;
        Sat, 10 May 2025 02:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746868866; x=1747473666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhgUHNaa6z426NTakx70hGZ4J9L2YpDfqhugqEzzdIw=;
        b=Wp2ELD92x/xL917wNqytQa3uxDsSjdhAwFStCn4BdufQl/gNwRGlCkjRr07QkjeET7
         I/f4bLz0WzN35ajtuUr7tv8ZkS4f8LHd/tys9FsE5wYuE6/GSihkuBPH+9OlGBr7Ng1x
         rkH6r+rI8fN33qK7PBq5m32pOlCV3A2Yh1O3z5G7Ve5GfU9D5DFdRxOfOI1VEgp3PXcc
         84Cbz3Of8jj9e4+w61aGmbHRPJT1OCEwQUitH5I+cZFxGJCq5ymBnUzWdcrI8+ld4/GO
         y8kxeBCtuia3sG+P+mPs4ns8yWmbRo4DKoTHNm7ZSmUjOFe66zCiTsVSKLPFE24jVTS3
         VYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746868866; x=1747473666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhgUHNaa6z426NTakx70hGZ4J9L2YpDfqhugqEzzdIw=;
        b=lVXKJ0y96sBWXJNoSVYEkxpVbzexVVxhWhRas5FpM+1fDs5WHttgGqjs8YmZBLAnzA
         IvbHYlQFwyy7FWcq9k2Bn2zN2zi/LP8wD84JRaARW3kpWfJ7oXijuLjyKouCbpCMSEpP
         pYMvZ9ah8E3nw7WRR69XmYxvQPs98hhf2jDoXTebS6QITJEB/nC4gWpsf911ruAv7Dnj
         MCE2dfgMHJ5HCxNSrJ8etpMBleA9Qrx5g8br19f5b1MqthqyKti8uissSrHeyGyfHG1R
         Hdb6IOZXSTfh4TR00S7MfBO4ttr9N+p2U7xQScrfAD01J+UHygCvfh4Bw/U3FAa33Rbe
         RmvA==
X-Forwarded-Encrypted: i=1; AJvYcCVmdH0n1FBodPcuwPQhyVJHcDJX5oCFVYsY4IUk+wID2jbagfb6Ti8apl2U0h70/Xsk6LUpDDlpHDhRcAWt@vger.kernel.org, AJvYcCWK9/Udsyp9huuVnlwv8/E0hjMG+aSGIAExm0uZO6Eh3GygnpQks3yii6YIBxtz+S+y4tkQ85drxey1@vger.kernel.org, AJvYcCWU6xZ8Sj6ntqH15rtxsqAKlIPHk/x8DyZTuboPnKXME0Y8iUGfc8REquVrtyUam7XGZ7MxyDeuDcWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBX4e26aguYBJD3lBMBl46UbiR4WC/9ZpVmfY9hYMSr9yR2ZlZ
	6BZaSKM/uutv6WPTV4IGDd6Q+7xJU5nhfGk16qpV5fo03deh8nUmeZXIOIwd
X-Gm-Gg: ASbGnctEgcXplLLH9HEjCeqV74L43Qap4kL+yts9cofL8xx6tmCaAuajaKRSDDG93OU
	HKXOAxJbVQ/H9DreTcmUuAldYfyjcTCJA9Xt5M83YZlaehdwcl1jpyNq9IxIStos+3zZGesSXyT
	EJ8ScaybLx48awHMaas/mSx8pFP9Iki8PnYAWyhrWxkJ/7cv8ZtzLwasSuSzyvPdqYUkpwcKxmN
	DClx191R98yzoDXnMo41/96v0jZ4i9AzLqb7/ZEs5sr37HpG6gfm2QK3V5DuH0r4teh008C6UZr
	DJjtJQyTu2/wQodikpmaNPvCAo1EVb2tL/d39tA4JqygCN00FIsJNFVQa/YK2EazxSMo2h992M1
	V
X-Google-Smtp-Source: AGHT+IGP5xryuMfZF/9LvsLfFzhlUTVvgMq/y3Dmh0nbsJbTjs55410ICSlsHzHyg+wj8SG/5k0mDg==
X-Received: by 2002:a05:600c:a089:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-442d6d6ad82mr55431285e9.18.1746868866014;
        Sat, 10 May 2025 02:21:06 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm55901985e9.36.2025.05.10.02.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:21:05 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 3/5] hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio configuration
Date: Sat, 10 May 2025 11:18:46 +0200
Message-ID: <20250510091937.2298256-4-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510091937.2298256-1-paweldembicki@gmail.com>
References: <20250510091937.2298256-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement support for setting the VOUT_SCALE_LOOP PMBus register
based on an optional device tree property
"mps,vout-fb-divider-ratio-permille".

This allows the driver to provide the correct VOUT value depending
on the feedback voltage divider configuration for chips where the
bootloader does not configure the VOUT_SCALE_LOOP register.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v3:
  - droped comments and indexed the table with enums instead
  - use device_property_read_u32() instead of_property_read_u32()
v2:
  - renamed property to mps,vout-fb-divider-ratio-permille
  - added register value range checking
---
 drivers/hwmon/pmbus/mpq8785.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index d0ac294b4bbc..2e7c0d0c3f81 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -5,11 +5,16 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/of_device.h>
 #include "pmbus.h"
 
 enum chips { mpq8785 };
 
+static u16 voltage_scale_loop_max_val[] = {
+	[mpq8785] = GENMASK(10, 0),
+};
+
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -74,6 +79,8 @@ static int mpq8785_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
 	enum chips chip_id;
+	u32 voltage_scale;
+	int ret;
 
 	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -92,6 +99,17 @@ static int mpq8785_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	if (!device_property_read_u32(dev, "mps,vout-fb-divider-ratio-permille",
+				      &voltage_scale)) {
+		if (voltage_scale > voltage_scale_loop_max_val[chip_id])
+			return -EINVAL;
+
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

