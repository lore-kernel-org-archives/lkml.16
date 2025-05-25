Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157C2EAE5
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748161704; cv=none; b=G3v4d4oq3rLHCAGUbs9WUlTRgoYnd2s/DrMFFTgx7IrBAYEck2F1aOhtwUhmQ3lrQBQRq2nyIlocDA09uzmlzMm8PbBrzlSWijTP6ogAQK4xz2SXVIQRmJUsnuh14dlV/MI1179oR/8TNS2ygudq/Fsy6nQVrR+VfvkMDIudutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748161704; c=relaxed/simple;
	bh=ejp4wm01HVYCSmFMOQbnLtRgrnY0ZvRQ2FFm4BrYP8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b98s6cfEImAkLl3U3VCDOPYXFXg9YFp3uVLOW5UNvegOdJ8vnqIFrCSOTsTz0gb4p0n9/PTnOAjsvnITuE5BpGrn7bhzcvZkTvQ7NtOIiS0pK1zr5G22NA3qaX2YgVrsj+azeoLHY0wahXVaIbT0noj7u1Qj6xSxHqXfjMOdRBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhosYu4F; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhosYu4F"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231e8553248so8531905ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748161702; x=1748766502; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtGixB0M/1PSb+BQwspOVAOu3wyv8hN39n5BBlGoJHY=;
        b=GhosYu4Fomav7c1Gdr887PwPhH2EhRIYmNIH5N8LUUYpt/MpOzJbDggnQXYdOq5Stw
         dNJ3T53Do8VL7Ln797QN94VdRsOS3JXo3bE2wmzyIbMpbVI88axwMnNVaMzyduzyaoW/
         TgV58m7a7tVRfpSEWW6M5hBDU0oCPM6K8ivJyr2H6gevowseUuFluG2WG7rPf6gU+3iB
         5Jx+N3DgjNdPfVPK4J0mxCE9Gs0Q/M1T7noeu8XRCgCeNSB3jZhaObc45k5a2e5DfuhZ
         RX0yit46U/refj42P2lr5atwDuuXhrMw+rm7nWErdyPnXcdOTuZAfFe92nTvvpr316X9
         rKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748161702; x=1748766502;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtGixB0M/1PSb+BQwspOVAOu3wyv8hN39n5BBlGoJHY=;
        b=Clq9Ge2WJUYg0NB0u1ynT9LhkiTeppB2oht4CTfLtIfP3nrxFiBRNdDAWtw8sFMz6F
         jAhY1GAxFgsparP4hvRYEbPWZ80R+jziFTLx/PFRrVmq5l/eGPwcvloXNK5cwY2DkwyP
         YGU4Dxc9Wkz/TPPvVlPX+4wh3/cqSS/BsgCD9WEPBp1G9fzAfsqP+CV89Y68R3SaQRNf
         VwsttqpnFyxFcl9fk1GEOBfsujqXHQTDY6eK9Gt1rbJ6PWZs6RDTMmAHFxc5euwpiNL+
         PsT9OepKeUl+CFHm7f5hUxY3ureSeGzHFcSQkHkC/EjsVooOdVjOQz1oxDwiRFJP6QTg
         e3PA==
X-Gm-Message-State: AOJu0YyQ4rSmeDnUtXcdjfxvuSO7q4QsMDrYY9+yUJrTwPTrHzh/6S5m
	0ZTWKe/khSVo7EHy6+Mehsp8u33Z7s7HmHnk4SP2BoXodWqrGScU42/h
X-Gm-Gg: ASbGncuIdIQWuJsTob1eLDMPZIxGIx11rtKKpu+OST5gT0nJ/eKCgopA/R50Zg6w/Jh
	f+U3d+dCiAutpYEci+y493zLiA3Atwy0JmzrvBoHR5Isobf3b5lqq/Y5rvBpGcnpWFej/naEld/
	QFVfpcVR9KvBCeeLKP46HtRVkd7aOseK5woQJhw/CbfDYpw1qn5GYYsTSvLj9gBWjlBGBo4oQcf
	KdK9BfUsHDhbOhQ5fgNX8vYVT73DR7tLEUGpHuHL253E1sFAIHhMRoVPBh9Ga1qdqcH8mu+X+lz
	LOCmSMAloqK4Y/mWv41zdkjNlild/GdvAucitdE3kDW0v4+7qcwD1CQ26F8h
X-Google-Smtp-Source: AGHT+IH+qm8sck6Xp62W24+76yybHMHIiXub7Bssfme5oiO0SDK0QOl9MxpJ1K8xKy9krpgH5yzf4Q==
X-Received: by 2002:a17:903:19f0:b0:224:10a2:cae7 with SMTP id d9443c01a7336-23414fb2509mr93389715ad.40.1748161702464;
        Sun, 25 May 2025 01:28:22 -0700 (PDT)
Received: from [127.0.1.1] ([221.239.193.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234221f8b06sm18716465ad.161.2025.05.25.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:28:21 -0700 (PDT)
From: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
Date: Sun, 25 May 2025 16:28:16 +0800
Subject: [PATCH v5] clocksource: timer-sp804: Fix read_current_timer()
 issue when clock source is not registered
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250525-sp804-fix-read_current_timer-v5-1-49b64c77a7a6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ/UMmgC/32OywrCMBREf6VkbSRpEhtc+R9SSkyv7QX78CYtS
 um/GyvizuUZhjmzsACEENgxWxjBjAGHPoHZZcy3rm+AY52Y5SI3QkvJw2iF5ld8cAJXV34igj5
 WETsgLn3hjdPa+oNnaWIkSM1t/lx+mOA+JUv8hS2GONBzuzCrd/q16f+2WXHJjboosKIupFWnp
 nN42/uhY+W6ri9MSxEC3QAAAA==
X-Change-ID: 20250411-sp804-fix-read_current_timer-1c7c5a448c6c
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, 
 Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748161700; l=3828;
 i=stephen.eta.zhou@gmail.com; s=20250411; h=from:subject:message-id;
 bh=ejp4wm01HVYCSmFMOQbnLtRgrnY0ZvRQ2FFm4BrYP8g=;
 b=JJm8AQYEpTYdo9BUZcaRnE0Z522bzD8TiV7Q7vliXE/f9VVK5jkbCgd+XZ8sZ4DH8p9qlHubh
 ESx2+GxcaVaB081u7O9Y5gajnjzt9YGSwzoDKDEbIVaVqKQhOr5ycGe
X-Developer-Key: i=stephen.eta.zhou@gmail.com; a=ed25519;
 pk=JMRa8Po5ykvp3C9lVKJCeZ9BuRW6xWwa0Sj4KqnLoOk=

Register a valid read_current_timer() function for the
SP804 timer on ARM32.

On ARM32 platforms, when the SP804 timer is selected as the clocksource,
the driver does not register a valid read_current_timer() function.
As a result, features that rely on this API—such as rdseed—consistently
return incorrect values.

To fix this, a delay_timer structure is registered during the SP804
driver's initialization. The read_current_timer() function is implemented
using the existing sp804_read() logic, and the timer frequency is reused
from the already-initialized clocksource.

Signed-off-by: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
---
Changes in v4:
- Dropped redundant `delay.freq = rate;` assignment in `sp804_clocksource_and_sched_clock_init()`
- Dropped redundant `delay.read_current_timer` and `register_current_timer_delay()` lines in `sp804_of_init()`
- No functional changes to the driver logic; these lines were unnecessary as per Daniel's feedback.
- Link to v3: https://lore.kernel.org/all/20250414-sp804-fix-read_current_timer-v3-1-53b3e80d7183@gmail.com

Changes in v3:
- Updated the commit message for clarity and structure
- Link to v2: https://lore.kernel.org/all/BYAPR12MB3205D7A2BAA2712C89E03C4FD5D42@BYAPR12MB3205.namprd12.prod.outlook.com

Changes in v2:
- Added static keyword to struct delay_timer delay
- Integrate sp804_read_delay_timer_read and
  struct delay_timer delay together
- I moved the acquisition of delay.freq to
  sp804_clocksource_and_sched_clock_init.
  sp804_clocksource_and_sched_clock_init has already
  acquired and judged freq, so I can use it directly,
  and in this way I don’t need to consider whether to
  use clk1 or clk2, which can ensure that the clock source
  is available and reliable.
- Added detailed description information in Commit
- Link to v1: https://lore.kernel.org/all/BYAPR12MB3205C9C87EB560CA0CC4984BD5FB2@BYAPR12MB3205.namprd12.prod.outlook.com
---
 drivers/clocksource/timer-sp804.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-sp804.c
index cd1916c0532507fb3ce7a11bfab4815906e326d5..e82a95ea472478ae096b2bf7abea0d65a7bca480 100644
--- a/drivers/clocksource/timer-sp804.c
+++ b/drivers/clocksource/timer-sp804.c
@@ -21,6 +21,10 @@
 #include <linux/of_irq.h>
 #include <linux/sched_clock.h>
 
+#ifdef CONFIG_ARM
+#include <linux/delay.h>
+#endif
+
 #include "timer-sp.h"
 
 /* Hisilicon 64-bit timer(a variant of ARM SP804) */
@@ -102,6 +106,23 @@ static u64 notrace sp804_read(void)
 	return ~readl_relaxed(sched_clkevt->value);
 }
 
+#ifdef CONFIG_ARM
+static struct delay_timer delay;
+static unsigned long sp804_read_delay_timer_read(void)
+{
+	return sp804_read();
+}
+
+static void sp804_register_delay_timer(int freq)
+{
+	delay.freq = freq;
+	delay.read_current_timer = sp804_read_delay_timer_read;
+	register_current_timer_delay(&delay);
+}
+#else
+static inline void sp804_register_delay_timer(int freq) {}
+#endif
+
 static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
 							 const char *name,
 							 struct clk *clk,
@@ -114,6 +135,8 @@ static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
 	if (rate < 0)
 		return -EINVAL;
 
+	sp804_register_delay_timer(rate);
+
 	clkevt = sp804_clkevt_get(base);
 
 	writel(0, clkevt->ctrl);
@@ -318,6 +341,7 @@ static int __init sp804_of_init(struct device_node *np, struct sp804_timer *time
 		if (ret)
 			goto err;
 	}
+
 	initialized = true;
 
 	return 0;

---
base-commit: 7ee983c850b40043ac4751836fbd9a2b4d0c5937
change-id: 20250411-sp804-fix-read_current_timer-1c7c5a448c6c

Best regards,
-- 
Stephen Eta Zhou <stephen.eta.zhou@gmail.com>

