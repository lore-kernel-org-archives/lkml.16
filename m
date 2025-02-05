Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818D22AE45
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751136; cv=none; b=YcZu8eq8vTajoLmoBHyDYdah3PNu+unaS/eZ/NmFZl9DgKwoSjqDDrZoF3coxVCRfLPsOdjqwnqOZz+egz5s7Kp8+t6DvSWbMmFQ1M+jyJx1+QNf7XxUbr65mhi9wpqnAzdTsIXkRQtiXHHjnO97KOaIB52tWdhjQgHurN4qn1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751136; c=relaxed/simple;
	bh=7kv+ohn4+JMZ1rgZ5wrp+qFbM4WdOU9IkQEezJWEEA4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Dr4Y/Xd84HgbrfdRRECOmPi5cSSfmjl5XmdiIc5yhxemfk8Wol5ncihz43NtRp+FhAf3eqH9SxJwV1bChOLsYaCm1CYgCJE7pbod06k/hVFG7tT0PjDY+Z7IWhGysv4P2yfZmuyLDDtNVtkwtGqIST7GcITtMu3LiloNVd5ZcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OyzVMoxh; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OyzVMoxh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=muUtDZ871e3BKh4vPnVNv+6PbMqja4ougcT0oszeQUw=; b=OyzVMoxhEvY+5dE39XSngFPzAI
	iPDdFIen8iE+zrnwT0smH8XB405zPTe4tbNUv6rAAs3nfObF7y/pB3J3sGPkRCJ44SJddRG61o5P2
	xE1fVtSuAYO3ih1GznSThGNW4lL4Fh7S7SV+s2TSEQcoPtL8NaA78OERzIVFWNeyaUfzNHUdthRq7
	bjO89Ul80pvhTq5IZa4gGR7CnN0nODgR30slcKFwolzdDkKegbpWXnLm2bXYERdEp300aHFA+528x
	nP17Zh47sQe6N3ymxFiK3KUev0suMhg6GbUOomz6FDi+/czbQ/Uuo7bS/Gzdaw0IMS5ZxedkGkQNh
	WbElW3Hw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-0000000Gbm9-40Ll;
	Wed, 05 Feb 2025 10:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C0F6B302E7A; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102448.789958355@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:25 +0100
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
Subject: [PATCH v2 05/24] perf: Simplify perf_event_release_kernel()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Get rid of the free_list...

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5462,7 +5462,6 @@ int perf_event_release_kernel(struct per
 {
 	struct perf_event_context *ctx = event->ctx;
 	struct perf_event *child, *tmp;
-	LIST_HEAD(free_list);
 
 	/*
 	 * If we got here through err_alloc: free_event(event); we will not
@@ -5531,27 +5530,26 @@ int perf_event_release_kernel(struct per
 					       struct perf_event, child_list);
 		if (tmp == child) {
 			perf_remove_from_context(child, DETACH_GROUP | DETACH_CHILD);
-			list_add(&child->child_list, &free_list);
 			/*
 			 * This matches the refcount bump in inherit_event();
 			 * this can't be the last reference.
 			 */
 			put_event(event);
+		} else {
+			child = NULL;
 		}
 
 		mutex_unlock(&event->child_mutex);
 		mutex_unlock(&ctx->mutex);
+
+		if (child)
+			free_event(child);
 		put_ctx(ctx);
 
 		goto again;
 	}
 	mutex_unlock(&event->child_mutex);
 
-	list_for_each_entry_safe(child, tmp, &free_list, child_list) {
-		list_del(&child->child_list);
-		free_event(child);
-	}
-
 no_ctx:
 	put_event(event); /* Must be the 'last' reference */
 	return 0;


