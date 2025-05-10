Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8121B9C3;
	Sat, 10 May 2025 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868878; cv=none; b=BypNEjqyxns0jxpd5iv9L9xEfv3FNjC9C8noUQbv9qzeM1X/KXJ0YNd05FUISE6+oiJKmHitW+gNUgirSkU/h8ibxrpWRGac18YV9xxrrHoC27MdG/nvKrwTuj7bHJNeX4E7sjp9lTZElc1tJqyOnqr/B43aUOW26umdYoGw1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868878; c=relaxed/simple;
	bh=qqjG4TLZWzysZi1HRtBlJBJzqF+FJgFf4pYolgJ75xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rd+Dx2uGeAMqQoY6piYh1TAEbejdOzTi0NEYIM545T9m2uWp6Ubx6YAcnU2Tno0zSYV3zgnC40Jlxe8giU0M3M7VHX9EdiX9eW65duxcvSmllO9zYvHJ6hp584bMvxbVxe6QsGdtWfyJ/CX2XJ3nJ1WEXUUw3NCm0HEtKjeBbwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gqjyjt7p; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gqjyjt7p"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0618746bso21783075e9.2;
        Sat, 10 May 2025 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746868874; x=1747473674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUKFOmyrkNA7dur3Ib6dvAXhOopAOx/jVKysZ5pKnNs=;
        b=Gqjyjt7pOdk0VrKqVKOhe6sALyGDTDsA6F1KBPGHNecGnHSGYJQPJWcJPw4Q63XRAH
         p9TeItEz2TLUADT3+538zzt1ySdqX158lT4YPvVeZr8Yl1IvoSuOhBgtmhCLRM8oUDrX
         6mbAcs1mKlWdV7S080DxS6juIN7Urnw2ez2TTDYCgXkxv5DSr1535JUZpi179KWebd5L
         anemPKx4f0cyXdyPadeAZr2D8q5/LJO/IO4EE/9D7pof1KGXnrzW2MZI+fctNoZHhLqS
         3kuziZENqcBJmk0Cu1xGs/FGmL/IouHnVNjpwRQd3h9SWEl30U5N2E9vMzCuDPIqwc/a
         bzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746868874; x=1747473674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUKFOmyrkNA7dur3Ib6dvAXhOopAOx/jVKysZ5pKnNs=;
        b=qN5+bwr9Fgss6QCFzMeSkJQwKPsiN6VcLnh8LnlmQPsMU5aRl1MO5MGmkybmH/V32W
         HmDFK5YoiaA/OQhpm//Y/AKLaUGd+VNJ8eeMFjoiJ0DaG4530guztGmBui/sxgPODolK
         Mb9VYqFoxtRkeq1b2yHVi404rRTpX8zqL1PL3JXsHy/c2xOiX4SlCfUbibxdIzRLLyVy
         Ev1LGCZ3i8hJk3rMhsVjrY4F/6m12D9G6hHXaFAzSwI7Mp3aBe29DVqjWW+Viyqv1jii
         6ZWqV2r9Z3mT984SuaiLBhU8nyN2TW0RMQE65GzYOpx+yMe7N+AWBoqvCOqut/S58RLw
         5CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6voXuPulSqZpO1/LbhSFZFSgKjkBE0yO4Y68Orlnn0OY0AvEEVX0ZJ7sFGdNnOYRCEria9McXIQIr@vger.kernel.org, AJvYcCWj7+MwK56KXwZVBXeyKytdoay4Gu7BboCY9A0z0BU6m9AFZK+o5fr34HSz8wUpRLSidegYfxSvwBPQhr3j@vger.kernel.org, AJvYcCX0ON7fXvxyL91aHr1IXsTQnT6aEyAnKwyWu6l7p2j8cOiwHa7KhifQ3X9G1GJXp6FformkiGqVyaoh@vger.kernel.org
X-Gm-Message-State: AOJu0YzetV6jyHe4XL6ITzdNcbrZ5E4BFRm7IMJvGiwCETSP2ieYEmJt
	aLmI4QK91ZZuQk+JdXLnGAmga08ekI85Gu4eVJ4Au2nslXgaqWAuP92/t474
X-Gm-Gg: ASbGncu9S9KKOBg4KVIX7x3ekJ/NgGbkguTevBfOuInevkz37Uo5vXNee2K1Ieg7bZU
	fBW2K/oDtvKYhMzKAawJANqhUCx8iLZnAvw8MxOw4pf2LBpEYgwPJEDlPLdA6xvKTm9WwMhdQ+/
	doyXgauONtkuApgyDMEetx8yA2oQY41yIhNU3yAXeQoEDh08ObKM14e8qbzog4m4vBknqzPA5x0
	AbL+prhEUO+5eHD18bHNfuXbnxUxZRq0F+oDHiprvwANekeX63h72Xk9OUtGn8eOM+TXtkxz62j
	fljPkqsq8xa9Bkaa/DdIFgIuV87EhywQKERtWcY/M3huJ9xLmpATj2ah4KCg4vxDwTMRs85oDeI
	6
X-Google-Smtp-Source: AGHT+IGlEra8PjVc2cBUJrQLHSr6lum+RzZkg5Qz4cmGYCMkFR9xrLOfBpgCy33LdOqth/PAKkqXoQ==
X-Received: by 2002:a05:600c:3d8a:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-442d6dacbe7mr63034535e9.16.1746868874280;
        Sat, 10 May 2025 02:21:14 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm55901985e9.36.2025.05.10.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:21:13 -0700 (PDT)
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
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 4/5] hwmon: pmbus: mpq8785: Add support for MPM82504
Date: Sat, 10 May 2025 11:18:47 +0200
Message-ID: <20250510091937.2298256-5-paweldembicki@gmail.com>
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

Add support for the Monolithic Power Systems MPM82504 digital voltage
regulator. MPM82504 uses PMBus direct format for voltage output.

Tested with device tree based matching.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v3:
  - fix alphabetical order in multiple places
  - change PMBUS_READ_TEMPERATURE_1_SIGN macro name to
    MPM82504_READ_TEMPERATURE_1_SIGN
  - use sign_extend32()
  - fix typo in documentation
v2:
  - fixed signedess for temperatures < 0 deg C
  - removed empty lines
---
 Documentation/hwmon/mpq8785.rst | 20 +++++++++++++++-----
 drivers/hwmon/pmbus/mpq8785.c   | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
index bf8176b87086..b91fefb1a84c 100644
--- a/Documentation/hwmon/mpq8785.rst
+++ b/Documentation/hwmon/mpq8785.rst
@@ -5,6 +5,7 @@ Kernel driver mpq8785
 
 Supported chips:
 
+  * MPS MPM82504
   * MPS MPQ8785
 
     Prefix: 'mpq8785'
@@ -14,6 +15,14 @@ Author: Charles Hsu <ythsu0511@gmail.com>
 Description
 -----------
 
+The MPM82504 is a quad 25A, scalable, fully integrated power module with a PMBus
+interface. The device offers a complete power solution that achieves up to 25A
+per output channel. The MPM82504 has four output channels that can be paralleled
+to provide 50A, 75A, or 100A of output current for flexible configurations.
+The device can also operate in parallel with the MPM3695-100 and additional
+MPM82504 devices to provide a higher output current. The MPM82504 operates
+at high efficiency across a wide load range.
+
 The MPQ8785 is a fully integrated, PMBus-compatible, high-frequency, synchronous
 buck converter. The MPQ8785 offers a very compact solution that achieves up to
 40A output current per phase, with excellent load and line regulation over a
@@ -23,18 +32,19 @@ output current load range.
 The PMBus interface provides converter configurations and key parameters
 monitoring.
 
-The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
+The devices adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
 control, which provides fast transient response and eases loop stabilization.
-The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
-with excellent current sharing and phase interleaving for high-current
+The MCOT scheme also allows multiple devices or channels to be connected in
+parallel with excellent current sharing and phase interleaving for high-current
 applications.
 
 Fully integrated protection features include over-current protection (OCP),
 over-voltage protection (OVP), under-voltage protection (UVP), and
 over-temperature protection (OTP).
 
-The MPQ8785 requires a minimal number of readily available, standard external
-components, and is available in a TLGA (5mmx6mm) package.
+All supported modules require a minimal number of readily available, standard
+external components. The MPM82504 is available in a BGA (15mmx30mmx5.18mm)
+package and the MPQ8785 is available in a TLGA (5mmx6mm) package.
 
 Device compliant with:
 
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 2e7c0d0c3f81..1e12e7267a7f 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -4,14 +4,19 @@
  */
 
 #include <linux/i2c.h>
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/of_device.h>
 #include "pmbus.h"
 
-enum chips { mpq8785 };
+#define MPM82504_READ_TEMPERATURE_1_SIGN	BIT(9)
+#define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
+
+enum chips { mpm82504, mpq8785 };
 
 static u16 voltage_scale_loop_max_val[] = {
+	[mpm82504] = GENMASK(9, 0),
 	[mpq8785] = GENMASK(10, 0),
 };
 
@@ -41,6 +46,23 @@ static int mpq8785_identify(struct i2c_client *client,
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
+	if (ret & MPM82504_READ_TEMPERATURE_1_SIGN)
+		ret = sign_extend32(ret, MPM82504_READ_TEMPERATURE_1_SIGN_POS) & 0xffff;
+
+	return ret;
+}
+
 static struct pmbus_driver_info mpq8785_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -63,12 +85,14 @@ static struct pmbus_driver_info mpq8785_info = {
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
+	{ "mpm82504", mpm82504 },
 	{ "mpq8785", mpq8785 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
+	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{}
 };
@@ -92,6 +116,13 @@ static int mpq8785_probe(struct i2c_client *client)
 		chip_id = (kernel_ulong_t)i2c_get_match_data(client);
 
 	switch (chip_id) {
+	case mpm82504:
+		info->format[PSC_VOLTAGE_OUT] = direct;
+		info->m[PSC_VOLTAGE_OUT] = 8;
+		info->b[PSC_VOLTAGE_OUT] = 0;
+		info->R[PSC_VOLTAGE_OUT] = 2;
+		info->read_word_data = mpm82504_read_word_data;
+		break;
 	case mpq8785:
 		info->identify = mpq8785_identify;
 		break;
-- 
2.43.0

