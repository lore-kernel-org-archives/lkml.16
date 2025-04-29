Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA832EEAA;
	Tue, 29 Apr 2025 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918368; cv=none; b=Urd1R96WWvq1OWqUBEw7J19ew/qUpoiPCQbjEW5eJqqDJRDb3e40dhF8HG5U3ibrYShFeF8usK/i4yw3eJX+roIjC8rZfYCLszYRMTGxa97ITGkcQU8DKaJTgZpxNZco0W54bXh+rq6vjsRgSyeVd+q0BN5bUNUyLtvmiKBXP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918368; c=relaxed/simple;
	bh=w4iRaUQHZkM0fO8HbQ9vVBCGgcHcu6U2DhNk+9gYwqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B9bYfipEWOQDSE3yvy7F7XsLSuGmV/yXsf+E1HB2x1JHuFZvCT5CPs4osQKkhWoybtEBCAug53ajVJO2NbCvr+8+g4pHCWfMVs7zxTjmisQHGdhWNvukwQaTZAwkqGr+TwmDlBkjt1tevoW6+2IVZj7Fg9Mh32UlkH+Qc00AYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F950IaUP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F950IaUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745918364;
	bh=w4iRaUQHZkM0fO8HbQ9vVBCGgcHcu6U2DhNk+9gYwqQ=;
	h=From:Date:Subject:To:Cc:From;
	b=F950IaUPzUvgzSA6Uun5UjP3H98Cu5O5l753bkEOUgclTknoNJcmvOViQmc2cR452
	 gEzZzjz2sU36f2BsmJqWn1v4SVOMZTUAt9ZyoOtN3fqyEXlxymeiUMHo3w4AF0vvgI
	 tBBSBt1NU2SjwBljGf2LlZJ+AiFL91CB9qagTThj5Az8hdDkKlXehXfjjEBO2p0Nqf
	 ctLDh7knNJdCcdVgzElI+ZQQ+9qlPsA2pm20EDxUEMBNgXOXBCOoOX56kKVzWmUltD
	 XzPjd33HDxV7vFLZnLMrK6JkXNfPMc11AMJlcuNMUMlVopuczMyKFIelgc+ktMLbFE
	 PK6A9i2ea5iSQ==
Received: from apertis-1.home (2a01cb0892F2d600C8F85Cf092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB99617E001E;
	Tue, 29 Apr 2025 11:19:23 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 29 Apr 2025 11:19:22 +0200
Subject: [PATCH v4] ASoC: SOF: topology: Fix null pointer dereference
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-fixup-of-sof-topology-v4-1-ff692244d64c@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJmZEGgC/43NTQ6CMBAF4KuQrq2hLf3BlfcwLloo0AQZ0mIjI
 dzdwsoYjS5m8SZvvllQsN7ZgE7ZgryNLjgYUigOGao6PbQWuzplRHPK84Iq3LjHfcTQ4JBmghF
 6aGfMc6UEF0pLxVG6Hb1Nxd29XFPuXJjAz/ubSLbtLzESTHBdkYJJUWvK1bmCvtcGvD5WcEObG
 ulfEk2SLIXghGtFjPwksVep/CaxJDFNuFG1kaIU79K6rk9wrGRLUgEAAA==
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
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The "get_function_tplg_files" function is only applicable to
ACPI-based devices (sof_pdata->machine and not sof_pdata->of_machine).
Skip this check for OF-based devices to avoid a NULL pointer
dereference in snd_sof_load_topology().

Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20250429-fixup-of-sof-topology-v3-1-3a15b8db7696@collabora.com

Changes in v3:
- More detailled commit message
- Link to v2: https://lore.kernel.org/r/20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com

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

