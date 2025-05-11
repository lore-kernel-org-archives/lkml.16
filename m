Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28B18A6A8;
	Sun, 11 May 2025 03:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935855; cv=none; b=NqKlNTlCSr/0JJ7hTE7SmMoztPxZFFPsg1QNbSAazBXf29snAXFbgttQNfRqw6xplSTJVBdAYsWvdX2yP2dPWucD5tXuG0c9RkFX4b1ajx+XLj6TtbIzTpWIMyZG7uqgUYRPIaumuFKolc+RTpsJDfcAkDFahXNos180LnWFRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935855; c=relaxed/simple;
	bh=P6wOfebkpU3WfvRqXOJRrv3NX2AzFgNF0qCkMWB0+XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jC4yKo9P+yaEUpzhWA8H5cvG8Qipl7y2TZWlExZLlVVsEogpJy9lkn8tbrwM5SVr+9Rppiv2bCqimJfXCOltprYu1phfvIUucOZ48UtDtzDuCQX2zlRz3Is9wbxbRCVtluo3b0Eqe6zmx/dknAVRRZspZPeUYttrLbq6v9xRrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A04HV5l4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A04HV5l4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso1021863f8f.0;
        Sat, 10 May 2025 20:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746935852; x=1747540652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcQ/7TEjuuT9DaFpB0BjkKvroqqAuAAo+U2kbtALpnk=;
        b=A04HV5l4aYLCfA8Xi/9ugvQOgLizgHKW3WDnPACQKE21D4+W8X9f/fxSUPlXUmk2x6
         trupYpNSQP3Ht09RPV2YFdXWua1tVw/jaOWVnewYuKXYsYKOdHHLfJsvszYSGAGqNjau
         O+AsCRUTAQQAZayZ5Q0sBxN2w+qSyVsBsWwRpu1V+tIDoKDuaISTT5npdgtIsUu2I0J/
         zeJWRFLFcLWIxVpHxM82d3FgSbSKsVTuF5+rgQG2ZsjZIzwYm1hn/uegTu86nT21GB0o
         PdLzZlCgPpsyTjiPPvKejWB0Qd+eQGHruuxcLYJCW25Dq8ZDoNXDp9UiU9EWpXcdtMx+
         sXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746935852; x=1747540652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcQ/7TEjuuT9DaFpB0BjkKvroqqAuAAo+U2kbtALpnk=;
        b=prtBDihse5hQRAwzDwlEDxrlybPFVQYNGpZIRY7JoUTMEU97EdNCTxzg1+O3/strVM
         ibOlYPQMz0PYS1dbG4fiZrKrwJSjbhIFuTYkYuFlf9h9DP4Iih7lVNelxe5axLI2PuHa
         s+L/m0+ZMZnMo0zydjzgdyiBFRqcVrq9j6EE03f6vyt3Vvqzi7joat+/DIlSma9WlST5
         +7cThPuO/KAvRqkQE3TDKttG9HjRmt1Teuu7U4FE8NRDR/vO8FgapIcCjDIzAlX2kxsb
         cbGrS4nop6eTZbJkFoXVRjcBydmdLrOeJclXB2zgch4jf85EXAIel6KYByXxmDgQR6ST
         pyHw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Goerm4Jy8K/VqDlhAEfdsW1rLRJtobhakHEqjCEpQxM0g8JzQ2exRRFg+74EiMwwOqSZvDaQVKum4rq7@vger.kernel.org, AJvYcCUVwNqbMpMzocihqadkO50w8WdBQELTAovj9nBX6FNjDK5DK0z8hDOwHtjy1JBxlrtxTJFXrsvnbIMA@vger.kernel.org, AJvYcCWmEU8umTA0GMdDu8wYh5PM4sjSj0Ss5iOLTIRtLeSE/J+GghNMusY78u1kSFEZnFbJ+qB+ydJjGNwS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3cR4k/HUv/5pH/7vX6HGI+2OiqtD92ztl6fFPod9f3gDo+FZH
	6OFnvs7OnrDw4qCWX7w8OtuEP440PA2/fBa7PiIZvELkwkAqV+oQ6c1i1q/f
X-Gm-Gg: ASbGncsHKkNGLhAAR1G15neDrLJ6Ifgb8+0/QkXXhnf7HDn3P5qY2CbzrF1rB0C0x6p
	wRI+VFfb6SY9mMIkpOwvsqeKWHAO3RPezD9+2HheHbEJ8q4rerdHnskWiCKOa0EQXaB0ooIApF5
	yoCk3Fjl7jVyoMhuNHPh7viE5zdSbC1QLQ13+LTXfOz5JLEbADRCnxh7HZijBlgwPm9cjLAIhwv
	RvKZy8Qpw7hey7bT9jwjMEl9afJiDlrx4WsduryaYcsaPhwcXGstCoV/ndJ7bzUgjO5g9CbxTeR
	nDkg/twP80skBJlPes/eg4hs5nS1RPizP6swN3s/XqQLRzdCsYGLmqyN9pFyGC4fAihAOF+Nzia
	O
X-Google-Smtp-Source: AGHT+IE868N5mJ1Tijjg3CP0NNfqWMVpdiXblDnz+XlIh9ilb4gA/tpDrjv9Brdu9dYYIYRr+kYVbg==
X-Received: by 2002:a5d:59ab:0:b0:3a0:9705:eb13 with SMTP id ffacd0b85a97d-3a1f64a493fmr6270141f8f.43.1746935851682;
        Sat, 10 May 2025 20:57:31 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm8163963f8f.92.2025.05.10.20.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 20:57:31 -0700 (PDT)
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
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 3/5] hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio configuration
Date: Sun, 11 May 2025 05:55:46 +0200
Message-ID: <20250511035701.2607947-4-paweldembicki@gmail.com>
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

Implement support for setting the VOUT_SCALE_LOOP PMBus register
based on an optional device tree property
"mps,vout-fb-divider-ratio-permille".

This allows the driver to provide the correct VOUT value depending
on the feedback voltage divider configuration for chips where the
bootloader does not configure the VOUT_SCALE_LOOP register.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v4:
  - no changes done
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

