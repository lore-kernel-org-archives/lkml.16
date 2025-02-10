Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D4254B1D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227584; cv=none; b=stfzVi3/zMPrijXgkFeZek8G+UKr71v6lJOKgR6dOCo/dITbTZ/umuAgvhwg/k7QuaKUm65uKnvNGvKqSfXxJ1L/wYn+nifY0Y58/9jBMSxQSbfQDXwdzjOvDfwjikoELKwqDN/fZ9MRNgmCF5EK3VXPBnHo8cXVLknsXj/hJ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227584; c=relaxed/simple;
	bh=TzHEd5eTrFeLbGCy70Lrd3O19A/neSYiwaiTebrdjf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxQRG7393jIWKJ4ldnFaqGHIV3oh1JbKbjqwbCG/FWMx9OFCcxEjUhhYxYLtT5uKQwB32nz2ai2zlNwOPX3z5+6DYZKa6lrR6JRTRMdlF9DeDGdCjsT1fmTe9zBfZW9HOX1XraVh9xcn25oJfui3IgeEuX/iMebDlZnQgs7RK/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hfRg5zvL; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hfRg5zvL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739227580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XhJoOYylyScttjl10zGIAvAlzbdG8kDOJU/varHqtVg=;
	b=hfRg5zvL9Im70+0AggXrST6EVT5FWYpWkkbbVv5YrTYWQhzVj2svSG7I376FPWtaXwAj96
	bBf7Gwytn92VZSxl2xsyd7ZLUQyGLiwNGTEE6LpOWLURoqMq8D5D/c6O9PiLR19pU2p17l
	5W9tidyE/LKDAzdF5acV0gfeDhaWPD8=
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
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: ipc3: Use str_enabled_disabled() helper function
Date: Mon, 10 Feb 2025 23:44:54 +0100
Message-ID: <20250210224453.363638-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function. Remove unnecessary curly braces.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/sof/ipc3.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 7de5e3d285e7..4a194a705ace 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -801,20 +801,16 @@ int sof_ipc3_validate_fw_version(struct snd_sof_dev *sdev)
 		return -EINVAL;
 	}
 
-	if (ready->flags & SOF_IPC_INFO_BUILD) {
+	if (ready->flags & SOF_IPC_INFO_BUILD)
 		dev_info(sdev->dev,
 			 "Firmware debug build %d on %s-%s - options:\n"
 			 " GDB: %s\n"
 			 " lock debug: %s\n"
 			 " lock vdebug: %s\n",
 			 v->build, v->date, v->time,
-			 (ready->flags & SOF_IPC_INFO_GDB) ?
-				"enabled" : "disabled",
-			 (ready->flags & SOF_IPC_INFO_LOCKS) ?
-				"enabled" : "disabled",
-			 (ready->flags & SOF_IPC_INFO_LOCKSV) ?
-				"enabled" : "disabled");
-	}
+			 str_enabled_disabled(ready->flags & SOF_IPC_INFO_GDB),
+			 str_enabled_disabled(ready->flags & SOF_IPC_INFO_LOCKS),
+			 str_enabled_disabled(ready->flags & SOF_IPC_INFO_LOCKSV));
 
 	/* copy the fw_version into debugfs at first boot */
 	memcpy(&sdev->fw_version, v, sizeof(*v));
-- 
2.48.1

