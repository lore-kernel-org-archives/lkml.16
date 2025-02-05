Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498222B582
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751138; cv=none; b=Zsqabap6guORZY1Jm6TFAege6FIgT8nllfWc/Ldfk0k70+3cHPCa+d3+PybEkh15dFfq6oG66NogVBH8DfnNwX5yYguBzS5zAkVkJl+aLBnoPI+pigWgj/qtp+mpxkzHOxHSf6t1ONN3Oc3VD5AeD4KzNk3q90+ZxO+oMIXXOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751138; c=relaxed/simple;
	bh=G/8gpuRBjgFB9ukLyeqX5GcoznpbBpChcH0nQSZO2mU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=SlmrdhCpbUyGiuyglOWcF96p9arNibVmiPIgyIK2lJC1bBB88AwTfr6msjQeZz/inVGIjz0O8hTXYcSq1wVqbUiyGsM9Un5g1pCddBwtdY5sD+F2Nn8vBEtd8HXtLS9hidOp7XSgBiga3YIDX7xHR3BQFEQUhuL7ysGi8sKwIzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yajd7LFB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yajd7LFB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=iNUen6OBM+L20CA6MxshEiynG2hCrEafEcpdg8s7hL0=; b=Yajd7LFBPuJF3PQ+otJlvWBaVc
	taWsSL9qpjr6x7RI5VpB0mFGQQ4Y/sJqSsgz2av6gQhnnwhekd8pxFpFwe8/L75+VhICxDGCSPQbF
	vN+8UrWTLc2IHjZtEFGuZf4fV5u7P1WzzuvXM9/dBH83UgJkHhBC/geDT1gLkvmoqwyrlF36dIGD6
	12k9Vd6LfhP80TzW2eB9Z7zwpZ2i+6aFxg6avzaLP77gV7QPsBUXYpjb56s5N43tc6LhInykX4PWI
	otbjbqnY+IuaV5JbhtOQ6UbQWkX5HwQ/oAMFPFsklhqQIvdnQx5o4Ad3aCKsF2aPPTXL2uzB5evGa
	W6Cv6eUQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-0000000GbmP-2JIz;
	Wed, 05 Feb 2025 10:25:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id F403530813A; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102450.350989371@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:39 +0100
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
Subject: [PATCH v2 19/24] perf: Simplify perf_mmap() control flow
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

  if (c) {
    X1;
  } else {
    Y;
    goto l;
  }

  X2;
l:

into:

  if (c) {
    X1;
    X2;
  } else {
    Y;
  }

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   73 ++++++++++++++++++++++++---------------------------
 1 file changed, 35 insertions(+), 38 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6664,6 +6664,41 @@ static int perf_mmap(struct file *file,
 
 	if (vma->vm_pgoff == 0) {
 		nr_pages = (vma_size / PAGE_SIZE) - 1;
+
+		/*
+		 * If we have rb pages ensure they're a power-of-two number, so we
+		 * can do bitmasks instead of modulo.
+		 */
+		if (nr_pages != 0 && !is_power_of_2(nr_pages))
+			return -EINVAL;
+
+		if (vma_size != PAGE_SIZE * (1 + nr_pages))
+			return -EINVAL;
+
+		WARN_ON_ONCE(event->ctx->parent_ctx);
+again:
+		mutex_lock(&event->mmap_mutex);
+		if (event->rb) {
+			if (data_page_nr(event->rb) != nr_pages) {
+				ret = -EINVAL;
+				goto unlock;
+			}
+
+			if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
+				/*
+				 * Raced against perf_mmap_close(); remove the
+				 * event and try again.
+				 */
+				ring_buffer_attach(event, NULL);
+				mutex_unlock(&event->mmap_mutex);
+				goto again;
+			}
+
+			rb = event->rb;
+			goto unlock;
+		}
+
+		user_extra = nr_pages + 1;
 	} else {
 		/*
 		 * AUX area mapping: if rb->aux_nr_pages != 0, it's already
@@ -6723,47 +6758,9 @@ static int perf_mmap(struct file *file,
 
 		atomic_set(&rb->aux_mmap_count, 1);
 		user_extra = nr_pages;
-
-		goto accounting;
 	}
 
-	/*
-	 * If we have rb pages ensure they're a power-of-two number, so we
-	 * can do bitmasks instead of modulo.
-	 */
-	if (nr_pages != 0 && !is_power_of_2(nr_pages))
-		return -EINVAL;
-
-	if (vma_size != PAGE_SIZE * (1 + nr_pages))
-		return -EINVAL;
-
-	WARN_ON_ONCE(event->ctx->parent_ctx);
-again:
-	mutex_lock(&event->mmap_mutex);
-	if (event->rb) {
-		if (data_page_nr(event->rb) != nr_pages) {
-			ret = -EINVAL;
-			goto unlock;
-		}
-
-		if (!atomic_inc_not_zero(&event->rb->mmap_count)) {
-			/*
-			 * Raced against perf_mmap_close(); remove the
-			 * event and try again.
-			 */
-			ring_buffer_attach(event, NULL);
-			mutex_unlock(&event->mmap_mutex);
-			goto again;
-		}
-
 		/* We need the rb to map pages. */
-		rb = event->rb;
-		goto unlock;
-	}
-
-	user_extra = nr_pages + 1;
-
-accounting:
 	user_lock_limit = sysctl_perf_event_mlock >> (PAGE_SHIFT - 10);
 
 	/*


