Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079092153C1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182412; cv=none; b=PSIKgHeW7967g9tI8Lanuz061+Ua+Dh+f8LJW/7GpbZE3pD16ln5cJb7HfurQ6iQ53yXqU8xn2Bktm4nM2xTz0LmJL6pJpTOpBP4A20ER5ycT9cX4ZEqAyTjQgznd5wZRs342D9rivbLSQYjb5IU+uciMqeSN2f9xJFExWS2PnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182412; c=relaxed/simple;
	bh=pPQEZi4Qcqv11U9FEmI0COFFsJwH60kqrPCUcqf6tbE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=miU6DMOGYbXE43YUX7S+DHB/96h+z60mKXqALNPzAMiBUQbGgxkhcUwbmNqDc1fgHAvyTldmjilskrL1rFeX2GXHNY1KikGa6gAWnEG6QzK3GQQdfmH/l0Y1tmdXSobbJFYcRv5nwNFWhx9VITMct/ZrYopoBaSDLd35rXmxbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kcgEAjS/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kcgEAjS/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2264aefc45dso82087925ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744182409; x=1744787209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THZYEJIp0OpQWutbU1ZY1t2ANQ29WhjxUWkhn4aAs5o=;
        b=kcgEAjS/aw6GeNMAK0i08Z9vLU9+QPlCcHf/Bz+9TKZ7oJqSJeuI2CEG9TieETxqgy
         TYCSxFa//iYlqLnKXxHn2DloLt7v140OSf2gbz7AqOXlqgOycqn0wg49llTi3Vep4IZx
         WbnGwojy0BlmnpaMB3kKf7q3VePKFnlwNwDSTWTcY/f7KcqPc5b4WZqxvLhdB3ht5Q+t
         pni1FyXZmrHegGgMMQAjRNVforFdqZ7Ghujl8rEjzOITkIp3UGRsH0I9n95JnB8fkBnM
         pe+QChw6nA+OnEPo5yLHNcsU1sz9qOeEkW5qvs0jEQJx6uJLWPYCZwBRuctYc++0eR95
         O7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182409; x=1744787209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THZYEJIp0OpQWutbU1ZY1t2ANQ29WhjxUWkhn4aAs5o=;
        b=Ux3yvQxjhhQbmmRc8nAfTy2UpNKc9vepU7ZASNgvyu/E2UKiAfPYFkIHTcIuN2J18t
         mYdZYAjRJMtsHJSa+QbzBRJRzmHhjtb4/egIJ97s1cVYppqiyq/k+7FEeDD8Ed2sfH7K
         KB134EhFCfRorKuSckwEdmOzROaVPcAOm+nlaTEA1ctreK9mc6M3zR5ADzHfmipZOQyC
         5baWAvE0+75Z6r/MVNBm4LBteAynO9qelwjvFSU2E9L1OpOmHCzGXomFctYCzo2sofAO
         2Z6/teypVTZBssgrzcE7h101AX2+4fMTFyRGbslBUbJ8Mlsn8lfq9K+6ZcS3futPQPnb
         oMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJDSfsxQwIp8+8ivaaSWWTCmdW4bqDsh3hdqlb/HAmCxFiwuJYoSsVbxOPpiYotXvT9cnWM2vDIbU+04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mNToFX1z+Z5RgDzSLzgkv3VfTWDI8vPUxN0qcLhpb4BEm013
	XUbO9m030xk1tS+Vpsap6ad7x9BRWSO16Uuvy9+GbQdLV51QPRdzzz5Gfq8rkZw=
X-Gm-Gg: ASbGnctlf/Hq+mAIPINdkEXFGyq68+oYa3g8sRFLsyh6Lw1uTHoyrmqVS5P44Lim2Kk
	Sa4cUGIppUt8RRF+eevhhY+WdLnWMquIH1W/KzF18JFkHQ72VFPiEhSg7Ycqa0j03P5q2GU7C+3
	cw8WCVVcjkAyRVx+6AJNhPtnBCHiCx1TCGFAKwNupi6cupiNNz+7oe2snHTebH18PbNFB+LGUPv
	5cJZixNzDrvWt8ZCIPgkNqvDamIfIR4AXXZjCm39Z518YTwCPmqq2AdZj6BBC9UffPLtSxpAbJw
	2LIr25IOcfUpw+YrY6U477LQF+R/j8N7Vh+kBEBXyWGJIApcv5iDkyFToSe9jqee1g==
X-Google-Smtp-Source: AGHT+IEcMLhqJwNuZeTBrvnjdTznoQyj3Rul1pM8+mw8l/1evuhlt9DvAXXnUDrqBMc7KQTj0Vx0XA==
X-Received: by 2002:a17:903:1a23:b0:223:26da:4b6f with SMTP id d9443c01a7336-22ac298f941mr33009615ad.14.1744182409178;
        Wed, 09 Apr 2025 00:06:49 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44800sm565754b3a.37.2025.04.09.00.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:06:48 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@suse.com,
	yosry.ahmed@linux.dev,
	muchun.song@linux.dev,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH V3 0/3] add max arg to swappiness in memory.reclaim and lru_gen
Date: Wed,  9 Apr 2025 15:06:17 +0800
Message-Id: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset add max arg to swappiness in memory.reclaim and lru_gen
for anon only proactive memory reclaim.

With the patch 'commit <68cd9050d871> ("mm: add swappiness= arg to
memory.reclaim")', we can submit an additional swappiness=<val> argument
to memory.reclaim. It is very useful because we can dynamically adjust
the reclamation ratio based on the anonymous folios and file folios of
each cgroup. For example,when swappiness is set to 0, we only reclaim
from file folios. But we can not relciam memory just from anon folios.

This patch introduces a new macro, SWAPPINESS_ANON_ONLY, defined as
MAX_SWAPPINESS + 1, represent the max arg semantics. It specifically
indicates that reclamation should occur only from anonymous pages.

Patch 1 add swappiness=max arg to memory.reclaim
suggested-by: Yosry Ahmed

Patch 2 add max arg to lru_gen for proactie memory reclaim in MGLRU.
The MGLRU already supports reclaiming exclusively from anonymous pages.
This patch formalizes that behavior by introducing a max parameter to
represent the corresponding semantics, and explicitly uses the
SWAPPINESS_ANON_ONLY macro in the code to denote this logic.

Patch 3 add more comments for cache_trim_mode from
Johannes Weiner in [1].

[1]:
https://lore.kernel.org/all/20250314141833.GA1316033@cmpxchg.org/

Here is the previous discussion:
https://lore.kernel.org/all/20250314033350.1156370-1-hezhongkun.hzk@bytedance.com/
https://lore.kernel.org/all/20250312094337.2296278-1-hezhongkun.hzk@bytedance.com/
https://lore.kernel.org/all/20250318135330.3358345-1-hezhongkun.hzk@bytedance.com/

V3:
In MGLRU, add max swappiness arg to lru_gen for proactive memory reclaim. 
Add the use of SWAPPINESS_ANON_ONLY in place of 'MAX_SWAPPINESS + 1' to
improves code clarity and makes the intention more explicit.

Add more comments about cache_trim_mode.

V2:
Add max arg to swappiness as the mode of reclaim from anon memory only
in memory.reclaim.

Zhongkun He (3):
  mm: add swappiness=max arg to memory.reclaim for only anon reclaim
  mm: add max swappiness arg to lru_gen for anonymous memory only
  mm: vmscan: add more comments about cache_trim_mode

 Documentation/admin-guide/cgroup-v2.rst       |  3 ++
 Documentation/admin-guide/mm/multigen_lru.rst |  5 +--
 include/linux/swap.h                          |  4 +++
 mm/memcontrol.c                               |  5 +++
 mm/vmscan.c                                   | 36 ++++++++++++++-----
 5 files changed, 43 insertions(+), 10 deletions(-)

-- 
2.39.5

