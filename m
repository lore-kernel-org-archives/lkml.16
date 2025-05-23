Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33B1DB366
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=crW+r3Ym4sbUTFQ6hbH7hTmNk06kSaWeh4BpaIZvAXz4en1UxCIoxplfd1gl6MBGE6pimDe5qbpbGFR3zyRuh0xL13134f8pePlYilxxIAIbTz3bsofSfI+IdYoL9dwo6KmpgT9Fq+UHF5AHiAXiRlWQBf5G0dTdcX/Eqt4eNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=scH8O9z4KQYnM947y3bsoS+So4c5Zz9w9UFXE+CEqv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xo7+wf+zltguOhrImSIlfSNdfpSUfYReG6CW5N0htRd/pJw6CJgJ+NPMdJ6xUCURlKGIajShoVvasInOYl1WYdwhnNfHdKj3WuHOqv4FTK02s052m+YzPUrmHdDHuKBb7VhZ/+oasU3ZECfZYy360QTZfE0m15ahABshLxc/h3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrdznUlb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrdznUlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4E9C4CEF3;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990145;
	bh=scH8O9z4KQYnM947y3bsoS+So4c5Zz9w9UFXE+CEqv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZrdznUlbhfdkx9n83B2ICMemJH2MC9UE5EjfmcOMl47j6tlN998RCm4iytyyiqHNf
	 qbVQps2x91FEF5Eb6rwUJ5yiogcA1LSIS1TrRFVJyRPXa0ztyZmKkeog3Vbewk79ey
	 P2FaDonQwhFwKxS/B40zlpfhOA3EjpSI5oAfiyfZCkNzwW3iOqxNr8u5YBtaK+643Z
	 GrmLfc/12EBq4jhNeKNK9UZBBKbB+147y50Fo2GoMrdPV9HjrhF2dju0X3SIPyEBCE
	 MTZFY2TrJ5whZv2rCJDx33W1WvZQsz6K9WP3HtXDG4gC3UwFYpWVCwSDFlmDlXz0to
	 1yhXZf5IJShIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5P-000000002si-3wOg;
	Fri, 23 May 2025 10:49:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/7] phy: phy-snps-eusb2: clean up error messages
Date: Fri, 23 May 2025 10:48:36 +0200
Message-ID: <20250523084839.11015-5-johan+linaro@kernel.org>
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

Clean up the error messages by using a consistent format with a colon
followed by a space and an errno (or unsupported frequency).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index c8f14f8fb9ac..232c5e8a554f 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -256,7 +256,7 @@ static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	}
 
 	if (!config) {
-		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq: %lu\n", ref_clk_freq);
 		return -EINVAL;
 	}
 
@@ -293,7 +293,7 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	}
 
 	if (!config) {
-		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq: %lu\n", ref_clk_freq);
 		return -EINVAL;
 	}
 
@@ -461,19 +461,19 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 
 	ret = phy_init(phy->repeater);
 	if (ret) {
-		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		dev_err(&p->dev, "repeater init failed: %d\n", ret);
 		goto disable_vreg;
 	}
 
 	ret = clk_bulk_prepare_enable(phy->data->num_clks, phy->clks);
 	if (ret) {
-		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
+		dev_err(&p->dev, "failed to enable ref clock: %d\n", ret);
 		goto exit_repeater;
 	}
 
 	ret = reset_control_assert(phy->phy_reset);
 	if (ret) {
-		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
+		dev_err(&p->dev, "failed to assert phy_reset: %d\n", ret);
 		goto disable_clks;
 	}
 
@@ -481,7 +481,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 
 	ret = reset_control_deassert(phy->phy_reset);
 	if (ret) {
-		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
+		dev_err(&p->dev, "failed to de-assert phy_reset: %d\n", ret);
 		goto disable_clks;
 	}
 
@@ -588,7 +588,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
 	if (IS_ERR(generic_phy)) {
-		dev_err(dev, "failed to create phy %d\n", ret);
+		dev_err(dev, "failed to create phy: %d\n", ret);
 		return PTR_ERR(generic_phy);
 	}
 
-- 
2.49.0

