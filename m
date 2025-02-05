Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70422B590
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751138; cv=none; b=JReEFF6wqBguyhES+bIvwbP6DQ229TWWFEJIUMdJnWb7GmQauUMAB1b+7K+2FfYsS0QWBljgPDHm3PorZNB4JTQcF0TG8Ls74Du8kK4rNHMlpKYWPknlyXUuJ2wkwfVCnE/mGiPdoMozh2ypwsYiLmdCkIZ3T+GuHuzht0oxTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751138; c=relaxed/simple;
	bh=rrbiOmz2jF0M7L1i0onuQaUMQEHoe8XCSP0wQvcLi6c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=CvrI5TgTENUJ97pXYRE8qiwmwQMtPTK7KGSmJmHCxKoOek7OjPv3bp8vA83bbCbrgdvnRn4oHUsUEuZsjAMPBFW/1mGIV5+/ZcFGHLJ6mO4dQNThqe7t6k4lktdmByQccwJK/KcmF50aW64t6XkyZfLGHcxoEG7gpl0f4eCTycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oT7ehJRI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oT7ehJRI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=pfiwW0dLUfHVNchZgL9hTztc6fyT30FB5T+P5wRGV0k=; b=oT7ehJRIlW8qvL/xMPkpDVw95M
	FTlpyl6ZoQw4+7Zg6xRrwR/5V2MlPRAmlDcaxLGR0KhKj3VqAI/CY2T31v+oEFG6Nm/SgY0niEVfU
	FmWzcB9BJ/sEMC8e41exIEbWfKp86AHVzZMD02LefN0ooy6mTlNVmSFIEHXMJyOWDXn77Z5lx1Ba0
	XwM/2XIo4W+ZGCa3fRjz+3L16juCfNOBxwuPniKbMnHw0c5tIEzmuCfbwKj5yOc/szwe0VL+2ETfX
	GXfP3WXpq0L5KziDJsqYYOOaQVdzGj7krEAPkOFOTe3MFS3zNWGbBetn6GBQ9c4P1BhZrEmZJuvNN
	+hQVvEvA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-0000000GbmQ-2Xiy;
	Wed, 05 Feb 2025 10:25:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 066ED3085D7; Wed,  5 Feb 2025 11:25:28 +0100 (CET)
Message-ID: <20250205102450.566454649@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:41 +0100
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
Subject: [PATCH v2 21/24] perf: Further simplify perf_mmap()
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
 kernel/events/core.c |   21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6661,9 +6661,18 @@ static int perf_mmap(struct file *file,
 		return ret;
 
 	vma_size = vma->vm_end - vma->vm_start;
+	nr_pages = vma_size / PAGE_SIZE;
+
+	if (nr_pages > INT_MAX)
+		return -ENOMEM;
+
+	if (vma_size != PAGE_SIZE * nr_pages)
+		return -EINVAL;
+
+	user_extra = nr_pages;
 
 	if (vma->vm_pgoff == 0) {
-		nr_pages = (vma_size / PAGE_SIZE) - 1;
+		nr_pages -= 1;
 
 		/*
 		 * If we have rb pages ensure they're a power-of-two number, so we
@@ -6672,9 +6681,6 @@ static int perf_mmap(struct file *file,
 		if (nr_pages != 0 && !is_power_of_2(nr_pages))
 			return -EINVAL;
 
-		if (vma_size != PAGE_SIZE * (1 + nr_pages))
-			return -EINVAL;
-
 		WARN_ON_ONCE(event->ctx->parent_ctx);
 again:
 		mutex_lock(&event->mmap_mutex);
@@ -6697,8 +6703,6 @@ static int perf_mmap(struct file *file,
 			rb = event->rb;
 			goto unlock;
 		}
-
-		user_extra = nr_pages + 1;
 	} else {
 		/*
 		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
@@ -6710,10 +6714,6 @@ static int perf_mmap(struct file *file,
 		if (!event->rb)
 			return -EINVAL;
 
-		nr_pages = vma_size / PAGE_SIZE;
-		if (nr_pages > INT_MAX)
-			return -ENOMEM;
-
 		mutex_lock(&event->mmap_mutex);
 		ret = -EINVAL;
 
@@ -6757,7 +6757,6 @@ static int perf_mmap(struct file *file,
 		}
 
 		atomic_set(&rb->aux_mmap_count, 1);
-		user_extra = nr_pages;
 	}
 
 		/* We need the rb to map pages. */


