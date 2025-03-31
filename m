Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF6214204;
	Mon, 31 Mar 2025 15:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436359; cv=none; b=TuUk3A1EjYZsFOmsIqV0SAAkza7cReLXaXQlBq4jANdUgKWln2n7DiJ0F90c5LtS9TSRlhzwDz4YQZj95yY+KhLSDI7AJSKPHlDorOQugb9sf8OUwrGp4IuJsCRa7dOBIc8CxWysM4/G3giiRQG9KASHOGUYCZdUm8zHyt/w4zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436359; c=relaxed/simple;
	bh=X+4YTOgaKia4SBm9JwbRZaGKwlEx4yxWYQVOlNN65Og=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gq5fzNcP8llC1jn9S/LN3WwpHkcQbmQN+hdQq9Xkuox+NE7MInI5pSAxSMS2PR9BC9LWMo+dxGzI77eoROTFboG/mu7FKTprMMp6oMkbB32bnwNsBM0fuafeje1ucelws8thrJByJ+Pw9V+QKeob/f9e5BMjo33J9CEDvpBz6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=y3aLtGlk; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="y3aLtGlk"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 5D3211FADE;
	Mon, 31 Mar 2025 17:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743436355;
	bh=M6Ms59MEu3FxpbZy5ys+yd+g+93FyYw+L8eXiLUaqfM=; h=From:To:Subject;
	b=y3aLtGlkbDHkJ3EsyceO7xgnNME9wiWzFkgVZlAoANLweTOGa31z84gAZTb4xWKAm
	 huJ6kfZ4orhXPxA0mfEmF7oFvOMzRCCDLPKpF8JO9OIA6FjHrifzBWXJ/pUvZ5kil0
	 tjnWbOOsS+l4rWCfVbIeaxpDuLg8HOhHSFTAODl3QfW6ZoPYSdr0/v36J2JjvClaXm
	 O1dZj00iN0nW+DZkk6ZaOrk5uNyoGzyHyKhmMhfU5hDPHCM8DmxCyhB64yc6O4Lo2O
	 NnFtO7KR10i5KdWdB2VndOxAl/tP2LxmlkETpHWzv1IrC190zikgrN4tA6OPLRGKsW
	 rgmzqXPJFV4cw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (amc6821) Add PWM polarity configuration with OF
Date: Mon, 31 Mar 2025 17:52:29 +0200
Message-Id: <20250331155229.147879-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331155229.147879-1-francesco@dolcini.it>
References: <20250331155229.147879-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support to configure the PWM-Out pin polarity based on the device
tree. The binding would allow also to configure the PWM period, this is
currently not implemented by the driver.

The driver has a module option to set the PWM polarity (normal=0,
inverted=1), when specified it always takes the precedence over the DT.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3:
 - configure PWM polarity using standard PWM DT properties
v2: https://lore.kernel.org/lkml/20250224180801.128685-3-francesco@dolcini.it/
 - pwminv module parameter takes always the precedence over the DT property
v1: https://lore.kernel.org/all/20250218165633.106867-3-francesco@dolcini.it/
---
 drivers/hwmon/amc6821.c | 50 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 1e3c6acd8974..9ad4e9b63138 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -23,9 +23,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
+#include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+#include <dt-bindings/pwm/pwm.h>
+
 /*
  * Addresses to scan.
  */
@@ -37,7 +40,7 @@ static const unsigned short normal_i2c[] = {0x18, 0x19, 0x1a, 0x2c, 0x2d, 0x2e,
  * Insmod parameters
  */
 
-static int pwminv;	/*Inverted PWM output. */
+static int pwminv = -1; /*Inverted PWM output. */
 module_param(pwminv, int, 0444);
 
 static int init = 1; /*Power-on initialization.*/
@@ -845,9 +848,43 @@ static int amc6821_detect(struct i2c_client *client, struct i2c_board_info *info
 	return 0;
 }
 
-static int amc6821_init_client(struct amc6821_data *data)
+static enum pwm_polarity amc6821_pwm_polarity(struct i2c_client *client)
+{
+	enum pwm_polarity polarity = PWM_POLARITY_NORMAL;
+	struct of_phandle_args args;
+	struct device_node *fan_np;
+
+	/*
+	 * For backward compatibility, the pwminv module parameter takes
+	 * always the precedence over any other device description
+	 */
+	if (pwminv == 0)
+		return PWM_POLARITY_NORMAL;
+	if (pwminv > 0)
+		return PWM_POLARITY_INVERSED;
+
+	fan_np = of_get_child_by_name(client->dev.of_node, "fan");
+	if (!fan_np)
+		return PWM_POLARITY_NORMAL;
+
+	if (of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0, &args))
+		goto out;
+	of_node_put(args.np);
+
+	if (args.args_count != 3)
+		goto out;
+
+	if (args.args[2] & PWM_POLARITY_INVERTED)
+		polarity = PWM_POLARITY_INVERSED;
+out:
+	of_node_put(fan_np);
+	return polarity;
+}
+
+static int amc6821_init_client(struct i2c_client *client, struct amc6821_data *data)
 {
 	struct regmap *regmap = data->regmap;
+	u32 regval;
 	int err;
 
 	if (init) {
@@ -864,11 +901,14 @@ static int amc6821_init_client(struct amc6821_data *data)
 		if (err)
 			return err;
 
+		regval = AMC6821_CONF1_START;
+		if (amc6821_pwm_polarity(client) == PWM_POLARITY_INVERSED)
+			regval |= AMC6821_CONF1_PWMINV;
+
 		err = regmap_update_bits(regmap, AMC6821_REG_CONF1,
 					 AMC6821_CONF1_THERMOVIE | AMC6821_CONF1_FANIE |
 					 AMC6821_CONF1_START | AMC6821_CONF1_PWMINV,
-					 AMC6821_CONF1_START |
-					 (pwminv ? AMC6821_CONF1_PWMINV : 0));
+					 regval);
 		if (err)
 			return err;
 	}
@@ -916,7 +956,7 @@ static int amc6821_probe(struct i2c_client *client)
 				     "Failed to initialize regmap\n");
 	data->regmap = regmap;
 
-	err = amc6821_init_client(data);
+	err = amc6821_init_client(client, data);
 	if (err)
 		return err;
 
-- 
2.39.5

