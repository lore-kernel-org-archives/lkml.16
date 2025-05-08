Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682688F49
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677272; cv=none; b=k1gNe/Svy3N4xw+hlLUNnNhrbY3s0RbPQchcYjVw7jqV+Tw/tFGO5ZiLHaYWi+TFewWfJxB3TJm4m4X2lMEcYhmztdoyMAN6jvhlfw+mplKOMdNTkssWNMj/BzKjceuVCpQEG1vr6N8qTpgx0C9xNAItTOSDIgZhH5hGqtYuVKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677272; c=relaxed/simple;
	bh=tsWFnDkKNpVcAkLM+e8w4zP5dZV809UWBcPphcMmdhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT+AO81pmN3pkYTGoOYSBnBUxxNsTo1elwPCFoDKjNOBfXVxvU69uu/7wDkB0Ib0OQXkRDqwxf5C77Yx8vGvMAgRZKZgPsmtTU0GmgKr+6GKtAjR43/CmoLELDXLZ5onkvR3LtpTxQjV4pcIa/0hMmJ+WBVsWDUM3/AcqL1kU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PYOO4kQv; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PYOO4kQv"
Date: Thu, 8 May 2025 00:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746677266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSuAPGyPgBolMXcBkfJmoFVJF9/cKlrpLmw4RvYPXKA=;
	b=PYOO4kQvHh2l4L80LkOs+WRbXpaJnWavEBp5dg4HJWYXgShE+Xo64PxLmuOtzPzQFQVBae
	g0Mt/R2QAnIVpWeiqchTaCxCeVZ+rcyCwR1qcS2X6iC3V9j9z8czqEWEBIv+Riz3+1ZkoL
	ZPgtzxNGp9mxG97XqaFz0t82J6vZ2QM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
Message-ID: <52tsrapmkfywv4kkdpravtfmxkhxchyua4wttpugihld4iws3r@atfgtbd5wwhx>
References: <20250507175500.204569-1-00107082@163.com>
 <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
 <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
X-Migadu-Flow: FLOW_OUT

On Thu, May 08, 2025 at 11:35:11AM +0800, David Wang wrote:
> 
> 
> At 2025-05-08 11:31:12, "Kent Overstreet" <kent.overstreet@linux.dev> wrote:
> >On Thu, May 08, 2025 at 11:06:35AM +0800, David Wang wrote:
> >> Thanks for the feedback~
> >> I agree that memory allocation normally dose not take major part of a profiling report,
> >> even profiling a fio test, kmem_cache_alloc only takes ~1% perf samples.
> >> 
> >> I don't know why I have this "the less memory allocation, the better' mindset,  maybe
> >> I was worrying about memory fragmentation, or something else I  learned on some "textbook",
> >> To be honest, I  have never had real experience with those worries....
> >
> >It's a common bias. "Memory allocations" take up a lot of conceptual
> >space in our heads, and generally for good reason - i.e. handling memory
> >allocation errors is often a major concern, and you do always want to be
> >aware of memory layout.
> >
> >But this can turn into an aversion that's entirely disproportionate -
> >e.g. using linked linked lists and fixed size arrays in ways that are
> >entirely inappropriate, instead of vectors and other better data
> >structures; good data structures always require allocations.
> >
> >Profile, profile, profile, and remember your basic CS (big O notation) -
> >90% of the time, simple code with good big O running time is all you
> >need.
> 
> copy that~!

Another thing to note is that memory layout - avoiding pointer chasing -
is hugely important, but it'll almost never show up as allocator calls.

To give you some examples, mempools and biosets used to be separately
allocated. This was mainly to make error paths in outer object
constructors/destructors easier and safer: instead of keeping track of
what's initialized and what's not, if you've got a pointer to a
mempool/bioset you call *_free() on it.

(People hadn't yet clued that you can just kzalloc() the entire outer
object, and then if the inner object is zeroed it wasn't initialized).

But that means you're adding a pointer chase to every mempool_alloc()
call, and since bioset itself has mempools allocating bios had _two_
unnecessary pointer derefs. That's death for performance when you're
running cache cold, but since everyone benchmarks cache-hot...

(I was the one who fixed that).

Another big one was generic_file_buffered_read(). Main buffered read
path, everyone wants it to be as fast as possible.

But the core is (was) a loop that walks the pagecache radix tree to get
the page, then copies 4k of data out to userspace (there goes l1), then
repeats all that pointer chasing for the next 4k. Pre large folios, it
was horrific.

Solution - vectorize it. Look up all the pages we're copying from all at
once, stuff them in a (dynamically allocated! for each read!) vector,
and then do the copying out to userspace all at once. Massive
performance gain.

Of course, to do that I first had to clean up a tangled 250+ line
monstrosity of half baked, poorly thought out "optimizations" (the worst
spaghetti of gotos you'd ever seen) and turn it into something
manageable...

So - keep things simple, don't overthink the little stuff, so you can
spot and tackle the big algorithmic wins :)
