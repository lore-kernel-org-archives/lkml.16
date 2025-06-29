Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611E1F4169
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751192116; cv=none; b=g2VX4DHnWHdVxa5NFSNRSIqTsWP3vJ9TmljmeUFt2H+3pqjXXvf/Q0l8Ib1DFaXjW/lFR57qXnA7LIORjm43oImxvLIQTsJCLrs60sfFS9TG5Nkad3WUECjGwqOu5qI1RM/D5mvsckto4uMGV0qBS2V2Q6ZZTgE6SbsgTvZFPf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751192116; c=relaxed/simple;
	bh=dECr4nkvseSg7N1+5IE3EZvxlUZeqMiCco8Y1FIv3e4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGX/tc+M9xMCzzfwK0NOfbQ7AksiMVd1glO3aUygMWBVGqk4VIulTH1Mrm/MUwqlXR1zaPVvPUEum0DpZgtNYg1+4lTOk0YeBwMbNrYegexIz0CbUz+v7uTRpf5JRtYrNb8wkmfbzWudxhQWiuLjTi7DgVFKqcws7BgGf5U+ZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBZZJlD8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBZZJlD8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C3BC4CEEF;
	Sun, 29 Jun 2025 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751192114;
	bh=dECr4nkvseSg7N1+5IE3EZvxlUZeqMiCco8Y1FIv3e4=;
	h=From:To:Cc:Subject:Date:From;
	b=YBZZJlD8Fmds6axB/L/QQbNzPzOPLsKdgaDpGvcCx6utfz+VRcCGyunCXLRcxKbgs
	 2WLMQ8EoTLX3a8dHQZqwFRD/EsW+7i7CuotUdnhQo/Tdnw/3sT4ib4VEkt+6BBloBq
	 u6cWg25hYvlduKk62MprsnJKjNWiTnPA5mtD5VYPMbv90AGLnaGugQcMn3OnSsg38F
	 Mm3wJU5OMv/CAoei/upaXSfcb3LRSQYMxJDy7nS1gJwuv1NljB0fZAmEj2TzlkzrKG
	 EFDwqm1ximOgCzaX1Yz74IkdbE0vpzNRjr+reWY4QTFZvtgH/1y09Ym28tURwlrlbG
	 m2SE1s8mPNjEg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: tps6287x-regulator: Enable REGCACHE_MAPLE
Date: Sun, 29 Jun 2025 17:58:22 +0800
Message-ID: <20250629095822.868-1-jszhang@kernel.org>
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
 drivers/regulator/tps6287x-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/tps6287x-regulator.c b/drivers/regulator/tps6287x-regulator.c
index c0f5f0a186a3..7b7d3ae39206 100644
--- a/drivers/regulator/tps6287x-regulator.c
+++ b/drivers/regulator/tps6287x-regulator.c
@@ -27,10 +27,17 @@
 #define TPS6287X_CTRL3		0x03
 #define TPS6287X_STATUS		0x04
 
+static bool tps6287x_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == TPS6287X_STATUS;
+}
+
 static const struct regmap_config tps6287x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = TPS6287X_STATUS,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = tps6287x_volatile_reg,
 };
 
 static const struct linear_range tps6287x_voltage_ranges[] = {
-- 
2.49.0

