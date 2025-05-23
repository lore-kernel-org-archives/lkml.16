Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1DD1B0435
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=ebrlhmi8P692BBmT4tt+qCwWvkSDTgPYBJtw/XAUXZlXgeOaoLkkkmR8jX5TqEpX8k8g9GjaJCd5Zlj7VOXgsyU8ULBq4F74dXK7f7G1ycCG+q7vPdhfql8FY/hx7aANJ6t5NqhTNm3nulqP9/KYKAwNVZL2Dmu0U3HvW/IHHuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=5JcbaWnU4DoMGQDtdSraUtirBZ7DeySehZbf2U9yd8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8rlAugo/aRK8yuqSUgouj7KBhzWYyfPLTUO9QtCvN2636RfBn/h9lVL875qquqC7sPbHB8b39XLulTBhNkAG6IMpj0lpjFbKTxvzJ5+wmAgsIBpZAjuajL9nOGggKfhjhXCFJtELGT5Jz5okpqexnukYG5Y/WsoQdZ3sBJcCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqhV2wzM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqhV2wzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BD7C4CEEB;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990145;
	bh=5JcbaWnU4DoMGQDtdSraUtirBZ7DeySehZbf2U9yd8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqhV2wzM+2ML2SQ69Ou6NVa+do0LIjfBgpCC9Q2SmHjgduIEqvrM6T7+sRPglKPzr
	 356xwhF8h54kQhecDlie3lNBYlFoBGZUdtSzHpmNxzw6ayghaGg97X5DXRyin+dtja
	 wuP51h979S82+eIIB6yfuOHXrwjcbq9sGeyqaIA1y/mNLIuC8/h9pi2LjMBqY8rAm1
	 TNNCDkLEfxkKznB03a8iq1lsLLidrjNrSiZVIZtO3+DfZzn67lduzCvnrxeTN6Esu7
	 085DNRah2OCpO8h12EafGRUgB/UcvuSOPaykr2/Aq+Yl21lxkWif8o20Du1HHu+794
	 pxf2GO15tH8VQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5P-000000002se-38CV;
	Fri, 23 May 2025 10:49:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/7] phy: phy-snps-eusb2: fix repeater imbalance on phy_init() failure
Date: Fri, 23 May 2025 10:48:34 +0200
Message-ID: <20250523084839.11015-3-johan+linaro@kernel.org>
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

Make sure to disable the repeater PHY also on phy_init() failure.

Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 19af3f99692c..a799c3d2bcfb 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -468,7 +468,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
 	if (ret) {
 		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_vreg;
+		goto exit_repeater;
 	}
 
 	ret = reset_control_assert(phy->phy_reset);
@@ -493,7 +493,8 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 
 disable_ref_clk:
 	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
-
+exit_repeater:
+	phy_exit(phy->repeater);
 disable_vreg:
 	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
 
-- 
2.49.0

