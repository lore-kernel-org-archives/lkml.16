Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51724430
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744599417; cv=none; b=sTtckJ91OZAUbhWhCxUpDQZPDkSMsND33ydRQiDdYQy+tv24xb1AAniCSvznF8xAs/pQnHFLy5p65ONQmwbQOlq6ebU6r7H3LT4tXCdlREG3fuOBmK3khxUv86ChvLQoOgewId3fNq6bEHeN4PNi8W/YA9kOcdtdcf9fkhaZAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744599417; c=relaxed/simple;
	bh=8Vsb+XEHz/93NY5F+EL1MsvGYeTMpJnyBa+C9aOtsHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k3tfpw9h05r+KDL48F3CMG1fhg8kS4Rteo54Ayb0qogdeIBLRZsL/KwCANXkuXWMoGDnfNqRMroTFKlobdX5ANXqn542EoLwvBrLpiSjAVxkm+NCIzCDv94UA2qO1AWsEA7ipkohH8KqUpGidRU7w2dZqrkm+FrxxO3KAsoiCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXfceUO9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXfceUO9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7359aca7ef2so5619877b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744599415; x=1745204215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7zK+vXj0E8h7cIXmFMz75JpCV/DBrIfVBCaCtku4QQ=;
        b=UXfceUO9CB2IxGXjdpmLTq0DiFMv1vaJ4XAAe7+9GJdcTJOfvR/fEB5IdRjEKNB7Qp
         bElUoZNFO/qnE2ne9nf9HlpTPqHZxfCYnFOcLV8fB5+Uq0J3+l8PGfoxzh5+/9Kmqncz
         hIu6YGXohnV/MnTNsCBxwxE+OLWr4c9g0jJXss8vBVFR6Vf2Q9+VgVMGxrHOFZDt3lil
         2Y1RHeYknb2TT7O0eR7uG/tUHXZk4fLmIGKK6s8JnXnRrzW6dFoW9qOm4xNAdo59cutk
         mC6lwUCt3KNWOi8cgTiU0SECVXyLgdi3ItA67FRcLrckLaVE/gs/15Yn4XGbIWtzdoAx
         M5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744599415; x=1745204215;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7zK+vXj0E8h7cIXmFMz75JpCV/DBrIfVBCaCtku4QQ=;
        b=t6GTb5fTYqJECXsNPf2C+uf4uunntG6xy462ZDS2ugw3t2K886XUgalFH2dcyHYWyN
         ZMPPpOlP8CHmOcs85KgyuiS/CInR36BJU24IKd1CmikVU96TDjyZ0ip8A6IUldktP4B8
         drTmg7WAIKrJsUPBNBN6Qe0lKyvDYTTZivrmdjSRtJuIKdZ67h1LIQhitqEfm9C0KTS+
         88i3kn4ahPxAdMiPjUlJWqZhN9UYfIhoYUMVISD6ZOcVm2I6NOpuukkSkqbjDUf8+lAT
         EQxCHEpbOPIatnKBuQNQyVq6MoZ45WmTFx4GIepjr0QbXIVX/ZGJB7nwKUqmEKCfaOnh
         mCkg==
X-Gm-Message-State: AOJu0YztwdbuImMXaB9TSrW/sr0NaMi4LZtCwtJJHcjvf4Y7pKhkeejS
	WdL4DX6ergkjIXuYw2I4+eEZ/zqOGWhDX5xwxopC34q6HIhCu+2ZuCI/1csI
X-Gm-Gg: ASbGncskIa6H7VvybLeoWO+HBI6O+xx9tTnwPheXjqWO1Ji26+iDwDsd/DzhwRrtnGl
	pTsYrkQYfFQkcHg1vF8AFjuHpJ6OXiUUdcK77zZZp719AGUZV9aVbmutD3Xczv02n/FGjLkg4Q9
	ETvmaOrls+8DmT0/R+RnYQ0XYfAguGEkhe/QmM+c7UiUxohq1YJesNGJPXe7F5bHEkOHt+Txcpv
	7OLIucSEQoiTrZShpfxdsi4qvOBHNvemOYdGOiSu/lxHGgYYzB+rEKvzMJyi5NYyCZY1+KwMgL3
	xpwEGIwPWYRWuymEuQc7b+He5jCRA8r5EOzN4C6Ddsy9xqvLaQ==
X-Google-Smtp-Source: AGHT+IF5/dNuV5cSvQYbK6a17Phw1sL/lTjDo0Uxx5z9+C7hY4cVK/swXdKrsoFSJDmtDtOjMLBoew==
X-Received: by 2002:a05:6a21:920e:b0:1fe:90c5:7d00 with SMTP id adf61e73a8af0-20179973765mr13974928637.28.1744599414779;
        Sun, 13 Apr 2025 19:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([221.239.193.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a081814dsm8513331a12.15.2025.04.13.19.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 19:56:54 -0700 (PDT)
From: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
Date: Mon, 14 Apr 2025 10:55:59 +0800
Subject: [PATCH v3] clocksource: timer-sp804: Fix read_current_timer()
 issue when clock source is not registered
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-sp804-fix-read_current_timer-v3-1-53b3e80d7183@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD55/GcC/y2N3QrCMAxGX2Xk2kA7ux98FRmjZHHLhXWmnQhj7
 25QL8/h43w7ZFbhDJdqB+WXZHkkg/OpAlpimhllMoba1Y0L3mNeexfwJm9UjtNImyqnMha5s6K
 njpoYQk8tgSVWZVt+89fhx8rPzV7KXx7HBy79K4iDAAAA
X-Change-ID: 20250411-sp804-fix-read_current_timer-1c7c5a448c6c
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, 
 Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744599412; l=3286;
 i=stephen.eta.zhou@gmail.com; s=20250411; h=from:subject:message-id;
 bh=8Vsb+XEHz/93NY5F+EL1MsvGYeTMpJnyBa+C9aOtsHw=;
 b=i+TJUflP4ok0LS0krdMTLCDSKhcFoAko5Qy9BTbrkoIMKmUz7Z3Pg3aQnB5nyVqgL7GqWefEX
 PKueDl3hX69As5qUA1+x/fzgTjU7SXVLUgAekh4QohLzno9Vequ77zz
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
 drivers/clocksource/timer-sp804.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-sp804.c
index cd1916c0532507fb3ce7a11bfab4815906e326d5..3194c743ad1d7d3862c63a32fb1297d8db291008 100644
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
@@ -102,6 +106,15 @@ static u64 notrace sp804_read(void)
 	return ~readl_relaxed(sched_clkevt->value);
 }
 
+#ifdef CONFIG_ARM
+static struct delay_timer delay;
+
+static unsigned long sp804_read_delay_timer_read(void)
+{
+	return sp804_read();
+}
+#endif
+
 static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
 							 const char *name,
 							 struct clk *clk,
@@ -114,6 +127,10 @@ static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
 	if (rate < 0)
 		return -EINVAL;
 
+#ifdef CONFIG_ARM
+	delay.freq = rate;
+#endif
+
 	clkevt = sp804_clkevt_get(base);
 
 	writel(0, clkevt->ctrl);
@@ -318,6 +335,12 @@ static int __init sp804_of_init(struct device_node *np, struct sp804_timer *time
 		if (ret)
 			goto err;
 	}
+
+#ifdef CONFIG_ARM
+	delay.read_current_timer = sp804_read_delay_timer_read;
+	register_current_timer_delay(&delay);
+#endif
+
 	initialized = true;
 
 	return 0;

---
base-commit: 7ee983c850b40043ac4751836fbd9a2b4d0c5937
change-id: 20250411-sp804-fix-read_current_timer-1c7c5a448c6c

Best regards,
-- 
Stephen Eta Zhou <stephen.eta.zhou@gmail.com>

