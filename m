Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261B1990A7;
	Fri,  9 May 2025 06:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773598; cv=none; b=JKNrzPM9t3ZTWN6xEKKjldy9qfbzhrVi2lWRIW32X9QAkMKrfpLAj03J/0MQDhk/YqppuRlfX5sAclyb9zDiSgJOItvh5/wdZ/rAPJpVZJ//34G+QWkjFa9/dZUV1MDWoUDxSphlMbnTagWCfuR8qcBhL7x9ztBCXHnUQBg9RgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773598; c=relaxed/simple;
	bh=THP1kaDvzB44Pso1pi/sHGv/pOUZ5gAiOpjhgkoG8uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoUqaOAff2+YckyTnz0J7VJeSYKMw5v/xK+akz2eOj5RlXTzRZM5CiWmHsBngWFAnLFk5en56LTDwmaqYt7X8/ebebxrhsDlND3/osFt9bT0IWnEHqS4XSwxJLoSQ5hkiPZpUu0EpeZwnziRIn6yj+HEEdQkQwzbxERVy8VBUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf0M0LJm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf0M0LJm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so12964415e9.1;
        Thu, 08 May 2025 23:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773594; x=1747378394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frbt3kJxnwS5OF/s4kyCgZ3meikDeJAvr0ZtPJr9m5g=;
        b=Yf0M0LJm9juYMD8gq3e9kbEVl1E1XVcJk0eksSYKpzIeG7m4A22s56w1HGX3Ho9DVG
         M3qGLFXiPPfriAZgc3lnSjnqv+dADrSM8TcQ2UbGVDQvlsJQB8Nw8FGsOfb4cBFuxcES
         BNS8s6REYlsGpO5QX+Q2seZSDIbw5ylmpQ6kozOW86pkLbK3b5gryQvNp/rTzKjsluLQ
         C1+5Jim91TkvY2orHAHb49Gmd5KBIKRPZiHg+TmFWXY0YmrhUiup1gxE4FPCjsO8Ewjp
         TB34tGZPURvV3j3O0GOvLJbiDim4VyrSX3d9kTVBbkemkKJrYZowSoSoA3VGyiMVDFCd
         VSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773594; x=1747378394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frbt3kJxnwS5OF/s4kyCgZ3meikDeJAvr0ZtPJr9m5g=;
        b=BtbUBqR9hwaeLj4Y7zhY5gmArQIeUFCNKc9HYRuuqJ1tnlsiGwlnUla+jGS6LDGflV
         6KQ4rjKcfh0tZW9I438HGqhZEbnmeAjA/3MPXAxClWWymUn2udO/8/WakHcjFWCuNm3Y
         /dTAKdc8KZwKPX1p1qQdY4lRzn9aD7f8cO5WMwvB1ErwAxyvTTBZhHcU+6T8yFYCDCAD
         t+SVrErWYz7BPleuDbFj3Ag/jiHte0n6MSo8A1bJi2IwsDwy42rCfNHtjeHaw4O4dt0G
         h4BSol/T0b33J/Ud3wuR6fQtKnU5wmuL+4AFyvJ8oqEFkoH/nPIz3W/fyOV8lZiK9flt
         12yA==
X-Forwarded-Encrypted: i=1; AJvYcCU1gvyEFs/yHpSFxby84DvpAWv+oMlErdXbPkEBYM2cBbCWrEB4vZee19ZlLgs9kXwsqD2dNfhYNCpv53Wd@vger.kernel.org, AJvYcCVBCybzPq13XxaAqaQ+lmC83UpjIuvQEy6z29nkmAqUm26FMB9+Mmz7Cmgsw0xUvpLO/mjPkXZtfgsh@vger.kernel.org, AJvYcCXK/BBOkHLZh6KekxG+/Hqhgu0jFqa7TwqnDn6LlIpEy00lNvxEHRyS6P25RMecJC+2mk6JqxFqj+to@vger.kernel.org
X-Gm-Message-State: AOJu0YzjFBKuM5rDLrCxmtG0udaRCv/dZWa2F2Q83gHmdPoDD/o+YPp+
	96AIZWLDy0QHdc0bqMMGC06m9Jcwz1ZnS8g5L0axvZ6QL265L9z2aM3VpvBD
X-Gm-Gg: ASbGncu8SUgkHJtgQgkryLznaAp98UjxwAk+eAB1oMN2YMp40i5EejRPTREHj0KxQAn
	3UWckPLnUWWjSgq2xRhlnwRhyiMLnUjEXpCLTs5GQRQ+8rH3bujf8KKCB0jGDHbtsS9CEEVAGZv
	HzWzk8oxT+8QxcUDwhqFdoiDe1E5FU8QFmg6Cd24ame66mnN23BjJ7yaYOnzhyJ6PrciMH37I+C
	cEezkPrFebhO+jn1UB8D4nFd3PINqWoEy12HXPAXhVrU1nbBv14DBFfzJIGtJXrIvSWv18SoCSM
	RGhGJwYlJrF0VZ8YXLTyZj/4FLb/HgvhepUT+L6FJ1D6opRK088IuyanVSqny6T3Mw==
X-Google-Smtp-Source: AGHT+IFbn/axhYAYo+11glkPlpJf67HqNGpBO6rkfeDy1i5/TuiHB4LCF7t28I5nQ92+y3bwGEHe0Q==
X-Received: by 2002:a05:600c:c07:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-442d6d18abfmr17385605e9.5.1746773594296;
        Thu, 08 May 2025 23:53:14 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm19276315e9.1.2025.05.08.23.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:53:13 -0700 (PDT)
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
Subject: [PATCH v2 2/5] hwmon: pmbus: mpq8785: Add support for MPM82504
Date: Fri,  9 May 2025 08:51:06 +0200
Message-ID: <20250509065237.2392692-3-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509065237.2392692-1-paweldembicki@gmail.com>
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Monolithic Power Systems MPM82504 digital voltage
regulator. MPM82504 uses PMBus direct format for voltage output.

Tested with device tree based matching.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v2:
  - fixed signedess for temperatures < 0 deg C
  - remove empty lines
---
 Documentation/hwmon/mpq8785.rst | 20 +++++++++++++++-----
 drivers/hwmon/pmbus/mpq8785.c   | 30 +++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
index bf8176b87086..be228ee58ce2 100644
--- a/Documentation/hwmon/mpq8785.rst
+++ b/Documentation/hwmon/mpq8785.rst
@@ -6,6 +6,7 @@ Kernel driver mpq8785
 Supported chips:
 
   * MPS MPQ8785
+  * MPS MPM82504
 
     Prefix: 'mpq8785'
 
@@ -20,21 +21,30 @@ buck converter. The MPQ8785 offers a very compact solution that achieves up to
 wide input supply range. The MPQ8785 operates at high efficiency over a wide
 output current load range.
 
+The MPM82504 is a quad 25A, scalable, fully integrated power module with a PMBus
+interface. The device offers a complete power solution that achieves up to 25A
+per output channel. The MPM82504 has four output channels that can be paralleled
+to provide 50A, 75A, or 100A of output current for flexible configurations.
+The device can also operate in parallel with the MPM3695-100 and additional
+MPM82504 devices to provide a higher output current. The MPM82504 operates
+at high efficiency across a wide load range.
+
 The PMBus interface provides converter configurations and key parameters
 monitoring.
 
-The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
+The devices adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
 control, which provides fast transient response and eases loop stabilization.
-The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
-with excellent current sharing and phase interleaving for high-current
+The MCOT scheme also allows multiple devices or chennels to be connected in
+parallel with excellent current sharing and phase interleaving for high-current
 applications.
 
 Fully integrated protection features include over-current protection (OCP),
 over-voltage protection (OVP), under-voltage protection (UVP), and
 over-temperature protection (OTP).
 
-The MPQ8785 requires a minimal number of readily available, standard external
-components, and is available in a TLGA (5mmx6mm) package.
+All supported modules require a minimal number of readily available, standard
+external components. The MPQ8785 is available in a TLGA (5mmx6mm) package
+and the MPM82504 is available in a BGA (15mmx30mmx5.18mm) package.
 
 Device compliant with:
 
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 00ec21b081cb..9a4a211b2aeb 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -8,7 +8,9 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
-enum chips { mpq8785 };
+#define PMBUS_READ_TEMPERATURE_1_SIGN	BIT(9)
+
+enum chips { mpq8785, mpm82504 };
 
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
@@ -36,6 +38,23 @@ static int mpq8785_identify(struct i2c_client *client,
 	return 0;
 };
 
+static int mpm82504_read_word_data(struct i2c_client *client, int page,
+				   int phase, int reg)
+{
+	int ret;
+
+	ret = pmbus_read_word_data(client, page, phase, reg);
+
+	if (ret < 0 || reg != PMBUS_READ_TEMPERATURE_1)
+		return ret;
+
+	/* Fix PMBUS_READ_TEMPERATURE_1 signedness */
+	if (ret & PMBUS_READ_TEMPERATURE_1_SIGN)
+		ret |= GENMASK(15, 10);
+
+	return ret;
+}
+
 static struct pmbus_driver_info mpq8785_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -59,12 +78,14 @@ static struct pmbus_driver_info mpq8785_info = {
 
 static const struct i2c_device_id mpq8785_id[] = {
 	{ "mpq8785", mpq8785 },
+	{ "mpm82504", mpm82504 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
+	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
@@ -88,6 +109,13 @@ static int mpq8785_probe(struct i2c_client *client)
 	case mpq8785:
 		info->identify = mpq8785_identify;
 		break;
+	case mpm82504:
+		info->format[PSC_VOLTAGE_OUT] = direct;
+		info->m[PSC_VOLTAGE_OUT] = 8;
+		info->b[PSC_VOLTAGE_OUT] = 0;
+		info->R[PSC_VOLTAGE_OUT] = 2;
+		info->read_word_data = mpm82504_read_word_data;
+		break;
 	default:
 		return -ENODEV;
 	}
-- 
2.43.0

