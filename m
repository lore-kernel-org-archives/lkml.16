Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD99372;
	Sat,  8 Feb 2025 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976619; cv=none; b=Xzw3LY0SIf+cEkAjTjh95522ynAVEpFXsjmhaBJTk4anM5i44HbfNCNk/ImnqjA7iUnqXrhpmfMzeL9hJzTda9SkshjoBqMYF9BzZSh9OO+Stb4ksDa1zQYoPLI8zwjAdZ1zKWuKzVgym4Qp6HxJl/NABV0JZuiDgXUiNwfOgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976619; c=relaxed/simple;
	bh=ifst8yV/EF8FhiBWA8kNBGiz9/Lddb64v4sxlVdCn6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmicT8aw1wMV9eqYlSvnaTwCK8Bx5HUNwaAKox31b4vFpNG/bI6QcmIExMShwM7IfdBzBVpUkquD6XcL86Lot1co9O3zfVSLcxo2YFwevZhhETSVN8lta5Q7i/CdlWKp+G4y6SHVY8XdKoS+A4hJ9ump9hok9ig3azWrCcfz5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs1EAWIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs1EAWIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3ADC4CED1;
	Sat,  8 Feb 2025 01:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976619;
	bh=ifst8yV/EF8FhiBWA8kNBGiz9/Lddb64v4sxlVdCn6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gs1EAWIzaOQO5qGIb636mpoLtXGGiQdeN3r0aZz+EKR5DGULecWc252OXnnRAz67E
	 eWWTx0b8Efoc/EhpvcDZtjQoRvdOdb6NbYD+YHSNDqwc0NyemHD/vgDnwQleeF8Q1b
	 NIiyt4dUwfxIVSk0yVWcpYlolLsyublbzczmuZx7uKt4aFXA0dgzH6e7bkD5H1t3Q4
	 k5unFMhut7bUakDAa5uXnJ1IUag4y/CajiPE/1FI14/5yoBF55zmmYT2deh2A+a2Qi
	 jnzKG55wF1au+LpWsQAR2avk/a/4+jRqDokH43ymtSlZVMYClSEx35jBVJgtvBpyMB
	 PJfF3OXHSfPoA==
From: broonie@kernel.org
Date: Sat, 08 Feb 2025 01:03:24 +0000
Subject: [PATCH 1/4] ASoC: tas2764: Power up/down amp on mute ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-asoc-tas2764-v1-1-dbab892a69b5@kernel.org>
References: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
In-Reply-To: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dan Murphy <dmurphy@ti.com>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=3144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=txU36oq3S6EeFAm2vapcUDf1FVTUFMI2CXvdCdkMac4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpq1h1qssZ2tgZVALAvsm+bM/SYwoiLcxGeKG+
 yzRgOd7yi+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6atYQAKCRAk1otyXVSH
 0OlaB/4kPnxzbwcET7/a+Y84GwGoq0s1jum6u1dLUNyarASveECdWOqk9LBKv8ufd/wY48RtSPM
 SUHAKXn3+rqadzwKwpxt4omOyRxllafF0hWoUiXlpMfTzMuXmezRQ/sl1SR98njT0PGm0ip3RWm
 H8uL5tZTKlXKrdLLqCltEpC8Et8PdzrL0DMpx/KV14jVm1+EZdtUM3nIaYL7t18Wxg0Uhmg7nOr
 SI0zv0SguIqXH182SW5aujhmWBDpZJWLLD8C+bnitiIYf5UwfRsQIe7GXLa2KQXq/U/6KSqMllS
 oGyi3CpY+OcIC/lcF4q677tUINlEX5M8wMJrSNaHPPADO83w
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Hector Martin <marcan@marcan.st>

The ASoC convention is that clocks are removed after codec mute, and
power up/down is more about top level power management. For these chips,
the "mute" state still expects a TDM clock, and yanking the clock in
this state will trigger clock errors. So, do the full
shutdown<->mute<->active transition on the mute operation, so the amp is
in software shutdown by the time the clocks are removed.

This fixes TDM clock errors when streams are stopped.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2764.c | 51 +++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d482cd194c08..60d660a88fab 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -180,33 +180,6 @@ static SOC_ENUM_SINGLE_DECL(
 static const struct snd_kcontrol_new tas2764_asi1_mux =
 	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
 
-static int tas2764_dac_event(struct snd_soc_dapm_widget *w,
-			     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		tas2764->dac_powered = true;
-		ret = tas2764_update_pwr_ctrl(tas2764);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
-		tas2764->dac_powered = false;
-		ret = tas2764_update_pwr_ctrl(tas2764);
-		break;
-	default:
-		dev_err(tas2764->dev, "Unsupported event\n");
-		return -EINVAL;
-	}
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static const struct snd_kcontrol_new isense_switch =
 	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN, 1, 1);
 static const struct snd_kcontrol_new vsense_switch =
@@ -219,8 +192,7 @@ static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
 			    1, &isense_switch),
 	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN,
 			    1, &vsense_switch),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2764_dac_event,
-			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON")
@@ -241,9 +213,28 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct tas2764_priv *tas2764 =
 			snd_soc_component_get_drvdata(dai->component);
+	int ret;
+
+	if (!mute) {
+		tas2764->dac_powered = true;
+		ret = tas2764_update_pwr_ctrl(tas2764);
+		if (ret)
+			return ret;
+	}
 
 	tas2764->unmuted = !mute;
-	return tas2764_update_pwr_ctrl(tas2764);
+	ret = tas2764_update_pwr_ctrl(tas2764);
+	if (ret)
+		return ret;
+
+	if (mute) {
+		tas2764->dac_powered = false;
+		ret = tas2764_update_pwr_ctrl(tas2764);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)

-- 
2.39.5

