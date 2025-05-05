Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64B298264;
	Mon,  5 May 2025 22:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484631; cv=none; b=UfRwyWIP/t3zCs/j8Rti/fTCfHc5lDWib7avSb3/Ob94rBXFaf9oryBcG+N4lFdyYmMpHTOCizFrNP1Pp26HWMe5ctX58FsIbaxD9gt8gGp2xdRoTqvmjFX9IL2ZNATG4kqfEFNOYHV6D/Z43555Y/z0MscOkLXGGKb/Wl4tw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484631; c=relaxed/simple;
	bh=dre8okAa5Q0bcUAIP51uDJhSuiCVcGjq/ec+y9xLIKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u8tVdCYLsuWBa4bXzxgS/yrQKEctHVAQo4CFtVM6dR6s9B4qbISo5+p9HhxjAPnuG8G7bk0jCg77R5TnPdrtqEVncQ48dtIBpGOL7FKwvvuc3iAf51ggIPsdPH+pCKyJQBw/enJzwYRH5mcXzVKlNhP8s9/uSELWHwr/uuJD4h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQLQbZ0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQLQbZ0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9344C4CEEF;
	Mon,  5 May 2025 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484631;
	bh=dre8okAa5Q0bcUAIP51uDJhSuiCVcGjq/ec+y9xLIKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQLQbZ0trn3fq9MEaZnSKxkGL5pEauiA/s+4BzRA4SpXOcTc/RgTknCIE7Q+vKkU/
	 Qz2uZ/NRora9EFtwpLr0+mShKpJmtsgAjmzIn0daLl8pHpPLydwEDINfNjB9MkU8JP
	 DBYwZODeXrkggDevYxNvybLWOz31n0NFKIIQzWD1P7/UqwKZaZJXV/eSZf552+rUar
	 JtxxjV+IygTAJbKlMvzu1Ps1VB1tG4izcd85bJx+pbOxyM4LJ/BpQ1C3g7MTe33Vrt
	 zmuWM6XoKmAjdtSRT5W6YzWasfG86Vv31kGgpo/bgIkxzcq4b/8yW8InpXFIszb56m
	 b+OaV3DfO2dow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 572/642] ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
Date: Mon,  5 May 2025 18:13:08 -0400
Message-Id: <20250505221419.2672473-572-sashal@kernel.org>
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit 7d92a38d67e5d937b64b20aa4fd14451ee1772f3 ]

As per codec device specification, 24-bit is allowed in provider mode.
Update the code to reflect that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://patch.msgid.link/20250203141051.2361323-4-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index fac0617ab95b6..6cbb8d0535b02 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -493,9 +493,9 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case 24:
-		if (provider_mode || (format == SND_SOC_DAIFMT_DSP_A) ||
-		    		     (format == SND_SOC_DAIFMT_DSP_B)) {
-			dev_err(component->dev, "24-bit slots not supported in provider mode, or consumer mode using DSP\n");
+		if (!provider_mode && ((format == SND_SOC_DAIFMT_DSP_A) ||
+				       (format == SND_SOC_DAIFMT_DSP_B))) {
+			dev_err(component->dev, "24-bit slots not supported in consumer mode using DSP\n");
 			return -EINVAL;
 		}
 		break;
-- 
2.39.5

