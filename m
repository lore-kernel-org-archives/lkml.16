Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390D20B80D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321267; cv=none; b=DFOI8BMlfyn7KVyvRexV7NqWv05GvZXq8j+X77IH2YbrhsN4xN8+fweGLQp+cLbn9yfIqU9px9CEFvyP9VwgzLN35TGkmaxVxmqf9iz8VoFNggc4krjq9evH7WO3Nuj8KIAmRuXrB+hE0f2yB8rTkdtSkrbur+PoQLXXiQ5z4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321267; c=relaxed/simple;
	bh=HkvU5H5T+Vyi2pEdJQTZw0q2sFCXY/WSgVZ7OCFEvhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAXw9imf2TtkWo0OupoIZnn6zqzyVxE1VVAPwA+/+yzk+OlKB/YJMTQR3xK3PHKR/cRMLZjfz6adZjEijn7I+lQSfQDtRlbM5uVxZ0M7+gAHmLuje7yIwzsep35fO0JAHbvidY7eAC0y6OlMK+lBt60uWN+/iIvyOh8PnPL7QGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E7uLd2yC; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E7uLd2yC"
Date: Tue, 22 Apr 2025 04:27:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745321261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZSjzh21Er6zfYpYTz3VLBkYDxUNuBOsafE2+zPHwBA=;
	b=E7uLd2yCclpmGAzh893lNm5cQKameJvnzPjKKJwvuaf8AXx89o9G9M1npI7pHn46ZNMlLn
	CqYXdHpLMy5dmKVTckr84siM9y3hXO1cInmM9WNNEo5/x5ZVPVKhwjWHvX23lWuvz3xLNY
	9oQw3PxF6TXoTd6aRabYweyEfx43PrQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
	akpm@linux-foundation.org, hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com, sjenning@redhat.com, ddstreet@ieee.org,
	vitaly.wool@konsulko.com, hughd@google.com, corbet@lwn.net,
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
Message-ID: <aAd9G_BYEcNwVuSd@Asmaa.>
References: <CAJD7tka6XRyzYndRNEFZmi0Zj4DD2KnVzt=vMGhfF4iN2B4VKw@mail.gmail.com>
 <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 02, 2025 at 01:06:49PM -0700, Joshua Hahn wrote:
> On Mon, 16 Oct 2023 17:57:31 -0700 Yosry Ahmed <yosryahmed@google.com> wrote:
> 
> > On Mon, Oct 16, 2023 at 5:35 PM Nhat Pham <nphamcs@gmail.com> wrote:
> 
> > I thought before about having a special list_head that allows us to
> > use the lower bits of the pointers as markers, similar to the xarray.
> > The markers can be used to place different objects on the same list.
> > We can have a list that is a mixture of struct page and struct
> > zswap_entry. I never pursued this idea, and I am sure someone will
> > scream at me for suggesting it. Maybe there is a less convoluted way
> > to keep the LRU ordering intact without allocating memory on the
> > reclaim path.
> 
> Hi Yosry,
> 
> Apologies for reviving an old thread, but I wasn't sure whether opening an
> entirely new thread was a better choice : -)

This seems like the right choice to me :)

> 
> So I've implemented your idea, using the lower 2 bits of the list_head's prev
> pointer (last bit indicates whether the list_head belongs to a page or a
> zswap_entry, and the second to last bit was repurposed for the second chance
> algorithm).

Thanks a lot for spending time looking into this, and sorry for the
delayed resposne (I am technically on leave right now).

> 
> For a very high level overview what I did in the patch:
> - When a page fails to compress, I remove the page mapping and tag both the
>   xarray entry (tag == set lowest bit to 1) and the page's list_head prev ptr,
>   then store the page directly into the zswap LRU.

What do you mean by 'remove the page mapping'? Do you mean
__remove_mapping()?

This is already called by reclaim, so I assume vmscan code hands over
ownership of the page to zswap and doesn't call __remove_mapping(), so
you end up doing that in zswap instead.

> - In zswap_load, we take the entry out of the xarray and check if it's tagged.
>   - If it is tagged, then instead of decompressing, we just copy the page's
>     contents to the newly allocated page. 
> - (More details about how to teach vmscan / page_io / list iterators how to
>   handle this, but we can gloss over those details for now)
> 
> I have a working version, but have been holding off because I have only been
> seeing regressions. I wasn't really sure where they were coming from, but
> after going through some perf traces with Nhat, found out that the regressions
> come from the associated page faults that come from initially unmapping the
> page, and then re-allocating it for every load. This causes (1) more memcg
> flushing, and (2) extra allocations ==> more pressure ==> more reclaim, even
> though we only temporarily keep the extra page.

Hmm how is this worse than the status quo though? IIUC currently
incompressible pages will skip zswap and go to the backing swapfile.
Surely reading them from disk is slower than copying them?

Unless of course, writeback is disabled, in which case these pages are
not being reclaimed at all today. In this case, it makes sense that
reclaiming them makes accessing them slower, even if we don't actually
need to decompress them.

I have a few thoughts in mind:

- As Nhat said, if we can keep the pages in the swapcache, we can avoid
  making a new allocation and copying the page. We'd need to move it
  back from zswap LRUs to the reclaim LRUs though.

- One advantage of keeping incompressible pages in zswap is preserving
  LRU ordering. IOW, if some compressible pages go to zswap first (old),
  then some incompressible pages (new), then the old compressible pages
  should go to disk via writeback first. Otherwise, accessing the hotter
  incompressible pages will be slower than accessing the colder
  compressible pages. This happens today because incompressible pages go
  straight to disk.

  The above will only materialize for a workload that has writeback
  enabled and a mixture of both incompressible and compressible
  workingset.

  The other advantage, as you mention below, is preventing repeatedly
  sending incompressible pages to zswap when writeback is disabled, but
  that could be offset by the extra cost of allocations/copying.

- The above being said, we should not regress workloads that have
  writeback disabled, so we either need to keep the pages in the
  swapcache to avoid the extra allocations/copies -- or avoid storing
  the pages in zswap completely if writeback is disabled. If writeback
  is disabled and the page is incompressible, we could probably just put
  it in the unevictable LRU because that's what it really is. We'd need
  to make sure we remove it when it becomes compressible again. The
  first approach is probably simpler.

> 
> Just wanted to put this here in case you were still thinking about this idea.
> What do you think? Ideally, there would be a way to keep the page around in
> the zswap LRU, but do not have to re-allocate a new page on a fault, but this
> seems like a bigger task.
> 
> Ultimately the goal is to prevent an incompressible page from hoarding the
> compression algorithm on multiple reclaim attempts, but if we are spending
> more time by allocating new pages... maybe this isn't the correct approach :(
> 
> Please let me know if you have any thoughts on this : -)
> Have a great day!
> Joshua
> 
> Sent using hkml (https://github.com/sjp38/hackermail)
> 
> 
