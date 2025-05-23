Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A17E1AAA29
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=qUzMskflcKDI9CFE9AcZhKz6urhGJ/zWSFPQnenWFVDycW+/qmiuW1s+V5Synk6eSYrtracE1FagebuwQamchTH0/5A/Wgc2VxhSCLCi9JxNqa/MerHxG+J3vqprh+rGRSFqufnPl6hZkxMyCGaJy+DvI06LgrIQewRfKPd19Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=O49xnH+Zi4MGHO24pslMdx6btGMUWu06sVjFRwGHYJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3hfnJ9SXllyYWnVMKn1mTtIvXcJxm16xvY9tpeMgyFdweGygZV0Nt3gGV/s2+P7zfqYlUSxbpU8rmoFqC3AOULP2J+V5Db67iqIStXEv62/k9zwtlW28wp4RXN0LmFc4seC7z63fbDq2pwEodHSMrdZEugRJiBfGt1NLidzsHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWKuKRgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWKuKRgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00623C4CEFC;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990146;
	bh=O49xnH+Zi4MGHO24pslMdx6btGMUWu06sVjFRwGHYJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nWKuKRgq1knioksANTiW9BBMhLK/qH/lkCV8zXAwcq4XJckB7KM9kJvKVp+GIVgYG
	 b5wxgjx40P8ZUlVfIgl63OVxD7pVEbHsN204Yqy47EJf12DpyEVvIHK1R4Y1b+AwW/
	 V19N4kybih2yjCuq1jdkBXIkIBTg4XRTeBIcg2oC2FF0KBv9pxsIULL8D++blj66XI
	 JnFDKLyZf417lHFpshosvPC+YsTY9cHOJBWik+J4Yd2kYcUPm7cYsHYmpeugd0HFle
	 uJKQR/CmepXkuemHZIZ++od6ZZrqT9FwHwngGnxNid46YolcvAZmFKcbBMKWcto/FR
	 0ij+TKHXPHFVA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5Q-000000002sq-0VJj;
	Fri, 23 May 2025 10:49:04 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 6/7] phy: phy-snps-eusb2: drop unnecessary loop index declarations
Date: Fri, 23 May 2025 10:48:38 +0200
Message-ID: <20250523084839.11015-7-johan+linaro@kernel.org>
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

There is already a loop index variable declared at function scope so
drop the unnecessary overloaded loop declarations.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 328e67ebfe03..c67712bd8bba 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -552,7 +552,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy->clks)
 		return -ENOMEM;
 
-	for (int i = 0; i < phy->data->num_clks; ++i)
+	for (i = 0; i < phy->data->num_clks; ++i)
 		phy->clks[i].id = phy->data->clk_names[i];
 
 	ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
@@ -561,7 +561,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 				     "failed to get phy clock(s)\n");
 
 	phy->ref_clk = NULL;
-	for (int i = 0; i < phy->data->num_clks; ++i) {
+	for (i = 0; i < phy->data->num_clks; ++i) {
 		if (!strcmp(phy->clks[i].id, "ref")) {
 			phy->ref_clk = phy->clks[i].clk;
 			break;
-- 
2.49.0

