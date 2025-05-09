Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905EB26FA62;
	Fri,  9 May 2025 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773613; cv=none; b=mllxJs8Nn+C3k5WbH33ADufHQ4pxOjNHSAadmCqJ/+zXmDEPrJlBzZJOyX4IRv5VO4q717da/afFSgE6N0oyR86Y/uaaJen7flpamA05jnmWXEBn8kUygWIcgrbJ3YkA0/35wdKvnWVM130OnuRXWO8+dt5e0M+zarE6qaRf1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773613; c=relaxed/simple;
	bh=l//vUM087xV+nJfyiGsMAfxiiqa54Dz/LRTuZMSZkfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paCk/uinVE2+OtIoTvftBhI8OwY2j9dgBiYbVqxRgLPsumsak2ig7JKXHU0ZWAdL+2cuE/v4hCzl2wPNDzR8yvxNM5RCnlejdom2zgQK31MipgQUQO4hEfFwwBmPbRA1Lsu2eAHwjtQO3G1x466FHv/qypfK40PSZbS2Kogmgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxjj6J5H; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxjj6J5H"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so17659635e9.1;
        Thu, 08 May 2025 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773610; x=1747378410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mJxZyA18DAsV55MUHihR0kGwoLDmPI7gH5j+D/cQmY=;
        b=kxjj6J5Hz17qvteFavT+eUvJXRH5Qg4dTMzCk4RGkdgfLobtttaeMYmgtfihpMOReV
         K0sYGABC49WH4ocKk5Y+dlmHMeiucGMB1Vv2JsQUlkh7NMvjxXeK3OLo5f2kdPEP5CSz
         /pz0EdieNGYpwisyfqaX3WNNZdG8RCH0YrdI6+du6BAir4jopGByp5XJqz2EKGrc593E
         vq+P2O39mQ/jc3RnVRPHWOsoUig0ydpZXIDUqnZjTp+fXRHDagKAk62vmjYsHhRsr0DA
         QEc/1EWixJfWCbSjzyupHU8cRNiRKNxTfV0448oKucaFZ/ayIM2fcsuVPyWvQBj8nCkh
         sN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773610; x=1747378410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mJxZyA18DAsV55MUHihR0kGwoLDmPI7gH5j+D/cQmY=;
        b=O8e+uKjyoaAw0y9O3KzHDY6nfo8oqUK8OcW9g2+ZHkLiTqyOVTeBNLzBJMhNpKhmL7
         YQmWqXprQLI7XtKfJXk+J/n3EGV8ZaAw454JVpIumqRp4eEl9ZxP/OajX8YEkwDrRr/H
         bhHDG8PrhYlMSAgY7NOAUNnL/IO/87YJiZ1lLj3Lmu2tixSi1g53VMg0EeJUAKdq/j4x
         HkzTkl/tD3YG7TDmVJuShkz5xRqPr1oJNBcTXgB0dBhNg3ql6ekUVI46LxzZZdOH3z0s
         oc46yUa4ZXqo9XcJfWaHIxFxxeD8klFgVr/CmeSHXHjTZZtjCrfW6RP+JBpJOIVfNcHK
         o+kA==
X-Forwarded-Encrypted: i=1; AJvYcCUzDhnNMpjOdSil7fQMvDiDlkJUJpiQV5g7i4yNZguJE96gAA0BWk+IU6GR6Jd8lBRgDNPqVC6g6xwS@vger.kernel.org, AJvYcCVIeblh7tarTV5w4jwxETXduLaFDWKgbQDQTiC7w2otK8TVrZVdfzjAeJqiZMZLRLQKB+3GfuN2/v259O7q@vger.kernel.org, AJvYcCVqyQLiG3JNKKepHMz5VAKU5XKj3/QclEEfbmCVpdPxz7xkN8fORmM2OlyuuVPnvDhRuo6PMvGzmH7q@vger.kernel.org
X-Gm-Message-State: AOJu0YwX6Rg6joqyRLd10QLhaswD2gJ4eB+ISEm22kGiO03s4007zrvf
	Xx7mQpu5ALkEB4WRpznt4jEYHNAhd/u/LjSV+U9EJMToXd04zvgPAFLxoflR
X-Gm-Gg: ASbGncsoqV8Mqm5+xeJl9urtoOEnZcS7jVMLV/O/muyW3koP8tHnKQmJwOsOtotqagP
	FPrNQFsyVIfe+udtSf6OuQHQ6AP6ItDou6Ix04pdb7JpWeVsJDJyp4rm+XSEsGwPcy4CNel+r8f
	zsJvLCyXW+bp0/rhnb79WnYFrUkwDEkzNq+jYN4LSoSBTkRueYEsMJs4UJ6cuuptz8xEm3r3HWR
	BA22BMswE/7xNBE+uvw3l4iQi01/PMzcaEuDMjscrkzG0FdzIpDyHjOlJWP4QvdM6HJ224+yRaR
	Q6i1l+slZKJdoaDi4M68bQVjRjJ0ydEeOoE7M59r0nTULxu/xwWRyCUo3fnOdPGmHg==
X-Google-Smtp-Source: AGHT+IECt1Fjb2mC/ICq4YSSW6IpGkJhFrpmupSt1M2faiqeR6nyn/ZZhIRL6VeBFBay229oiKvh9g==
X-Received: by 2002:a05:600c:6307:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-442d6c36448mr20301805e9.0.1746773609804;
        Thu, 08 May 2025 23:53:29 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm19276315e9.1.2025.05.08.23.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:53:29 -0700 (PDT)
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
Subject: [PATCH v2 4/5] hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio configuration
Date: Fri,  9 May 2025 08:51:08 +0200
Message-ID: <20250509065237.2392692-5-paweldembicki@gmail.com>
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

Implement support for setting the VOUT_SCALE_LOOP PMBus register
based on an optional device tree property
"mps,vout-fb-divider-ratio-permille".

This allows the driver to provide the correct VOUT value depending
on the feedback voltage divider configuration for chips where the
bootloader does not configure the VOUT_SCALE_LOOP register.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v2:
  - rename property to mps,vout-fb-divider-ratio-permille
  - add register value range checking
---
 drivers/hwmon/pmbus/mpq8785.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 34245d0d2125..1d0e7ac9daf4 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -12,6 +12,13 @@
 
 enum chips { mpq8785, mpm82504, mpm3695, mpm3695_25 };
 
+static u16 voltage_scale_loop_max_val[] = {
+	GENMASK(10, 0), /* mpq8785 */
+	GENMASK(9, 0), /* mpm82504 */
+	GENMASK(9, 0), /* mpm3695 */
+	GENMASK(11, 0), /* mpm3695_25 */
+};
+
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -99,6 +106,8 @@ static int mpq8785_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct pmbus_driver_info *info;
 	enum chips chip_id;
+	u32 voltage_scale;
+	int ret;
 
 	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -126,6 +135,18 @@ static int mpq8785_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	if (!of_property_read_u32(dev->of_node,
+				  "mps,vout-fb-divider-ratio-permille",
+				  &voltage_scale)) {
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

