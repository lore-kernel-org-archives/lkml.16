Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FC22B8C8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751139; cv=none; b=qObhOSna6PAiBugiHZyEtA1af9NyWF/phOASOyB5+jtCltWjCP+ZaiY/uNr2GuO5aKSijms5qM9d1ZRzCpFdljWsiymdCK78UbSDmztvFLjaRHmoSUBjD8Q8SEzc5iEPbQSiB1tMHyyHfxuGOU4WgSbg0pv9Cho0RfbtBU+/LYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751139; c=relaxed/simple;
	bh=t+nkHao6oa2/XUVBMrLN2l1wwJK0Yjp4YK/DtpLwCAs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=SCZV796boY6S9kya8UIsPqYjzyKyCvyfSfl9fHNCUpyCvmrxyIl2h+x7grlsNAp4Z2SBJ90NtcXFaRz/98tkvVCMdv8a8s/jN9ZG6czbusmtJbmuRic73ACBVnZTIYF2GO7702wI1+pKx80MEMNrMgJyOPKV2BjBwcsXv1x+91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZFv74E6g; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZFv74E6g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=hr6tiJEA7PUuuL2CfFFjilBKdlpHbB0gBHXJT1lSU6Y=; b=ZFv74E6gei7ac7JUh1QwVEuTg5
	ujc4Mkm5w9isa3F+Rj4zeIhclRWVwSJWgRYqSPI4wn5MUNjrpVIaZ+cA/Iuj4SNGMLGtip2a+f4xZ
	TwOynxRHSNclh8a+HJFYREMtcZlhaIPiE7KgtV/j3cnTKuf1+p/AN1hcXZW21bamG3AS00uru3PS5
	R+obNUNd7JSfi0cBCkNgZDKRmgjACJhliyKO2SLyUj6V3987vq6eMBIEHO+9hkBmrPBz1sBpy018+
	fTtAaCR6va4lLU5CXDyKZ4yVlsOLbMS7y6gLvDOiOh7iFxAId7GEzM96k2R8M1x1NQAS9GZbrIgFz
	5OYij8+g==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-00000004GPT-2YR0;
	Wed, 05 Feb 2025 10:25:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BCF1D30083E; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102448.680187551@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 ravi.bangoria@amd.com,
 lucas.demarchi@intel.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 willy@infradead.org,
 acme@kernel.org,
 namhyung@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 kan.liang@linux.intel.com
Subject: [PATCH v2 04/24] perf: Simplify perf_event_free_task() wait
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1223,8 +1223,14 @@ static void put_ctx(struct perf_event_co
 	if (refcount_dec_and_test(&ctx->refcount)) {
 		if (ctx->parent_ctx)
 			put_ctx(ctx->parent_ctx);
-		if (ctx->task && ctx->task != TASK_TOMBSTONE)
-			put_task_struct(ctx->task);
+		if (ctx->task) {
+			if (ctx->task == TASK_TOMBSTONE) {
+				smp_mb(); /* pairs with wait_var_event() */
+				wake_up_var(&ctx->refcount);
+			} else {
+				put_task_struct(ctx->task);
+			}
+		}
 		call_rcu(&ctx->rcu_head, free_ctx);
 	}
 }
@@ -5492,8 +5498,6 @@ int perf_event_release_kernel(struct per
 again:
 	mutex_lock(&event->child_mutex);
 	list_for_each_entry(child, &event->child_list, child_list) {
-		void *var = NULL;
-
 		/*
 		 * Cannot change, child events are not migrated, see the
 		 * comment with perf_event_ctx_lock_nested().
@@ -5533,39 +5537,19 @@ int perf_event_release_kernel(struct per
 			 * this can't be the last reference.
 			 */
 			put_event(event);
-		} else {
-			var = &ctx->refcount;
 		}
 
 		mutex_unlock(&event->child_mutex);
 		mutex_unlock(&ctx->mutex);
 		put_ctx(ctx);
 
-		if (var) {
-			/*
-			 * If perf_event_free_task() has deleted all events from the
-			 * ctx while the child_mutex got released above, make sure to
-			 * notify about the preceding put_ctx().
-			 */
-			smp_mb(); /* pairs with wait_var_event() */
-			wake_up_var(var);
-		}
 		goto again;
 	}
 	mutex_unlock(&event->child_mutex);
 
 	list_for_each_entry_safe(child, tmp, &free_list, child_list) {
-		void *var = &child->ctx->refcount;
-
 		list_del(&child->child_list);
 		free_event(child);
-
-		/*
-		 * Wake any perf_event_free_task() waiting for this event to be
-		 * freed.
-		 */
-		smp_mb(); /* pairs with wait_var_event() */
-		wake_up_var(var);
 	}
 
 no_ctx:


