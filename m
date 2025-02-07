Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792FF1DED6C;
	Fri,  7 Feb 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928811; cv=none; b=IYWRJtiisy2sLXyT3DSi8ws9CQZVq8CdDoezoSzZINfidct8FI/aE3izCYEShzR84/G0/yrzAZgsePRc6lHBbVeHi0HYzLEcI9T8mO9n/pLcrlgDNmgrjPEdl1zz/LEzMJ2zgTaPa2BCy/1cvjffuDb+GuND0Z0WrZF4mpav8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928811; c=relaxed/simple;
	bh=wxf0zPe/RDiIn2bemv2QkrA74j0RiuLFsdJiJoj2U5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XD2aoH3FtOFKmv6lMDJDtow4CdfNsnfi8EtPqP9pn9SgHyf3/RgjI4mTf3ZLSMbjjHqpATW/qiWjwEfQN5YSbozXRzGL6uz9Uwv5ZyfTbd3k3Gls4eGSKCrW0UIaHWYdPXcy5vVbkYjIH6MgYw87AnJnkzw8Qzev0Fpm21Yoj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kRYKWRHA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kRYKWRHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738928807;
	bh=wxf0zPe/RDiIn2bemv2QkrA74j0RiuLFsdJiJoj2U5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kRYKWRHA/Jfccn43BUUpUvLnpRwDiJGgsjJdDY0msS9ZQAhRKiBqyDqrhwhdmtol6
	 J9Y5yDxu+ETIQs4K3OMsjyMIFX5Ayop4wI/PrCh8Sb/0aryLQU+dpPcvcq4rjY+9CO
	 wFSk7H6Pt7cQ5ikBOVoAZ9A2CxhA9clMhSgFKJwey7UmIqrneClV4/BJ5uqm9hnxzM
	 +bk0md0jUdJyushHx0yKWdCmubOursyC9GsN581CQrNFrN7OlkpwjsXVkREhL3Fh3k
	 R4LffJR5xyEybV4S+m6LB53IIMZjygBejPYhzkxexAOGFHczDp7YhPfZCvDyMbCWRT
	 ucJOagXpFW1gA==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 83C2317E1511;
	Fri,  7 Feb 2025 12:46:47 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 07 Feb 2025 13:46:04 +0200
Subject: [PATCH 3/4] ASoC: SOF: amd: Handle IPC replies before
 FW_BOOT_COMPLETE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-sof-vangogh-fixes-v1-3-67824c1e4c9a@collabora.com>
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

In some cases, e.g. during resuming from suspend, there is a possibility
that some IPC reply messages get received by the host while the DSP
firmware has not yet reached the complete boot state.

Detect when this happens and do not attempt to process the unexpected
replies from DSP.  Instead, provide proper debugging support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/sof/amd/acp-ipc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 5f371d9263f3bad507236ace95b7ef323c369187..12caefd08788595be8de03a863b88b5bbc15847d 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -167,6 +167,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 
 	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
 		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
+
 		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
 					  true);
@@ -188,13 +189,21 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 
 	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
 	if (dsp_ack) {
-		spin_lock_irq(&sdev->ipc_lock);
-		/* handle immediate reply from DSP core */
-		acp_dsp_ipc_get_reply(sdev);
-		snd_sof_ipc_reply(sdev, 0);
-		/* set the done bit */
-		acp_dsp_ipc_dsp_done(sdev);
-		spin_unlock_irq(&sdev->ipc_lock);
+		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
+			spin_lock_irq(&sdev->ipc_lock);
+
+			/* handle immediate reply from DSP core */
+			acp_dsp_ipc_get_reply(sdev);
+			snd_sof_ipc_reply(sdev, 0);
+			/* set the done bit */
+			acp_dsp_ipc_dsp_done(sdev);
+
+			spin_unlock_irq(&sdev->ipc_lock);
+		} else {
+			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_BOOT_COMPLETE: %#x\n",
+					    dsp_ack);
+		}
+
 		ipc_irq = true;
 	}
 

-- 
2.48.1

