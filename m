Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27A1CBA02
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=gtwHPAXCpCN5DS09fxOqjMlj8AbvOB5o+OFzqb+UFB2W9bMrhsRGzqhCCs4xW6rgttjxK9ajDHwRNl6SmdAsC+MkPm4Y+07tdtDO9Cf4Ve+cTtasGn8oMAvzG3ttgeXrM0D1mT/MfYW0SWElXevD/td3bWdZNAtHu6emnVc/soA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=QvdPw+EY6HW87BbEEl2SyehUHlzXAPAlSJ5ycP2aCMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCOQNvredmt0ggCq/X6PO2MYJprvLdsir1Q/v4ee2wttgDcCSOZfBIAgZ8l+iuMWaXCz/NIU7MbNDyWn1IoW81DWbmZ9NCPTPXCnxs7zP5d1US4oaI5y66aIPC0zS74kfWrk5tnYLJUCB996wMDJlB+1LnSS6xcO5iY7cOPFuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2vgwT36; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2vgwT36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C07C4CEEF;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990145;
	bh=QvdPw+EY6HW87BbEEl2SyehUHlzXAPAlSJ5ycP2aCMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2vgwT36EbUBNRnDHtzIXgUX8MrFsJy0XJ3L7jfR1iBDqMpn8DURb5jNH/n1suH1o
	 cUEa+ltYMCMc5kOkaOXG4Is8DN4xjzoVNmHumub3VYYzRUl79mqbiIA5b/4q9bgscU
	 i2ZzjecICwzivashVH+rmd8856uo7pc//f1ymQGDhkVI9jrUb1AYq+iMXCZiWXEgd+
	 DwWEX5Mz//A0zlfmphTm9P8WqafRmzAC10TLoLv8WrIJRPqRAXJ9Czvfci0NNUFwVO
	 BALK6UPk6ZSWFguFpG/SdxLPJoLeX+eb73p1pBc5u+uHpvFndgza/cqZ3uzLcau/u3
	 d2flNuFPYV3sA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5P-000000002sc-2jmD;
	Fri, 23 May 2025 10:49:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/7] phy: phy-snps-eusb2: fix clock imbalance on phy_exit()
Date: Fri, 23 May 2025 10:48:33 +0200
Message-ID: <20250523084839.11015-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523084839.11015-1-johan+linaro@kernel.org>
References: <20250523084839.11015-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to disable all clocks enabled at phy_init() also on
phy_exit().

Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b3..19af3f99692c 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -504,7 +504,7 @@ static int snps_eusb2_hsphy_exit(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 
-	clk_disable_unprepare(phy->ref_clk);
+	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
 
 	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
 
-- 
2.49.0

