Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BADF211A0E;
	Mon, 28 Apr 2025 22:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878509; cv=none; b=hLK3MbJeciMYosWcMWjV7aJNcH3Gn+/5NhRfGd2a9DxyvLyiKSDEVoc/sZvZJOsSobcxg7sD1Tki9z65XZTedc1dMar7TccxtMI81CyQFQ5/7WIY7MmbKR+4ikufLE9ARuLekIkaei5NuGTA6XR8vzH10CwEokAZkwFCgDQ4T2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878509; c=relaxed/simple;
	bh=Fnl8k+xyEzFdYf5yFWIa9NmfoVelQ14unO0N2MqZGMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYlsHX07GDKWamoUwJSaDgmkYldFubIBG9gjD+8eJThpyxiXamW6KTKF7EsMROL8hPjxGZnRAcQiylPwCJTU1wiXWiPdNrsx7rVWZql239NrFN7n3Pgo3P8k8MEtuBJGyHLiMPGUOa7CF7c1CCjW9QQKP0iTfRHJq1KwzzLOBhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+OR4KxA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+OR4KxA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so27615955e9.2;
        Mon, 28 Apr 2025 15:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878505; x=1746483305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0h0V/PY2jmAFbZxjwD21XEi98uAqLPs6Qxnq/8Poro=;
        b=B+OR4KxAksr8uMV7sWSl30wxL4QQERF5CyCPW1wNB+knjAUeX7Enm9SmDUWdW2g+9a
         o+OfBAFb3f5Nh9+4CsotOuOhIzgRm6h8FFbJG4hgBW5xOWF7UMSsGGxTUHJq3R+ylOpl
         +KO+ykPL2ud0xGxBD3dOPB/Qn0+R3cWcLmv3TlrrZVNFC1p06ozuEHrD3ZcUIHCOZzLC
         djXgYhJ4aXAxRGP0Ycrwp3fj70dbJoRAir7Vm8a6uZumb8Ixs2c/zJc3Goo31pPZTNVy
         oHyKvcpyzoKzkEXij+io11p/MCVD6Opfu3BTvZUZcoEcuISDkaYMNhtM+QF/OsPl0Scs
         cWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878505; x=1746483305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0h0V/PY2jmAFbZxjwD21XEi98uAqLPs6Qxnq/8Poro=;
        b=IC/LjHZ3F2DlbQ9WAmgnCf7/BfLSm5K0jB1+LXeZODlcOCYaacM7l1kw4H0278E92H
         Oa2wPofzhwT5cTuBRle1MU1se8HjIDEWD2KCEYV9FP1Ciw3M9tsvDcZH/NsOIkGDoNHZ
         XY1daTtnxRtg3R32MtQH0SaCdAf1NsmKjN4ti1R9Xu2joFbiAi48dtkv4cKPsjEdsspT
         DYwKahiKwo/XsY9eWuD2quqp+yCnp2MQVTuT2GE+eb+L0aoMV/FqsgMHbYeW0zp8khI2
         wNVFPT5h3MWdPi64OXpsJmOtcmHioEiDXIJ+Nbbofli31kcAJy3Jp913vBSJesPyU4Wa
         yb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeBA6yFvU0Qveao6cWcOdhdMdkmBnLRZBnSTKPFr/0CoCrDDU1O8te8+4S3T6EwY7A0SZCIqu9sQ8m5C87@vger.kernel.org, AJvYcCUz2kqfBv8HnpPDHBiwKftRK3+aSDd841y9whs86yCuTvtc9P84O3YHOLAT7oosisPertNS7UzfrVpz@vger.kernel.org, AJvYcCXQq1pdXVvPycugSeyS7UifJ5o4nZFcIu0BYyx9EJhmcDB+kYEUBoyOo+pwXXAucx2OFYcO6LTBB7s3@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEu+gq6FT45QqLqELdg8kkvS+Ovt50kzKdMSfNONSlmxcdUm2
	MYLyOyuX0UCxB4Yz+kwWaiwDiVyR5F74H1hqiY7jiQOu3Rt/B4/1m8StLmw+
X-Gm-Gg: ASbGnct0n0LPLNx7/83MxjboQDrmyLbfi/Psv+pL+ew97vZvtNr0s9LXIXKsIjM02O2
	zTkwOx5yYfqWHNwcEPLWmnymBHnHAt28hxvXBFDODv7Tg6P1rBvi+GDLKyN0eCr4tN4RFWBFNF6
	5xhP6rO06MayRHrcvc2JkTV2jqoPNYfpZLL3cycR8R0PaZU3f6MxFxShSxpyq0lTGKV1k10hIc8
	worgxH8EEg18aNKlFwTcIvK5L10Qw7M9uC3KLwwJP+enljXm8JiMmp3ideLlJLijikCL+Mup9aN
	Erg1v+/Eok7NsKhJVMirhMMXZePljwflTPdINgXwHvejfawysPqc+jvWJbgZy3FVHg==
X-Google-Smtp-Source: AGHT+IHeQHxQhx1+o/gyFU8ozlHeFVob8ZCTDWC7tCyz2WBdmTGTLPuF/rs0+pnairTpV4Szoz7sbQ==
X-Received: by 2002:a05:600c:c17:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-441ad3c6509mr2893165e9.18.1745878504973;
        Mon, 28 Apr 2025 15:15:04 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm135901085e9.33.2025.04.28.15.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:15:04 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/5] hwmon: pmbus: mpq8785: Add support for MPM82504
Date: Tue, 29 Apr 2025 00:13:32 +0200
Message-ID: <20250428221420.2077697-3-paweldembicki@gmail.com>
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

Add support for the Monolithic Power Systems MPM82504 digital voltage
regulator. MPM82504 uses PMBus direct format for voltage output.

Tested with device tree based matching.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 Documentation/hwmon/mpq8785.rst | 20 +++++++++++++++-----
 drivers/hwmon/pmbus/mpq8785.c   | 12 +++++++++++-
 2 files changed, 26 insertions(+), 6 deletions(-)

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
index 00ec21b081cb..7ee201550554 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -8,7 +8,7 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
-enum chips { mpq8785 };
+enum chips { mpq8785, mpm82504 };
 
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
@@ -59,12 +59,14 @@ static struct pmbus_driver_info mpq8785_info = {
 
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
@@ -87,6 +89,14 @@ static int mpq8785_probe(struct i2c_client *client)
 	switch (chip_id) {
 	case mpq8785:
 		info->identify = mpq8785_identify;
+
+		break;
+	case mpm82504:
+		info->format[PSC_VOLTAGE_OUT] = direct;
+		info->m[PSC_VOLTAGE_OUT] = 8;
+		info->b[PSC_VOLTAGE_OUT] = 0;
+		info->R[PSC_VOLTAGE_OUT] = 2;
+
 		break;
 	default:
 		return -ENODEV;
-- 
2.43.0

