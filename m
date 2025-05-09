Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0414221293;
	Fri,  9 May 2025 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773590; cv=none; b=TSrUiRyRt1GSEiYpIaiWQ5msx9B1V+3iWC91qnKzC+XI/Q0fzRuJeZZnsUp2QIv2+cSL6+DR2wewVfxQ/sB/61OFGadVexCzz1sBqxi/0ZTAu50EWNckkZ7T3SNoCxn8k0Q5HHT4oFW21G030/QR2xfbFv4M9vuIcW+5SpaqUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773590; c=relaxed/simple;
	bh=2idPfThrWw8aQgWtm4Z01+9Ucg83XpwGIBJ7OPCurko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYr7V4xm+bCFZ/dbvMdTZ8FmQtsAE2SXX0D36BzfoJ9pe64rxekqRfcRRw23/U6p3666usVtYyfQtqwU1lYTAUbT1+biibMA3Qi1TTEGDDbCgNCvW/a/zg9ijUk3WJoKVUfxP31pLwjhcT6UVdCFs7EF3buJfTxPhp1WGS7pOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEsBvIjy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEsBvIjy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0ac853894so1465051f8f.3;
        Thu, 08 May 2025 23:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773587; x=1747378387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDgPHFp407MffVy+hvMLpY3deWQ7hhBKSUfGaXpJ5UM=;
        b=KEsBvIjyEFVb63UHRhYKrrbQlezLKAQBdB0iunfnLBTXuEq3DW58qkSgBB7Zidhg4w
         zYtMzHgvByU+JtFAiHIRrML3oRtIHd+thXF7vN0ZrKWyRUvqNkQkafLYoDHksDnJxIBO
         7825a7yGDRx/FJ6Um4IYM72gphhQdHzktZ1Z3Pf5mq74V7I2IzF75fiyU+JIhni1hf78
         5uwuXVHMajx/kKpFE/FG1uGRPDPYiflfkU0C3Vq3Z1dzEBIGvHY1K+3WUUMKwdGpj5QS
         AepZv0+zdZbsfOlJrb2OzYfKHE/GG4IHRgjpkm5X/vZS0lrDoI5DTr9gfpOFEbBjwl6B
         VWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773587; x=1747378387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDgPHFp407MffVy+hvMLpY3deWQ7hhBKSUfGaXpJ5UM=;
        b=lLfygr7RufXvOqvA/Ecd2S2FYkb4nPQTClkrPL551+i7R/5Lsu79A29oh/Jzy6Yqn5
         FDwViTUt1UgktSxSI8Cc4M5Ow6P7YNNuUWkkY7TTw70QYyi1qaWa7Wg8uqELLOWYjZOy
         FVRaatPsncN49MlCJpp82qBmYYOg0K1tpWJKS/bUlgG7R8IZGiRASDZqKaA1nXC8gij2
         /RKnp97HrV8uUlR3Ps4fg2FlElrqmX93DaJjrJa2vSzbLMcGVOVWIk7H0c99hiSo83yG
         /59qnhE2Qb5IXPbpyZdd42HhYTgRU76QI2SbvzWFois1LBdsplmeeMLEhgMgec/W3DzK
         reIg==
X-Forwarded-Encrypted: i=1; AJvYcCUn621uphJ5mpjRRoGXAzrhk0vUSO9SmIQy7xoiJCoP3oaQinTrK4DXh31rOjuEywQz9LkL/4MeKrZP@vger.kernel.org, AJvYcCVeF1vk6w9FFbb54Fnk8pKl0fIoYM5YScZ7QFujI17KtHD7jfTXDONk+2z1luTKjvOIqpnkfqnVFaWI@vger.kernel.org, AJvYcCXEfIFxjZddbMwI3KQSmU5aCHFOqMV2tnKPRMid+TXPZgjgop/Li/9pUlroJ6adVfXr4MNygxabRMSz9mfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxopQtsPpaEZfBgd7aesAUKvF+uMoVdDqQIvfOH02lMBIyR61Oq
	Ds70TNjkkLtpaI5dTohjr58jEnG9vTbNTBoJuugzzB7Q43fpns+V5uPGTiZV
X-Gm-Gg: ASbGnctXxdu80jR3y59+qdRf3sEG3nIrIycvJQCirIw+GJZL+Vm1EFVtizIMXEhZsE/
	ktQEOuKkYIZxLxI870/V/Cy+tbuxo5e+0nhYvoJAj49kCdv25E9dx5IK/y+feSJM2zzXd6xs0Eu
	kXf5DoyfKa530Ok79ggFN68/nrr5dTQEJV15Ut0NjTU+biG32uDMttCBG1zBPLyAxRV5ye9T9zC
	H69BB5CyTLzv0yqOxkIWK38zKQl0P9+3ZPsFMzMS2ZVpR4ao/zYq++VceoS7oQRbK/gBCcW8bXh
	7YiBmQyLPwFRrsDJWNcgYpGBsFb1debqZn0NyWb0HR4/TvfYRanhgJx1/SswNqFuOQ==
X-Google-Smtp-Source: AGHT+IFKa8IQhq/R2lqrpyp0HlL59TYo+i7nnrznDepx+EnOcQZ0BCOL2WOj/cmQzz1fR4+XpQaSKw==
X-Received: by 2002:a05:6000:40df:b0:3a0:8383:ef19 with SMTP id ffacd0b85a97d-3a1f64ac258mr1799084f8f.51.1746773586665;
        Thu, 08 May 2025 23:53:06 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm19276315e9.1.2025.05.08.23.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:53:05 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/5] hwmon: pmbus: mpq8785: Prepare driver for multiple device support
Date: Fri,  9 May 2025 08:51:05 +0200
Message-ID: <20250509065237.2392692-2-paweldembicki@gmail.com>
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

Refactor the driver to support multiple Monolithic Power Systems devices.
Introduce chip ID handling based on device tree matching.

No functional changes intended.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

---
v2:
 - no changes done
---
 drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 331c274ca892..00ec21b081cb 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -8,6 +8,8 @@
 #include <linux/of_device.h>
 #include "pmbus.h"
 
+enum chips { mpq8785 };
+
 static int mpq8785_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -53,26 +55,46 @@ static struct pmbus_driver_info mpq8785_info = {
 		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-	.identify = mpq8785_identify,
-};
-
-static int mpq8785_probe(struct i2c_client *client)
-{
-	return pmbus_do_probe(client, &mpq8785_info);
 };
 
 static const struct i2c_device_id mpq8785_id[] = {
-	{ "mpq8785" },
+	{ "mpq8785", mpq8785 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
 
 static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
-	{ .compatible = "mps,mpq8785" },
+	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
 
+static int mpq8785_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	enum chips chip_id;
+
+	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	if (dev->of_node)
+		chip_id = (uintptr_t)of_device_get_match_data(dev);
+	else
+		chip_id = i2c_match_id(mpq8785_id, client)->driver_data;
+
+	switch (chip_id) {
+	case mpq8785:
+		info->identify = mpq8785_identify;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return pmbus_do_probe(client, info);
+};
+
 static struct i2c_driver mpq8785_driver = {
 	.driver = {
 		   .name = "mpq8785",
-- 
2.43.0

