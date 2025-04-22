Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E251F09A1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351353; cv=none; b=ZTqdi3igdM1hgF64LFrbaYC7VQ0Y5zJn2Z5YU7t/Qd5CQpt1o+yElewHmGfIqep/3j7NilopEjwJHIEuElwRELsmxZDWNjH0nxu/qrKzLCtDd7QJfnGPzRoj97JVh7fTgzWmuX3UOp5xI/wazlV8rRMWFCI6L/ymogFW9dvLq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351353; c=relaxed/simple;
	bh=tJe3zZeJkz1ognYUTOAEkdc0KXDK7yt84OVNkXdgXbw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fsbU2hmK8SqaJlpso8W9xktv1ZPPUaFAxq5LDyQ3bPrJqSK7r/QK/LM3kGfnOVEEBUFmyRCIroZE37Nvy0kbHxlA8wHuOU79an3ZOw0Kiu/3sCDBM+d1dNOkMO4tfRt4fMR8CpE1UbJh0fzvbUNeUFbxj8j5fKtxgLHxvd7z7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWEd6TN6; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWEd6TN6"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c14138668so1372297a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745351351; x=1745956151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hk7btU3vfMhpkAls6GN39173morDF5zAYw+1usHCHqs=;
        b=UWEd6TN6WGJJzGk+J2HawrBxv4CJV2uWUU+cuGNX7N4pIJI+eH9/QVAvoM/rPbgjQW
         AvM+CQ4+2XGzzAlugrbFu446mamtKEVOw65l1VVbdVHMkcnRxresn0SBs2JNX4xc1vPA
         +yOLWUJF/p96shj5M1SHC3tPSQY5itvJ1sSWjGcoB+6N2TnTbKW7P7vlO+cxyPFENKlV
         hOYGvoUkUDg3fSC3icY0uOKkAWdzQRk1eT2ZGp+iRuYugxgxkxUXuvT2biQx5WY2ZcqX
         XDqb2lkca1lCaBpAkqKbet3z8fINuma4IxMi8nSzIt3KKf8n4rkuwG73hcNqhqmtHWvV
         u4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351351; x=1745956151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk7btU3vfMhpkAls6GN39173morDF5zAYw+1usHCHqs=;
        b=PIiYcg/NUKcaYxb6fbgJmnzaqSV9LzlkphALeonyep392BD8wJhKSd0/NReBmM24QO
         9VKRKae04UdhvA9s+NYnP0nkyizeZHZp3j51VJHOejOK63/fou6ZpY745z5+HsbEDIkw
         ana2DGT3dc5zj9YrXb/64QmUpwz6pQigaLP3lNy7haxBO/8tlGYIagVVhWFIIqiRdrgD
         IKoe6t7E9ZR8lhXwcRcgrrpSPC8lYXBpsYwviPDpR3219YQrMJ3HBbFliAB7F8qgYuG8
         2lVZ9BKcoINq60j6FRmaxv1KyM/Fmv98nRX+2XBkeT+tgJ6pTgDTrcUG9zO4KgQS9D89
         NzBA==
X-Forwarded-Encrypted: i=1; AJvYcCWzneFbEEQFf5tHxiO5uUR3q9XDzX3cY93+AuhWrycOTgGv3o1KZIMuTWAVrwXznOAC4r211Bpy3pJDGvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YziERVHwyigKhk69h/Q+pqsCoHtRQz+WEgfuzAd94Q8JGTKm5//
	Ynr7kKHHQymY/ZZpj3kfu9UAArD41wxQ9JZSKrNluesfoKDpXfvja6o7rA==
X-Gm-Gg: ASbGncthabpBS60gN9dKEdQImh7AnBVOScSa1YaRPzb6l73i7XVIhFuNiqOJxTl7nB7
	K8Sc3jP+d89JDtUBsrVBpglWkoOP9wNcQT1g6RTEVTUNno+LbU1coOlMas00CkJeMbM8jss8XUB
	2C/s8YUkYMY67xpnJp+ZkGdnY6TUggWSdW7c5HJXvG4sfgzpLwMcjK2qEGcx8IdY0kygbzklgok
	B22/vm6cFjX63u5GWkPRfn0GY853DeHVQ6tojCvVuywixQFqgmTtoBTiN/yij2aMWOMxPqEiSxy
	cmDfpJj1yxstOv/GPGfQd73ETIaL4nwywKjw5d8QqN805XjY4KRH1xKnMJisYCtVIo1hJQricFa
	d73AvF46D
X-Google-Smtp-Source: AGHT+IGlvPHKCGNOwQ1P6yPygenHkdTgRPo04sKrGbz2FNZRR9FkxWlSrdnmCZ9+4q4YKdVQj1sojA==
X-Received: by 2002:a05:6830:6307:b0:72b:7fc2:2f1 with SMTP id 46e09a7af769-73006218916mr10797420a34.12.1745351351185;
        Tue, 22 Apr 2025 12:49:11 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047afafcsm2131187a34.17.2025.04.22.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:49:10 -0700 (PDT)
From: Doug Berger <opendmb@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Doug Berger <opendmb@gmail.com>
Subject: [PATCH] sched/topology: clear freecpu bit on detach
Date: Tue, 22 Apr 2025 12:48:53 -0700
Message-Id: <20250422194853.1636334-1-opendmb@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a hazard in the deadline scheduler where an offlined CPU
can have its free_cpus bit left set in the def_root_domain when
the schedutil cpufreq governor is used. This can allow a deadline
thread to be pushed to the runqueue of a powered down CPU which
breaks scheduling. The details can be found here:
https://lore.kernel.org/lkml/20250110233010.2339521-1-opendmb@gmail.com

The free_cpus mask is expected to be cleared by set_rq_offline();
however, the hazard occurs before the root domain is made online
during CPU hotplug so that function is not invoked for the CPU
that is being made active.

This commit works around the issue by ensuring the free_cpus bit
for a CPU is always cleared when the CPU is removed from a
root_domain. This likely makes the call of cpudl_clear_freecpu()
in rq_offline_dl() fully redundant, but I have not removed it
here because I am not certain of all flows.

It seems likely that a better solution is possible from someone
more familiar with the scheduler implementation, but this
approach is minimally invasive from someone who is not.

Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 kernel/sched/topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index a2a38e1b6f18..c10c5385031f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -496,6 +496,7 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 			set_rq_offline(rq);
 
 		cpumask_clear_cpu(rq->cpu, old_rd->span);
+		cpudl_clear_freecpu(&old_rd->cpudl, rq->cpu);
 
 		/*
 		 * If we don't want to free the old_rd yet then
-- 
2.34.1

