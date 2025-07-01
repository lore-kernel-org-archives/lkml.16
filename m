Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D627A924;
	Tue,  1 Jul 2025 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387821; cv=none; b=RsKr48A71fYSkv33tsnGOm8Laivjg88QuKg+XlHB8gFNmjmdtE4pV/NrYpXh1PeqbZ7F5WAolJrpOvGdjgawOs2hGHZzBiydsAJ7Q0DexVBIJ45+kSnDzsWnJ97ZHeEJ4Vo6IfsTDIggNpa3nM9v7WQGkQ/O176obgduTZKMN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387821; c=relaxed/simple;
	bh=RK8SB4EJXzDR75Wtd6g9Il6AVAxxcuOajEeiy5IaFDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t+/6ito0WXONsKAh0ufjVIvCLG7N+7VRrwAnQQ6FlQXXHomYtbrpxWt93lEpvQgnIzdf+2/aCZwmIq/iFVQWdkR2Ai+azoPdAV0RXc0Djt7ZT7AI/b56Zd8914jPxNmdE0mFaX/Tk811lph9/5TBUacnA3tN941RKiq2kYhdpY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUKI4IuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUKI4IuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F410C4CEEB;
	Tue,  1 Jul 2025 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751387821;
	bh=RK8SB4EJXzDR75Wtd6g9Il6AVAxxcuOajEeiy5IaFDY=;
	h=From:To:Cc:Subject:Date:From;
	b=aUKI4IuLVsW9CfAhRY4GGF6d43SuPPjnnV1ou5MQC1YXQ04JGK/HDQtrTZ3+mfjs8
	 DSmDJLWp4yHKKCET1MiGNoM1k5Xhx1jXuoKnR6XfnKNQ9NJ/3AECapP9InMPgEij6c
	 jg8GJkABLNGJ7EJbyUJzBgAnizm36lECUwjAfjIW5H11Ee1hPtMjm9tj86Rqj3fyl0
	 jpa+YvkraAb/3nvw7f4NS8CqLXl4dbx7N+SnUfnc7NLj19eEu8geqMwuqx1AJAd5kV
	 bAvFhrCUGUZaL4KftSHZGpoV/w5K0K2BbXSzxC0fGIdKg4RsZ4Df+jKutKVszZtqZR
	 2MYMdVSudMySw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0E54E5FDF8; Wed,  2 Jul 2025 00:36:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2] mfd: axp20x: set explicit ID for regulator cell if no IRQ line is present
Date: Wed,  2 Jul 2025 00:36:52 +0800
Message-Id: <20250701163652.252010-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

Originally an explicit ID for the AXP313/AXP323 regulator was set to
avoid a conflict with the primary AXP717 PMIC on Allwinner A523 family
boards.

This didn't entirely work since on some or all of these boards, the
interrupt line on this secondary PMIC was left unconnected, and thus
the driver would fall back to the generic "no interrupt; only regulators"
case, which didn't have the explicit ID set, thus undoing the intended
fix.

Also set an explicit ID for the regulator cell in the no IRQ generic
fall back case. This fixes the conflict for the AXP717 + AXP313/AXP323
case. For the actual single PMIC with no IRQ connected case, the ID does
not affect functionality, only the device naming of the regulator cell,
and by extension the name and path under sysfs.

Fixes: 249abf9b1e25 ("mfd: axp20x: Set explicit ID for AXP313 regulator")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

This is an alternative to

    mfd: axp20x: Skip PEK on AXP313A/AXP323 if no interrupt line is available

which was deemed too fragile.
---
 drivers/mfd/axp20x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 25c639b348cd..c5f0ebae327f 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1231,9 +1231,8 @@ static const struct mfd_cell axp15060_cells[] = {
 
 /* For boards that don't have IRQ line connected to SOC. */
 static const struct mfd_cell axp_regulator_only_cells[] = {
-	{
-		.name		= "axp20x-regulator",
-	},
+	/* PMIC without IRQ line may be secondary PMIC */
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 };
 
 static int axp20x_power_off(struct sys_off_data *data)
-- 
2.39.5

