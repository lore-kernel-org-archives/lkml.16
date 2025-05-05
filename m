Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC5427F74A;
	Mon,  5 May 2025 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485515; cv=none; b=vEHON12XGQbaDsupy2fy9RrCogun4C0txVKFSsBP9Fc0NXcRX2bbQXODpnMPGunBD4QKopmcvyfzZ9RTGeG5rkdrJZbqELUi8cm2C7KymvAlAWl/CZsgM2XgGoXVGqfjpugAvj8aLkHFVHeiFUnBRgVCBAATKzzvo5XVAJSZBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485515; c=relaxed/simple;
	bh=NrKHRuMeaILovRsT/haYgQx4xtXO5Kjk1YY4SG2k6zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUTRrr3thznjWQ+4pX921CN9s3c2lGDvlR9i5faiQT83xpjD/VLX5CXJfghipJLN0UuUH+U6gXvckdZKdz8rjhHQGzoWD8ff6id66xpcU7e44QiU4RTg+jXXjNfkDk5gv69qwHVesvDSGyss83RsNBoxItX2BUF3P8fW4Ut7gKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLOUjOPb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLOUjOPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D8FC4CEEE;
	Mon,  5 May 2025 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485514;
	bh=NrKHRuMeaILovRsT/haYgQx4xtXO5Kjk1YY4SG2k6zY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLOUjOPbH16ccgCfLy1tGsajlfejrmMqSVGhz/pyJVDvFXS8sdHkQ37rpofOq0EOp
	 yPLWGzz2yzXcd2/gZVKftaiUnruZWG7uHrmVijfbV0WY2ZcPLlaDhyGf6DQuevTCb5
	 p1kwbO2N6mWvOuh3Jv724/4YKNBuK0OHHKmvKTQF1D2Ds7OfQ8LslxMLka08o0VZZe
	 aq+SK0EuOjEltEWSsUE/ZKLheTpK0v+Q/sY/Ur/gMdCtmbvCKCTn6KyojPoIzU32Uv
	 BCG1ToOajDd9o3r6IH0bWkhQf7dSlJWP3myGNSeG0f3Q8RNAdgloF/Ph0w3O6oEY09
	 MA5dvhhoIQsBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kishon@kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 355/486] phy: core: don't require set_mode() callback for phy_get_mode() to work
Date: Mon,  5 May 2025 18:37:11 -0400
Message-Id: <20250505223922.2682012-355-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit d58c04e305afbaa9dda7969151f06c4efe2c98b0 ]

As reported by Damon Ding, the phy_get_mode() call doesn't work as
expected unless the PHY driver has a .set_mode() call. This prompts PHY
drivers to have empty stubs for .set_mode() for the sake of being able
to get the mode.

Make .set_mode() callback truly optional and update PHY's mode even if
it there is none.

Cc: Damon Ding <damon.ding@rock-chips.com>
Link: https://lore.kernel.org/r/96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com
Tested-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20250209-phy-fix-set-moe-v2-1-76e248503856@linaro.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/phy-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 413f76e2d1744..e0a6a272f5714 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -405,13 +405,14 @@ EXPORT_SYMBOL_GPL(phy_power_off);
 
 int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode)
 {
-	int ret;
+	int ret = 0;
 
-	if (!phy || !phy->ops->set_mode)
+	if (!phy)
 		return 0;
 
 	mutex_lock(&phy->mutex);
-	ret = phy->ops->set_mode(phy, mode, submode);
+	if (phy->ops->set_mode)
+		ret = phy->ops->set_mode(phy, mode, submode);
 	if (!ret)
 		phy->attrs.mode = mode;
 	mutex_unlock(&phy->mutex);
-- 
2.39.5

