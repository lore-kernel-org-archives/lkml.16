Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02671A7264;
	Fri,  7 Feb 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928809; cv=none; b=IlYUaTA6e7eEWMauiDCPsw46hOLJbCmYszKkgYIvweRTlXF5hv/P9sLpnNFJUq7zjXu1IvNECVtYPyS5ZHsuS2vhzrfXznRE37/W24GZXJlKGQiXtPjoh38sE78cjgLlY9eE6h1N1v72+YA5IaL/Lpt8ECK1WSiapuiff0Zlee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928809; c=relaxed/simple;
	bh=YQnd1JYPID2jesZLmcSp+CRXJ4HV47bmtKKxCbVX2LQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flJ5L9gukkw900HD0X2XD3zPQJRBqGrVjA0NreDYMHtzaO77btVDMHira/AsQM/yO/zQUPa1NBOH2Avv/u+e0DQ8GNUAwDCbBRLJZbHj251fSDecUT+UYL5S+RWF3z1eSmAXWw5KMcxfXae/LwG7jd506QHgeRor3djjb45eZPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PTbFi5fx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PTbFi5fx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738928806;
	bh=YQnd1JYPID2jesZLmcSp+CRXJ4HV47bmtKKxCbVX2LQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PTbFi5fxGz6wGQhQG6vPP11fyXDEmX0uhWSgZry8I4bOcc39CidnHsVWgg4MnnuHB
	 nlBWE1LNoApgmKzyECCjty+gBmTO8eq6sNjfGjSgbmbqbWf9lVrkb85tffiCext1//
	 SMHFM5g5svIyy/0InuCaRby6WG9rHcan8W+t7vCuplNvbtWUJNu0hwYgsh1jUS0d0L
	 vWjCR3OKIGC1ZVZzJkygM+6VvhQgf3hfAM/tKqNNvHmxVYPjnDHWyqsmfEvinlxY8G
	 MTS9qcQaZRoctKaMWCnugOvMKW7wpsKPYiGBoO0FByBWcDaDk12cFnBUQJqQCoVVuv
	 zxEBSnpxIuPEw==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C866D17E0F9F;
	Fri,  7 Feb 2025 12:46:45 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 07 Feb 2025 13:46:02 +0200
Subject: [PATCH 1/4] ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-sof-vangogh-fixes-v1-1-67824c1e4c9a@collabora.com>
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
In-Reply-To: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Stress testing resume from suspend on Valve Steam Deck OLED (Galileo)
revealed that the DSP firmware could enter an unrecoverable faulty
state, where the kernel ring buffer is flooded with IPC related error
messages:

[  +0.017002] snd_sof_amd_vangogh 0000:04:00.5: acp_sof_ipc_send_msg: Failed to acquire HW lock
[  +0.000054] snd_sof_amd_vangogh 0000:04:00.5: ipc3_tx_msg_unlocked: ipc message send for 0x30100000 failed: -22
[  +0.000005] snd_sof_amd_vangogh 0000:04:00.5: Failed to setup widget PIPELINE.6.ACPHS1.IN
[  +0.000004] snd_sof_amd_vangogh 0000:04:00.5: Failed to restore pipeline after resume -22
[  +0.000003] snd_sof_amd_vangogh 0000:04:00.5: PM: dpm_run_callback(): pci_pm_resume returns -22
[  +0.000009] snd_sof_amd_vangogh 0000:04:00.5: PM: failed to resume async: error -22
[...]
[  +0.002582] PM: suspend exit
[  +0.065085] snd_sof_amd_vangogh 0000:04:00.5: ipc tx error for 0x30130000 (msg/reply size: 12/0): -22
[  +0.000499] snd_sof_amd_vangogh 0000:04:00.5: error: failed widget list set up for pcm 1 dir 0
[  +0.000011] snd_sof_amd_vangogh 0000:04:00.5: error: set pcm hw_params after resume
[  +0.000006] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at snd_soc_pcm_component_prepare on 0000:04:00.5: -22
[...]

A system reboot would be necessary to restore the speakers
functionality.

However, by delaying a bit any host to DSP transmission right after
the firmware boot completed, the issue could not be reproduced anymore
and sound continued to work flawlessly even after performing thousands
of suspend/resume cycles.

Introduce the post_fw_run_delay ACP quirk to allow providing the
aforementioned delay via the snd_sof_dsp_ops->post_fw_run() callback for
the affected devices.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/sof/amd/acp.c     |  1 +
 sound/soc/sof/amd/acp.h     |  1 +
 sound/soc/sof/amd/vangogh.c | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 33648ff8b83365e76d7d90e52c2cb8f884a2fe72..9e13c96528be3371e063072513c118cfc8b93fe8 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -27,6 +27,7 @@ MODULE_PARM_DESC(enable_fw_debug, "Enable Firmware debug");
 static struct acp_quirk_entry quirk_valve_galileo = {
 	.signed_fw_image = true,
 	.skip_iram_dram_size_mod = true,
+	.post_fw_run_delay = true,
 };
 
 const struct dmi_system_id acp_sof_quirk_table[] = {
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 800594440f73914e7b8ccaf86369ac686e1da630..2a19d82d6200223cdfccd49fbcf1b52968ae1230 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -220,6 +220,7 @@ struct sof_amd_acp_desc {
 struct acp_quirk_entry {
 	bool signed_fw_image;
 	bool skip_iram_dram_size_mod;
+	bool post_fw_run_delay;
 };
 
 /* Common device data struct for ACP devices */
diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
index 8e2672106ac60a22824836a944503a05616f8661..d5f1dddd43e72dd62b3d031130193e6125edf9df 100644
--- a/sound/soc/sof/amd/vangogh.c
+++ b/sound/soc/sof/amd/vangogh.c
@@ -11,6 +11,7 @@
  * Hardware interface for Audio DSP on Vangogh platform
  */
 
+#include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 
@@ -136,6 +137,20 @@ static struct snd_soc_dai_driver vangogh_sof_dai[] = {
 	},
 };
 
+static int sof_vangogh_post_fw_run_delay(struct snd_sof_dev *sdev)
+{
+	/*
+	 * Resuming from suspend in some cases my cause the DSP firmware
+	 * to enter an unrecoverable faulty state.  Delaying a bit any host
+	 * to DSP transmission right after firmware boot completion seems
+	 * to resolve the issue.
+	 */
+	if (!sdev->first_boot)
+		usleep_range(100, 150);
+
+	return 0;
+}
+
 /* Vangogh ops */
 struct snd_sof_dsp_ops sof_vangogh_ops;
 EXPORT_SYMBOL_NS(sof_vangogh_ops, "SND_SOC_SOF_AMD_COMMON");
@@ -157,6 +172,9 @@ int sof_vangogh_ops_init(struct snd_sof_dev *sdev)
 
 		if (quirks->signed_fw_image)
 			sof_vangogh_ops.load_firmware = acp_sof_load_signed_firmware;
+
+		if (quirks->post_fw_run_delay)
+			sof_vangogh_ops.post_fw_run = sof_vangogh_post_fw_run_delay;
 	}
 
 	return 0;

-- 
2.48.1

