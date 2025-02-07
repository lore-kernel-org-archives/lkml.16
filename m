Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7419047C;
	Fri,  7 Feb 2025 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945409; cv=none; b=IUin3CYsb/ts6O/yMfox6fRCmeATrlM3EWgGtL5fdgWhL8yKNuXSAura6FaBiHYUhi/JlWbWDy2NJVwq21Fvm32ZmhQH4RJK44WwR40vgEOPKChDJknf8rJdDVk2W3OTEdTwyjZxU4YHCQCFMDn4ulfGbnCFv6i86+aKeDEF+jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945409; c=relaxed/simple;
	bh=00dstohvcxyDvJB+7xKK0xdciSDo+aZ2Nro5KZDfjqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uSY0vVWv0N6A5eL5RDpbUjM0+wcgZaQ6UKYWSdCSpKFSRFgk1wTikMDJbWKVlRaET62K4VJgXzUV5C53b4PQSD37t+cdYPq0w+x3A4zRO4l2l3D8E7krCiLvQJOnWD7jTt0zhIem609b093kd2JRlBwYf+/DzX3Q95vz+YvA+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2zmhuDc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2zmhuDc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436281c8a38so15794225e9.3;
        Fri, 07 Feb 2025 08:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945406; x=1739550206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJkU1KmB4l7DHwE2bzrMD4bmWDxpx3bz5pQap38Kxjg=;
        b=F2zmhuDcy1uDmUg+0vZC91eM0JOtZVRoyOTLQ4J69nM8WwI/M3mtXlktqsnh8oKBKN
         W89EVFE7bVqOpEapX8k3u3WFVfGZrHnpXBYP5wr39XaWi4lFAEhBPoytsUij/OlAKaJR
         tgbakU65M3bdZ6edLtQz0QShMh27W2xb8MIsA+CROHEjxUDcBtRosNS/ySEi8Ye3zVmO
         ZtrHgqjKAvf+xrRmA1kFGmiVmA0sGeNgI9ik8K2KGcSv9B6bByWbAE54nvgdmRRsB1X+
         w2doPfsVWnWYEJBTVrrvw0WIKpvJMK/amT8PeCnNnR9KXpjFS66kNY3khkiYzkN5vj/6
         OZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945406; x=1739550206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJkU1KmB4l7DHwE2bzrMD4bmWDxpx3bz5pQap38Kxjg=;
        b=hcNHdQpA0+/OS3KetaD6BOKeenmySVOCpQzARY/rlU0/Xu+vKRzPOFfnS8C7aOxKFI
         KsxGUhgvy0oe8wzCm7YS4j3YoacvYvMcXQIVmeAaVdWpwkA2QFyGlixyOwma3EjPOJyL
         YKZTuDRqi+KfRQuctApcNGwlnJeEI7nsvJGkJC7Blv/+LNt4N5/ihGfuqLhwqUGMpo6n
         8B+2omQJuDEyhzJERSleVaL6JX6USf5HMpheYoHNENgwAgGUJbrMXl7DYRh/AZozJcPN
         BQn6h53+ahlLu0QUR1rRWhhwriMdnkUhtWcu+raedvwZNDOXKpX5DCLnJD7WngFo/h2B
         3wbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Y8O5ewJt4XFQaGzjW1BauP/zgDxhXqpx7F17vk40NMVB7ru/TTJlT2GVqplbu2eD4uQA3TaFkWi6zA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk7XV5ZImB9dzQJUUw2hlaYpbqU6RJDs4t5WSdH5sqB2kWDkzp
	HZjlbsGf4eLHKYdp/MS86/coola2kePTyhCiRnVrh4WLJ305r7QX
X-Gm-Gg: ASbGncumlCfAdGOC3mrBef+jMrf7JhKcSFwsO+okP8cxCXG4t+AiNpPddSvZZ/JSzwH
	PWVeGW3qPxKb+LPMnH3Og13u15UB1+T8EMjOb/7e8OQtj7p/KgDplVANJf58IdIgXLRjRWIeNKf
	T+98HzJlf3YCkb9Y4oGeJnmJiWqchQMjUOlpSt9ErVhqFKnQbGNUpQYbZoSykMIkQpDXkaZuu4k
	O7z0t+eOU6iULgamlIgZEbTcwwo2bD+wfCzfF/IZX1Wm/1I8Nui5CULbxVIMcP3+ZM1duaNzdXI
	6aZUzoLOErgx93+sePZvhTzAEuVjQ2ZrkXB8iWLMgFyeW8bT7wDyWA==
X-Google-Smtp-Source: AGHT+IEDx2e4YeD52CE58CrpNv/sjvtNAXkVfDjYGlMXgzf4qcCOVgfUIQ46bJE1JrrmbEoqvZJvWA==
X-Received: by 2002:a05:6000:144e:b0:38b:ecec:8576 with SMTP id ffacd0b85a97d-38dc8913e36mr2674138f8f.0.1738945406261;
        Fri, 07 Feb 2025 08:23:26 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:25 -0800 (PST)
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
Subject: [PATCH v3 4/7] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
Date: Fri,  7 Feb 2025 11:22:43 -0500
Message-Id: <20250207162246.3104-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
References: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 52dff369d9cf..9a32ebe3eabc 100644
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
 /*
  * DSP control.
  */
-- 
2.34.1

