Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F911CA0
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739081617; cv=none; b=Db32BRPgQgHnKLHKlnzKsFCw/bxebFC9nYJLXarwxvf4aZMZsZHkqr13IslBql5IhbabR4SMhNdus+J3EL7CnWoUHWDKNBpBQZ1ogSCrEvyQ6Hj7eyp/RIS3rdAa9E76KE/e6YXesYaXm3/6VI/PVpbsg4CYt3tCDBWe8e/TIN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739081617; c=relaxed/simple;
	bh=r9l3X0h/k4HjyI4SfuRJtcppk/M3dsbr96keZORi72M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CnFBzy/+u5ry1ZwdWGJCkAMbuDPwx2XTtA9FIdHj6ARqibEphj12dTGAKEm7FETHw6Dkvs9YAYi4Efid7rKME3ig9qKU+0HbGE2B/2kZWv6uoPIWm3/ASxfelG1mymEE/PR2mKZUK5nu5pOnIEFiKbnrNeQrfDbkqc+Zv0n5+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HhFD3WR+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HhFD3WR+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso842540a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739081615; x=1739686415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YU7wRncnO8wIwaOm5iP7dvoTbcr3ycvs8QfzeTKT60Q=;
        b=HhFD3WR+QC3YLSTLKh7E0C/fm/+/FUP+rKaAu/Sy8WkICLsixX1pcA7P07nyvn1874
         6MT1ktZq2SCnyW0JtS/RMVWkxk7Krz8aodWrT9Dk6b7HTqSQ+OMmJGEwvXrIGLMVx1oL
         q5MFA7AqUyFsiOvcTOtTa2cyVezzGq9LsMwrc6Ptr3G9W715D9EXP/mwtQMEW2lm9Aq6
         62KtW88N/OWtpQ/vg09iojj2N9kXQJ3UqFcAo17JIyop1qqeQE4CHd3PGncR5s6Fyk+l
         yLuXAQbhqDgOci3rgLDggcI+FKm51RX9g0E6EhEuLkWIGwdYOnRUm8uGD8oWSK3nzNhg
         Pb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739081615; x=1739686415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YU7wRncnO8wIwaOm5iP7dvoTbcr3ycvs8QfzeTKT60Q=;
        b=e7pDthZyn3Vh/0PLyOCLwJtN/MGRO933DXbXttMSrw5pYinV9rZl3gfpDhTHN9WH8a
         RGvvBkJmulU2kwlRPZ5B0OuEdUusUmP/vDpeN3crs1rLNe+QqwS5f9+o+Iixm4obdefW
         /MdwvQNa0Mp8zEf2QtwFJloyujAUJETHXRrrH9fAZs4QVeqvhJEIXGoENZX4xsMjgb5p
         vn+qX8JX0NmGR2FBK5/6/AfPAjC85yxuF/ku5rSdONqtaByJ4nIcWxVcl7i79q7VvUWI
         OASCCF4OXXuaYAeGLuger3ESymwBJPY7sATz2G6T9eqJ8+xPCJxsJ1F5kbxCMFuG9jXK
         Fc4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqkOyITj8FLpqUUUNwUPB8HF+nvEGR5Du474Vj1Wq9bXb0rDp1QYIxAx7Oeu9bdxo1OMPmjL6dtjB1xiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykY1HQoQ29zlTfav4+XUMbb2FFzo8vvkipAZWn3DlZ2sS8yVSg
	Hlsq2vbPmJWLTDZH1kz8tT4BDCoqrFTHcG7r29huojlfYM6fxlmHtXFhy32tLUc=
X-Gm-Gg: ASbGncu193VJ1nn5oD4zV50AEMl9tVemutQhRugbkaZ8zfz9bGBsnS9uPb/OGtxHMcA
	+BfipH88892ny6o1CXqHi5VGBzGQ4sK6sQDu6IqjR65y2o9IMbuxBe59AkDkse8sohw6z5WF1XE
	YakkMrgvhq8qU1Td87nVe+1ALENv7gcu5VIO5qikXqn9ygBNepnyJ8zqNpyXrfZfDOv01MSOxXh
	UKCiBeajE0UqHt9+cEu11j+FpCm7DmIJxq5x4/FEUojxoQ0T7pvFrNV9JyGDSp09rfiOIZMMR6A
	QCEFCzC/ZFmmwPCMkJSIaiq/TsyqpzbdGFFa+jB2ZPnK4Wt4qy5ohA==
X-Google-Smtp-Source: AGHT+IG4/B+BVSKFZSg0eLyPkjsStbggwOl3ypIeb+J8t72J6SPFnXFAvt85+GGZSh1vuPiPJlSHfA==
X-Received: by 2002:a05:6a00:1a8a:b0:725:eb85:f7fe with SMTP id d2e1a72fcca58-7305d2b2903mr5406607b3a.0.1739081614939;
        Sat, 08 Feb 2025 22:13:34 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad26b9sm5550700b3a.50.2025.02.08.22.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:13:34 -0800 (PST)
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
	Yury Norov <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 0/2] Fix and extend cpu.stat
Date: Sun,  9 Feb 2025 14:13:10 +0800
Message-Id: <20250209061322.15260-1-wuyun.abel@bytedance.com>
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

v4:
 - Fixed a Kconfig dependency issue. (0day robot)
v3:
 - Dropped the cleanup patch. (Tejun)
 - Modified 2nd patch's commit log.
v2:
 - Fixed internal function naming. (Michal Koutny)

Abel Wu (2):
  cgroup/rstat: Fix forceidle time in cpu.stat
  cgroup/rstat: Add run_delay accounting for cgroups

 include/linux/cgroup-defs.h |  3 +++
 include/linux/kernel_stat.h |  7 +++++
 kernel/cgroup/rstat.c       | 54 ++++++++++++++++++++++++++-----------
 kernel/sched/cputime.c      | 10 +++++++
 kernel/sched/stats.h        |  3 +++
 5 files changed, 61 insertions(+), 16 deletions(-)

-- 
2.37.3

