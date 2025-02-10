Received: from out-179.mta0.migadu.com (unknown [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903E14B08C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188946; cv=none; b=nU/Q+JWKa2nTPug8dOr5/fUe1u8jWlOm0QiwvgCVObhXnpD24Mvb/OgC9SLy5Top4akr+FbCGGeQcAYtQm96PpN66ko16KJ5Rk0WcrSUqPsZqCgxiitSyLWs0rrSOc9TUySMqc9qjTgHb7XWlRFWyr63JQoZ/TcRb9PIjRefvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188946; c=relaxed/simple;
	bh=qEWjjv1OKr0nsfOSK7KFSHDmp/DaHTep6guXolJn2YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rp1H4qnCjPN4KHfzjdpkFkFihYFn1ChMV8oTFa/c7ivYeKZRPFh722PZ39XmGHcFIgz2bWk3srgt9RNBcRGU0Pea8zyUFwpHNMfnRnW00wHsZWmm0XOHQV2jnv7Kg4vKFOm/eh5YoCNWaQZWvN4wBsnVZCBsYSWOCHrD/cmd67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BP/5BsSv; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BP/5BsSv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739188935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pA/6WNfJ1BYe+CfJ9cK2duSfXSVvygT2LUvTsOk8I0Q=;
	b=BP/5BsSvEhpXqfQg/VHI0dP7cpL9dIWZY2KLwLYXMGbwpE0b3UeF1t7Rqphz41xeS+YUBS
	n61iZpMPQE4synPfhTr9LbVCDw4jcFjvEAvnKMvLHq3jRzQjwpKaHCXOp023Be+/GQTHMH
	Q2PtR+tG0gQJtpQNJk6nP0ASC8bhXZc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rander Wang <rander.wang@intel.com>,
	Fred Oh <fred.oh@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Intel: Use str_enable_disable() helper
Date: Mon, 10 Feb 2025 13:01:30 +0100
Message-ID: <20250210120132.53831-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enable_disable() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/sof/intel/mtl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index d07c68f431ba..4a6b1d56171e 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -11,6 +11,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/firmware.h>
+#include <linux/string_choices.h>
 #include <sound/sof/ipc4/header.h>
 #include <trace/events/sof_intel.h>
 #include "../ipc4-priv.h"
@@ -176,7 +177,7 @@ static void mtl_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
 	if (ret < 0)
 		dev_err(sdev->dev, "failed to set SoundWire IPC interrupt %s\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 }
 
 int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
@@ -209,7 +210,7 @@ int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to %s Host IPC and/or SOUNDWIRE\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 		return ret;
 	}
 
@@ -228,7 +229,7 @@ int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to set Host IPC interrupt %s\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 		return ret;
 	}
 
-- 
2.48.1

