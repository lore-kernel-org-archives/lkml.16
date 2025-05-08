Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F042045B1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711245; cv=none; b=pdZqx0LClsEWIUUn40/Zk7VRsEYyB5zkW/pLQKogLFvJA6MFoDoIQ+0BamVBZiurdOcpbF2qPqr7+E6i4KELLtNyDYQlSehaask/IeyvbXgUlveZrcbU96OUVwAGspd5yD969BC3X2slrE6b1mYU3Mj1ft+gTFcYAgKmQ8RbaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711245; c=relaxed/simple;
	bh=KYAsb/sJQM1IKhzbF3zbN4Dgcaxk4EbBE1cjrpMsd4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTPRw+xxwdi1VQSgbCrmtrTfQmoMAWslNK9W4PNypRLORgXaGHKHC/LJWrFOiFw0WB6yD6Abb+jl5gQwgDtIx87IMIAdik71wxOw/vfJVBuRXTRTnSYMo2Jd+j1mb3Kd0F0fubkqUjJrkto+Id7KbldKbsedNXtykI2PGvn7XG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MbY+G5hP; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MbY+G5hP"
Date: Thu, 8 May 2025 09:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746711237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O6UnM0lzDqdDWIJP8LzrGKGnouE7W/3Fbjl8iEI9USs=;
	b=MbY+G5hPQHyNM2PvNFuZCdQZNzO+lf3M6ePwJoDdE7FXme0aN1iEWbbSYoeOcSnLQtdWfB
	xIDNZSjFHb7EJyqNfGC1B8y3qSlWkrOeeL2gSlCrWi2IQPyJ7mFIH9KYrcLtvRP3coYeXE
	ZmpEh6pYV3TO1DpW9ia2ZxIPhlTlIkY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
Message-ID: <y6d7vzvii5wvfby5446ukpvdmulwd5lzcyki6rpxckh432d6jz@xwtlwnkhztuo>
References: <20250507175500.204569-1-00107082@163.com>
 <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
 <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
 <52tsrapmkfywv4kkdpravtfmxkhxchyua4wttpugihld4iws3r@atfgtbd5wwhx>
 <e1cc19.5287.196ae733594.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1cc19.5287.196ae733594.Coremail.00107082@163.com>
X-Migadu-Flow: FLOW_OUT

On Thu, May 08, 2025 at 01:51:48PM +0800, David Wang wrote:
> At 2025-05-08 12:07:40, "Kent Overstreet" <kent.overstreet@linux.dev> wrote:
> >Another thing to note is that memory layout - avoiding pointer chasing -
> >is hugely important, but it'll almost never show up as allocator calls.
> >
> >To give you some examples, mempools and biosets used to be separately
> >allocated. This was mainly to make error paths in outer object
> >constructors/destructors easier and safer: instead of keeping track of
> >what's initialized and what's not, if you've got a pointer to a
> >mempool/bioset you call *_free() on it.
> >
> >(People hadn't yet clued that you can just kzalloc() the entire outer
> >object, and then if the inner object is zeroed it wasn't initialized).
> >
> >But that means you're adding a pointer chase to every mempool_alloc()
> >call, and since bioset itself has mempools allocating bios had _two_
> >unnecessary pointer derefs. That's death for performance when you're
> >running cache cold, but since everyone benchmarks cache-hot...
> >
> >(I was the one who fixed that).
> >
> >Another big one was generic_file_buffered_read(). Main buffered read
> >path, everyone wants it to be as fast as possible.
> >
> >But the core is (was) a loop that walks the pagecache radix tree to get
> >the page, then copies 4k of data out to userspace (there goes l1), then
> >repeats all that pointer chasing for the next 4k. Pre large folios, it
> >was horrific.
> >
> >Solution - vectorize it. Look up all the pages we're copying from all at
> >once, stuff them in a (dynamically allocated! for each read!) vector,
> >and then do the copying out to userspace all at once. Massive
> >performance gain.
> >
> >Of course, to do that I first had to clean up a tangled 250+ line
> >monstrosity of half baked, poorly thought out "optimizations" (the worst
> >spaghetti of gotos you'd ever seen) and turn it into something
> >manageable...
> >
> >So - keep things simple, don't overthink the little stuff, so you can
> >spot and tackle the big algorithmic wins :)
> I will keep this in mind~! :)
> 
> And thanks for the enlightening notes~!! 
> 
> Though I could not quite catch up with the first one,  I think I got
> the point: avoid unnecessary pointer chasing and  keep the pointer
> chasing as short(balanced) as possible~ 

To illustrate - DRAM latency is 30-70n.

At 4GHz, that's 120-280 cycles, and a properly fed CPU can do multiple
instructions per clock - so a cache miss all the way to DRAM can cost
you hundreds of instructions.

> The second one, about copy 4k by 4k, seems  quite similar to seq_file,
> at least the "4k" part, literally. seq_file read()  defaults to alloc
> 4k buffer, and read data until EOF or the 4k buffer is full,   and
> start over again for the next read().   
>
> One solution could be make changes to seq_file, do not stop until user
> buffer is full for each read. kind of similar to your second note, in
> a sequential style,  I think.
>
> If  user read with 128K buffer,  and seq_file fill the buffer 4k by
> 4k, it would only need ~3 read calls for allocinfo. (I did post a
> patch for seq_file to fill user buffer, but start/stop still happens
> at  4k boundary , so no help for 
> the iterator rewinding when read /proc/allocinfo yet.
> https://lore.kernel.org/lkml/20241220140819.9887-1-00107082@163.com/ )
> The solution in this patch is keeping the iterator alive and valid
> cross read boundary, this can  also avoid the cost for each start
> over.

The first question is - does it matter? If the optimization is just for
/proc/allocinfo, who's reading it at a high enough rate that we care?

If it's only being used interactively, it doesn't matter. If it's being
read at a high rate by some sort of profiling program, we'd want to skip
the text interface entirely and add an ioctl to read the data out in a
binary format.

The idea of changing seq_file to continue until the user buffer is full
- that'd be a good one, if you're making changes that benefit all
seq_file users.
