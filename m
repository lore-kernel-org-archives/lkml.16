Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B509A93D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751191496; cv=none; b=HJckoxQTsH2867OhrF8KUvRCCFng9mkMT8crCDa83zEWppGz6b7CeS0WX+NEjDmTQMF7vnk6C1DgO9nz8NIjDzqVVFBuZ30PXDTaw9OQoHpnpkcYqNXZZe8UYe5ImLUraiC572bguSgFCW5Q6BV11RSILJTGO+smhjFKRjWt+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751191496; c=relaxed/simple;
	bh=U6i18Vnf5LlcNLppMq8ML+MT2YpNCZVqfiXlyUVrYRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xhlj0H55PzNlLH+xc433RiciFSvj/PJD0jYLN7jRwbbWPvnO8HxNVGuBdrKZEKsw6vhRJs1ywVmH8vfDNH/Bhm2Cr1j0KFOGVjTopPXEcdTMK/wWSqDp27aExUxm5IaLhor/nFSmTXu68cKNAA6lUFeP5FSH6YOhdF0V2JxQaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxepMrrv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxepMrrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475E8C4CEEB;
	Sun, 29 Jun 2025 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751191496;
	bh=U6i18Vnf5LlcNLppMq8ML+MT2YpNCZVqfiXlyUVrYRw=;
	h=From:To:Cc:Subject:Date:From;
	b=lxepMrrvkWkBMQYm8PfeqeD0VeXSRA9jUtvbNmJ68DGzuSkqKyw67DRqNc6KzpTcU
	 QHGBeBfkdVGaA0WHE4A9Rs9+8CoGp1SBHdnANAdKyXMNhLOIyZNCxslGzAHuQIvaeZ
	 ZicSOojvruHyEOtXvbnqvGLiIbuj6n21DvHwX8s0u1gvymhNE9aY1Ze7cyvqvlOAJM
	 eLFQpen00lPGd/qeOa26V8N5oMn4v3Uo0YAt2ypVG6iTEIfXZMAYCfAUJ78ARoO39U
	 VWgjgDmykjU6xjPAeAjLv1YCCPXns7VLfYblpji9Dn/M3EECg9M7gB0Ox2EWDbfo+D
	 x7Y0Ya7CKXe8g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: rt5739: Enable REGCACHE_MAPLE
Date: Sun, 29 Jun 2025 17:48:03 +0800
Message-ID: <20250629094803.776-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable regmap cache to reduce i2c transactions and corresponding
interrupts if regulator is accessed frequently.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/regulator/rt5739.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/rt5739.c b/drivers/regulator/rt5739.c
index 91412c905ce6..5fcddd7c2da7 100644
--- a/drivers/regulator/rt5739.c
+++ b/drivers/regulator/rt5739.c
@@ -24,6 +24,8 @@
 #define RT5739_REG_NSEL1	0x01
 #define RT5739_REG_CNTL1	0x02
 #define RT5739_REG_ID1		0x03
+#define RT5739_REG_ID2		0x04
+#define RT5739_REG_MON		0x05
 #define RT5739_REG_CNTL2	0x06
 #define RT5739_REG_CNTL4	0x08
 
@@ -236,11 +238,18 @@ static void rt5739_init_regulator_desc(struct regulator_desc *desc,
 	}
 }
 
+static bool rt5739_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == RT5739_REG_MON;
+}
+
 static const struct regmap_config rt5739_regmap_config = {
 	.name = "rt5739",
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = RT5739_REG_CNTL4,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = rt5739_volatile_reg,
 };
 
 static int rt5739_probe(struct i2c_client *i2c)
-- 
2.49.0

