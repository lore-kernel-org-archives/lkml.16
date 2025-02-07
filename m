Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46177E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901430; cv=none; b=MMfuB+JCz/fzIuv39N8JRq5WUAs9M8WcRQAgXpVEjYuxikvR+o3zEtbgqd0//IhAizxKRWYm/6kiW/pDwBKjVQh/iY6+doBwkPlthE2JBDy1E658hnjMG5umUkSihwckXP7sUUrFKtqF2TN38Bsx/ItmvYtvMhY0PjSBcfB9CK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901430; c=relaxed/simple;
	bh=4yiFfvQmf+IqEFCVbwx0Ox15H/l5qURbpxynYPs1ZIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HjH+sMMSIwkuLwfOOKnY/eOsRw1ZXdh9j5ypLyBa0QY1JFbTpbyu1vjeeLqgxaWbOQQy3kswPAdAyFDqAssotLE9+qCwjJlbf3aTr2I8l3YsKIHExJ5fnrTtuieSt5NSBeOi/CrJ0OlIf++LgLWyQ4cnLyfGYkpWbaz2V57NtbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JHdE+RYu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JHdE+RYu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f08216157so4351765ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738901428; x=1739506228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnCfLPVKO43z3ormZqP6IZKrhAgtovoHgoWJYn1S3Uw=;
        b=JHdE+RYuw4k1jMI2MxLnk+RyrXx+nvL0ZvZxMpFYiTmIkg2uLaRHvr1R8fwJVetl3W
         3Tdww4jET/pVXhvo1eAAGqmN3isgYgSv9YEIqpsvHlBvTefjTeWS9TQ9iSyxu/LD/gg2
         djoPK2PjC7BmlRL8npO3/ho1iigduxo/FO3GwWkjvA/GLwwD3XdRim4XJa2oWjpUfdmw
         nZ4EwD8fluTTyxW1ciTGc3ilLsN0KdA6JmlbeILyG3uqc7icoaRAMs1y4a+WfLHXlNVd
         K1UwlfqekVgOEv7ghTVdDBW4kh89d4yS053eaYVWLoo4etv9YIdyZbuBgL9aCOBOWrB0
         /zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738901428; x=1739506228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnCfLPVKO43z3ormZqP6IZKrhAgtovoHgoWJYn1S3Uw=;
        b=ib4Wz/wfYyHzTCpSSRjz5DPOfpBmBimLmKVhaYZ5nfVSpz9w5VPikudJffDRKAJ1U6
         uaQYz80zdBvXgL5BJg1fZfseXiYGg4bPDtXGPe7aznvheqN+SLds6Kc9pEMnX9lAn9WO
         W6glswlpc0MS5wsXOr6z0xmabd4uEyYwdXdaK9b5onaQhNP0nrw0vWwjsokhV/EUBcmG
         +qoZt++oDzGNH+SZgaddcRrcpLA68CGvhIOQ2fvsOKK4aY1WZt+Txdz+aTxpaTsjAZTG
         xO8eHuLfE0lO6sYGq5F5v1OpmJZdVI2d5OwDymfwPFOceq5y2da6331Uc3WNKQCG+Mvu
         KTSg==
X-Forwarded-Encrypted: i=1; AJvYcCU85PuUUr1pJTyzisUUeB37rtg/7jwf9Jf5SJZwL5ELVHZkUxsQ83H4bKUuKZobAxwHM5/GoSAtDEviKms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JDcw3tNiJDGozCg2AGaB5H5dYzpBiu+LvNGxXwlnarhRvJlx
	07f9Q8hUytyD8jpQUoFekYxZLxDHNuYt1jKNF6McFkwdCstg2QmzouclxesB9tw=
X-Gm-Gg: ASbGncvpK0JcZhBcUPIc2MYOnZnoi1DBFqpWYSFSaL6JeuUSMybQcw2tfWUhG4yXMQ8
	ti7EAe+TmXipbhZy8K6TaN7UOl/4qhzy8UDgnKdsaeP0beEi3X+xWKiiVW00OZkToVOzQakLxP4
	zFY7Vv0ImuMjOzuQqSS7a0B/gKE48LmbgqLCaUkApjjAJbxalDruHfEJL1eM1GNyjtDd8kP8Q1Y
	VjHpKGNsfFMqPuFEExSKxBrfWeoucB6oLwi+SQdL4IH+7Hm1jONlIDYvXPgNUbVO+uggz0qfUhx
	FqzvyMp4exTbLhLTzeMvjV0fooCJa6XyzmvEsGrAZ4CyHux5jV6Rhw==
X-Google-Smtp-Source: AGHT+IEkl43185PNxeLkgg7txN9kFAf7e0wb9MU+WD/KzTlqrVTDGwET2z05wzs/5ZubIeD6pxAbRg==
X-Received: by 2002:a05:6a21:9216:b0:1cf:4dc7:e4fc with SMTP id adf61e73a8af0-1ee03a23ef4mr1504689637.2.1738901427808;
        Thu, 06 Feb 2025 20:10:27 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aee7fbasm2135485a12.46.2025.02.06.20.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 20:10:27 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Yury Norov <yury.norov@gmail.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/2] Fix and extend cpu.stat
Date: Fri,  7 Feb 2025 12:09:59 +0800
Message-Id: <20250207041012.89192-1-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1: fixes an issue that forceidle time can be inconsistant with
other cputimes.
Patch 2: extend run_delay accounting to cgroup to show how severely
a cgroup is stalled.

v3:
 - Drop the cleanup patch. (Tejun)
 - Modified 2nd patch's commit log.
v2:
 - Fix internal function naming. (Michal Koutny)


Abel Wu (2):
  cgroup/rstat: Fix forceidle time in cpu.stat
  cgroup/rstat: Add run_delay accounting for cgroups

 include/linux/cgroup-defs.h |  3 +++
 include/linux/kernel_stat.h | 14 ++++++++++
 kernel/cgroup/rstat.c       | 54 ++++++++++++++++++++++++++-----------
 kernel/sched/cputime.c      | 12 +++++++++
 kernel/sched/stats.h        |  3 +++
 5 files changed, 70 insertions(+), 16 deletions(-)

-- 
2.37.3

