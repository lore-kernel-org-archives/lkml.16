Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99A2741D2;
	Tue, 15 Apr 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702926; cv=none; b=LbuOYAr1gczPjN+xnOKEMQ3z6/XJaypvhXhVSRwd4DAUnoph8qeVMQ4RR1itK3sl9+9IsBI4Jg/oeR6dJXM4H83pOoGg1iRjhwctVGUDJJIcPIYj6ohavQ6TROp1BtGpy3+QmIk6JLE/PjTgk78irX6U5n4Ud6abg9bGtaQn/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702926; c=relaxed/simple;
	bh=WdZ2M4MN5sOyCFES6rqpJQ8kGAODCf2hpo5rXfxebgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxXUTr34ZPMlbvoQGMoDxisb1XgFNQfLi8gxv/uIXBgr6iwQw76h0w9YThj+NkUKUYWmOQ30Nady8VYo5cs8cDF+HuNupAak6MvonA//un2rM+vWAT5ZgmvMEhIKJCtG3TW53yc72Oh0q2hY/HGYuaKbFAgrKV9SYGy2j5CLh5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRVlMHtE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRVlMHtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB99C4CEDD;
	Tue, 15 Apr 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744702925;
	bh=WdZ2M4MN5sOyCFES6rqpJQ8kGAODCf2hpo5rXfxebgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kRVlMHtExBrNPupjMnjtNdYq/UxGF7x5aA1lvT1cOQFZLTVN+JMPNnEGntsUf1c6x
	 aCG0iSfmNDVrcGBLYri0a6ZLTNKEL6eglgwyiwiu6mWj71rSx6fDgfN3zK3q/s0QrE
	 z4L0G7Dt5ckIzPONmFfyzWUTDvFNXt4egjE00+VlIGauRqBBmt1aREUwkdvJUTlhvV
	 85iXbPwwmafa9hRBqADpk7MwGKsJLqucQHRDfUtz+Ltw48OqtK2zVQacZ3yFMj7L2z
	 Vt/cBkhAqqfUkZkr6J4QqI/yQnUCenoMCGdkejJt/wkRwyEtVixSEVjMOqLHdigrSl
	 W/2jTPrCyNKiQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u4avi-000000001sg-0Yml;
	Tue, 15 Apr 2025 09:42:02 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] ASoC: codecs: wcd938x: drop unnecessary mux flag assignment
Date: Tue, 15 Apr 2025 09:41:45 +0200
Message-ID: <20250415074145.7202-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415074145.7202-1-johan+linaro@kernel.org>
References: <20250415074145.7202-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The codec driver data is allocated using kzalloc() so there's no need to
clear the mux setup flag when mux selection fails during probe.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 55031c16e4e1..8c9f67dedb83 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3281,7 +3281,6 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		ret = mux_control_try_select(wcd938x->us_euro_mux, wcd938x->mux_state);
 		if (ret) {
 			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
-			wcd938x->mux_setup_done = false;
 			return ret;
 		}
 		wcd938x->mux_setup_done = true;
-- 
2.49.0

