Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E12BEC31;
	Mon,  5 May 2025 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485295; cv=none; b=oaYfA7pIM/E8tAFvdAJXO9RPlGiCk3ZVShSvD7Yr5MNreiazNGaH5JQGvRZ/85rV6T6i1KXMmNr7cGbhRWPCcUuQ5QV0JbAZpfira94wdK0r1uNglMSI1ho1RHWHgi4/Og412EoZqiqBjvZcy3JeBVkrkL0Hlp8E2Vqvapqgvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485295; c=relaxed/simple;
	bh=O2mn++1uinwWnkH+yXKQUTW2RQxr5fSjFwSzt/Zof3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abigqQoC5x1rSAmGjO6SA7dJVjGGzf/G07st3PEnN0TG2GopceA+JRyPunbCHQKq7XfiOXt6ei2TEHlhk5bEitS0+IfFbfMJA6NwUCPbpFi3cjr8ih1HPdlHhbgI/77BGfacxhjnIVwiKpPYhJgl92WaLgCwcWhtsRSu1GGk2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnRrDcLr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnRrDcLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC4BC4CEE4;
	Mon,  5 May 2025 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485295;
	bh=O2mn++1uinwWnkH+yXKQUTW2RQxr5fSjFwSzt/Zof3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OnRrDcLrKYTX4LdYkbHmSEf/PkxU96FR0PjKDEq4Sv52eN/M0g9zEAlTLPeZwVIFG
	 FTtmg4mNSifm1OoMPAPmCxAvBEZj+hiaMvD1Jg12HzLP8dkVmNiV62RKXIc7jd2Lu/
	 443ftYAl+hQpvCcxI9NXZa6zHNV+5SkAZORFJMLrNiOGVmSG8bEUW0+svuZmMtLNeU
	 Oeiy8PDtQezlJ/E5UoCY0WUaXVPcPckJPbiNmZKEK/eCvl9f5wzyytcACbWah2/5ub
	 008OwnYQAILWU+ozobwZkuCUOUfCK+h0lWwXdXzeeiDQl1E6nWQFJU2jBzWLrPxrqU
	 6n/G5MnSTq25g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	ckeepax@opensource.cirrus.com,
	krzysztof.kozlowski@linaro.org,
	Parker.Yang@mediatek.com,
	yr.yang@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 255/486] ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as non-volatile
Date: Mon,  5 May 2025 18:35:31 -0400
Message-Id: <20250505223922.2682012-255-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

[ Upstream commit 7d87bde21c73731ddaf15e572020f80999c38ee3 ]

The DMIC_GAINx_CUR registers contain the current (as in present) gain of
each DMIC. During capture, this gain will ramp up until a target value
is reached, and therefore the register is volatile since it is updated
automatically by hardware.

However, after capture the register's value returns to the value that
was written to it. So reading these registers returns the current gain,
and writing configures the initial gain for every capture.

>From an audio configuration perspective, reading the instantaneous gain
is not really useful. Instead, reading back the initial gain that was
configured is the desired behavior. For that reason, consider the
DMIC_GAINx_CUR registers as non-volatile, so the regmap's cache can be
used to retrieve the values, rather than requiring pm runtime resuming
the device.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patch.msgid.link/20250225-genio700-dmic-v2-3-3076f5b50ef7@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 73e5c63aeec87..d36520c6272dd 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -2855,10 +2855,6 @@ static bool mt8188_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_DMIC3_SRC_DEBUG_MON0:
 	case AFE_DMIC3_UL_SRC_MON0:
 	case AFE_DMIC3_UL_SRC_MON1:
-	case DMIC_GAIN1_CUR:
-	case DMIC_GAIN2_CUR:
-	case DMIC_GAIN3_CUR:
-	case DMIC_GAIN4_CUR:
 	case ETDM_IN1_MONITOR:
 	case ETDM_IN2_MONITOR:
 	case ETDM_OUT1_MONITOR:
-- 
2.39.5

