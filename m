Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83E20E033;
	Mon,  3 Feb 2025 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603154; cv=none; b=WvZbIw0oh4iZQE/TNBwY9KaViByqLK7mySTH64fTSaEvT5NKE58atMeh1QrCn/VstynshL3pqfqb2H85Tp4IhpKqkiaW8VK+POsSzBwLZs+LvNL1qOP01fKamZekdlYenON2lhmsqOyhYJcHc+nJPLiRv9lxTGD5Ca4YA92DxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603154; c=relaxed/simple;
	bh=105ztv0GxeKGez2Y1scHpelgc9Xdh5IcIC+jWLs7RP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9HJI0pUcraMrF/uTR/6YqRnskk527YhsQiiqc2TSey5oiWoRRxfTl99GFVp+xm6YBAnHnjIWUqUiQiSE/tlIyu4wvmWIv8son7KLhG+bKqcIl/T0HIebOeFpFDlS+cC2mwHCpAAehCzliVk2oyjuAAaMZBbjM7KGDjZfMsh/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVVKpeJX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVVKpeJX"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso7637722a12.0;
        Mon, 03 Feb 2025 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603151; x=1739207951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVLkWQiYUuhhhsdwpTyM3ZsFW0DY+2FMF1nD3WQqkOg=;
        b=XVVKpeJXy7NbSIU84MQktms3X1Tzkgj0Hn9K2zb0Vgv0+BctDUXKpt955g07VZMDpw
         9rXUwMTOgelkCw0w8mvyOo5LYf5SAdOyHgKdLY+07RkEN2HdnaIYYzp1a81jwnYQBe4c
         DDdOKSZbN3aBOO+lrk8ey/cKtmRJHSrHemdkhlWar3w8PEhdnxrtJ2g2UWsxUdL744sN
         0xdP3pmjLg1EpFhjzf7HM7KQUCMcC6XTkE7voRD70GJQTp0A3iuzJJBA1DekNxIpU8B0
         ge8cMZy71jYV/bFd7ZPPQDRfSM3GxS+1o7nOhvkc/hkGkY2QyucaAUlneJwuFXnCHAGh
         2Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603151; x=1739207951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVLkWQiYUuhhhsdwpTyM3ZsFW0DY+2FMF1nD3WQqkOg=;
        b=aqmcvVxU5nzP+QwPbeOM0g7j3UOh21OZIexYpYtixGvNDldH1ao6K7NJrR+cp0T3MA
         5BnbJDnGLlUePno8SfxIkA7N20+H03R/hi5fz6Zh4LUoEP/02obHRrZaSp1fOCmPsCc0
         TS3oj4AUHweUZfS1KKp5rjc3vQpo6T/NtDGRxaOY4XBGso12x6A3G1Jrw3iks+GSt65T
         aYBmGa4n4JEmUvffBcoRnsQPHxsyfyie93cjWaYSL4xRV3QsDqMGQ9TnvHi+a3wiwX86
         ekRIQceIQtnLXeZG3elEHiejQ2YMPg9TXDE3fZwtKE1cPor+TnhlAsMyiB29JtykPlSY
         5blA==
X-Forwarded-Encrypted: i=1; AJvYcCUz1Gd0PVr5ahYiLhspyFC+XCGNk4giPUgVC8dQyfBzjW0Ti7iPeEI1vCmuKrKZpNihJQ6q+9lvfnmKGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx62XIsZG+JZgMfNp3cpsPFeaZ0zFPfR1AV6w5Sz9BHPVu4EgkO
	0cCW++WENe0Znx+SYalRM/KwHSgVGHl1CGvYPgcViimH8bmKyddr
X-Gm-Gg: ASbGncssA+tNDF03YKPERDKMgfId1/nMMY5EAxv0MlsX25mftxFCLOpDSHFW0ZuVpU4
	xl3I3t7oebzhxB/z4S/LePgmiVeZ4/rk51OJSunntrbX8DgKMgR4cqb2jMwjuNjSz53xgpBFQSZ
	MErpv9CzNB9wk8OdG/yOLyFkOEU/zfi2pLdVTtC1pyZcK7iBv05ZRMdJsXc31xuD02LjIKOLTme
	RdbdRGUcamR/+tpcvRQREApCM6pZTrTGcg9nQIl5xZw65N3kgksr493HCGIulQaBpP5PCUT8L3o
	Kvez0Ih2C7q+QWEiBaYabC59wVSDGsaQS9DPnzSqfkBgZkue8w==
X-Google-Smtp-Source: AGHT+IFWBtIzBa55lZGBmGM864Rxc9R4mw2rCLQdHmq6rtMQaJzvFs8EjxgL0A6Ds+KOpWrF0JHfSg==
X-Received: by 2002:a17:907:961a:b0:aac:2128:c89e with SMTP id a640c23a62f3a-ab6cfdbc4d3mr2826766466b.43.1738603150375;
        Mon, 03 Feb 2025 09:19:10 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:09 -0800 (PST)
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
Subject: [PATCH 5/9] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
Date: Mon,  3 Feb 2025 12:18:04 -0500
Message-Id: <20250203171808.4108-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
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
index 93968f077d52..1efdb169cf07 100644
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

