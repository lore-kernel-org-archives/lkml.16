Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F1340A87;
	Mon,  5 May 2025 22:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484680; cv=none; b=tOs6UUPlOyyyBwLx6ss6Ze+JUUODLeVJiUj3hyb+HiYijEZA7LZoJ01Kj7t7J5s5FlvstSGflydWvM6VhaVo8w2Umq6LUgEuBSEux/ev1MvgRJbpRH701HakyX0IB44mI8P+CIDURD8OnR+uK/FdrZDLf7ndb9Di/241Fxj16vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484680; c=relaxed/simple;
	bh=T+J2cNi2QZ0+RjAyOsVc7K/5Jt7jZTWdQRphP4bBNcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CXKHMUyCb2egC1W2xIpXaPOQ8E81MRGvDJVhRtMifrBhHstuXpbI8wWN0wvLDzvs+9KPsdZqOBMQEWn4pI+45NEiVIcoWoJAk2eo/71hKbhR4HiQI0UpjvqMhZofoaD6FXKPc02AUYi95lc0f/sVELacdHdafssPzOo4twVuzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apghB54t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apghB54t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDB0C4CEE4;
	Mon,  5 May 2025 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484679;
	bh=T+J2cNi2QZ0+RjAyOsVc7K/5Jt7jZTWdQRphP4bBNcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apghB54tCpEqsKoGoUuBVFlLQ1Wd97K2+xBEpyLDefrC4rAs7ubB2Vwlnc0JLi/e/
	 dtr9HAXMLz73S5SZjYYzFv/CKlnRqGf4qebsIAl7LwPG3GftsyvMY2gf1AuClLEU0b
	 wwmLwd+EO93Y+ad7PeE415mvWMAi/Z9aVrfP3tCxlZvmeui5Q5C9SS3XGNFScZRSeA
	 9BELGaWGOVgKI+G4rSSH4lFCXepW3ILxE5hSWwjOiJe9dS/FP4glvRJOG1MRQhj9/3
	 W6TX/MeGcQQde+FZffsiPeWl7CiGUFMi/yUEmEWrHfxceB/6GEztbWeLiOrOpE+PXQ
	 pooKfKkQMoTsQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	lumag@kernel.org,
	stefan.ekenberg@axis.com,
	broonie@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 602/642] drm: bridge: adv7511: fill stream capabilities
Date: Mon,  5 May 2025 18:13:38 -0400
Message-Id: <20250505221419.2672473-602-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Olivier Moysan <olivier.moysan@foss.st.com>

[ Upstream commit c852646f12d4cd5b4f19eeec2976c5d98c0382f8 ]

Set no_i2s_capture and no_spdif_capture flags in hdmi_codec_pdata structure
to report that the ADV7511 HDMI bridge does not support i2s or spdif audio
capture.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250108170356.413063-2-olivier.moysan@foss.st.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 657bc3dd18dff..98030500a978a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -245,7 +245,9 @@ static const struct hdmi_codec_pdata codec_data = {
 	.ops = &adv7511_codec_ops,
 	.max_i2s_channels = 2,
 	.i2s = 1,
+	.no_i2s_capture = 1,
 	.spdif = 1,
+	.no_spdif_capture = 1,
 };
 
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-- 
2.39.5

