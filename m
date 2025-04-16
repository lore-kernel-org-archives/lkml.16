Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B78A185920
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811518; cv=none; b=qLZrsAJJa6YfYBRpcohrx2ZzLs52hIRvKkmz2nTb6x6YuztibsXe7CKyaDZ6IHyI2arFe/Aaogmxb8U6mxY48KS2WwgsrWJbiAFH2dOKMfO6c7ivoZNHentv5Yu8wOwdCFPF5YVIjGvxeagyn8G6mnJpYBZNxmrfjj/X0aWLrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811518; c=relaxed/simple;
	bh=O652EDl6UwUbsu14UlA+Lv1Ltuil8ye7clm7QQ4ffrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jq4vp2YSOPpwPYWg88i6d0dmm7Kbd+QrcvIrlpUWQ8pxTP3lzgVzfexuz0V4XAS/LGjiJV/gV2zXtQ8z4yTbdYT0vMRKOSEKOTw/1/f7EbG+KPkebhWkAtGesoHiEhEOC5E0PEWYIplAPwi6lM4yHN1ZWyz+mMqx7en78bzQTAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=tX+Px/kj; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="tX+Px/kj"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c554d7dc2aso1041570585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744811513; x=1745416313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzLhMgMwNH0NH5AOa4O9mcMXGuopza907c5GCi91e+0=;
        b=tX+Px/kj7Y7fVqT1Cqzx48I93MOo/pWKwdkL+VcMpCH5mgXhT7HaQ2OlDVjsalrdoM
         svEoPkOapU5Fu5UaqCrQ9jH2aJwTEPxDQjtCkIjfK5t0vopRv/AKqAFQoZ1VhuF42nyv
         lr2PLmK6tMva0CaL769tZeb1FI1UUJDq/gSQrVJxMrg/UMswwKghf7Uk+dt0LdL0bDMB
         kOF7zATUeIBi98AaN2y1lUWCzGevvawnto69/NHMnB133MsaiBCrr0pIN5sxDsRlHQL2
         OIEbBoviHSOoWOpIi7mdlqootrzTeafqhabyxaNOmGVVND/kx7UgHq+G03sK3V+9rbpZ
         hOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811513; x=1745416313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzLhMgMwNH0NH5AOa4O9mcMXGuopza907c5GCi91e+0=;
        b=bRaWegwW+P8jZIdMIh/pClpgMZhvjzVoPPz7O3Rm1laiYDAoa2HVv43UFvk0ALHN+v
         a7Dzif8DcAluF7i0C1sYgwy4colmVPzM7b38Wpv2Cb3shSidc1h31KNfbumWB0rKIAlv
         DIvghG5ELwFrVpWSGRs5lPomUESb9sKCLLOHp25khT/vl31jjz++zao/4wkZGDRssOSR
         lVaOeentrHAV88d58c926iwE3L7ws5hyNy5OUn0lTHgYwVGx2ec2a4B9hvWppvkt2EXk
         cyYBtjwH+yXVVISLSwYcAPIryUdewJts+JQ8FCUA47uIgIFI1zUEVBkUCwjuuog3DCAw
         lRYw==
X-Forwarded-Encrypted: i=1; AJvYcCUpDEm4yIXYtgLWrEVX8oFLREgMX/Gx6PU0vqifw808O4p7RLLd834VIaiGwgF7RDvTLRUnfsxGAUHBEP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSkFTeG6uCAhhF5IQPUZOir4SIIEcm+HV1GZ5P+PczCzqowBt
	Bebo7907YOHsTWieZ3Xi7sYoQDi8GM3WNrdmJDqd2kzNTzLSm7X1+Liv4jjsL44=
X-Gm-Gg: ASbGncu9ckS93ZGLNh8752YbTeQwuRiV5YqDI1ANgqQt1fYFUAqragACs5ChO9jGPUZ
	eXzQcuCUZHXM+YeNuapx7LXGJ6fT7DQFnEy7QMm/ss4m5G8wszKZQc7r+MUyccjc3KThF5QejXS
	+dyXZoLN7tusqg7R93sk6UhCmvCL8yEJbhSCYq2/rfFdDI+nou1ilzvye78BDNDhhpEPXhNBQ/q
	py5nK1+REAjxQKrcBxGPneXZXCTOOHk33K/scvweL58XQd/0PmUIY/nnQ/P9svmGBXCVn35RFpx
	eu9zENcvcI6/3o+6xY9vJJZHBRHGqnyCEMA64EGDZluj5tH6qQ==
X-Google-Smtp-Source: AGHT+IEK5xcLCTEstx/iGH3+x/DoyF2pbgoR2j9HRIFCwxYq9oqyIz9Gtu4Bo2sL9Ekj03MVC7PbLQ==
X-Received: by 2002:a05:620a:424b:b0:7c5:d888:7098 with SMTP id af79cd13be357-7c9190642abmr225230285a.44.1744811513336;
        Wed, 16 Apr 2025 06:51:53 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f98eesm1062834085a.83.2025.04.16.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:51:52 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mm: two allocator fixes for 6.15
Date: Wed, 16 Apr 2025 09:45:38 -0400
Message-ID: <20250416135142.778933-1-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes based on Vlastimil's review of the defrag_mode patches.

#1 fixes a bug that can lead to memory deadlocks on high-CPU-count
machines. This affects not just defrag_mode.

#2 fixes an overreclaim issue when defrag_mode is enabled.

Based on:

  commit 16176182efbf3dfce6dad18dcc8801164329d1c2 (akpm/mm-hotfixes-unstable)
  Author: Uros Bizjak <ubizjak@gmail.com>
  Date:   Fri Apr 4 12:24:37 2025 +0200

 include/linux/mmzone.h |  2 --
 mm/page_alloc.c        | 12 ------------
 mm/vmscan.c            | 29 ++++++++++++++++++++++++++---
 3 files changed, 26 insertions(+), 17 deletions(-)

