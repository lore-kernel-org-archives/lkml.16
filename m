Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0F26B975;
	Mon, 28 Apr 2025 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847150; cv=none; b=FP1CVuG/066XhbTr45VbhDJXr8uM27Z4GeP1ImtpEbOH+2NQFMX2vFSA8hCdyGBDwPzafpMsy8BMmEN77AMV8ULy4wpXZ4MRg2OjcQJe7Aep2ilBwAizFRDFBQjwV2kjXk0oK/K31RRH0ehlOB+Ih7c6N48nIH1k1fFb0lwG+7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847150; c=relaxed/simple;
	bh=8jtRb1Hh/0Vm82dhFZQWZkgaVHK4NRx2LMCvM6Taf3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u1k0o8r61RFiOg9TNCNnt6lz0HpjlTNkTsbdUu+RTB4qW7ORm8sSXBlm5iZNeTrretr+RIHfipJIDdjOLD7R4fbsEy1B5OM4RIIkOWmfZh4rBONWB37CpdFLh/kCAadakQRsrAiC6kqLZjKFwMD4q6PhpfaeiXZ5ZBHUg8i8m7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ei4ohMHO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ei4ohMHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745847146;
	bh=8jtRb1Hh/0Vm82dhFZQWZkgaVHK4NRx2LMCvM6Taf3I=;
	h=From:Date:Subject:To:Cc:From;
	b=ei4ohMHOIFbtKhh4oTI7xfWQRZ5ltVT7NXtGKkG3CGViMwP4578NSzCGhv+Jd2Kn2
	 kCDu/vI+lC/MCVUPmHYR9hX5/pKJa0fxC2WfV1X3wsSFGYLDXrzLcW7XaiK3nh0IZ6
	 jrCRCyRN2QyK/PdYNivQ6k8ROXUDh2/cUQmubTq/WDBOe4z1GVLOT+qc8OPd2EvSi3
	 5Bfnsi/xeoEb7DiE7Qk9RdMrMw5pTy1m8n6p8TtzmW3+htVtA5P/q53KXCQwn8pnRH
	 Ox5yCULFR0iWqxIt6jD7JIRaqVV+eOOH7NDj444FMv0kLSE8Mv4oTcAxISruy0zB4v
	 YUL2TMf03Ab3Q==
Received: from apertis-1.home (2a01cb0892F2d600C8F85Cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1CBB17E0DD0;
	Mon, 28 Apr 2025 15:32:25 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 28 Apr 2025 15:32:24 +0200
Subject: [PATCH v2] ASoC: SOF: topology: Fix null pointer dereference
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGeDD2gC/4WNTQ6DIBCFr2Jm3WmACpKuvEfjggIqiXUMWFJjv
 HupF+jiLb6X97ND8jH4BPdqh+hzSIHmAuJSgR3NPHgMrjAIJiSrhcY+fN4LUo+paKWFJho2lEx
 rJZU2jZZQukv0JXjuPrrCY0grxe28yfzn/lvMHDk6y+tbo5wRUreWpsk8KZqrpRd0x3F8AeaaO
 jy+AAAA
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

Prevent null pointer dereference in snd_sof_load_topology()

Signed-off-by: Julien Massot <julien.massot@collabora.com>
Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
---
Changes in v2:
- Better commit message as suggested
- Link to v1: https://lore.kernel.org/r/20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com
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

