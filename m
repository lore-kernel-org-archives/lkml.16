Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002D19994F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748801412; cv=none; b=Suzn77Zv0qFDRRkzc/dPqzLuzYcd3i/4PL9T4+SI7kfLjq6gMXAuZA9C22Dg29HSrl+++PLzAngEyrWJ3aENWJJl89XPA0xMbA2zfo9nyjQ6+fxZ2eTfMIcejVV1rEjJNCoDdOHKkSq83fynbdHIZiIo7OeaS8GVTVcU9T1h06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748801412; c=relaxed/simple;
	bh=pVepWIaCEzIeGRFQaZcmBLWWt1ncE0szpJw0yCvelIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQMlZiriePmBBMfoIE+shGPUwyVvTLguAqYsebaaW/pl6HFULUqIWyG0zt39HgPAtpuLiggQBshJZxD/Hi7L0vY6SUNDJExEfLow9gAEu37ieWs14xVlAbk7Q6UO328Tr6sReByyhqwyY83rMZp7Bd5tClJAkkzZTAa/EkneeFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=Vzpbs2RB; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="Vzpbs2RB"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4606841b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748801411; x=1749406211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sU9tdqLEYldteiJ8zq2UvA8WAxhWduR9ZKzVOtxtP6A=;
        b=Vzpbs2RB5WIKiCwQH87/lXeXDlQukhgvt27PcvTt3isUhtPlEJqJTaRhic8oGfG0JR
         rd7r+Hm+2zJyIL9KZZx6LMezNcTibnFGlbVdivVPheUTAZiu4EIA1N24EB+YnWVmleCv
         Q1aakhSWpEIS/kGyT4H2yzeJS4cmyqi4ssn9/4/zJLzfldZaTZ+6lQSjkAgcKtZbDgos
         /MVo388RNU1rULW+kt46STOpR3GAiTbOeIpa67PbqsjN7c7cWaHJv6dsJC9ELKA/JFKg
         AIGaIokKEBx4DyFACBupzTtDvCninTZki+DZjty1AQyGzGtsjA+ndx9Mavm7aIkKjppU
         F91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748801411; x=1749406211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sU9tdqLEYldteiJ8zq2UvA8WAxhWduR9ZKzVOtxtP6A=;
        b=EFJ8Hu8GukQPZRekvgfZOz6Kp0X1XPqPLzdI5lKwoM1UaNm8m5ZxsZ6mKBt2BBQFB9
         LOLQGeFlaC5OrerYsfC5Sbyz5aYzj3l4AXBV8QyNIFaYWjbnueWgVXEwbNeMFdu4KwMA
         MUSuLCqkyvKGl5dghCwxUlVVvP7pb8H6qg6AtgoiIKuu16pzOiLIlR8ZfngylEvzJqDs
         h4sfqXJwq3PyQVe8zb/dK2nCPFRNrc0mm8UKliKtqcImw9o7ymctkFX5DJNC6GWj5tvu
         lrvD4QUpPT4c8DgSXLwgZkVN04wYrGM8/NDApz9bRkYM6LB0gig05iJbvWoNBvyy1e39
         vqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlzcvb3yFVGCLqasFz7AhHTcxuow2uN/KHYzqeUgz/4E8k0kJt+bxoOM7zx1l3BPlobvISbc+3cLxDc6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7DZvQywFLGAp+3nPcBPVEGK2WUG7s5t1KCysmuDZ0KPLsvc/
	XvGBW0vwgwTBsPuVchXnkzDyPpZy9K8stTF7sy9Bl5JLekrPJYLXlFcybKbJRctJdsE=
X-Gm-Gg: ASbGncszsIQKDZam/CYQ1HazSUB15cLFubvAmtO5lrb/ehY/pvFy2ybroNkUDEyn2xa
	2vw95fy28ShZaSypTd8fsDf9HsgkpPV9ayunVKUdA2qDocDRabOdKYz8MvpYXW/WwfjhgKMdd7g
	SHegHN3Hr+g0/rkqzY3FmquAK5I9TCS8htFt4p9pRMAJ/uNMVeW/d9V0WOckTZIW0PVMhiD2knn
	dtl6EyNAusdYr7gbwAtKSsnXEGTg3NC8MgTX4DbBbhAFkFIO9RsVkYHGMdHBnYTeWWy+PgBJQeR
	mAgotRZWserrW4pacH6l3OBY06nmhVuFRmGPrVp8Uoo1/0LJ9k0Y+8Fkykw=
X-Google-Smtp-Source: AGHT+IHSEupw3IYJm7DRT6ZTLRx1Z/wZrEOvicGQApG9PBcuNBfCuSfdvpZ56SLAnppMJUQR6LpXXw==
X-Received: by 2002:a05:6a20:d497:b0:21a:da9d:e970 with SMTP id adf61e73a8af0-21ae00895a7mr15679779637.22.1748801410665;
        Sun, 01 Jun 2025 11:10:10 -0700 (PDT)
Received: from thelio.tailc1103.ts.net ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeade44sm6169945b3a.70.2025.06.01.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 11:10:10 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] reset: thead: Fix TH1520 typo
Date: Sun,  1 Jun 2025 11:08:26 -0700
Message-ID: <20250601181000.166088-1-drew@pdp7.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix trivial typo in the Kconfig entry for RESET_TH1520.

Fixes: 4a65326311ab ("reset: thead: Add TH1520 reset controller driver")
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
Philipp - do you prefer for me to have a thead reset tree and send pull
requests to you? I currently do this for thead clk and thead dts.

 drivers/reset/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d85be5899da6..2330c420a1c6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -287,7 +287,7 @@ config RESET_SUNXI
 	  This enables the reset driver for Allwinner SoCs.
 
 config RESET_TH1520
-	tristate "T-HEAD 1520 reset controller"
+	tristate "T-HEAD TH1520 reset controller"
 	depends on ARCH_THEAD || COMPILE_TEST
 	select REGMAP_MMIO
 	help
-- 
2.43.0

