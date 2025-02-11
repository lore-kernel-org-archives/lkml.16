Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE201C5D40
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288786; cv=none; b=E1wdNigi4waQvQvtPpQVu1v1Opku3W95UxR6kImesCAgtLb4sHnLyCjEn7zpl525juRUgbfuNVHvhlaaahH8yj44ABLoB6zmbFHxnamfBLTrqOJWp+GSBV0bMhTvA3L3r7S4NGdhph6wVf/SUO7nXJzf/OHOZKte+SjGkc/4zFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288786; c=relaxed/simple;
	bh=U4I6LlS4qaYZ6mGVP6bK/atgZtNz4pME1UApxIVOd8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8r/vp37OVZiRUGocl2meF8pAQzNvnf1btHDz5/5KLRRA1T6WLcRx/SAQD5Z3B61AAyarjWmH6/JiT4aPUoDbXdldTo92jUvztoKSYjvaybgZ8zZ/PT//s35BurHF305LQx2i7+oO18C8kjQO1qisW2pPMaRz7OMRlf+STstCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=by3CyW1Q; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="by3CyW1Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y6iE82yrtSYgOVBWzoisjUgHqg+T/A17sCqEUE6bpAY=; b=by3CyW1QoBDCfReN0gQBpw+glJ
	cRm4t6WyQsREAdJiDXX87LOYs71ubC1RmpLuyhOveiD2bxdQtidy/Jyhuz4ebee+NFW+1wyzWpspx
	kuAWNKnRVRM0HcvRI2Xl1+7Q9UNYR8lqZap+Sq+BSaTp2FMcFhr5KPpzgNMXSLb2dBxsh95Tc6LHp
	bJLi+0guxLFumHhNLkXEdkGtlNKClJYmozErmXUnOrxpZEPXQThxN3FQH1sOnvfo5XCztsLQFWwRo
	XyJNUK5CodSG/KdV+FKe/GTny7fGx7gI2r0mdUs3oEh7A6Ez0xBh0qWeeUcG3etaCDERN5ozOyk4S
	cip9285A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSo-00000000c9v-0Qr1;
	Tue, 11 Feb 2025 15:46:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2EB833004AF; Tue, 11 Feb 2025 16:46:17 +0100 (CET)
Date: Tue, 11 Feb 2025 16:46:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: "mingo@kernel.org" <mingo@kernel.org>,
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"acme@kernel.org" <acme@kernel.org>,
	"namhyung@kernel.org" <namhyung@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"irogers@google.com" <irogers@google.com>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>
Subject: Re: [PATCH v2 24/24] perf: Make perf_pmu_unregister() useable
Message-ID: <20250211154617.GI29593@noisy.programming.kicks-ass.net>
References: <20250205102120.531585416@infradead.org>
 <20250205102450.888979808@infradead.org>
 <72078a3d-4b19-4aa9-bed7-f95362b6265a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72078a3d-4b19-4aa9-bed7-f95362b6265a@amd.com>

On Mon, Feb 10, 2025 at 12:09:18PM +0530, Ravi Bangoria wrote:
> Hi Peter,
> 
> > @@ -1737,7 +1742,7 @@ static inline bool needs_branch_stack(st
> >  
> >  static inline bool has_aux(struct perf_event *event)
> >  {
> > -	return event->pmu->setup_aux;
> > +	return event->pmu && event->pmu->setup_aux;
> >  }
> 
> this ...

Bah, I'll try and trace that.

> > @@ -6412,7 +6444,7 @@ static void perf_mmap_open(struct vm_are
> >  	if (vma->vm_pgoff)
> >  		atomic_inc(&event->rb->aux_mmap_count);
> >  
> > -	if (event->pmu->event_mapped)
> > +	if (event->pmu && event->pmu->event_mapped)
> >  		event->pmu->event_mapped(event, vma->vm_mm);
> >  }
> >  
> > @@ -6435,7 +6467,8 @@ static void perf_mmap_close(struct vm_ar
> >  	unsigned long size = perf_data_size(rb);
> >  	bool detach_rest = false;
> >  
> > -	if (event->pmu->event_unmapped)
> > +	/* FIXIES vs perf_pmu_unregister() */
> > +	if (event->pmu && event->pmu->event_unmapped)
> >  		event->pmu->event_unmapped(event, vma->vm_mm);
> 
> these two ...
> 
> > @@ -6837,7 +6880,7 @@ static int perf_mmap(struct file *file,
> >  	if (!ret)
> >  		ret = map_range(rb, vma);
> >  
> > -	if (!ret && event->pmu->event_mapped)
> > +	if (!ret && event->pmu && event->pmu->event_mapped)
> >  		event->pmu->event_mapped(event, vma->vm_mm);
> 
> ... and this one.

These are relatively simple to fix, something like so. This relies on
the fact that if there's mapped functions the whole unregister thing
won't happen.

---
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6432,9 +6432,22 @@ void ring_buffer_put(struct perf_buffer
 	call_rcu(&rb->rcu_head, rb_free_rcu);
 }
 
+typedef void (*mapped_f)(struct perf_event *event, struct mm_struct *mm);
+
+#define get_mapped(event, func)			\
+({	struct pmu *pmu;			\
+	mapped_f f = NULL;			\
+	guard(rcu)();				\
+	pmu = READ_ONCE(event->pmu);		\
+	if (pmu)				\
+		f = pmu->func;			\
+	f;					\
+})
+
 static void perf_mmap_open(struct vm_area_struct *vma)
 {
 	struct perf_event *event = vma->vm_file->private_data;
+	mapped_f mapped = get_mapped(event, event_mapped);
 
 	atomic_inc(&event->mmap_count);
 	atomic_inc(&event->rb->mmap_count);
@@ -6442,8 +6455,8 @@ static void perf_mmap_open(struct vm_are
 	if (vma->vm_pgoff)
 		atomic_inc(&event->rb->aux_mmap_count);
 
-	if (event->pmu && event->pmu->event_mapped)
-		event->pmu->event_mapped(event, vma->vm_mm);
+	if (mapped)
+		mapped(event, vma->vm_mm);
 }
 
 static void perf_pmu_output_stop(struct perf_event *event);
@@ -6459,6 +6472,7 @@ static void perf_pmu_output_stop(struct
 static void perf_mmap_close(struct vm_area_struct *vma)
 {
 	struct perf_event *event = vma->vm_file->private_data;
+	mapped_f unmapped = get_mapped(event, event_unmapped);
 	struct perf_buffer *rb = ring_buffer_get(event);
 	struct user_struct *mmap_user = rb->mmap_user;
 	int mmap_locked = rb->mmap_locked;
@@ -6466,8 +6480,8 @@ static void perf_mmap_close(struct vm_ar
 	bool detach_rest = false;
 
 	/* FIXIES vs perf_pmu_unregister() */
-	if (event->pmu && event->pmu->event_unmapped)
-		event->pmu->event_unmapped(event, vma->vm_mm);
+	if (unmapped)
+		unmapped(event, vma->vm_mm);
 
 	/*
 	 * The AUX buffer is strictly a sub-buffer, serialize using aux_mutex
@@ -6660,6 +6674,7 @@ static int perf_mmap(struct file *file,
 	unsigned long nr_pages;
 	long user_extra = 0, extra = 0;
 	int ret, flags = 0;
+	mapped_f mapped;
 
 	/*
 	 * Don't allow mmap() of inherited per-task counters. This would
@@ -6878,8 +6893,9 @@ static int perf_mmap(struct file *file,
 	if (!ret)
 		ret = map_range(rb, vma);
 
-	if (!ret && event->pmu && event->pmu->event_mapped)
-		event->pmu->event_mapped(event, vma->vm_mm);
+	mapped = get_mapped(event, event_mapped);
+	if (mapped)
+		mapped(event, vma->vm_mm);
 
 	return ret;
 }
