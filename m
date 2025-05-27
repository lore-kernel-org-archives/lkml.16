Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BF1224FD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386322; cv=none; b=gvXY0QqhT1vwj7J72iQRIiaKxwEx+CY/WEtAiTz/k9eoEB0nlRwwXdHABEc/If6xTRiMbprMJL6xuRB6kCHvHqz+zDI5bRiZEFJZT2I8I+LvoWtzDplmEL7HsO8Q6lJsA7xf85UMDcy3sSAHjxVkohSU7L9gy2ZolViUX599M54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386322; c=relaxed/simple;
	bh=eixPJmSBOHUU9V0mP09wATCfRqo0Gg2HZAMTM21cdaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4LRVu9dsWYU63HH1CR2dv9bHhJQyyCK4qS8PJK4lRtT1X179otST/N3FL5NLLg5P8W7ySYot4OA4rZr2t9/NyddVB3YMWNDZuYv28Qxa9CJfALaMn5IlkgFnk8ZFu8zqLIC442uVuZ4RPuTC8pOHxzL1mbCXKG44BeP6UsWZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PxYQoF6L; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PxYQoF6L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=zYroR0JeTvEc5k+dhsSlbbRBRTuaHoKGLn9xLivB2FY=; b=PxYQoF6LWHnUgUJnGKULKZ3wU1
	3B8i0EvtM0aqnuJPZzfTx1F9v65Gro8NfNfVa2b2aYVKa9yjJ7Fea7KFbr+KdnXsT7avL47pFm1h5
	UC31fNC1YYD2pt8Tv/6sLwIgOCCs517tTgkviI7DKCPAKoGzu0r0cvwRVLO9K1Z1V45lG9ESMKDdx
	wt/wJJsdgo17GMnSPzLicjfA49h32GvHJ0uxJBoYDEmwne/kc1+PimtVAnD4ejz+fbVCdZlSc6rph
	rE+u0U1fNT5k5QwnEHgBvQxnyU54916Ef9RzIDPvI1ANnESt+rRobDb1/Bys/kA9EPwgUyOSi2YKG
	JDPu96rQ==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uK38r-0004UD-Ee; Wed, 28 May 2025 00:51:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Date: Wed, 28 May 2025 00:51:19 +0200
Message-ID: <20250527225120.3361663-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
calls to clk_disable_unprepare() during probing") removed the mismatched
clock_disable calls from analogix_dp_probe.

But that patch was created and sent before
commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
from the DP AUX bus") was merged, so couldn't know about this change.

So in the original patch the last change is
    if (ret) {
	dev_err(&pdev->dev, "failed to request irq\n");
-		goto err_disable_clk;
+		return ERR_PTR(ret);
    }
    disable_irq(dp->irq);

    return dp;
-
-err_disable_clk:
-	clk_disable_unprepare(dp->clock);
-	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_probe);

the analogix_dp_core.c actually now has the runtime-pm handling between
disable_irq() and return do introducing another goto err_clk_disable there.

So remove that one too and return an error pointer, to not create build
breakage.

Fixes: 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
When I reviewed the original patch, I failed to see that difference :-(
But I do wonder how dim was able to apply the original patch.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 01201fff59a6..505eec6b819b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1586,7 +1586,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	pm_runtime_set_autosuspend_delay(dp->dev, 100);
 	ret = devm_pm_runtime_enable(dp->dev);
 	if (ret)
-		goto err_disable_clk;
+		return ERR_PTR(ret);
 
 	return dp;
 }
-- 
2.47.2

