Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728DB1E8329
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226834; cv=none; b=HSF4WV9Qon4va0eixhQrNn2MXmwcsKmwnH5t311FL+9KM86lkKKVlJKp921wtak2fHnkEL0W6Rl42WGPBjwDCP7U12gphfn+4PkWYhdqXQfuUrzrrTvkGyY966OVE1JWHsZqNOTsOI1oaFs9CjkA8oQTDW67+lNm+funHKBjyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226834; c=relaxed/simple;
	bh=sExzakVH1B2Xxw3gMwgsfTa/2KA605LqWYiZiOcRTk8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N5gV6t1KOoQAVgaUifE+1Ach4+2GA49chf2ORxhC2PoYmJqFmq7uouIBeQKixexjHgClCQk0O5IzqnTQjp816t+f6ILU+viPTGbxbEMs0pLuTNObv7jbE2ra8CJ8uAAIgrCnG+owZmIxFKfAogYxtQic+DE/aeMoiHwyM9OtXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EiFIfwd3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EiFIfwd3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73972a54919so3209473b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745226831; x=1745831631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAvCeYCUp+x3TneAk3XV4vYqRfxvUTcMHcVdkQKAbNw=;
        b=EiFIfwd3WApvgxOfpzQt5RGjz2m/WbFNkecCxlbzTy2XVWVPdmPPON2hPkkPtx1NEV
         InDRQVq98/GmxD+c1o2VfDyOtrzQhAb6ruX802BTqNq+R7YK7iePFCcnlhVQ4s2u5wWR
         cAtWUkUvWh5T/41QW6BBdCIXeYKGI7Re0Gdj27eLECRVt/LxKBlU4yatir5g4wGmL6SE
         weVp7fY3dfyyHJZ1JQAzFltPYIlYKC9TenyCAiRPqEyRAXv3kiXwxhwdWPG/bO5Nb7pS
         9wy8YFduLtyjiuCbRRUkKUmYQ7AwPhI8z2In2GoyXpMOe7SWHrCzkvVMR6yzFn9Wkeun
         N1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226831; x=1745831631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAvCeYCUp+x3TneAk3XV4vYqRfxvUTcMHcVdkQKAbNw=;
        b=qKZL2PCQL1JyLxeLzjvvr+ypciWAI/lY+EkZAoZdFYyBfXU+/Sfmydsp1g39wgxiH0
         T/pKpGnctkH+eZkmBXPlOamdGprSgR/Doevdp8gMyn0GbxH/7C4PIw6oIuihqFUqz+Pl
         x7UdLLwCRaPGb5RAkWsosQ4uvGStA26g1kRozU5Wrk/Z567yLXZDadqQbX4Kn+7+69hL
         75bVUDZZmb7BRqDCnTpbiDQJUD0l6PyE7BN8REVWMEZmvYff02lWKG9tNlMX1ctNpzYi
         JKCeqWeraC9wIKj+DE+U9fToI89Pzp/KIH9zdib+UE+Gp0uAZnj6u2YbPzBWEWJxynhW
         8EWw==
X-Forwarded-Encrypted: i=1; AJvYcCV+y8vETOMptIAtiYHlGd4Yrxf9zXW/RmHDgZem81k7sIEPPxYKqWoRIkke996IGanM7ENCXQQ0fUpxj/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywew14BWCcHA+Pj3IS8rR5X9dtt1F13JKpN8IL4BQEveQU64S+/
	MHWe9W+34AyQxUHJP6fGw2PkWMojSPZ7v18lTDs1o3Rgoxb5KaGjZ3WVtfjr7kg=
X-Gm-Gg: ASbGncvCu6LblL/VuWjarVxQ4cDb2ophSE9n+fCAwOuuhhKA7u7IH1xuYhn3lGPIrQi
	cwVNhDDu+1dDMTrNohj7STiZ83bwKId20dFYgxmN8DbZ3Kdk0CjlzKUITkWK0MtCI9xIil38bAu
	lbcprUtUbKRfslBmoVNG4o9nMPAOamG4WrsNkT58LxnbNAmH0RsSc8/ViLPyx4t+8RBjADqWaji
	v+Z8Lmrkz717Qt60nKiz/VumnGCVTMdfDZpASW20gw1LrUQfwjUuNd9SOa94bZtBujjyDqVX+0G
	zf6hUMsU/ISmrDTKl/Rmt7A99FMDcxmFi0EYgiaeuJ1zw/oazhQ8uL6p1MlwQ2VYlA==
X-Google-Smtp-Source: AGHT+IGn1SUCrQl8oXH368WxO807alYxuylpceMsJ9Q14IYZjIpfBiR2WXsaug7OD3joBrOnWXV4FA==
X-Received: by 2002:a05:6a21:1084:b0:1f5:5b2a:f641 with SMTP id adf61e73a8af0-203cbd207f5mr16239273637.28.1745226831416;
        Mon, 21 Apr 2025 02:13:51 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157be12sm5246285a12.64.2025.04.21.02.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:13:50 -0700 (PDT)
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
Subject: [PATCH V4 0/4] add max arg to swappiness in memory.reclaim and lru_gen
Date: Mon, 21 Apr 2025 17:13:27 +0800
Message-Id: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
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

Patch 2 add more comments for cache_trim_mode from
Johannes Weiner in [1].

Patch 3 add max arg to lru_gen for proactive memory reclaim in MGLRU.
The MGLRU already supports reclaiming exclusively from anonymous pages.
This patch formalizes that behavior by introducing a max parameter to
represent the corresponding semantics.

Patch 4 using SWAPPINESS_ANON_ONLY in MGLRU
Using SWAPPINESS_ANON_ONLY instead of MAX_SWAPPINESS + 1
to indicate reclaiming only from anonymous pages makes the
code more readable and explicit

[1]:
https://lore.kernel.org/all/20250314141833.GA1316033@cmpxchg.org/

Here is the previous discussion:
https://lore.kernel.org/all/20250314033350.1156370-1-hezhongkun.hzk@bytedance.com/
https://lore.kernel.org/all/20250312094337.2296278-1-hezhongkun.hzk@bytedance.com/
https://lore.kernel.org/all/20250318135330.3358345-1-hezhongkun.hzk@bytedance.com/

V4:
Split the patch in MGLRU and add comments to make the code clearer
from Andrew Morton.

V3:
In MGLRU, add max swappiness arg to lru_gen for proactive memory reclaim. 
Add the use of SWAPPINESS_ANON_ONLY in place of 'MAX_SWAPPINESS + 1' to
improves code clarity and makes the intention more explicit.

Add more comments about cache_trim_mode.

V2:
Add max arg to swappiness as the mode of reclaim from anon memory only
in memory.reclaim.



Zhongkun He (4):
  mm: add swappiness=max arg to memory.reclaim for only anon reclaim
  mm: vmscan: add more comments about cache_trim_mode
  mm: add max swappiness arg to lru_gen for anonymous memory only
  mm: using SWAPPINESS_ANON_ONLY in MGLRU

 Documentation/admin-guide/cgroup-v2.rst       |  3 ++
 Documentation/admin-guide/mm/multigen_lru.rst |  5 ++-
 include/linux/swap.h                          |  4 ++
 mm/memcontrol.c                               |  5 +++
 mm/vmscan.c                                   | 42 +++++++++++++++----
 5 files changed, 49 insertions(+), 10 deletions(-)

-- 
2.39.5

