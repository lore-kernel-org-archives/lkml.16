Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE524C67E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217091; cv=none; b=Q/7olqm1QDuS7NuFSKXmz21T/wY38N0x0VGXzCANmkVORyCEzio02Bsj4PgXeV44pVnkhY+Pnu7N1ZmTTa64hSdq2G7nNP42u5fzB83/2CiyCXI8ztV1y2Vpsjkvy9hufap2KDtBnlykxdUyx7TtRMtyE67MkEEetIJG684wjDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217091; c=relaxed/simple;
	bh=NL0LHcvrRTbFaurivkSLOZV3+ypMF8EEk4/wIyUuZsk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PUwcYGuTizC6u1Ko2b14+3wxxjhSuqsVJuFYpeatc+aUVKX5/AdEg126f4QJge68O1U/BcsXJchKJYvFmdTdyzrfrxhV0VB8nG+lIu10O2X6KlENS5ZdqQnnMuANcbyzevCMzbRpC5JuRDBD8bNXCGTqzwXso8DR1T64uPMtshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshdon.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1DE7aXB; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshdon.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1DE7aXB"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-3f3ba246da1so275589b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739217088; x=1739821888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tOXnxgBUA2lQMXUHGwH30+TGhSdaWlZ68DAVadzFkQA=;
        b=q1DE7aXBwBr5nFTnwAUpod4x8ntDdH1FpIpICM5E6crhvrS/NHvM94jBHaCuV4BEHh
         HOntm3KnvhJvYa0OsBkIqL2BPzfWpZfHsEipuJo1EhFWxP4nOgO/r3xHVw1Nd61du42O
         XNym9Q/WLe20YGcbDUZ95HwPZwD0IPUPeQ5apHzHrgVMWxRT9BaWe/39BN1M60Xih3Op
         5kvdSJRPDDxwzFoYuhpq87qMUOLg6GXZBbubZ4vVc1gcYLqa0MUoiDvWQYCy5O6RN2BT
         gw4Tg+zOHTlUT73IjANRp65kKAd65HeA25Thz3YejaXCxd+5TwHH+Y6qXOfMBG89oCLt
         S6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739217088; x=1739821888;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOXnxgBUA2lQMXUHGwH30+TGhSdaWlZ68DAVadzFkQA=;
        b=JJG3VmHgCarYaNlSy8mvTH8XH26LvL7lkEmirwZWvf3yJRRrkgD+z5IUEdF4jEcE/N
         XWLBtBj3rox+R1dqvieIEEaq5GQOn+EyUrUkEithnWFxVjIzh9omIZH5JJiffukhQUhI
         h/ZMraADWxgwlvC6C14JzuXmhNXtixj+05dQi/olxM8lZ8IKeIFB2Sd2+Y5++Nuiai7u
         PYcap7lQCx8ssm51ESeDHIHyOtFd8a+rXiGUnsKcDX9VVAntHbTDyBJJmvnVgIzTC+Xh
         dZSXG9aiW+ElMNZpNGROjmX3IBpHWm3yQKJo56CZfsUbLm/5uk3mrpkA/WBrjmGwAcYb
         tB0w==
X-Forwarded-Encrypted: i=1; AJvYcCUvXhaxEeISaPpbuEErfSJC8Glm1H1qpYRL1TVS37WQLPG95ailXAoNqVBrX7396ZP+idqZU4FLSBNuPqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKPKUGqAr+r0GjrA81Ztp11mwdu71qMvedh2UEZfU6NaLYyP2
	ZfZelhBuFDhP8X68M/WvDV4B2HNhMntRn/c0Vaa1nscGwnBoQw1SeBjdIxM3F/VUiSCBYCZj7vf
	Vy0uT0Q==
X-Google-Smtp-Source: AGHT+IFgSDA7YZwETAkSQItXtMybQDCzv3AKO4IAwD3VBscyHky1oQMCOzajc3TfGclLzwGpVOFbdrSNKjDr
X-Received: from oabhp16.prod.google.com ([2002:a05:6870:9a90:b0:2b7:fd7e:8001])
 (user=joshdon job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:8302:b0:296:dd1d:ce73
 with SMTP id 586e51a60fabf-2b83e795187mr9579392fac.0.1739217088424; Mon, 10
 Feb 2025 11:51:28 -0800 (PST)
Date: Mon, 10 Feb 2025 11:51:17 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250210195117.1074569-1-joshdon@google.com>
Subject: [PATCH] sched: fix potential use-after-free with cfs bandwidth
From: Josh Don <joshdon@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"

We remove the cfs_rq throttled_csd_list entry *before* doing the
unthrottle. The problem with that is that destroy_bandwidth() does a
lockless scan of the system for any non-empty CSD lists. As a result,
it is possible that destroy_bandwidth() returns while we still have a
cfs_rq from the task group about to be unthrottled.

For full correctness, we should avoid removal from the list until after
we're done unthrottling in __cfsb_csd_unthrottle().

For consistency, we make the same change to distribute_cfs_runtime(),
even though this should already be safe due to destroy_bandwidth()
cancelling the bandwidth hrtimers.

Signed-off-by: Josh Don <joshdon@google.com>
---
 kernel/sched/fair.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 34fe6e9490c2..78f542ab03cf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5917,10 +5917,10 @@ static void __cfsb_csd_unthrottle(void *arg)
 
 	list_for_each_entry_safe(cursor, tmp, &rq->cfsb_csd_list,
 				 throttled_csd_list) {
-		list_del_init(&cursor->throttled_csd_list);
-
 		if (cfs_rq_throttled(cursor))
 			unthrottle_cfs_rq(cursor);
+
+		list_del_init(&cursor->throttled_csd_list);
 	}
 
 	rcu_read_unlock();
@@ -6034,11 +6034,11 @@ static bool distribute_cfs_runtime(struct cfs_bandwidth *cfs_b)
 
 		rq_lock_irqsave(rq, &rf);
 
-		list_del_init(&cfs_rq->throttled_csd_list);
-
 		if (cfs_rq_throttled(cfs_rq))
 			unthrottle_cfs_rq(cfs_rq);
 
+		list_del_init(&cfs_rq->throttled_csd_list);
+
 		rq_unlock_irqrestore(rq, &rf);
 	}
 	SCHED_WARN_ON(!list_empty(&local_unthrottle));
-- 
2.48.1.502.g6dc24dfdaf-goog

