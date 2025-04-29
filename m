Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FE13A3F7;
	Tue, 29 Apr 2025 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745910492; cv=none; b=Xpt8E/yuhor89iXNPGsBxDoJxG9eUtIRUFv/OiNY1TbjylXOW7MBIWlJ5Um3TNXIbHY2AaT4V5pjPytcJ66EAVcm2WxwolsSUbNQCqkoS5oNYzUWiGBCuk8pVLcbQhhSm6z9VuAPe88mAtJG52TNQ19gXhkParGhk9tgnbRre5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745910492; c=relaxed/simple;
	bh=aE6zz7cpHKR5xzBlcOsApev1m2bk4YRf052mzvXiOxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qaTNcFhzlwRCE+7h0S2lZlv/Z4O5kVdWmQZXzwIftxTU6hOBk0hVgH+sm/5RrMGzV6QVAbpwTi8X02GGg5aBddUl7tKGnzNnS8pM2yqcKrOvsne/OtwZk4t/XOxYJ0T1+k2hXbKXmgg92zTIHYYKwzi48zR7cp1YullDQ1tEi0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jkYcv51A; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jkYcv51A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745910488;
	bh=aE6zz7cpHKR5xzBlcOsApev1m2bk4YRf052mzvXiOxo=;
	h=From:Date:Subject:To:Cc:From;
	b=jkYcv51A4BLdV3F9ygISV2NYOwx/GT1GccAv8dHVFwKHu1YqULln1vB+Wxuv9l4sF
	 FaISlYdiT8PBjgjVf6Gx5iCEaK64uemTDQw4M2H6tOHNhIcoOkeLz3Ed/4QKbPfwbj
	 rG+9XsPXowMIxTHFzEsWIYDrbJKu2Ml/BrQGWd5ZhQdc1JPUmVkBjqsY0w4exI+SHw
	 /0z+4jK5KeD282fDqBgjXxnT35jQEzfiBKIyIpe49AyOVkj5z6TOJh8wFJ6LkWuq/j
	 mTt/7DAPJTLvmTk2s+f29y9S1xfnbjN6/45skMfcIdflS+6STI9eUk30oa5kdzst3Z
	 xQbFxnn/DrZuw==
Received: from apertis-1.home (2a01cb0892F2d600c8F85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C4E317E049F;
	Tue, 29 Apr 2025 09:08:07 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 29 Apr 2025 09:07:54 +0200
Subject: [PATCH v3] ASoC: SOF: topology: Fix null pointer dereference
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-fixup-of-sof-topology-v3-1-3a15b8db7696@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMl6EGgC/43NsQ6DIBAG4FcxzKUR9IB26ns0HRBRSaxHwJIa4
 7sXHbu0ww3/5b/vVhJtcDaSa7GSYJOLDqccqlNBzKCn3lLX5kx4yaGsuaKde788xY7GPDN6HLF
 fKJRKCRBKSwUk3/pgc/Fw74+cBxdnDMvxJrF9+0tMjDLaGlZXUrSag7oZHEfdYNBng0+yq4n/J
 fEsyYsQwEAr1shvadu2D8nFupMIAQAA
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
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The "get_function_tplg_files" function is only applicable to
ACPI-based devices (sof_pdata->machine and sof_pdata->not of_machine).
Skip this check for OF-based devices to avoid a NULL pointer
dereference in snd_sof_load_topology().

Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
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

