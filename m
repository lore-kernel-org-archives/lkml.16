Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8B1D9A5F;
	Thu, 19 Jun 2025 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354339; cv=none; b=QLRB0NsGb05Vr39UavzNctIa9pv7G3XlDZNDJK7i5UNEzVwjjU5p7navKViOrprJdTWF9E1dFQ3iPwQFKzWf0xEHiXRUmamhKjInUybrmMpQUl6JQ+Kl+ZYFrRmA8coaFQSYILddawQA3bkI/f21pVFYyQtdjXS1VwDJU0VZ01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354339; c=relaxed/simple;
	bh=dnW/KeOlCCPZwEfbvo8J45kgENPUMKU2wmQYqK2LIGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rB7CQ2hM+1Q1bHujMXwMkr2JJ4yPKFJVbvA9r+imfnNnqQaWphh6/7dA4BSc0NpWfc3FABSu6mu1aMdZrhxtHyvPp4o8g/hrfuJxud8ef3wTywjKy44DjlFAJRXVrj/qMom15zUwU1HGSfNyPY07nFPEaH3PNaAtGXMLEdYplvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN0QGBbt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN0QGBbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A1AC4CEEA;
	Thu, 19 Jun 2025 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354337;
	bh=dnW/KeOlCCPZwEfbvo8J45kgENPUMKU2wmQYqK2LIGw=;
	h=From:To:Cc:Subject:Date:From;
	b=VN0QGBbt4tRi4gq3NSM17Znien/P1ilBoWwY9IbHVkQ7Bw8Ok2MxdGEEpyKFX1p5R
	 qNn4Si4thBFEmD/nf2xLyEgupYDj38sOA08a/TGxFzbppC5c1HcGB5qd5/lElsN6Fb
	 2UZgY0kQ+rtxt2Lgw/KJvFuXaHlOPgahGuGo7H3jEO7h8nU24KDtZzsCKnf0FnsFwM
	 dUEKqfYWhc67JA+hIKRTa8M4BV5j/hz8+LVtmkGkaiiG6xCSOLe1dsFZZlWuqb91M0
	 R997NMJqIkXa7KLBcptaXLrVds5lYNuSIrcRdWJYJxnzxH6JxmNudKcrd54mxcDsHv
	 thMCbil/KaipQ==
Received: by wens.tw (Postfix, from userid 1000)
	id CD6D65FEF5; Fri, 20 Jun 2025 01:32:14 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] mfd: axp20x: Set explicit ID for AXP313 regulator
Date: Fri, 20 Jun 2025 01:32:07 +0800
Message-Id: <20250619173207.3367126-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

On newer boards featuring the A523 SoC, the AXP323 (related to the
AXP313) is paired with the AXP717 and serves as a secondary PMIC
providing additional regulator outputs. However the mfd cells are all
registered with PLATFORM_DEVID_NONE, which causes the regulator cells
to conflict with each other.

Commit e37ec3218870 ("mfd: axp20x: Allow multiple regulators") attempted
to fix this by switching to PLATFORM_DEVID_AUTO so that the device names
would all be different, however that broke IIO channel mapping, which is
also tied to the device names. As a result the change was later reverted.

Instead, here we attempt to make sure the AXP313/AXP323 regulator cell
does not conflict by explicitly giving it an ID number. This was
previously done for the AXP809+AXP806 pair used with the A80 SoC.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/mfd/axp20x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index e9914e8a29a3..25c639b348cd 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1053,7 +1053,8 @@ static const struct mfd_cell axp152_cells[] = {
 };
 
 static struct mfd_cell axp313a_cells[] = {
-	MFD_CELL_NAME("axp20x-regulator"),
+	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-- 
2.39.5

