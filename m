Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC518A6A8;
	Sun, 11 May 2025 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935864; cv=none; b=Gs6O90Fqsejwxa6aN/HnCvsAmCvE2J5jGNJhFVbvYF/zzveDvA3VH6ZXGmmAbzRgWibMFYIZyB2JOuBqX9RXGaOg+33neTDgqi8bCQ2+gX6jLSdv70g/DSFZEzWAMgHNUGAjCeTyK2eJBErc5j3p4qemRQcQBccn3xWiYhi+YrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935864; c=relaxed/simple;
	bh=GQuN8y6ggGwA8hmdtSJ1FPl8vpx4Ppxc28x8OC7841s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6BvS1HyMS82W/ynCTKd+JbbjmS2zFeyNIx6QY6vuxGYfqoDtkL8nJyqinPtYaWCUxHwKtgrdHqi3k81XiqgNbm1+xjHlg5J3LrRhqqv0yGyS3+rRQmHsXTwelELGCzHuBxt4EWPRwsvBggX0ib1TRzpxqZdyCrvyHgXCIPAxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSbTrtGP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSbTrtGP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so2482780f8f.3;
        Sat, 10 May 2025 20:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746935860; x=1747540660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcX2FzfNWS4ZbAVrn7bw1wbI1siUi20/FPsyq5QKJUw=;
        b=GSbTrtGP6CzOgcoCmDoOOmSrNYJl1ixlblrLZ0hA7nO7L1AMXU0IkFyvb8tmLu/xew
         B/Ieh89vXsztZuZAM7yg6T3owP/vX5d21fFxZha9YEmJSKCXV38Lqqi/XmM2gs+cYSTl
         3NPGxxGVl1KcOLs0F+hwgmu+CDqRD0tvtP3+r8dutq+nZQ9S25fVf0MY/SzZZyuJ8k0q
         zgQDrvPDb8Bx5S386aiqVAuzJ2B+QLDsKAPW94uKOyOiXAfwoi4YD4qi2oWwxScXH6z9
         jqiBe7E8jOiMOQnJG74MNLJM/Wu5csuKJ7BOcB904a9v8q7zoaQ5DS4CCO/8uAulHny2
         Uqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746935860; x=1747540660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcX2FzfNWS4ZbAVrn7bw1wbI1siUi20/FPsyq5QKJUw=;
        b=q7UHcPj3/jhKv4IiTctJM/NDMjUDVjOkfayWpIGhaM9o55D+gEvIrULr6heGF6CLvF
         8tkLcW+NwCeaHc+JHB8gf/9JkPbcAMR8izCfh6N6l8H2z2keipjoW3YhfXEm402gmRdu
         NO6UeYb8MlbQVkw7zU8JfBFQUgDepujiUuE7UBZWAl/sKgCdsMe6FA1mHkYssobYyXvX
         rtxmquGPSmUkwFN5aOHdxYs9FPyrCs8nf4mk8yeCbbJHm8ijO6dVSyXxJBYbyIyFRnCH
         bOR4wanQNTpl0Gk8Re2+4q/K9LRyOd8PunhFKd0aJpxBrhiaPChCP8U86PZGdx2iXAUm
         Cojw==
X-Forwarded-Encrypted: i=1; AJvYcCUHZ0+G7O7t3mzMfs8rp8p+JEynH+pxNs8I1YBGWJbzQ91+nUNz4oqeRSwE5eYJY/WH88zvw89Fm8vj9RoC@vger.kernel.org, AJvYcCUgRirSOTH2mkVP6jYXZxPs43yOh2B8sUFm1sEcUoD+XwkZW08U7y0LJT5RXhCAueErtANzJBgLPEJJ@vger.kernel.org, AJvYcCWWlU+soCQYwVjQd3sVbGbauE8RCR9iSRuUIHGF6X96vqLv3KqudqAxOS/7l7Fla0IpsE160rowInCw@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5f1TWNV3MoeWIetlqCD15FAsjY8kUSNNXSEkDyc77FQLc5ok
	WBzKZLbD+poWQkpqGKlQKA9f3vfkYHkqRqIFPbJ6EhV3idsCVg3wacQVrbvy
X-Gm-Gg: ASbGncvYa+ZwtZIuWbY3uyw8+XcrifCuJqMUHIQfKl2OToND7wqB8gP9N96g3rOrq58
	TffkIqCuN6UFzKQVHxPq93oWUzztKqU4BW2jODlyU+q9lrletmrT7JascBBJsgabIXz96TcnMNp
	bRRIv3XOpp4SVtYQ7L3l08/Uuf7V8KbPKPAuQu8ueozSkFos0c5H1SbeCLaPZEqqr5webjWDxli
	6roARzaWgA4zBXSA3XVxpz7w/BJ0VKrNy7WCkUhWv6G/ZNZi9gqKBcja7DC7VcaOZv+qKxUoHqX
	mfuNyxAnderBP52V9k9rjeTYkn5AeXDnNG6J56gCyxH7dXes7tIJt4/lBlH+yfNoKQefvhiD2xD
	K
X-Google-Smtp-Source: AGHT+IEieMPNdSxvs2kn8h2BgpqCFNWZ+axLbCMjw70PhgV0KIdRFdLNYeDWS8GJ7ydM8RDtVTTw5A==
X-Received: by 2002:a05:6000:a91:b0:3a1:f5c6:2bd with SMTP id ffacd0b85a97d-3a1f645f228mr6481258f8f.31.1746935859929;
        Sat, 10 May 2025 20:57:39 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm8163963f8f.92.2025.05.10.20.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 20:57:38 -0700 (PDT)
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
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 4/5] hwmon: pmbus: mpq8785: Add support for MPM82504
Date: Sun, 11 May 2025 05:55:47 +0200
Message-ID: <20250511035701.2607947-5-paweldembicki@gmail.com>
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

Add support for the Monolithic Power Systems MPM82504 digital voltage
regulator. MPM82504 uses PMBus direct format for voltage output.

Tested with device tree based matching.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v4:
  - do sign_extend32() without check the MPM82504_READ_TEMPERATURE_1_SIGN
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
 drivers/hwmon/pmbus/mpq8785.c   | 29 ++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 6 deletions(-)

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
index 2e7c0d0c3f81..8827d5a57310 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -4,14 +4,18 @@
  */
 
 #include <linux/i2c.h>
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/of_device.h>
 #include "pmbus.h"
 
-enum chips { mpq8785 };
+#define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
+
+enum chips { mpm82504, mpq8785 };
 
 static u16 voltage_scale_loop_max_val[] = {
+	[mpm82504] = GENMASK(9, 0),
 	[mpq8785] = GENMASK(10, 0),
 };
 
@@ -41,6 +45,20 @@ static int mpq8785_identify(struct i2c_client *client,
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
+	return sign_extend32(ret, MPM82504_READ_TEMPERATURE_1_SIGN_POS) & 0xffff;
+}
+
 static struct pmbus_driver_info mpq8785_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
@@ -63,12 +81,14 @@ static struct pmbus_driver_info mpq8785_info = {
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
@@ -92,6 +112,13 @@ static int mpq8785_probe(struct i2c_client *client)
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

