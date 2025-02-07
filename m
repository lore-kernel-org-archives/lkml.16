Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BCC1DF24F;
	Fri,  7 Feb 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928812; cv=none; b=TSpE1ENnzL1rlF/apq9I8cpFdA61BweqiiF884W8561iFQUnYzMn3bUIChjKN3gJXQDsvqan1vVfPF8bjm2HBDt/w2FfCXhqkhI3RWshjvmKpOCfEVYexLZOV8sxJTcdGrCkavdCInzaqxxVUvScKXfHl2aDOe9SndzxiHDWrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928812; c=relaxed/simple;
	bh=H0rXNCWcCYKTxtO4blj1uR9+hKzfT9N/DPWTmQgYXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6BqAMOliV3ls7q31N1BWddzlAoVA6jaUCZnQW5HEI6xpfIWfzdAK0RAoX4J91PFhLa3PN3CjKm2J7x1unrMRZ9N9MVI7yRN2UT6zQVCIegRkgRbywpV2c1smT5QxIswYCqfHpYYrawLBI4O0SvgNfK2vBi5XUPmTelIfBnLwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R4lzb8ld; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R4lzb8ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738928808;
	bh=H0rXNCWcCYKTxtO4blj1uR9+hKzfT9N/DPWTmQgYXGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R4lzb8ldLKl8ogOXO9PmOgL/inF1T3Nz4+S5Cy6O2EYbaQ1pf7Fc3fMa/c2xEG9CZ
	 z6Oicq0u+P7mWA26ANDZoTS4NFzH8pz2wvamTqYqsjy7vVgRHX+wNijN9R8tCAFU8A
	 F1tvNThLz27MlPdGA0Q4q8du/jCJuseSDQcpIJR2l7NCWPFXu7DRRWxKBZgmFM0Zwt
	 RudFGFR5BCaKLP1Y/NkW2Nj/bVB9Ih5K61kzdGvayPThagyg1cpWLK60PcvhkcVmfN
	 PIy7UsjpkTs/C0EQHS5ZCPHHZe+9etGZLgpfNGmHdDB+YRcu5mxNEBlQwwfjdhEOqE
	 uFh5ilkPlbc8A==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6ADAD17E153B;
	Fri,  7 Feb 2025 12:46:48 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 07 Feb 2025 13:46:05 +0200
Subject: [PATCH 4/4] ASoC: SOF: amd: Add branch prediction hint in ACP IRQ
 handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-sof-vangogh-fixes-v1-4-67824c1e4c9a@collabora.com>
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

The conditional involving sdev->first_boot in acp_sof_ipc_irq_thread()
will succeed only once, i.e. during the very first run of the
DSP firmware.

Use the unlikely() annotation to help improve branch prediction
accuracy.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/sof/amd/acp-ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 12caefd08788595be8de03a863b88b5bbc15847d..22d4b807e1bb75e6f4e6dbf161d79b1a43808004 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -165,7 +165,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 	int dsp_msg, dsp_ack;
 	unsigned int status;
 
-	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
+	if (unlikely(sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE)) {
 		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
 
 		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {

-- 
2.48.1

