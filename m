Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BFE22B8B9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751139; cv=none; b=VVb8VkIa+Imya9UUoxep/4rejk0Qilg6WxTQOiHHEc5zRWH6d65GE8Ji4VlhEjxb2c2LcXLxjDHcDceb/yQnGlLrFOmJ7lYzZrMv1KIXyJS83IVlcjFeNdPUi28sH4pvdqsoauHcQAFbWjKpO88ALvnaC9ec+1ETpPOx4O5/RhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751139; c=relaxed/simple;
	bh=G9kQZVQBtt+RsD9ItrMsGJ3XXGNJo6t6g0PxG20qb1I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rCUgqQJV/s69vapiKpeERppukljzNxGsGxxMnkH6LoEa3Qx3CQTRtT/KD/b/bT2FMwF59lO65qYI3rz2mUgpWmpGPtS5y9TeB+Y1s5rP3bM9JayRgjJoxx9JYt6I/8kv0MhRGf+/bQ+SFjxNRO5KQ+JxW/LHB8LJR7lKqYLTJjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ll8QTfYk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ll8QTfYk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=XRZxkRqsf7mtFnenUXbwbTX3ORyj+dl5pWe7RLTsNck=; b=Ll8QTfYk2zz3e5BCmrrN9jI1uf
	7Ho3vr/XB08zfhvDg7afq/+P3TFC0niBsAKY7l6DUoCMnOfxkTjiMgdPbmx16CeB0KMjaEqynWeoA
	s5yUrl3Ylv6qdikh3L4fnCKcSDY+fJJF0sSkCOC45cfYhkv3Tpk7FtHp3XpyhjOxytlSNlY+bfsxx
	IrNUZCUS5u9qbkiL037s/URZNd5e6yQmgPBICC63jqiV4uIhAYIuxX9TfrWkJNYU6IXu04BYvKMF6
	jELHDM/FVmxESSO7oGwRjmlvTSg9hNr/eP31BbTXpMndeAhdALTvVbRYiR4BGOaJC6XUEMNHxcCEG
	UAsvHylw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-00000004GQA-2Z6r;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 0DCAE3085FC; Wed,  5 Feb 2025 11:25:28 +0100 (CET)
Message-ID: <20250205102450.781721189@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:43 +0100
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
Subject: [PATCH v2 23/24] perf: Lift event->mmap_mutex in perf_mmap()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

This puts 'all' of perf_mmap() under single event->mmap_mutex.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6643,7 +6643,7 @@ static int perf_mmap(struct file *file,
 	unsigned long vma_size;
 	unsigned long nr_pages;
 	long user_extra = 0, extra = 0;
-	int ret = 0, flags = 0;
+	int ret, flags = 0;
 
 	/*
 	 * Don't allow mmap() of inherited per-task counters. This would
@@ -6671,6 +6671,9 @@ static int perf_mmap(struct file *file,
 
 	user_extra = nr_pages;
 
+	mutex_lock(&event->mmap_mutex);
+	ret = -EINVAL;
+
 	if (vma->vm_pgoff == 0) {
 		nr_pages -= 1;
 
@@ -6679,16 +6682,13 @@ static int perf_mmap(struct file *file,
 		 * can do bitmasks instead of modulo.
 		 */
 		if (nr_pages != 0 && !is_power_of_2(nr_pages))
-			return -EINVAL;
+			goto unlock;
 
 		WARN_ON_ONCE(event->ctx->parent_ctx);
-		mutex_lock(&event->mmap_mutex);
 
 		if (event->rb) {
-			if (data_page_nr(event->rb) != nr_pages) {
-				ret = -EINVAL;
+			if (data_page_nr(event->rb) != nr_pages)
 				goto unlock;
-			}
 
 			if (atomic_inc_not_zero(&event->rb->mmap_count)) {
 				/*
@@ -6716,12 +6716,6 @@ static int perf_mmap(struct file *file,
 		 */
 		u64 aux_offset, aux_size;
 
-		if (!event->rb)
-			return -EINVAL;
-
-		mutex_lock(&event->mmap_mutex);
-		ret = -EINVAL;
-
 		rb = event->rb;
 		if (!rb)
 			goto aux_unlock;
@@ -6832,6 +6826,8 @@ static int perf_mmap(struct file *file,
 			rb->aux_mmap_locked = extra;
 	}
 
+	ret = 0;
+
 unlock:
 	if (!ret) {
 		atomic_long_add(user_extra, &user->locked_vm);


