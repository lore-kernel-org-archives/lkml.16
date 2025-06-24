Received: from mail.postale.io (mail.postale.io [3.136.239.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D338F9C;
	Tue, 24 Jun 2025 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.136.239.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750739673; cv=none; b=A+M5k9rlrvweUKpRvS/mhftKun5IezOIoQC9XpQPvH8MwNttuUB9dIqlBeeRfPe8Q8JWVIXgM15D9nfMP2Wg3EC2aLLstOAQToixSOmcNnatkD3qpf1KHq57ctk478Az8Bf0yBaN6zF8cM7S057VkUuqOWURr11ubaDVjfbFE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750739673; c=relaxed/simple;
	bh=HLJex5AUKx/+gXv4/Jh5B0qZpNxDDVXokDOpEZVZUF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ny5xGkzhBOpVYVHDCxrYsMCEtAVIbsVhMeuJisJZ8BSL20aTTRY0OHb6ZA9HFOy3UNuYyldrMg9OsdruBUhGLxxaJZRRUGV9bXi0dy8XoFPbRMs43WwwwTei/v390y2vIUUCu4DprLQNNgkZ2xR2qF2xOWwlLTxuk/QCen1CG+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl; spf=pass smtp.mailfrom=glxys.nl; dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b=GfeUtc2s; arc=none smtp.client-ip=3.136.239.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glxys.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b="GfeUtc2s"
Authentication-Results: mail.postale.io;
	auth=pass (plain)
From: GalaxySnail <me@glxys.nl>
To: lkp@intel.com
Cc: david.rhodes@cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	me@glxys.nl,
	oe-kbuild-all@lists.linux.dev,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	tiwai@suse.com
Subject: [PATCH v2] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
Date: Tue, 24 Jun 2025 12:31:21 +0800
Message-ID: <20250624043120.2119742-2-me@glxys.nl>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <202506241158.kxrazQoo-lkp@intel.com>
References: <202506241158.kxrazQoo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received: from localhost (Unknown [127.0.0.1])
	by mail.postale.io  with ESMTPSA id A4F82316-DE20-478E-AEAB-1A2E688300B5.1
	envelope-from <me@glxys.nl>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Tue, 24 Jun 2025 04:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=glxys.nl; s=s20221125375;
	h=from:subject:date:message-id:to:cc:mime-version;
	bh=HLJex5AUKx/+gXv4/Jh5B0qZpNxDDVXokDOpEZVZUF4=;
	b=GfeUtc2slL3zfPMcf2qI8umKz0h399zumbdVpEJDiskzaUd92jTIiNWgoOPoBdu/Pkm+qJ4VMo
	BGz8o0meAE7jCi4VlNXv53fZOSE7R0v2ca4fK1lxqaVJyyQCdnhxFx4r24CIcmCmpPNBRZvS2aTw
	udpQsPLiKiHEWnaY9NMxg=

add firmware information in the .modinfo section, so that userspace
tools can find out firmware required by cs35l41/cs32l56 kernel module

Signed-off-by: GalaxySnail <me@glxys.nl>
---
v1 -> v2: fixed missing ';' in the previous patch

 sound/pci/hda/cs35l41_hda.c | 2 ++
 sound/pci/hda/cs35l56_hda.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d5bc81099d0d..f71f6aca0601 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("FW_CS_DSP");
+MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw");
+MODULE_FIRMWARE("cirrus/cs36l41-*.bin");
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 3f2fd32f4ad9..eedd8fdd3b8b 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw");
+MODULE_FIRMWARE("cirrus/cs35l54-*.bin");
+MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw");
+MODULE_FIRMWARE("cirrus/cs35l56-*.bin");
-- 
2.50.0

