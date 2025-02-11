Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883B267B60
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294921; cv=none; b=d7OyHeXXoE+oQcO5aOMc+tOyVhv5LPS6fcTQQg9EywTRghDyE7Rd2U775DURn/dINsELmqi1AOinf3/ppxXKxP3yfmxa/9qEK3BJ+UfRU5bSkMQ5m641qDl2GfF32C87NuUUXU9eBDlpEsWYVt5TRFEk3D3+cs10A75k/9A1BhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294921; c=relaxed/simple;
	bh=aFYZ6uitcWrrRO3QpVWn0nNaiQ1LXsJLRLMMtNT53bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngylRGg0/MKW7Mu7qJIfEd/c8bsqrNxRiis9o8AG6j7BfvZp2yYwan0eAwXH+Jap9ZZRb7MyorpXHuKk7gcfOnJxOkzujUk8xns5Za+LwR+G6kl1Kk9ncCxB8q5QJaS1UuTFlvTQ2XLN1eYbvzZto2w0VrnVu6XrXTgXpYdbsbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y0kZ5zRr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y0kZ5zRr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4395560cc13so8261645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294917; x=1739899717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9bx0I47Tn6bEo7jRo7TyxG1K/HAB+sHkf2wm2VOOzI=;
        b=y0kZ5zRrZbKjre6Af3KM9mVrGwD0XIhOE/W9GTa8GSTXn77L3dSbGLeTfyM06KDPT1
         UXPCOthHeq8KynXbxiYlghVazAHp67pmdBvye/PRCShRZheQIRJVeAQkJQ9VRhkScgN3
         iFF++vTdBI0t+UJQrmy9Ta7hpOO8mH0IJMrNIBWKNN5CoRHrs1KEeT9F0uwlgiph/v5o
         O3dX9hZs7k7o0sDnZBYsUM5RKUxMwwLjZ8RrHKNUnZeOqk3u/urPalIEOiPmv0q04O+2
         W9mhyasJpW7ga8p5nLHvzPkWteuKo4ilNVVcsZhichvFb4jGHyesIogAPtJ1pK39puRY
         mSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294917; x=1739899717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9bx0I47Tn6bEo7jRo7TyxG1K/HAB+sHkf2wm2VOOzI=;
        b=vPN9b9esXwDZtjecLyVwAEdP38KvC3t2brKakxx6x0cXaEWFbZYlbsDV3uLd3xJYLE
         ABAcXMk7Q5ZoyfGON8j0oTsRUoZ7tnr0z6GhrTYfGcCPaKx5E1zN0k4N1IUiMlvHm3bU
         oK81HHPaRzFYdIk3QtKE3030n/KkZaVwMiHYWidfYaetiVyV/LFLfPCe4dHqmPlzF4Q7
         j7Qh7ZU/EQ58Hg3w2jejF1CgX7wNApavkxJ/ngVUPV5qopCAcFMGnaTc1Wxion/3vsJq
         Ht0UEB7vnunpdLuKLR4Nf0V7Yd+tae0xruvapVIX114TtR8xiJdIlpTTNolm5U721hup
         YFKA==
X-Forwarded-Encrypted: i=1; AJvYcCUPNupTYGhTKhWomBcBnUIgB7Z6aF66RZTnN89g/6TIOKejipsy+RinR9sXP3R9StXv76U5sXOE/nVzl2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbuDxcOHG8K6nJcZJNQtWzKsTl+8s32P1dVPHvqsqstHXlI9Q
	2Wv4o6M34CGWuEtiqm6TITnYLweFSYO3redvIw5h0BUl6/fD4i4TwE8sU4cVGmc=
X-Gm-Gg: ASbGncusmX1P7JqWv2LDXacKq9RosAoudtqMVkNiM3DbvXEgce9hJF6gbIhmYbsWw0Z
	kyrKIedV5baQpRMX9hTRrPdDoUNXDeYhPPEpWEYDsVS09O3d3ZJTjETrgabARD+Wc65AVktjbsX
	5vbk2gv0wOJkO8h304Qbqp2YKgt7V9DKirGJsEJ7CGtHL+HaK7LsLwHsCdL1NHDzdHSiUF5Ip36
	7odFe5EYhSligtwYB6QhoU2JMo0BF+fjO9OYV4YuAqR+fiLOP4hgkyCZI4r9du7fYHYEZfCbIyk
	ijL7TON96Q0/ceLkcw==
X-Google-Smtp-Source: AGHT+IFtn7cTk53CsXLOs0ym8l94Gy0ie7XH6W8nO4K/ObG+5/+lrQBGQ0HbQ/z1Qw6bfBt122n8Rw==
X-Received: by 2002:a5d:5887:0:b0:38d:e3a9:d655 with SMTP id ffacd0b85a97d-38de3a9d75bmr4402306f8f.15.1739294916823;
        Tue, 11 Feb 2025 09:28:36 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 5/7] clk: eyeq: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:02 +0100
Message-ID: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aFYZ6uitcWrrRO3QpVWn0nNaiQ1LXsJLRLMMtNT53bw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g5lkk3cqWgHMP3CCG4BuwFe5C2F3wDshnNy
 Adoe13MMYqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOQAKCRDm/A8cN/La
 hfxOD/9Ov3vQy2nAixWu6Lno5OjamDl9bupksGzUtMDHc3Xnbgp0ZK8iN2OFHVZlt0w267iS/4d
 7BXXIUjw9uPxlI6NadJ92+0lsfL6O0LWMo9OmvzB1/x5pZBA+YEREunOSpce9nC20sikciEBxTi
 rAxg8rwr8ZbHZQdXySHjwnBJQwZC/iPPASuRiiFLp/ifq/OFA4BnF7OEQskN0iU7hG3dGoppKWP
 bWpN0Ij+Lrk15oMjG8ab6kxJlyfgfETay2YsUbcEO0nXWQ+5USk4ckRfYMdt3al182sK+D3FrRE
 PFFDpVNKveSTOJEVtRnW1eESzOqeg2fE3VkPAei/faQ0lwxcbDbLcY0UxsCoCxGmYLHN6hhgC5U
 XuMNecOSpFOMeKJO6vJFQQ0A3eACqbzTC6C3syS5lCJmD50uYrnc9EgYrbePOD3pbuhz9xpuNys
 ZvepVJNwvwaxXq/ouY7OWTUNzROguqe6owYkGT5o8Bzx14gpbHkorKDg8Yv007gSfVQPEra2XqZ
 SQ/E9ifTm3uHKHiGZjfpCIQNSXD38akhhCAtt8XKGlSYC11IsLi73ZRanAiq5Exj4o8s3iA/rg0
 u6tC0ZB/l5f4rEl3yzKymgSCtpn/VsM2fgBmzvPeQsj9wqGXJ4L4L6xeTkVUpxcrmqImB9uxOse KsRdlOtx7sxXS6g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..37e76ad3fbe95ee2dea7df8f6b02d28f19f1d5ef 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, name,
+						    (void __force *)base, 0);
+		if (IS_ERR(adev))
+			dev_warn(dev, "failed creating auxiliary device %s.%s: %ld\n",
+				 KBUILD_MODNAME, name, PTR_ERR(adev));
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.45.2

