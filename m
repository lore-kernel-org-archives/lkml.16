Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E71D90C8
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=GiQjsJntDvW7pXg6I/YD8nrceurBuZO/uwV5IhFeZFHw0Of7oTZZQqOhCvLzeQrGtyYTXBev7jA5U1y0xSrRviJI9YmBzCKRCyS/64PuIrDZoQFJ40c3X6g3Pm6zyYU0jFOcQ3ukXRUZIPPvONuwavTgr4vZTy985TX+bGcQKHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=i//o3UqrswhmGduD9nFXJlKSTMmDLLiHgF4P7egYPTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMbCWHEztK1HF/q3KAccIpOMGoJ8+gI0nNsCgvdGy9CuFWMbP4NTochwu9gRlwM1B5hQP9i0ao9MXSDYsD1Na/DdJSLjzV4GEIdwi5CtclKcczcNvElTZ6+qt91HDANMkh54uEDbtOscW3YmKNDyLDBzJbLD6Txd0ayY7qIh3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6Y1TW+r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6Y1TW+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70E7C4CEF2;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990145;
	bh=i//o3UqrswhmGduD9nFXJlKSTMmDLLiHgF4P7egYPTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6Y1TW+rAmr0fJTOAgy8nIoVGvREXl3d0/qjHitilvunFXs/hvyHwmVWET6kconZ5
	 sm6FW6Cxsaw49ihe4iuk64MSDYis5ervImefMlxYbCrHuWG9LKPitPrYlvIR2z31Uw
	 KXAqAnS3zQ75r1bFY8SDXJWR2spDQkYmOETOAukX4mb5A9kltSQ1HfN0CQ/SLDh5ol
	 i1aEwLaauv7nkYvOMU9pkSQg0Wcdg6ju/MnZHgOOWnfJkVxb9IFFqWLHEBOtRq03Xg
	 43BC4f9WMQ66nVPIGM8HjESOfWK45I1KsudTJqVC6Q9mXzd5WmwR5VmJgJgO/AhE4x
	 BaqQZ8KkqVwzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5P-000000002sg-3VfV;
	Fri, 23 May 2025 10:49:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/7] phy: phy-snps-eusb2: rename phy_init() clock error label
Date: Fri, 23 May 2025 10:48:35 +0200
Message-ID: <20250523084839.11015-4-johan+linaro@kernel.org>
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

Rename the clock error label which is now used to disable all clocks and
not just the ref clock on phy_init() errors.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index a799c3d2bcfb..c8f14f8fb9ac 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -474,7 +474,7 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 	ret = reset_control_assert(phy->phy_reset);
 	if (ret) {
 		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
+		goto disable_clks;
 	}
 
 	usleep_range(100, 150);
@@ -482,16 +482,16 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 	ret = reset_control_deassert(phy->phy_reset);
 	if (ret) {
 		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
+		goto disable_clks;
 	}
 
 	ret = phy->data->phy_init(p);
 	if (ret)
-		goto disable_ref_clk;
+		goto disable_clks;
 
 	return 0;
 
-disable_ref_clk:
+disable_clks:
 	clk_bulk_disable_unprepare(phy->data->num_clks, phy->clks);
 exit_repeater:
 	phy_exit(phy->repeater);
-- 
2.49.0

