Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1422D4C5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011377; cv=none; b=Tw1qwj29yeeTTVJFGTMZqW+QFQ77lPEb46MzllKFC3oKpRMx6VHPnEWhnahIh/mgLAwmwxercUfiBabbghG24nGZBuuA9qrLv6JkwMDjAfjdCVebx5K6Tm9XSJErmt/cUZQO90frrPsbFlyGRB7zLEqSrnb+hXDOcGnA4tYv1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011377; c=relaxed/simple;
	bh=wQGkKBH4zeLsS/bI15KpYvK8K6dQR9NIyzsnMjNLcGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6jkaJo7tDe2aDVnKoeyveulbShfOQ6F8jK+P6T+zZzGFDyo6YQqeEWG2rzEI4sR+yO6935sl4X6SNBWXGUwz0Q7DpuhAb+JWF4RJN7fSOWa8ayLcpcW7LwfwaBO41/tQKI76yDw2FQ7P/KQWe4ZhqfA6FiU4b5MpOJXeFSfbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Str6SwuN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Str6SwuN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GQJ6cEtAWkqqCEmraKtILCYkz5+4I5qUBIAFj/BaO74=; b=Str6SwuNHBUyYXNDc8wSPR6mOZ
	hYFxnVZwhbWKuKG5usLV+M0NwZ5OHSS/uF4DTtv5mQePo+vn7a6RTd3Zz8Lm4ylnVYpPn4TUYr7bg
	Qc6gBmFZMyCI2byk/NvOVuPDFzK2nYBuy37D4uUfG7x/ZI+MvZKBE+THwwSkX1OBBXcd5f8LDxH88
	fIVkF3W7faDGoOP/d/jqqt0f0bo929vgJwNbPzKiPKf50sGzoA6G7RSUDxTiFZ0V6TnlH15eHLJ4i
	xlcaztfbILN7clO8HSFx6Q9ez5xxCveOje6vArE93lxlApVPJlJGscoABFWLJ3gshxJl53bZA0RHk
	iA9tGyZw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV42r-0000000DYu7-1a3d;
	Fri, 27 Jun 2025 08:02:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D32DB300222; Fri, 27 Jun 2025 10:02:48 +0200 (CEST)
Date: Fri, 27 Jun 2025 10:02:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
Message-ID: <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-3-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626134158.3385080-3-glider@google.com>

On Thu, Jun 26, 2025 at 03:41:49PM +0200, Alexander Potapenko wrote:
> kcov used to obey clang-format style, but somehow diverged over time.
> This patch applies clang-format to kernel/kcov.c and
> include/linux/kcov.h, no functional change.

I'm not sure I agree this is in fact a good thing. Very questionable
style choices made.

I had to kill clang-format hard in my nvim-lsp-clangd setup, because
clang-format is such a piece of shit.


> -static inline void kcov_task_init(struct task_struct *t) {}
> -static inline void kcov_task_exit(struct task_struct *t) {}
> -static inline void kcov_prepare_switch(struct task_struct *t) {}
> -static inline void kcov_finish_switch(struct task_struct *t) {}
> -static inline void kcov_remote_start(u64 handle) {}
> -static inline void kcov_remote_stop(void) {}
> +static inline void kcov_task_init(struct task_struct *t)
> +{
> +}
> +static inline void kcov_task_exit(struct task_struct *t)
> +{
> +}
> +static inline void kcov_prepare_switch(struct task_struct *t)
> +{
> +}
> +static inline void kcov_finish_switch(struct task_struct *t)
> +{
> +}
> +static inline void kcov_remote_start(u64 handle)
> +{
> +}
> +static inline void kcov_remote_stop(void)
> +{
> +}

This is not an improvement.

> @@ -52,36 +53,36 @@ struct kcov {
>  	 *  - task with enabled coverage (we can't unwire it from another task)
>  	 *  - each code section for remote coverage collection
>  	 */
> -	refcount_t		refcount;
> +	refcount_t refcount;
>  	/* The lock protects mode, size, area and t. */
> -	spinlock_t		lock;
> -	enum kcov_mode		mode;
> +	spinlock_t lock;
> +	enum kcov_mode mode;
>  	/* Size of arena (in long's). */
> -	unsigned int		size;
> +	unsigned int size;
>  	/* Coverage buffer shared with user space. */
> -	void			*area;
> +	void *area;
>  	/* Task for which we collect coverage, or NULL. */
> -	struct task_struct	*t;
> +	struct task_struct *t;
>  	/* Collecting coverage from remote (background) threads. */
> -	bool			remote;
> +	bool remote;
>  	/* Size of remote area (in long's). */
> -	unsigned int		remote_size;
> +	unsigned int remote_size;
>  	/*
>  	 * Sequence is incremented each time kcov is reenabled, used by
>  	 * kcov_remote_stop(), see the comment there.
>  	 */
> -	int			sequence;
> +	int sequence;
>  };
>  
>  struct kcov_remote_area {
> -	struct list_head	list;
> -	unsigned int		size;
> +	struct list_head list;
> +	unsigned int size;
>  };
>  
>  struct kcov_remote {
> -	u64			handle;
> -	struct kcov		*kcov;
> -	struct hlist_node	hnode;
> +	u64 handle;
> +	struct kcov *kcov;
> +	struct hlist_node hnode;
>  };
>  
>  static DEFINE_SPINLOCK(kcov_remote_lock);
> @@ -89,14 +90,14 @@ static DEFINE_HASHTABLE(kcov_remote_map, 4);
>  static struct list_head kcov_remote_areas = LIST_HEAD_INIT(kcov_remote_areas);
>  
>  struct kcov_percpu_data {
> -	void			*irq_area;
> -	local_lock_t		lock;
> -
> -	unsigned int		saved_mode;
> -	unsigned int		saved_size;
> -	void			*saved_area;
> -	struct kcov		*saved_kcov;
> -	int			saved_sequence;
> +	void *irq_area;
> +	local_lock_t lock;
> +
> +	unsigned int saved_mode;
> +	unsigned int saved_size;
> +	void *saved_area;
> +	struct kcov *saved_kcov;
> +	int saved_sequence;
>  };
>  
>  static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) = {

This is just plain wrong. Making something that was readable into a
trainwreck.


Please either teach clang-format sensible style choices, or refrain from
using it.
