Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABA4280010
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763027; cv=none; b=ATxQk/PfkSZB7m/+gTMwe8XDcTpzwZzQPEOKzfOKqffBXwjcbru6thataUh78kDdx6J/oq3G+o6UdvkndH58E/+4xaTLvw80c9oeAXb6ApQwXP81DOm/J8CBf/QM1qR01l2KPvWwJcwIitvJRf6W+4rp8WfX9Q6ZMrHXiXuvxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763027; c=relaxed/simple;
	bh=sl+FbGCFgUh0cLIIGBUbbIXxFtqMeN2ESuE9qcu6VlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfxjHGTUfQDX0mt4WkT7rloAGnda/0xVOjB5lx0hscoAqeth40RlHnvyxU642RqOtqxmsQd5NmiQ7hA2vqnj7hru/XEP0l8An3UquGFrcApi7ZYHiJYytCXuccS8P5CUcxhbxiyVrojHggPBHppRFdPpMuFOSMLKoZZ6ajlBdX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=dyCJvgSO; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="dyCJvgSO"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7cadc92771dso585324885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1747763025; x=1748367825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//GTCbOPuXsQxIKhsrLq0DkXd+60Fx6SU5NzAGZER7U=;
        b=dyCJvgSOvNabDeVSA/cpiUrziq6h5fESIZFVI2oTEdcXeVEfASXEozlR/I5bTkKxBS
         uqIYuYsPBYSrNKlaGEm2PpITItY6PJduKTaTYsq/ONXPJxf9gz7fAqhYoQkVi0+TAI6R
         eGC5g0u+Z0DLHwUOezotwVa5smbFI3Q2JPMh3SJ2zu8mb9HOQ3l0mOOudDV9/BQX0JXh
         kcfR/8R9PNLmVIo1ieNVvjnMFI+vEBfAZkM+dWIC5v/1wUdAHSCMrpL292mRH8AfNkfj
         81GAsYImcI2+jejRXe9NEeApCan5xq8TPy8uMEjuRev7eQzN0kMViX2H2MQaO40PXyKh
         u60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763025; x=1748367825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//GTCbOPuXsQxIKhsrLq0DkXd+60Fx6SU5NzAGZER7U=;
        b=JQVDnRjtFDNVAnoRyJox2gwBH2vvxbyvBuUU0/pqQ6QDyUbt6+AdPT65JZoSHtdW/n
         AKBmA2HkyedQEOgH/58WQFH/2kzWNSs2agrt8Xo/PO5io0jLDxkgXaFbC3Dvpva/cUi1
         fJIVBeHVwFKjkz62/QKC4BpW2BTEPolo5hT9B8RIy39FFI3BeFZ8/2mBreLEIxltl7d1
         xzmJiHPnKv0O19gpJCP7GirsAlxWvt/p0zwerd2Fx1aJiWTW5ifpByqJG5t0E1lPAosD
         Ek/XwoowNrVtdT68RrrwPh7Ay8PQBqF1+uIXTj5wFg+QuwJRToL4nWbFeGANBz5TYJb7
         y2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWyO0UNIKrLgsjw7mg04cvEbvRxDqEHsd1j4CFBGxlhmNRZKC1YqRTmS9ZfU8l1068AYVzAACQSMRR9qoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuBTKMdMbeh68iCgzCWaW0qbngbP8TRPyN101ffxZFj52eCog
	aycihLA994wj3hXc6wCtm2v+1mv1Ye+Nqos5rDBXUhVIpsoNgUSCzDzVXvVAo5CYWQ==
X-Gm-Gg: ASbGncvLHgYXdUkHloyoFiiLzGjC2V7eE43gM/k7RTULC30PD4yZXskxXIXHybjJ1XQ
	TAMuiP/u9PjO6Doijrfv645I4iOc8cw/XYs6YYkIy5RT0T90V6FDKGmYXXZZ2rjTCX50kbW+B5M
	Is6cfZYbsUTPJv+XwN7SwzMja2zQuM6E0aOIhnMiQDxdZ0MtOf1W5sq3i3fY8adXyytu4sgYOFj
	q+LF7KL6XORsMRmOXZv02yflJP/Le4YPjWFMfsVGn5Taz+Yr2I6dT06mRuCdC2Rm4QBQd7t4rft
	TDAWvkc6E6XryPL17ICUEuWXD1zneP4oyOBoUL5JOqALUOuTYA0jG0O+IuYeHQp2hQX0o2MV9SK
	rrKM+b0bdiJr8y0/qkcBQCVxQXg==
X-Google-Smtp-Source: AGHT+IE36N4uKMHVtNBPowo41ka8uj65GwK1GS5fqiXZBuL6KOO85LIE4flCa2HGG7jSc88SE3U9hA==
X-Received: by 2002:a05:620a:459f:b0:7ca:f349:4265 with SMTP id af79cd13be357-7cd4670aa2emr2553493585a.4.1747763024810;
        Tue, 20 May 2025 10:43:44 -0700 (PDT)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae528553sm72660101cf.68.2025.05.20.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:43:44 -0700 (PDT)
From: Job Sava <jsava@criticallink.com>
Date: Tue, 20 May 2025 13:43:38 -0400
Subject: [PATCH 3/3] mfd: tps6594: Adds support for powering off the PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250520-linux-stable-tps6594-pwrbutton-v1-3-0cc5c6e0415c@criticallink.com>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julien Panis <jpanis@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, jcormier@criticallink.com, 
 Job Sava <jsava@criticallink.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763020; l=2125;
 i=jsava@criticallink.com; s=20250404; h=from:subject:message-id;
 bh=sl+FbGCFgUh0cLIIGBUbbIXxFtqMeN2ESuE9qcu6VlQ=;
 b=t9jR0ycbMi8aS67LKhkQypLvnJEh1eq1pSrZmuqhqR5yEv0sWC7On47ka8pQvbhOZbIfdEHhv
 i8mimht0nRfCFTDPiYI9/CSsHw8SJwGMPoMoLRk6RWyTZ95uOeiLpIP
X-Developer-Key: i=jsava@criticallink.com; a=ed25519;
 pk=DPPriJ+pziqtCZ0EIomf/hKU23s5T1u4WOQaT8BpQSw=

When the FSM_I2C_TRIGGER register's bit 0 is set it triggers TRIGGER_I2C_0
and the PMIC is transitioned to the STANDBY state
(table 6-18: SLVSGG7 – DECEMBER 2023).

An ON request is required to transition from STANDBY to ACTIVE.

Signed-off-by: Job Sava <jsava@criticallink.com>
---
 drivers/mfd/tps6594-core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
index 1b0b3d1bf6c4..f4c434c0d87a 100644
--- a/drivers/mfd/tps6594-core.c
+++ b/drivers/mfd/tps6594-core.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6594.h>
@@ -615,6 +616,19 @@ static int tps6594_enable_crc(struct tps6594 *tps)
 	return ret;
 }
 
+static int tps6594_soft_shutdown(struct tps6594 *tps)
+{
+	return regmap_update_bits(tps->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+				TPS6594_BIT_TRIGGER_I2C(0),
+				TPS6594_BIT_TRIGGER_I2C(0));
+}
+
+static int tps6594_power_off_handler(struct sys_off_data *data)
+{
+	tps6594_soft_shutdown(data->cb_data);
+	return NOTIFY_DONE;
+}
+
 int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 {
 	struct device *dev = tps->dev;
@@ -623,6 +637,7 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	const struct mfd_cell *cells;
 	int n_cells;
 	bool pwr_button;
+	bool system_power_controller;
 
 	if (enable_crc) {
 		ret = tps6594_enable_crc(tps);
@@ -681,6 +696,15 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 			return dev_err_probe(dev, ret, "Failed to add RTC child device\n");
 	}
 
+	system_power_controller = of_property_read_bool(dev->of_node, "system-power-controller");
+	if (system_power_controller) {
+		ret = devm_register_power_off_handler(tps->dev,
+								tps6594_power_off_handler,
+								tps);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register power-off handler\n");
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tps6594_device_init);

-- 
2.43.0

