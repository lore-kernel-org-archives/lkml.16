Received: from mail.postale.io (mail.postale.io [3.136.239.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2A70808;
	Mon, 23 Jun 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.136.239.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687490; cv=none; b=RruAEQtsAwv9jtxm0UpxMS/mxzrOUjtYQyY5RiEkF7UvbfyjknppdVi7mxWo4IbVmKmwexuNdMgguZAW0j1f3CiLDPUwkVMDpVyvvknWAxx3nBGHiXHp6sgj5JWVRwAYMSo9JHIfnimj4/baX4dsQDykJvBoeeJD9cLqRH6a6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687490; c=relaxed/simple;
	bh=6XQlyCUS2gWhobrzOHN+QuiHbimv1iGT1sT3DR9O7do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDVeOYF/yMPGDGpa8rhoGEVC7yP4kLL9iSc5m05U52pf0FO8fhOW00affiDp477dpfk1P67n2zRpjHrei/8mzhtGTdgQwgTehsJq1MSlQyrLO0s0QwVW+zUo8+Ehy7XcXyCfay1WaS8VBaPZBRUb5vzAGcXlnMHi638MYR/q2BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl; spf=pass smtp.mailfrom=glxys.nl; dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b=Y14YDZCO; arc=none smtp.client-ip=3.136.239.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glxys.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b="Y14YDZCO"
Authentication-Results: mail.postale.io;
	auth=pass (plain)
From: GalaxySnail <me@glxys.nl>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	GalaxySnail <me@glxys.nl>
Subject: [PATCH] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
Date: Mon, 23 Jun 2025 22:00:31 +0800
Message-ID: <20250623140030.1539477-2-me@glxys.nl>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received: from localhost (Unknown [127.0.0.1])
	by mail.postale.io  with ESMTPSA id 5CC59E4A-8D82-4B56-8B77-D53E820242D0.1
	envelope-from <me@glxys.nl>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Mon, 23 Jun 2025 14:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=glxys.nl; s=s20221125375;
	h=from:subject:date:message-id:to:cc:mime-version;
	bh=6XQlyCUS2gWhobrzOHN+QuiHbimv1iGT1sT3DR9O7do=;
	b=Y14YDZCOBVYiDFAkgbiEVh4f5FvBEPBUuQiMGmEkuHuZTOnZIuvRfUHJwNDXfDKLFeijAmCa7n
	pAr9tCkO6JdOraQrX8W9LoWUcBsA/J6ZH2xMb71fRjVSKte8fcyX54rcSgdOIUcSmQxpBlBZyqZD
	UC3s0QciOJLBy1H/M2ygA=

add firmware information in the .modinfo section, so that userspace
tools can find out firmware required by cs35l41/cs32l56 kernel module

Signed-off-by: GalaxySnail <me@glxys.nl>
---
 sound/pci/hda/cs35l41_hda.c | 2 ++
 sound/pci/hda/cs35l56_hda.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d5bc81099d0d..90e994b79481 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("FW_CS_DSP");
+MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw")
+MODULE_FIRMWARE("cirrus/cs35l41-*.bin")
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 3f2fd32f4ad9..c393fc0c7339 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw")
+MODULE_FIRMWARE("cirrus/cs35l54-*.bin")
+MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw")
+MODULE_FIRMWARE("cirrus/cs35l56-*.bin")
-- 
2.50.0

