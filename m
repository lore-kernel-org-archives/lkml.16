Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC6163;
	Wed,  5 Feb 2025 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787467; cv=none; b=mOwUqpyI23xwRelePGFEEVtlACl9Z6ywagZfpoAj+LjCgduFJq4matwquq5nz/W57E8tFzhf2+WVzxGQSPtv8u47yEjoQIUI7UtYFHQ3hzBzRp+vBYpg3rlQMdA9n5vsktEbal7Ps5cHVB2ljXK75aY5NeFJjWBu3zQAo/SlctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787467; c=relaxed/simple;
	bh=Zr+evapb/nefpmf01Gqpy0YSDWxRxiHvWclKrOSHX0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBwgGoNlimq+XYWkTNV/Kcl2PtCE0XmmRVgGrh6WbITg0yJV65Vy+wydDhPGn3gcVekAWfQrXVpCYIiFcZDJ77WEHVE8RLudN2UhCJETN+dbIYU+3xRFFrBbRJHIiyiwI4sebF8OY4pNRKfTwt3k6ddDJnGMHpXHP0sD1IMElEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtGr8wI0; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtGr8wI0"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dcd9c38f66so2429179a12.1;
        Wed, 05 Feb 2025 12:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787464; x=1739392264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAjVcNoOfbq0GY3dIYjgRmnP1VxE85PspBstMgf/BvQ=;
        b=NtGr8wI0Jj0R8OwoifLiIaO2hPvJBMl0QLR+bM46KSE0QMaLanYlvcbTVrvkf1QgFq
         aMbssi3ClVcfcrS6xnLuDho8RwNikZFwGZOdi6jBgScVL4SeT7/SryX7LJw4VzC9xpYb
         5/5rs1GFIUyoZF07O0SVW94xfIrheqZy1NVxC5GEQyZm0xJoxjakW8oT59moKW+5Hbdq
         hiI/JYspcZhTvRqmz3hW30QmPmyuNMB/fsousmMctTou7UaOgDSCw5RjXpsM2CBQJprH
         LYiKkiuydMd8y6tfTdc3+B3OkdJpm6sUgKaV1BTK+fsXWY9AZ2C3cfZ7IEQioC5LGMVt
         2POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787464; x=1739392264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAjVcNoOfbq0GY3dIYjgRmnP1VxE85PspBstMgf/BvQ=;
        b=wwgxXRPB1kuX4Fxybup10ShaEjjNVHDAHWpYF1ZSbYNr+hv/kH5TI0Gv0qS6IJuLTc
         DVTG68wt1rstVzp8aKwQQnDLl5LlDYqcp/uSN/wUWllWxVcuCHJ4oB7HR5bLmHNQNz4L
         5kej08s1ifciUoYWI9b+5TJW0bQ83hRQkDVwr5PsNhG5awS01UJY05haGBgjfIiNnqs1
         KtJKCYfRwSSdMBbil7nCA9kFx0Pvp3xR2Nn2mhn0u3aiQCbF+PF6AGU4xG32exzESQRM
         nU8adfhv1SWu8eg6p4aeGNh/CRkn3f3fD5b9ZciFl+gPe4hisd0Bd0M4wqA2eWPjS9UQ
         VaCA==
X-Forwarded-Encrypted: i=1; AJvYcCUmqlwo+eqSerCLlotOU8NKoHy0DeiIbrHsTgZSFlS7nfbRn4gsB43pFK585CV0tLDzmoJpnnM7BasMkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoRi7izn6iMOET/xZSdeBOn8rag3rFF2y2Uj4CMi9dBDJX8D4v
	gj3b27TG/XnYjOa5V4zTAN8vknNh8z6claA8j//W6tu2xstNyFMr
X-Gm-Gg: ASbGncsHJVnk3zHdGn2ZvDagJ1/+AZuceKfpmB3IOojVlAP2+J5B1MDJbFMuYwNyOpd
	jVHGXIb/3YD7F/KdaPwqnSrmuogc2ipc8fw/xgF/cFRBBcjvOP14gnX819JU/FdxhlT+tDOzqwZ
	EjnkwZdng/uef9I5+yfn5hex4uh+RbznnFSK5DoHq1uOZio0Vm5cD5nL7+1hbcuSQDZoKjKvl2f
	gzS1Jj9ggcWZXUPgqLaxsM5zsBbAsr2GrPE0XnPFLEQXIIKvxvaWIwwb0JMGM3r9c5tM9fEwvWx
	JAClE4Ir9VCQyuWtgjmkoOlIFxNtM1r9Mv0HrqVW+uqew0PTCVtNcw==
X-Google-Smtp-Source: AGHT+IFGDx2SZaBxQ+c7tA6+S6jcfUkYnjGWtcmfgxTCXalpz5BRRqDTA+J+vlJhnihyUB4ysGWTVA==
X-Received: by 2002:a17:907:1c0f:b0:ab6:726e:b14d with SMTP id a640c23a62f3a-ab76e9d8cb5mr86659466b.23.1738787463741;
        Wed, 05 Feb 2025 12:31:03 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:31:02 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 5/8] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
Date: Wed,  5 Feb 2025 15:30:19 -0500
Message-Id: <20250205203022.2754-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Drop some unneeded/unused macro definitions and header includes.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 5d6524d695e2..5ce094943aa2 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -6,41 +6,12 @@
 //
 // Hardware interface for audio DSP on i.MX8
 
-#include <linux/firmware.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/pm_domain.h>
-
-#include <linux/module.h>
-#include <sound/sof.h>
-#include <sound/sof/xtensa.h>
-#include <linux/firmware/imx/ipc.h>
-#include <linux/firmware/imx/dsp.h>
-
 #include <linux/firmware/imx/svc/misc.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
-#include "../ops.h"
-#include "../sof-of-dev.h"
 #include "imx-common.h"
 
-/* DSP memories */
-#define IRAM_OFFSET		0x10000
-#define IRAM_SIZE		(2 * 1024)
-#define DRAM0_OFFSET		0x0
-#define DRAM0_SIZE		(32 * 1024)
-#define DRAM1_OFFSET		0x8000
-#define DRAM1_SIZE		(32 * 1024)
-#define SYSRAM_OFFSET		0x18000
-#define SYSRAM_SIZE		(256 * 1024)
-#define SYSROM_OFFSET		0x58000
-#define SYSROM_SIZE		(192 * 1024)
-
 #define RESET_VECTOR_VADDR	0x596f8000
 
-#define MBOX_OFFSET	0x800000
-#define MBOX_SIZE	0x1000
-
 static struct snd_soc_dai_driver imx8_dai[] = {
 	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
 	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
-- 
2.34.1

