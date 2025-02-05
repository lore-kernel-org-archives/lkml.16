Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BC2063D8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751135; cv=none; b=B/5Km54MWvZhNmfcCkMgcy431CqA2mzcBcPMNBCll+Uu3o3iHe78yYbOyaf4xuAPzC62WCqlqRfP/6Q0JS+xRdVmPr1umq2ussUER9YkbsuGoKq6RlogwY1B9FxtbtQIh64af6kQOIaQeeaG+LH/aoFpT+mJMY2eNwN+kVi9VkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751135; c=relaxed/simple;
	bh=2W3RwCqdWrSbI3AnIU7O9V1/QqhgCRodoKt377zeFEM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=RgpffQmO6tN/Wg2Z06qnRWY/wTuMZnqMc3FaZDASOPi/KcK4Lne+ppaOjjcr8ffk+FmKZxbyS8J7Rbp7X52TGoJZcuYaX9PDPWPSwJcybMRw5aqPaOyOXKLyBE5K4mRKYRQV3YFunCXcMpKvRrtRfy1kVvr4WgIv3DdTBFnrB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nUpUfYO+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nUpUfYO+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Hz7UCE6SpGqMPyTo25jsb7HnrcJHQ4a5YG8n6VtwtD0=; b=nUpUfYO+2FDb4M3TjV8sLJdP4C
	5c0QznLIJ9Gh3vPhJV8pLp6ZhIlXK7RClAwo5YqCs8oiTJ1c1LpWkLAgjEnlOkzkyjD5efi39503h
	6Sk0Y91oHLycdwRtaHxdJy8eHuntLQME/f6ByGeMlUHz2KfuHdNwvYydTmHLxOmfvy3nqd9hcXTLU
	BFjFeaI6VyK8T6pqFqBEbT43cjZuFfx7lJOyloeNOnzayH84jO1pRMyED9quROIcqYjAfUWb5r/WW
	eBF7+4NJ2I1qlK/C0qhMkqd4H050VUfpEcrl2SIv7hwv89jWzYrVgRFcNvnKAE1rO/nye7WH7UK83
	Hh+EOTpQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-0000000Gbm6-132m;
	Wed, 05 Feb 2025 10:25:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B928930078C; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102448.563246589@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:23 +0100
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
Subject: [PATCH v2 03/24] perf: Simplify child event tear-down
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Currently perf_event_release_kernel() will iterate the child events and attempt
tear-down. However, it removes them from the child_list using list_move(),
notably skipping the state management done by perf_child_detach().

Crucially, it fails to clear PERF_ATTACH_CHILD, which opens the door for a
concurrent perf_remove_from_context() to race.

This way child_list management stays fully serialized using child_mutex.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5526,8 +5526,8 @@ int perf_event_release_kernel(struct per
 		tmp = list_first_entry_or_null(&event->child_list,
 					       struct perf_event, child_list);
 		if (tmp == child) {
-			perf_remove_from_context(child, DETACH_GROUP);
-			list_move(&child->child_list, &free_list);
+			perf_remove_from_context(child, DETACH_GROUP | DETACH_CHILD);
+			list_add(&child->child_list, &free_list);
 			/*
 			 * This matches the refcount bump in inherit_event();
 			 * this can't be the last reference.


