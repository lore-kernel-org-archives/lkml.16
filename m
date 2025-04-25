Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB031D8DFB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571093; cv=none; b=GEvM1/mHxbpeXJ2It/6/OuxVz3IRLbm934rAVeZ41J03FrpRMsQmJ6y5gFHR8W2uM+lk/C+KfE2EYv9QiDTrPIDWlJaqwL8KWusrcqQ2pUODVSyD00sy+jc3vfzqm8GEqomsdyo8zm0lq1w9ksO691XvdaOoRilj2VYQmbqG9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571093; c=relaxed/simple;
	bh=s38RoT5kIRhdPftjwpsM6ip6juWHwscI6YCbY4HPsgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIbG3llKca7oC0AJIwy7KFH97xoIJBb5FKsE4CmVSlNwxMXUxWo1eY+2PJ5r2VvsDHwCUYdH23Z0FotY1jJibwi8fNbxHMM6nvMeIdOi4REF4ADIxOnWgjnO6lK1L2mXjm9krmPmZ0bIEXU5tZn8dIqfvyXP3AXykJVT7DUlzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=tHyY9G94; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="tHyY9G94"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7370f389d07so249012b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1745571091; x=1746175891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSXKZ9RZpx5GZehUzvuOx7MK/Lhjx1UgMS46U5FhreY=;
        b=tHyY9G94LLFyw5eoYWrnqidILPdTXMt+VmKZ/hY8KveTmmQ3Epp07++2uE+GYfkBQ9
         eOw89gYQQvjedKw4+ygk8X3jeMrSYNbN2PxCHKIq0G/PkogWaN4R3x8yaGvC9/d0fu+x
         LSqQ/nCCA8HEtwCWbDMSfGYqW75qswLMscixwmqv1LHTiUQsWnGvW5kyeIH/uvBrtU4s
         3kQTR6kbwku9EVIxL1i36TQ9FsYboJpGt8lU1hP6DODI3ra1/2p9R3cf9mq3oVKS78DM
         N0gyphQ3kWXCjVjl3KNG1DElrtqlWq7m2XRJ9xlL+tIzB0riDAF+zkbVFocklO58vOUC
         n3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571091; x=1746175891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSXKZ9RZpx5GZehUzvuOx7MK/Lhjx1UgMS46U5FhreY=;
        b=TJz/DNejckjfTDv97sN855DAvLdTXO/IvNYHf+gkqMPU4fh5naUIzkyyVrxdnxz81P
         VxB/Iu9yrWPyaVPvjdIIjyIIusNdTr6m9KNBAnradvLcz065ElDAcqO3AekQn89ewrwI
         P4Q3y5F0kMyUqxYaDirotJ7X5EBtud3GXV2qHoPAfruj3Cft3jM+ii9uSbG+0PCGyr1z
         7i+AsKkqGVwprDzZ3oxhVPc94tAhBfqJJN2prq1j/tQFBD0zywSrBj6C6D/Wy0sib+RC
         h21wVqaLqakGaLNW9qkjTU8mCw7HyDtJl338rDz/eMjezL3BS/mv1MdmuIR+Zyd7lltp
         ng/A==
X-Forwarded-Encrypted: i=1; AJvYcCU2onpqjMQhT45QmodlmzDCBa+v976E17TjD4ol5swHZZRpHMZAmQsLTLouEz0x0Fwsqol/klCVaYIqL7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLqUqDqRlAOdQsTXqp2buXzAAgE1+Xw8dZMkQRGnNI5SZC8mmY
	ANEH1Wc2mcSu75ttGRWiDwfOq6aNRK47+TbhWb3fCb3uQie9HpPXycwKMEEjHAM=
X-Gm-Gg: ASbGncuWrbz6KrTRTX9ezzSxOyBAtPI4MpXrvMhBE5LUyNUUO7YA6JARi9dLV5n9+rN
	CrGmiP8deczU5lxPeTjP0H0pZviALG+8Fi1OZ3DR/ps7A2JcC+Uws3dxv4wIHbZkDm5Ngc+wTXf
	IBtg3J6P+zouEvWortCE17IE2ACytaWBttH888Xem66ko41xWMxjjMmIklzKU+huthYRXKhHV0c
	5xYs31eiC1CsBx/gLrIPQe+1Ni66+j6nIM9Kt+iKgUyg/BDklBnHPDXxr7Duh/RzF89mKkOzGEi
	q7BETPEfrgj0Mx7rqZhQapCdsM4HPHAXuX9BmDptQNCDfNg=
X-Google-Smtp-Source: AGHT+IHKmIM5F1Z6NOkjsaeIV8Ue2IAROxvDZM40DKONnIXgT8Tj7hpOFuhm5jSnOsy7xY/oVP+t8A==
X-Received: by 2002:a05:6a00:414a:b0:737:6589:81e5 with SMTP id d2e1a72fcca58-73fd6af0883mr930890b3a.2.1745571091143;
        Fri, 25 Apr 2025 01:51:31 -0700 (PDT)
Received: from telecaster.tfbnw.net ([2620:10d:c090:400::5:daee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a923sm2650942b3a.123.2025.04.25.01.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:51:30 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	Rik van Riel <riel@surriel.com>,
	Chris Mason <clm@meta.com>,
	kernel-team@fb.com,
	Pat Cody <pat@patcody.io>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH] sched/eevdf: Fix se->slice being set to U64_MAX and resulting crash
Date: Fri, 25 Apr 2025 01:51:24 -0700
Message-ID: <f0c2d1072be229e1bdddc73c0703919a8b00c652.1745570998.git.osandov@fb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

There is a code path in dequeue_entities() that can set the slice of a
sched_entity to U64_MAX, which sometimes results in a crash.

The offending case is when dequeue_entities() is called to dequeue a
delayed group entity, and then the entity's parent's dequeue is delayed.
In that case:

1. In the if (entity_is_task(se)) else block at the beginning of
   dequeue_entities(), slice is set to
   cfs_rq_min_slice(group_cfs_rq(se)). If the entity was delayed, then
   it has no queued tasks, so cfs_rq_min_slice() returns U64_MAX.
2. The first for_each_sched_entity() loop dequeues the entity.
3. If the entity was its parent's only child, then the next iteration
   tries to dequeue the parent.
4. If the parent's dequeue needs to be delayed, then it breaks from the
   first for_each_sched_entity() loop _without updating slice_.
5. The second for_each_sched_entity() loop sets the parent's ->slice to
   the saved slice, which is still U64_MAX.

This throws off subsequent calculations with potentially catastrophic
results. A manifestation we saw in production was:

6. In update_entity_lag(), se->slice is used to calculate limit, which
   ends up as a huge negative number.
7. limit is used in se->vlag = clamp(vlag, -limit, limit). Because limit
   is negative, vlag > limit, so se->vlag is set to the same huge
   negative number.
8. In place_entity(), se->vlag is scaled, which overflows and results in
   another huge (positive or negative) number.
9. The adjusted lag is subtracted from se->vruntime, which increases or
   decreases se->vruntime by a huge number.
10. pick_eevdf() calls entity_eligible()/vruntime_eligible(), which
    incorrectly returns false because the vruntime is so far from the
    other vruntimes on the queue, causing the
    (vruntime - cfs_rq->min_vruntime) * load calulation to overflow.
11. Nothing appears to be eligible, so pick_eevdf() returns NULL.
12. pick_next_entity() tries to dereference the return value of
    pick_eevdf() and crashes.

Dumping the cfs_rq states from the core dumps with drgn showed tell-tale
huge vruntime ranges and bogus vlag values, and I also traced se->slice
being set to U64_MAX on live systems (which was usually "benign" since
the rest of the runqueue needed to be in a particular state to crash).

Fix it in dequeue_entities() by always setting slice from the first
non-empty cfs_rq.

Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Hi, Peter,

I believe that this is the fix for the EEVDF crash that we have been
discussing. Thanks again for all of your help, this was a doozy.

Based on v6.15-rc3.

Thanks,
Omar

 kernel/sched/fair.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..0fb9bf995a47 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7081,9 +7081,6 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		h_nr_idle = task_has_idle_policy(p);
 		if (task_sleep || task_delayed || !se->sched_delayed)
 			h_nr_runnable = 1;
-	} else {
-		cfs_rq = group_cfs_rq(se);
-		slice = cfs_rq_min_slice(cfs_rq);
 	}
 
 	for_each_sched_entity(se) {
@@ -7093,6 +7090,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 			if (p && &p->se == se)
 				return -1;
 
+			slice = cfs_rq_min_slice(cfs_rq);
 			break;
 		}
 
-- 
2.49.0

