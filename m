Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFCA1DE3D2;
	Fri,  7 Feb 2025 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928810; cv=none; b=dE1cydM1la1sUmQ5CAVceMHCdwC5Z8r00nfK5HOa99D1RbZdSVlDgBcpJrNk81xMwtuVa5AtSvpX1fRQNQpBoVSsWf3pCADyauq9Pk2LoypLx93Cx/ccOYPbxVGQEdOKuwb3ITa4EtdhArUAmds15tOLUw1tvV+uSx0rF0drS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928810; c=relaxed/simple;
	bh=2V8T91nGZ/E3zY8ODMv8Kr6y/rg7PBI4fQV67w6f8C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nbkq89GhGbntCHJxTRGPCcZKskmU1WchoPEwyQ0o9IXVZKZBQJcAiDBwRlSpz6xjXfZ3LwMovJ/kgkb54dznlh1wXHml4+OCbcz00oaumPDlDETagltTj8fppYi+OzEjkhRO6IvxmEoeNvMB62wSWxpWoObBNeyAEAeubPcGq8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oeinKjDh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oeinKjDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738928806;
	bh=2V8T91nGZ/E3zY8ODMv8Kr6y/rg7PBI4fQV67w6f8C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oeinKjDhy8YT6ttHogHw7/pRWtNI8VrexxDQJDMO70GV1qMx+uWwjD3EKdosmwzn7
	 Fjr36/z+ij9KKs1dtUvZwtZbHRAR4oiMDN8txTuqq61anLpkASacJNyzxhGo8R/fKy
	 9p2+tmgb3yG6FXCAn5u+n6GLAWeycai9Eq9/QIgGq1wVUB/9l6X9/f1f7P5euZncAa
	 DyqYYX+2VmNXRGVvm449bjlyX11+3N1bX0UlPojojG2oK5h8zz+ra11sZd1o0fsDoD
	 neZmFdsDx2eiSz2x5jA2J+F4apJzjamIbNNzR+1B9uWQF/XDQi7rbfmGnIv4mvYL6X
	 jOuRHtH2VnkJA==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9CE2117E1507;
	Fri,  7 Feb 2025 12:46:46 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 07 Feb 2025 13:46:03 +0200
Subject: [PATCH 2/4] ASoC: SOF: amd: Drop unused includes from Vangogh
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-sof-vangogh-fixes-v1-2-67824c1e4c9a@collabora.com>
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

Remove all the includes for headers which are not (directly) used from
the Vangogh SOF driver sources.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/sof/amd/pci-vangogh.c | 2 --
 sound/soc/sof/amd/vangogh.c     | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index 53f64d6bc91bae9e2ec506384a83b209a296860f..28f2d4050a6769335b5908c16946eff85aa7161d 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -13,11 +13,9 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/platform_device.h>
 #include <sound/sof.h>
 #include <sound/soc-acpi.h>
 
-#include "../ops.h"
 #include "../sof-pci-dev.h"
 #include "../../amd/mach-config.h"
 #include "acp.h"
diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
index d5f1dddd43e72dd62b3d031130193e6125edf9df..6ed5f9aaa414e696b0ae9b3bb83bd92a5dcd8d4b 100644
--- a/sound/soc/sof/amd/vangogh.c
+++ b/sound/soc/sof/amd/vangogh.c
@@ -12,13 +12,9 @@
  */
 
 #include <linux/delay.h>
-#include <linux/platform_device.h>
 #include <linux/module.h>
 
-#include "../ops.h"
-#include "../sof-audio.h"
 #include "acp.h"
-#include "acp-dsp-offset.h"
 
 #define I2S_HS_INSTANCE		0
 #define I2S_BT_INSTANCE		1

-- 
2.48.1

