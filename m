Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3154171D2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747626536; cv=none; b=mhocQVc4/mi5PQuUC2mLJhcpq+/WHtfeNYRshUIcSNRYs2RlPHOy/dxfUHEOlcScdKcXaTqOBR5fuuEACnr30aQ9746fDw0hbRBrPLiyHLZlofrIwredv25Hl/xBmShOwgDenkIVlwXrouAGRRueuKur754u23VaJ8yn2W49UJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747626536; c=relaxed/simple;
	bh=gfUNnnnOl9QDR9aF705w1osP9tRPXHLGsUiMHi7TKRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkL7vGs2Bchj5QuKyIrtBVy8cyKF27dlLD2tPBGp5KZRlV87D04zfPM1xe5y25KnREpr5TOH5ZQ4aQy1XiljJE4e4OQARRJSB9JTHl9y7tM8ehtaIUK/3TD0PLmW1oRGNd0FONnuCIprPzB/UnsoXMw5bAaCnUWtEtOfEw5cDWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqEzVKZK; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqEzVKZK"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-6f8cda1ca6dso5928176d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747626533; x=1748231333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CiQjDVJ9nq0tDv4zpvgUbL0B4wUpcB1kqM07f0SJEQ=;
        b=AqEzVKZKfLf7HNgr/FIK83dLjt8aTj0ttgWwZtifh33dBitWn+RsWvAXnc6QhO2ldj
         7PgtvKzKGgMFOfjrkXC+eQ9rrmsUBwvRA6RkaxXIOdEDQ2p+rVlRCFRxACpcRoL82PeW
         uj8Js0NihNa/uQ7CI+Mz0kO8kkoiWFcCzNfZhPKIlXA5szDLoVr4HHY6ecdRyyKf4NXD
         creasbXaREjaMTJh63KAtOoGdqeMDw6S0xaxdKKVUdjfRZ6avfD6w2hpzE7rIiMpGE+k
         Qta/8j340Chs1txCyZot1cJkovYqi2E7szAZpjdSupzpVwr8+NEiHeYjJQJTo/NOb5M7
         4x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747626533; x=1748231333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiQjDVJ9nq0tDv4zpvgUbL0B4wUpcB1kqM07f0SJEQ=;
        b=IJ21Yi1b3GfGmRXElnpjlGD6vF9zYwiXW/FoR6pMuHiuVWmCWutaKuRkZRW9fAja6/
         ZRoAH8s+bdbvh5N20F7ZIi8GfquW2/l+A/s1cA5yNvVEHvw96yt5O/ycL7LJi4priop+
         jyj9uZD/t3cZfzsaYcMdZHvwUSMxyRolW3g9jRHdlZT3aNe/egKMYiEHn+iDTX13+RBL
         XkL2J73/hvQJmrEsRXLVmjCrYplqlNH7Y7ZCPyy3a6zA4YsKHxqrW4N4YBIEyN6NelsK
         +BNPKOxgEQQXMtn6LaRpvzvckbR18nrpoXRgwdSR9XX8RpKwOp/AUL/zSmb5c7x4inc9
         uKFA==
X-Gm-Message-State: AOJu0YxN/Qm8rsnviqZhByVffMjdc4Mx3axO7iptgkvvSExaOjN90InI
	4U6fzRUeAIN8x2VFsb0ybDQ97aolD7P1zbpaCm6Ql4lWyfoKSjGim2lnD7sZfAB6O/5AFGvG
X-Gm-Gg: ASbGncsC1pGHghEZcBBkMkXpqke1tOv7RmpH0uEKdqLdvFUR3kxIAwqkdUpypafvX57
	4PiuRmlRheov7KXGyhZCkkhj0QMcBXxUu4OXXWT2ukZm7HtDK7tM1lxft+8AvhiK1gs2h3FqiFQ
	U63LtTW1HRDJZ50etM1TOUlt6ZXTxG6Dy28ugFdj6llO9ebKU1wkPFa0ImTtxw1ukhfDqf5CzWg
	VdBknsKABS3319uPZHPDc06zOBT6Mvfjlys7kjRU21jNwjwlLMDifGqeZnQarTcCxoK1ngJM4zG
	4bgup3IFG/MU7TXKJtcj0k2Hxx16Q+IVtEH1ypQRGYIhwGkrWGU=
X-Google-Smtp-Source: AGHT+IHTxVVuJijd6lxpzISN4OHiLXiIboN/8FxOEMfwkGh+9xa40u7V/NKpPTuWBIUVz3Lx3jqlvg==
X-Received: by 2002:a05:6214:410:b0:6e8:fcc6:35b6 with SMTP id 6a1803df08f44-6f8b0847db8mr192819116d6.2.1747626533298;
        Sun, 18 May 2025 20:48:53 -0700 (PDT)
Received: from biancapradeep.lan ([2605:a601:a630:6300::8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0988e08sm50692756d6.125.2025.05.18.20.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 20:48:52 -0700 (PDT)
From: Bojanala Hithashri <bojanalahithashri@gmail.com>
To: linux-kernel@vger.kernel.org,
	trivial@kernel.org
Cc: Bojanala Hithashri <bojanalahithashri@gmail.com>
Subject: [PATCH] Spell fix Documenation/watchdog/mlx-wdt.rst
Date: Sun, 18 May 2025 23:47:52 -0400
Message-ID: <20250519034823.158936-1-bojanalahithashri@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spell fix for mlx-wdt.rst Document
---
 Documentation/watchdog/mlx-wdt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
index 35e690dea9db..3778f85d1ba4 100644
--- a/Documentation/watchdog/mlx-wdt.rst
+++ b/Documentation/watchdog/mlx-wdt.rst
@@ -48,7 +48,7 @@ which is optional.
 Watchdog can be started during a probe, in this case it will be
 pinged by watchdog core before watchdog device will be opened by
 user space application.
-Watchdog can be initialised in nowayout way, i.e. oncse started
+Watchdog can be initialised in nowayout way, i.e. once started
 it can't be stopped.
 
 This mlx-wdt driver supports both HW watchdog implementations.
-- 
2.47.0

