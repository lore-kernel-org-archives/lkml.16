Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864624501B;
	Mon, 30 Jun 2025 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291574; cv=none; b=QHKq/c6ZtN4lBYmrmG1ESIKA19ZppZ+csptqyXPHf6Oqa/tB51v+2ZZj2OsFg8RyiS/dTpERChmnzazDB7Mz99rI8laLFApW6WlDx1nBdILpdQ4qP/eGaC1WD6Qp9xQS19esUsSv7BZXqYHm8RxU5mAZidyA76VPK+GsTBsXBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291574; c=relaxed/simple;
	bh=BLeTzHiVYrcH1QMezUXpiaCbYaNy9iuQfkkE2j1kvvE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qca26Wo/1J2i9D23p2r4sW6bRtKFs+m0/JhEWuKGjJ4bEnhAGGx0FCWv/w359ooBLAcRWwunhPfI8j+y6H7Zuq5Heg/JjtZsK8T1uTSxzIPf4DaqeRqHnXT25NY6IeA1MkThKMEBBL0fXu/EklEBm3VdCyMvFqoZqlp078dpDJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUeRuwJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUeRuwJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDA7C4CEE3;
	Mon, 30 Jun 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751291573;
	bh=BLeTzHiVYrcH1QMezUXpiaCbYaNy9iuQfkkE2j1kvvE=;
	h=From:To:Cc:Subject:Date:From;
	b=QUeRuwJP7seoHvP5pT7ExodC3YkDQfgxpX9UsCECDZSrA854UnDVVmpbr4ADiskqH
	 pJzriguNTvsMpj2ZApq6LhIwD+o+nL8kH1OXkUyJo8CIxlYuTVqnIRwYzVrFw9vbE5
	 aMoQIUaCucRlHugGoeOeO+aUkIpRhV5i6/OiJZuEC3I7UlkZio76ZWeVyhQV0x2hvH
	 /bm4yfVoRnb5ztKlrAAmOulG0YKHLXuzUktq3MpzEtv49eX6ct4ppQOctB7T5IrA6/
	 4HN/5ksr3XzgIP4JahmoVoYZRj07aC4WuEH+WicgD7CXm9cUiDh7Ob/mAKClpSHohd
	 a5Ms7kwslVxOA==
Received: by wens.tw (Postfix, from userid 1000)
	id BCF125FE2C; Mon, 30 Jun 2025 21:52:50 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] mfd: axp20x: Skip PEK on AXP313A/AXP323 if no interrupt line is available
Date: Mon, 30 Jun 2025 21:52:49 +0800
Message-Id: <20250630135249.3961621-1-wens@kernel.org>
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

Explicitly exclude the PEK cell in the no IRQ case for the
AXP313/AXP323, instead of using the generic fallback.

Fixes: 249abf9b1e25 ("mfd: axp20x: Set explicit ID for AXP313 regulator")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
The other option would be to move the explicit ID to the generic
fallback case instead. This is really only visible in sysfs and the
kernel logs, so probably not that important.
---
 drivers/mfd/axp20x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 25c639b348cd..8877482a95a1 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,6 +1055,7 @@ static const struct mfd_cell axp152_cells[] = {
 static struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
+	/* Keep PEK as last entry for exclusion in no-irq cases */
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
@@ -1306,12 +1307,18 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->irq_flags = IRQF_TRIGGER_LOW;
 		break;
 	case AXP313A_ID:
+		/* Exclude PEK if no IRQ is available */
+		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;
+		cells_no_irq = axp313a_cells;
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
 		axp20x->regmap_cfg = &axp313a_regmap_config;
 		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
 		break;
 	case AXP323_ID:
+		/* Exclude PEK if no IRQ is available */
+		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;
+		cells_no_irq = axp313a_cells;
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
 		axp20x->regmap_cfg = &axp323_regmap_config;
-- 
2.39.5

