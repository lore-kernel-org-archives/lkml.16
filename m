Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85E136E21
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200380; cv=none; b=rf2EIUIJwV/dg4IbWV6NEoThCcyLd2Up143Rzx8nuQgqSikcrwzo72q3nHJ5AWkEYYIPMHPsbLtzvjEZiloP7GETS9QJoK1xfnszbk8VJIBuXeYcLgURtyho5NAXtiGylnEXIUAXfNBf+EXU7IT5SC6qQsvM6FcJaiqBaMFp6dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200380; c=relaxed/simple;
	bh=xj17MFlJulz5p0jdPBcalKowBvoJHFJ9677WrwPHzAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JbsMBeJ/f8aDSB9BojKdL64/hg4/34CnVVPm3h8NUk7hkY3WaWgBpSX9MvzyC9yAn9OHHFYRx18eqgRwWdM4xaLBP7aoL99acFJRhRr/8OgL4lHzml2wDq6rby7p+xjuv8MP9JR/fiLkPGHhucbB0wgD0IrwrBdUmmRaOxR3++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O+vU7twm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O+vU7twm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaec111762bso1086855866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200377; x=1739805177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=friAMnSjLY0+SGaIxPPMR2wFL3NaVBwarbQhTRSR7xY=;
        b=O+vU7twmNJ0IUZ6ed++VpYIoENxMTlmNYdzPZ6i0zkQpPir7iFBwyfJIndN3L2H/mb
         r6B9f6p3CVSi6aCed+h59QxurfNyrT0QoMCI+ksSHI9QzJXz++nIl2QtujYwQVFLHfVb
         fwWrHpZeclvF2arj/9xIPHR/CLSnvV+qmSD3J4ANjVB2orciGly2HhXmquADDHfrrBQ/
         gpExhRX7wRDkt2BDgIXaqLy60afi4vJ5UtnI5M0VG0ylZ/bJXB+e8Hge0PsWo0X3gZSm
         1AM63z2zkxGKxx4mFSmCab0qUa7BJoipAmQ5rCjYd2PD8gRVyr/pU9WO+RHW0zlr1KvW
         Qdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200377; x=1739805177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=friAMnSjLY0+SGaIxPPMR2wFL3NaVBwarbQhTRSR7xY=;
        b=Y5Uk2kJOentCjfwH8V0aAX/90il4Mx3vte+dDB040M3/QiyQJBxD5hduRJQRH1iaxe
         GrXnbS3SlNWvvzzig4/2S0gDraReIi168bqzKnx2faBPo+Njs4WQMTHUjwnNnbiVGtVy
         dBPjQswSS4c1yX9CgkqEhJMoVBI1iOfxBGDJlCbsfmrbavInlCvpdph6KSduhKikO/Si
         qzgbFMTRGElUhe84Yx9GyQNLda/BjSpWFQOSoOnYYDMIYtDpakzyNeqRRYkXgcZVmn6p
         EtgQjJwnwI/2YDHJK0Qim8tmCICq9nnVUHjUOOMeaAJRHhOBp1CXvjXCV14OAqdhTmT2
         pyjw==
X-Forwarded-Encrypted: i=1; AJvYcCUtlb8fU5XfLy9EGjKbzziOcCcVrpOV1nE5wpYYzZHZQPRElXb1vH127l1N7Rge73sEo/dgeBEPdbRAfO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNXx2TVBMxQ5AWwFT2fAhky/N0daFyl6TOYryFwHkJ8Ya0mGqe
	5vTleCVOMtvEJVG2NBFDxkJAqZN4iFcdUR25VtsiqeMPp+MdfBHdujqVs0CMDtE=
X-Gm-Gg: ASbGncswHfbNqNyPmVoslYz+j3DQ0FIGw7M+YN88HYtzc1/F1/InWtroLl7L4AZA5dD
	qtQCToGPMpyjTON5nhcAJhxH/yRyIKwySOyYh4Tkh/bqLjG9pztKTovSWVvrckDpAXeTMvCt/5M
	1/MHa8mUPEVR/2TWOds65LABrh4sLSw6M0Zz1jNRKEpUdoWehRS+LaFGQWdZLGJ8ynMV3R0qqB7
	dkpHKPlm+rohscRg0ZspbvpzeQ+urf5+wZdcCoa0PlwnSSyOIaW0lyyiizRpdh+c4quOx9cGeLp
	ov04FM4RwrGK5tDpLQ==
X-Google-Smtp-Source: AGHT+IG/vCz02gYL/LIB5SscWC32zJnOpctVQAJXvp5QEx6eAgb2yHXEDLpqT66quaqHwD+vieK5PA==
X-Received: by 2002:a17:907:d01:b0:ab6:d59b:614d with SMTP id a640c23a62f3a-ab789b395a1mr1619973666b.23.1739200376665;
        Mon, 10 Feb 2025 07:12:56 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:56 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH 3/9] sched: Always initialize rt_rq's task_group
Date: Mon, 10 Feb 2025 16:12:33 +0100
Message-ID: <20250210151239.50055-4-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151239.50055-1-mkoutny@suse.com>
References: <20250210151239.50055-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rt_rq->tg may be NULL which denotes the root task_group.
Store the pointer to root_task_group directly so that callers may use
rt_rq->tg homogenously.

root_task_group exists always with CONFIG_CGROUPS_SCHED,
CONFIG_RT_GROUP_SCHED depends on that.

This changes root level rt_rq's default limit from infinity to the
value of (originally) global RT throttling.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/sched/rt.c    | 7 ++-----
 kernel/sched/sched.h | 2 ++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 17b1fd0bac1d9..dabb26b438e88 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -89,6 +89,7 @@ void init_rt_rq(struct rt_rq *rt_rq)
 	rt_rq->rt_throttled = 0;
 	rt_rq->rt_runtime = 0;
 	raw_spin_lock_init(&rt_rq->rt_runtime_lock);
+	rt_rq->tg = &root_task_group;
 #endif
 }
 
@@ -484,9 +485,6 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 
 static inline u64 sched_rt_runtime(struct rt_rq *rt_rq)
 {
-	if (!rt_rq->tg)
-		return RUNTIME_INF;
-
 	return rt_rq->rt_runtime;
 }
 
@@ -1156,8 +1154,7 @@ inc_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	if (rt_se_boosted(rt_se))
 		rt_rq->rt_nr_boosted++;
 
-	if (rt_rq->tg)
-		start_rt_bandwidth(&rt_rq->tg->rt_bandwidth);
+	start_rt_bandwidth(&rt_rq->tg->rt_bandwidth);
 }
 
 static void
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 38e0e323dda26..4453e79ff65a3 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -827,6 +827,8 @@ struct rt_rq {
 	unsigned int		rt_nr_boosted;
 
 	struct rq		*rq;
+#endif
+#ifdef CONFIG_CGROUP_SCHED
 	struct task_group	*tg;
 #endif
 };
-- 
2.48.1

