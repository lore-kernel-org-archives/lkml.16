Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90F22AE65
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751137; cv=none; b=e9NBS1RRYBYD3L7y++3rJACJMH/0Y8i75bii0qDgckxG7IkzWzbRLZz+88PmfLS8coKcs2rm17VhHACXfBe4WB9Dt3RqxuZEMEnDbkGx62N5EBhOfN/Muv/H2LSJCtLUTbiIOcdf8tRI8fUJjCkRO5mAqglBvD7XaeFSdzA/xQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751137; c=relaxed/simple;
	bh=nl/E7IbifIHY4saIGLrcUyqLZKw5Y4dVMLE4DYop58Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lVugHw5EslAkKuPeszwceVGWSlLDP7LvNGh1EuDUDBVp/5Fc2yKInZQHbFD6SUrqA3bPFAE4sFb/oGR6tTphfEabhTzPTNU5AYANYzVeMOBQySK2adK/5KqlEbzqsD4zCjbJsg5gXZtXP2MCb77tYTbVKEHy278K3Bh1PktbnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pza+EoGK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pza+EoGK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=zvAjMRogCzZXBg0SQLthP0VbH9NxSHSRwZYyo2uheI4=; b=pza+EoGKR8cpT/KN8sT5/+L4pD
	6Zp2YqczUFeL6npG5/mfBsDhyGZGdPholkSKZpc0NV6diavYr8G6KgkT6KrVrLZifPQBKqSCngLGk
	8MLiT3hqDty7zA5MmwPT3w/3UBdZNY5vgkJ1bPF9PR3YtGHUTBrxvlVCI4aVlnOjF4zlpjxcSnjV0
	7rGwqkg0kx1CqBQKqBX9bgQPWYvMa6lYlLabQZ/h5tnOfM3Tmoth9COyPByTSGfM3W5JBOSm4CBRD
	FR4cO6D7x7MubuzV+4MWbVlLDFc4/P5bxXuHNQsEQww3sXUDnVEpwdwl67/G84FAUiiNMFaJ7nNvj
	RNfWi5hQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-00000004GQ9-2U9P;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 0A3863085E6; Wed,  5 Feb 2025 11:25:28 +0100 (CET)
Message-ID: <20250205102450.672685519@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:42 +0100
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
Subject: [PATCH v2 22/24] perf: Remove retry loop from perf_mmap()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

AFAICT there is no actual benefit from the mutex drop on re-try. The
'worst' case scenario is that we instantly re-gain the mutex without
perf_mmap_close() getting it. So might as well make that the normal
case.

Reflow the code to make the ring buffer detach case naturally flow
into the no ring buffer case.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6667,27 +6667,32 @@ static int perf_mmap(struct file *file,
 			return -EINVAL;
 
 		WARN_ON_ONCE(event->ctx->parent_ctx);
-again:
 		mutex_lock(&event->mmap_mutex);
+
 		if (event->rb) {
 			if (data_page_nr(event->rb) != nr_pages) {
 				ret = -EINVAL;
 				goto unlock;
 			}
 
-			if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
+			if (atomic_inc_not_zero(&event->rb->mmap_count)) {
 				/*
-				 * Raced against perf_mmap_close(); remove the
-				 * event and try again.
+				 * Success -- managed to mmap() the same buffer
+				 * multiple times.
 				 */
-				ring_buffer_attach(event, NULL);
-				mutex_unlock(&event->mmap_mutex);
-				goto again;
+				rb = event->rb;
+				ret = 0;
+				goto unlock;
 			}
 
-			rb = event->rb;
-			goto unlock;
+			/*
+			 * Raced against perf_mmap_close()'s
+			 * atomic_dec_and_mutex_lock() remove the
+			 * event and continue as if !event->rb
+			 */
+			ring_buffer_attach(event, NULL);
 		}
+
 	} else {
 		/*
 		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already


