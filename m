Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A172E92DD;
	Thu, 26 Jun 2025 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946705; cv=none; b=ECzpgDGKplB8fFY89BoTMd3zNvSCMJuSsep1Kyj6WZk/v2/9Je8quw+e819bqq4vDw3+d4yd6wbyzAE774FB9XZw4BpLAfo+3BFjG9/hMY4cpGdiNnacaxAv4X1n4KcdCRwFK8KIhIhond0eHHeuoFIGvoBd+1IWeo96cOi9hu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946705; c=relaxed/simple;
	bh=r/bYQUwPKhlXrOwPUT8HwFDzwISFoCDFKs+oeDei2qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmXLcWRGrs599DgvJeTh1+WloP/YDbh6FjWAcTpJAYYSqyr2c9uk9qmshSNwVDLnZxurj4puw3q0NrfsHtIRz/fDtr6LnBryzOo4zUwGbzAZPEIUPsJBy4uGXIloULevS+ZEMS8i73ybGJk5VdvbNqqbw9BwKVxdX6KHekPt+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+a9YW4b; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+a9YW4b"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0df6f5758so70638966b.0;
        Thu, 26 Jun 2025 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946702; x=1751551502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B9UQTA0XO+RGIXXW8DAfCHZQQ8vv/QjGxfsmB/2GQk=;
        b=V+a9YW4bUODsprBmkb16Ww7gDQisPvmLYdwGy1XZ6Fm4+0qKrgDsvk4IFv7z94KuHK
         5Oy1/o65vs7TX4ChZeeEzDq80hHlSh80ZLfYzewk4G+3zFK74ChlCt2ESVYOpLGiu5nd
         M2uS161CH79u6w4nUaZb42UaARvPjbVl/JxMEqrv3+87DedHoxubecdGg3vHTC3AYbzN
         y8RuwqboslCQKYAXhEUspTjUjBDZ1GtU/KMcxkGZCCjzy2/j8EZZmsX2EIOmMm8uIIxV
         ADvLZc7GFgBftZUKxnaJomnTt+8daifnEmAT4JbohZZP5rE43Amie/g+JGJ1pN3OqvS/
         Hjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946702; x=1751551502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B9UQTA0XO+RGIXXW8DAfCHZQQ8vv/QjGxfsmB/2GQk=;
        b=H+UqjVaPu2Qn+TuwK36x6n7jsKSHJZzcE/yk99y7J+8FIlKW9I/C0f6C11F/QAMvJ3
         PP0pGplrH/aQW0x7/FayBVX/rJqVX9/DJNfftcgJC21Z3jzj7NywuYgIw9GyJe0PMCp1
         ehIFU9SD9YU2j7ZbVLaeBjICMXPZr/HVnIl7VJ8CYUSQMkfpT1SXRFBS9+CQPlUNNk0Q
         bfARFnV9gz18JAok+7E3e7hHTTWGWxj8nHn1Ph/mgX5MpX2oWyAWBpHxYQGTWSkpSInJ
         R1nhcHbWsmNye2N6tdOWwdIVHYmnRcJgNUSpzGKyD79bl7lfgXJtNGj9y2QW81lQwRNU
         DcxA==
X-Forwarded-Encrypted: i=1; AJvYcCV0vPJ/5AFeb3CBBGguVXo1MiwhNd0rfVKuREh7LrByQ3nizCDYP9VN5kHt/7/uK8ngpVXJJgORE5u/7fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQahY38ynftjpKka74AOD8Su+0y5+wwBqLr/eY6F0LIc+vLgg
	L9k/sI2Fej0RFJNMeOPyKjbhZZULnWqDuLsjSr7mKRlOCq6mCEPtnyk43bkrVRRCo+Je0g==
X-Gm-Gg: ASbGnct0ngyDKYvqpD7xmdh7pvgjXraZS7icrozys/LkwryV8Tmol4g7qZS60gyEx/y
	yOnAQv1pFLAjQD4BdGdhSWB/e6E4b9wiodlGmm/9sW7jcaZalRy9cXr+EJAL8ZAh0TVN06gtCYp
	NYKjEG19gr2C3SOjSJMNY4bFXGXmfVXTGJ950gHO/wAOuSgBIDR2L09dCOYUuSlUeoLIUUDG7U1
	ey8IXkoLUVYBaFh76KceLbSGQqL0sgZxMyPWYkB4zqtygUa1+nuOsuqEURbXdEvDzuXw/4SH+aN
	O4gF7w+fm9jrA2xH+yyrs2IsniKbn3Bnz0upluMnNM8WqO6UprzpEpAbcPlUEFKngBhD7kCe5Lv
	VVyTS/eZH22Q=
X-Google-Smtp-Source: AGHT+IE07fXK7KUi/Kcs82M8/c4AI6q7J6d/VrAbZNafj4SS/HHhE/zXHJGl4LKHd9oOEFh9xlCkuA==
X-Received: by 2002:a17:906:c10a:b0:ae0:628a:5093 with SMTP id a640c23a62f3a-ae0be7fdd39mr844096766b.3.1750946701083;
        Thu, 26 Jun 2025 07:05:01 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:05:00 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Thu, 26 Jun 2025 17:04:31 +0300
Message-ID: <d8596aeea72b2acab614277372f15b773ef3d008.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
The original behavior can still be used when the cooling-levels property is not specified,
ensuring that the new functionality does not break old boards.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313b..504e7d254 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -15,10 +15,16 @@
 #include <linux/thermal.h>
 
 #define MAX_LEVEL 3
+#define MAX_SPEED 0x64
 
 struct khadas_mcu_fan_ctx {
 	struct khadas_mcu *mcu;
 	unsigned int level;
+
+	unsigned int fan_max_level;
+	unsigned int fan_register;
+	unsigned int *fan_cooling_levels;
+
 	struct thermal_cooling_device *cdev;
 };
 
@@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 				    unsigned int level)
 {
 	int ret;
+	unsigned int write_level = level;
+
+	if (level > ctx->fan_max_level)
+		return -EINVAL;
+
+	if (ctx->fan_cooling_levels != NULL) {
+		write_level = ctx->fan_cooling_levels[level];
+
+		if (write_level > MAX_SPEED)
+			return -EINVAL;
+	}
+
+	ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
+			   write_level);
 
-	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
-			   level);
 	if (ret)
 		return ret;
 
@@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
 					unsigned long *state)
 {
-	*state = MAX_LEVEL;
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	*state = ctx->fan_max_level;
 
 	return 0;
 }
@@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
 
-	if (state > MAX_LEVEL)
+	if (state > ctx->fan_max_level)
 		return -EINVAL;
 
 	if (state == ctx->level)
@@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
 	.set_cur_state = khadas_mcu_fan_set_cur_state,
 };
 
+static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
+{
+	struct device_node *np = ctx->mcu->dev->of_node;
+	int num, i, ret;
+
+	if (!of_property_present(np, "cooling-levels"))
+		return 0;
+
+	ret = of_property_count_u32_elems(np, "cooling-levels");
+	if (ret <= 0) {
+		dev_err(dev, "Wrong data!\n");
+		return ret ? : -EINVAL;
+	}
+
+	num = ret;
+	ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
+						   GFP_KERNEL);
+	if (!ctx->fan_cooling_levels)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "cooling-levels",
+					 ctx->fan_cooling_levels, num);
+	if (ret) {
+		dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
+			dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
+				ctx->fan_cooling_levels[i], MAX_SPEED);
+			return -EINVAL;
+		}
+	}
+
+	ctx->fan_max_level = num - 1;
+	ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
+
+	return 0;
+}
+
 static int khadas_mcu_fan_probe(struct platform_device *pdev)
 {
 	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
@@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	ctx->mcu = mcu;
 	platform_set_drvdata(pdev, ctx);
 
+	ctx->fan_max_level = MAX_LEVEL;
+	ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
+
+	ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
+	if (ret)
+		return ret;
+
 	cdev = devm_thermal_of_cooling_device_register(dev->parent,
 			dev->parent->of_node, "khadas-mcu-fan", ctx,
 			&khadas_mcu_fan_cooling_ops);
-- 
2.49.0

