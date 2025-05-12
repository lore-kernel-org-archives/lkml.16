Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969328D857
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055090; cv=none; b=iPARBeSE67Vi294AdhYnVH3ggg7S8S3/RcyynYfoWBNzujxIFJ1zu0tYIiNfvrg7/gXFhwPJsXaTbULlJISxpzTKVMTSYv2esS8Os8EoYaHuSs7l59OXHvWFClCsboEzleofbYQ6yWloe2UCgWb9uJUBmK5zfKTqNUjWMYqdd7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055090; c=relaxed/simple;
	bh=bJs/SClUq0oF2f8MntTu9NTBz4WjVI3mEcHzuwXZUfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i07NITH3zuVJsJ7JakhnDHqoBZMeqpaNJpbkfliYybpOSfi+2z6J301dWiLy6rEWim4kd9SxL1MncYrZORxS+8WU/z3WAyT6AJzYNxN1ASRWCn87K7taIZnQE4k65o8Aqu8XLjj5GC6JZoP+w9lVWuAeqDISST9GqyDej6Px5Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DzjlT/cW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DzjlT/cW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=axlMwKNrI+h+jhmsnPzVduNtjasgTc+O67ZEnNEZj/A=; b=DzjlT/cWfO1qdw2XPoyo9papkd
	6ikl3AUpS1Zl85fazhLMIvaJsCBHQG3JY6vbOOvqQ4yh9BnV7Bz1OHCUpNZmGeugEsdXMlLQ5RcU5
	Pl+7DgBPxicGNpOIleJepmiIZYMg+YutN+NV4w0uFeXvqR3JFS7cybglvKCdvMsOxLHXPUV1P3kX7
	49c2WLXxqEacvyE4LpQCRYUliVPmiJN+bAH7nX6lqCa59jtlkFKbcGf4JmYNSopRpUTrI4at1ur6J
	UVQekmXcwbcMmYhaSI1o5mZuh2uq0+KiIl9rd5Je2Z//elBuFND3PNn+IPqnvplMZSi+MqIMJ+7vp
	/pMBl5bQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uESpe-0000000Gl4x-0Ynq;
	Mon, 12 May 2025 13:04:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 87C57300717; Mon, 12 May 2025 15:04:33 +0200 (CEST)
Date: Mon, 12 May 2025 15:04:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Message-ID: <20250512130433.GA25763@noisy.programming.kicks-ass.net>
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>

On Thu, May 08, 2025 at 04:28:25PM +0100, Lorenzo Stoakes wrote:
> Currently kernel/fork.c both contains absolutely key logic relating to a
> number of kernel subsystems and also has absolutely no assignment in
> MAINTAINERS.
> 
> Correct this by placing this file in relevant sections - mm core, exec,
> scheduler and pidfd so people know who to contact when making changes here.
> 
> scripts/get_maintainers.pl can perfectly well handle a file being in
> multiple sections, so this functions correctly.
> 
> Intent is that we keep putting changes to kernel/fork.c through Andrew's
> tree.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc45b0ba843..55332d5bc499 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
>  F:	include/uapi/linux/auxvec.h
>  F:	include/uapi/linux/binfmts.h
>  F:	include/uapi/linux/elf.h
> +F:	kernel/fork.c
>  F:	mm/vma_exec.c
>  F:	tools/testing/selftests/exec/
>  N:	asm/elf.h
> @@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
>  F:	include/linux/mm_*.h
>  F:	include/linux/mmdebug.h
>  F:	include/linux/pagewalk.h
> +F:	kernel/fork.c
>  F:	mm/Kconfig
>  F:	mm/debug.c
>  F:	mm/init-mm.c
> @@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
>  F:	include/linux/sched.h
>  F:	include/linux/wait.h
>  F:	include/uapi/linux/sched.h
> +F:	kernel/fork.c
>  F:	kernel/sched/
>  
>  SCHEDULER - SCHED_EXT
> -- 
> 2.49.0
> 
