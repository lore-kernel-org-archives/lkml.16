Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAC1B4236;
	Mon, 28 Apr 2025 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834198; cv=none; b=WrS3Hza728OeKwNwYW8A4NZrHh/KUW0FAGwj6L0DDiHQVtz97EC4RlHmd08YksGWRbvs1T1UQsjhXMVtxo/fXk8kwk9TwaxIqi5l5yGOcZ7tp+c1+1AvA8O7pUBC3UFcyiPmJd/331NdwZWp/WNuNu9BnWwn1a9f3HyvmN/8gYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834198; c=relaxed/simple;
	bh=XYTODzse5us2neQsw8s2lArUi8LCD60YViDDuzArWxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mLb6eCiFCODFtrA7uVI3+NGVIVJMnCfKT+A0ej8Sslxl8JwEkLVl0kxBprMi5S1Hmpx+gkqKzv4O1x1czoyQ4Q3K2Pn6EFdDbGAZC966MgJbyiIhPwV9HME8izUlIS+LwJtTigQ7gHI+GY2Gz9d0Y6lrxri4jj+8AmsVHtmT820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RYRE0B3s; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RYRE0B3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745834193;
	bh=XYTODzse5us2neQsw8s2lArUi8LCD60YViDDuzArWxU=;
	h=From:Date:Subject:To:Cc:From;
	b=RYRE0B3s3c2f3BvIo0Agghh0O/4++TkIZVox5gAvgV9C4VQCiEjz5VbuNsVBmeP9I
	 TFJVEH5XontUJ1K65A3Dsdt79mNqwwtBMEO80PaxpBhPjsD27xWTbanQLsWEymfjx+
	 7GjZJb0UIDIbO/RziEnl6wmlt6LuJull3VAJadqw9ON+gtW3FHn+1LC/joZ05owmDP
	 GramMJH/Fi4QgLcYSMBU56whWnIUuQp+YCaGFARCZHJjM6igpyDHKCvJmmJlKzmz+7
	 3nysHtq8mc+s+VVAzZdhrHZYrm5roCUlNsJ4KVRYjVF4bR76EHTfJMgish7vQPMI7L
	 3dw/Rbo24ulRg==
Received: from apertis-1.home (2a01cb0892f2D600c8f85CF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2534617E0F93;
	Mon, 28 Apr 2025 11:56:33 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 28 Apr 2025 11:56:32 +0200
Subject: [PATCH] ASoC: SOF: topology: Fix null pointer derefence
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com>
X-B4-Tracking: v=1; b=H4sIAM9QD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3bTMitIC3fw03WIgLskvyM/JT6/UNTWwsDAzNbNINLcwVQLqLSh
 KBSoEmxsdW1sLADRnCMlnAAAA
X-Change-ID: 20250428-fixup-of-sof-topology-50886568a785
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <liam.r.girdwood@intel.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

sof-pdata->machine is null on OF device, since get_function_tplg_files
is only implemented on ACPI device (machine and not of_machine),
check first for null machine.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e19ba94f2c80a43731b90351bacfde2720db50ed..5d3ee3a86392c5a3fbfd05f83acc99b102c8cf61 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2481,7 +2481,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (!tplg_files)
 		return -ENOMEM;
 
-	if (sof_pdata->machine->get_function_tplg_files) {
+	if (sof_pdata->machine && sof_pdata->machine->get_function_tplg_files) {
 		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
 								       sof_pdata->machine,
 								       tplg_filename_prefix,

---
base-commit: 80626102e730787e2cdcab0e36d267bedcd1a63e
change-id: 20250428-fixup-of-sof-topology-50886568a785

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>

