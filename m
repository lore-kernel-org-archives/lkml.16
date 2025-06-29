Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED826217F23
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751191680; cv=none; b=A3ORaC5zcPNGEXoPzc64Gx5RCb9CUIM1U1C2n9LUxmvAWsj/6QkShI5BMrjRLmnTynYJnbGlw8MX5DoeWjzQgbPTI19PfIPIsvVzGA8PLbrai3crocnsYxJlFcDiYVwEngcHYenx657OWbc2pSnh0tU7ZlK4PJ8NFKX8LkpxIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751191680; c=relaxed/simple;
	bh=xl15sp93FApoJQWrZ6I3m5fCoKY4t7l9xkTS0g5f+rY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3/1amPElD3TVr4VgExRg3HE5ZyMZnaeQgljkd6J7Jtes2dretuQ2ckznSIaZ0KvNDvBJZJWvQBYHSa+YJvzD1RtmPS5/tELIL+Dg435LTSIjY8zyDSzttd0/zGTgbx3EE3nsjoYwtWOqnNIG8/EuVfnobtj48/YvB3kgQ+CrJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxXcuUpk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxXcuUpk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2988C4CEEF;
	Sun, 29 Jun 2025 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751191679;
	bh=xl15sp93FApoJQWrZ6I3m5fCoKY4t7l9xkTS0g5f+rY=;
	h=From:To:Cc:Subject:Date:From;
	b=bxXcuUpk6s5rBzK0yc/AY7orQQZv41W0VvZwol7vzlfQZVCBU0EerHP67mADqgCqp
	 mKLi5b5n8l6bMdSoCeXqHHaeRbduB9bvp3hNTyDVqRYe0FGgU011waPKEQtbcnFIPH
	 MlNwB/uCPZSJIVg33auzLqSwOLAYFp0HVRTyIov+5EVXn0cOIR7qht3RUY61qSZud3
	 gRDiDE6+rweVUXTYw5bZ6zS1CmjM5YW2dKhPx+3/ADA3CmFGrwWv3mg/fq16f/6k0p
	 lIZVeKeKpR0MabQGGTbwmcAsSA8LxuJCknBAzBE0RnaQzeGNH/hLOMxtRjF2ZsbVwd
	 bWSISsMP3tfKw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: tps6286x-regulator: Enable REGCACHE_MAPLE
Date: Sun, 29 Jun 2025 17:51:07 +0800
Message-ID: <20250629095107.804-1-jszhang@kernel.org>
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
 drivers/regulator/tps6286x-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/tps6286x-regulator.c b/drivers/regulator/tps6286x-regulator.c
index 75f441f36de7..778f169b0acc 100644
--- a/drivers/regulator/tps6286x-regulator.c
+++ b/drivers/regulator/tps6286x-regulator.c
@@ -19,13 +19,22 @@
 #define TPS6286X_CONTROL_FPWM	BIT(4)
 #define TPS6286X_CONTROL_SWEN	BIT(5)
 
+#define TPS6286X_STATUS		0x05
+
 #define TPS6286X_MIN_MV		400
 #define TPS6286X_MAX_MV		1675
 #define TPS6286X_STEP_MV	5
 
+static bool tps6287x_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == TPS6286X_STATUS;
+}
+
 static const struct regmap_config tps6286x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = tps6287x_volatile_reg,
 };
 
 static int tps6286x_set_mode(struct regulator_dev *rdev, unsigned int mode)
-- 
2.49.0

