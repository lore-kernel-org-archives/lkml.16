Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3A320F
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162623; cv=none; b=KYdjS/ng5c+YTGx2NpblifVuAIGv+xyMm0C018BOHvJtWRq74dgatq5NgEln1+4f5JkEXL/0/UZwuzzIVenwu8zC1uv1EN7lfaB9X/NWVXzQTYb9bEc2JWRCZqrt6tkoxdF4ZrBBaNd5JH0xYvoM6T6LLGEnXRvgg0M70b0Nhl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162623; c=relaxed/simple;
	bh=ejp4wm01HVYCSmFMOQbnLtRgrnY0ZvRQ2FFm4BrYP8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AXsWu7xCeNJCb9MqLolP0L5R4WxDKQRF7lxOgGep/3/3GW2p4GO6cqBc++nX+sgBvbhgaZQENzPiHqvsf8Z+w2Q5nxA1x2ILR1Q1Gumij5V0Cok6qqurhgmwj0GMDKkBd3euYbw2Q1y2vzgU7kwbx8lx3LGWA1FOBe42V2yYVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9WJVlAU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9WJVlAU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c035f2afso759911b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748162619; x=1748767419; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtGixB0M/1PSb+BQwspOVAOu3wyv8hN39n5BBlGoJHY=;
        b=E9WJVlAUi2dmkHzITbrHezAaiLcMj65pGmZVNw5fEPo2ss9nIfIWqjByaMwAxZoG5C
         xHEr5YXHVUyKkFqdFiwTsicYugh8daNfxot5EJOm4gV7s4UP1I1W/R4nJisH+B8Dv1U+
         02RscgT4/AxbUHHgLapDkiIJa8OOrQUiFVXsLMHmG9hu+x3yiIjw4KOnIX5NYnAHpIOQ
         K95qgPi122Mz5F+0lmj49n9U4IXsDtX2AMetOODNWikC4L+QgClLlod7iugw5tAmTphS
         FqP/TgIR0bhsCnLPKKTLwj/Ko9or3ox7lbOPZGlfjrj1gK05U0QONhegWTzHgAlaJks/
         yZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162619; x=1748767419;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtGixB0M/1PSb+BQwspOVAOu3wyv8hN39n5BBlGoJHY=;
        b=aJTfQZvI47JpDzkPQyENQ7JIDObiawFgINE7nnSAl1/1LZ+BKXgPiqBjnaGCJIVKVD
         6eu+OT06GnB9u3EjxWhkDY2aNp975XNqPArfbLdFSyMooWaQPbQJWWjLZmN8RaMrwz8V
         XnF112Aruiq3k/x0YaH+GwLiA5vNVKYNZOLqa/W50eJ8sS3PljZX0MaPYuuAxVsGjT8T
         ONb5aToRPVGdY4P/PPCz+QGEdIXNdd+hkTtcUPZiaQFwtnafeVnhsxlNmwAKq7efn2tX
         JMXOLimgSBAgSVeCLVezVeQ+GDEDmAg7/XwuYXdKEyI9hhAZJKPQSGTb8d20df37oQB5
         Xecg==
X-Gm-Message-State: AOJu0YwwG1uaCIEnyKun3NAfIzuskXvLZHT/u8nbHDQwxmqq2yfS2NnO
	Jr+MNir4p7oghOmetd2LiV1Kj1e4oJjTp3RaJDBtxP+Rhq88srd2bHL1
X-Gm-Gg: ASbGnctJ5XVABrjq5xjRM2L6t7NZIj/Jsvp102kBKtEECHWXSnqRVCYfSooqtlBDIyu
	XFBW+uZyFUc439OcmSuMQLQXmqKMvQh6e0Qp5kw7PYUsJoLrlylFNrjpynQiuKrNemaig81OzTx
	PXCiO2ruNLd36rYazm4L2jwXw5ZoObqIrEdPaNx6+iK2jfv11YdJenNBXyaGTGmyjez6P18YjDe
	Hu9/vrqvoyHX9ufEpnnyYkmSAxLIQh9tThWgpaht823s/+ndXGEponckL7TAgtwiAQ0RDLIfkSF
	DoTx9VFk9gtDcrWz9Pk2yKsBnTEbdOlyJAT1Rf8W41WAmX1XKBi/gy8q8Dqz
X-Google-Smtp-Source: AGHT+IEomj0oZPKQpQVVdBslKAypdN2IfBy3v68wpOFrS6bxogjqpViu5gdizVYxCO73LFWnw1aNYQ==
X-Received: by 2002:a05:6a00:3d02:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-745fde794bfmr8569683b3a.3.1748162619270;
        Sun, 25 May 2025 01:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([221.239.193.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9875e08sm15682198b3a.133.2025.05.25.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:43:38 -0700 (PDT)
From: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
Date: Sun, 25 May 2025 16:43:28 +0800
Subject: [PATCH v4] clocksource: timer-sp804: Fix read_current_timer()
 issue when clock source is not registered
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250525-sp804-fix-read_current_timer-v4-1-87a9201fa4ec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC/YMmgC/4XOTQ6CMBAF4KuQrq1paUvRlfcwhpQyQhP5cQpEQ
 7i7BWNwpcv3MvneTMQDOvDkGE0EYXTetU0IchcRW5mmBOqKkEnMYsUk59R3KZP06h4UwRSZHRC
 h6bPe1YCUW22VkTK1iSWB6BDC5cqfL++McB/CSr+VlfN9i8/1hVEs7WdN/l4bBeVUiVxAygrNU
 3Eqa+Nue9vWZIFHtWEqVn8wFTB5yBNptTbaJN/YPM8vaIrkKSoBAAA=
X-Change-ID: 20250411-sp804-fix-read_current_timer-1c7c5a448c6c
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, 
 Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748162617; l=3828;
 i=stephen.eta.zhou@gmail.com; s=20250411; h=from:subject:message-id;
 bh=ejp4wm01HVYCSmFMOQbnLtRgrnY0ZvRQ2FFm4BrYP8g=;
 b=tDi3l1l/RFkM30iXuj9Gme78Zu96c/OKByAH0lw8em9KYgrpOyuxqOqKMuCGtobDLOxQM9Nll
 L8VtLCmoDpFDOVwVNnclV9E/O/8bh/h3NpszwctJrkgB1VkITp8XDo3
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

