Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D721EF37A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334038; cv=none; b=CHUv1YsOvzXrHvzre3WvuROKlfqtPNtwhyAPj+KEOZMq+a61zKx/KaR1REXT7B1LuajVHJ7BTv31+nFtiKegsskMAegORcXlgYdIGG/9DUnHXg+ePbseXHZEXwVyU7A0kgAOlPpSMZBqWZo4ZKxtgY1xityBlnlHFPpIc45XPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334038; c=relaxed/simple;
	bh=tAhs+TtWNSDJ1hyAb29zLp/m6r7GF+q2i+6+Wk90nsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Npr+e8q0pxGsRQ3Q6isyDfuduW9k9YF197JNc+juUoY2Kq1KytnPL/2mfmRZxc89lelaSMndfpEObkVyV60OzyZFPpLlOy6TyK4594snO9cwrFhp0sWKK4BuceRnCbbp0mHVF0e2+toXn/ennuWXT7Drm1XClugKMjlzGvR14YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfQcKrCE; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfQcKrCE"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7080dd5fe92so8564927b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745334035; x=1745938835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeAk6MyHc6xLXP/13BBrx6xteBuCRy70CN1qsBOrGPw=;
        b=TfQcKrCEyU4zAys7JVNmcujQFuOiidrUYhxG+ofp82GGiA8zSUr5jBmqvCKANxE4ED
         HcCHETMtOIa4HBP7oF47CjVX4ZO+U02id2CNmoG2zNksyzq2hkvjD7t91ZmSoimOMjv8
         WPmcA7OK97j5GXU5ByFdxGjt3DPV0/h1LE3kMu9QwkthlqYNTn1Sgt/iOboQWeCagdO5
         6kamh9T+nB3JZxwYI4k6rRh2KVLN4YKQojhnhsTj2eCmIXbtr5gpU3rkLvN3LHtH55uV
         86HeJvnmvM8vqsDGrYSd274lo3iHj0OheRpQSqa9xDBgl0QCcUrRv2P8d6Z5Zm6Ha4Zj
         Fiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334035; x=1745938835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeAk6MyHc6xLXP/13BBrx6xteBuCRy70CN1qsBOrGPw=;
        b=Rc3WO+Tx0h82O+vNu+2WSWtyR3YiML8uqjnPqB9P1flMrYPy87sLX6RLS8/2wIyq86
         FhPM3Pws45bvxHIxie1zV5puwyhzLf5xd258l/WmGI0NI0wsYDULGxDkI6fOWnZLkUyt
         WFmu9YaEZfvE8bKmg8KC3li6zxHKPanR42TCkkcx+1rP5Dj92IpwwEyXF+8XJd82xB19
         ze2jKWokvrs4Tco9ejoaja7/WC4I9vN6ilBhYGHALqsIiCi71tCEWrIEQQcTqEQ9H6/m
         P9q5yEfKoJuapJkoLWBNpoNwXdpiXFiu/H226HPNS2D3da83rSw3akohMtAiIcxaMclC
         9wpw==
X-Forwarded-Encrypted: i=1; AJvYcCXjGHeJfGqQUq1hUlraXhWqJXtSgapH1Hkhb7S4OrSqMa3p3KMoACdw5O/3QMxS0xrfa8eHDRaxd0jmXOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWfTRG2FbKyqlwombglTpPMgSAjaXhC4v0m3sbqxzS/uvoUq5
	YMa1c/jzqkiHY39D7EalQPPFy8IC+LRs44BcKq7sFtz6V5Fr2YE8
X-Gm-Gg: ASbGncuP0Dhu8YOAMffaD1UNstLdccZiNeB3d7ACShCULpseCGaN/Qf8XSSf3JCrQ/5
	sekqxJWnvbxrLtneXqdhD2Qdqd9y7KO8TxxFBxW9Zp++IZabjiYRMxWL2Ke79vxaPMxrqGmaSsD
	xc34sqxr5H/F4aHsqiObV5S6oUHsc2RVRM/605fV+abHjDSKFBLx8JNVzpgcqUZgMRCdp/gWtdg
	3OWY7sJew2yQYmyp0Tj09x+TANyP7OYhKQNdCKAAfuSmI3jlcMrOCdoP/C0Zh51dTa3PuilCUTI
	wY3h2AnZzSLCueGtqwgU8nagwXCzmfHl/oaN
X-Google-Smtp-Source: AGHT+IFUjbW1XWnRQ05I8CcYEAQHzRwJyH/lX3NojwOrr018pgYK+qTFz98YZYtoLI0IwFn/4EC3oQ==
X-Received: by 2002:a05:690c:6e0d:b0:705:750e:851 with SMTP id 00721157ae682-706cce1f305mr246404357b3.37.1745334035021;
        Tue, 22 Apr 2025 08:00:35 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-707d4e9d386sm18765897b3.121.2025.04.22.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 08:00:34 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Yosry Ahmed <yosryahmed@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	hughd@google.com,
	corbet@lwn.net,
	konrad.wilk@oracle.com,
	senozhatsky@chromium.org,
	rppt@kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
Date: Tue, 22 Apr 2025 08:00:31 -0700
Message-ID: <20250422150033.1867401-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aAd9G_BYEcNwVuSd@Asmaa.>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> > > I thought before about having a special list_head that allows us to
> > > use the lower bits of the pointers as markers, similar to the xarray.
> > > The markers can be used to place different objects on the same list.
> > > We can have a list that is a mixture of struct page and struct
> > > zswap_entry. I never pursued this idea, and I am sure someone will
> > > scream at me for suggesting it. Maybe there is a less convoluted way
> > > to keep the LRU ordering intact without allocating memory on the
> > > reclaim path.

> > So I've implemented your idea, using the lower 2 bits of the list_head's prev
> > pointer (last bit indicates whether the list_head belongs to a page or a
> > zswap_entry, and the second to last bit was repurposed for the second chance
> > algorithm).
> 
> Thanks a lot for spending time looking into this, and sorry for the
> delayed resposne (I am technically on leave right now).

Hi Yosry,

Thank you for getting back to me! I hope you are enjoying your leave : -)

> > For a very high level overview what I did in the patch:
> > - When a page fails to compress, I remove the page mapping and tag both the
> >   xarray entry (tag == set lowest bit to 1) and the page's list_head prev ptr,
> >   then store the page directly into the zswap LRU.
> 
> What do you mean by 'remove the page mapping'? Do you mean
> __remove_mapping()?

Yes -- but I am calling remove_mapping() to unfreeze with a refcount of 1
(zswap is now the sole owner of the page). 

> This is already called by reclaim, so I assume vmscan code hands over
> ownership of the page to zswap and doesn't call __remove_mapping(), so
> you end up doing that in zswap instead.

Yes! I changed reclaim logic to be aware that zswap can do this, so there
is a new switch case that simply continues through the folio list when
zswap steals the incompressible page (but we don't want to drop the page).

> > - In zswap_load, we take the entry out of the xarray and check if it's tagged.
> >   - If it is tagged, then instead of decompressing, we just copy the page's
> >     contents to the newly allocated page. 
> > - (More details about how to teach vmscan / page_io / list iterators how to
> >   handle this, but we can gloss over those details for now)
> > 
> > I have a working version, but have been holding off because I have only been
> > seeing regressions. I wasn't really sure where they were coming from, but
> > after going through some perf traces with Nhat, found out that the regressions
> > come from the associated page faults that come from initially unmapping the
> > page, and then re-allocating it for every load. This causes (1) more memcg
> > flushing, and (2) extra allocations ==> more pressure ==> more reclaim, even
> > though we only temporarily keep the extra page.
> 
> Hmm how is this worse than the status quo though? IIUC currently
> incompressible pages will skip zswap and go to the backing swapfile.
> Surely reading them from disk is slower than copying them?
> 
> Unless of course, writeback is disabled, in which case these pages are
> not being reclaimed at all today. In this case, it makes sense that
> reclaiming them makes accessing them slower, even if we don't actually
> need to decompress them.

Yes, sorry for the ambiguity -- this was specifically for the writeback
disabled case. My focus currently is on reducing the amount of CPU cycles
spent stuck on trying to compress incompressible pages. 

> I have a few thoughts in mind:
> 
> - As Nhat said, if we can keep the pages in the swapcache, we can avoid
>   making a new allocation and copying the page. We'd need to move it
>   back from zswap LRUs to the reclaim LRUs though.

Yes, Nhat and Shakeel have both offered the same perspective. I'm currently
working on this approach with help from Nhat. 

> - One advantage of keeping incompressible pages in zswap is preserving
>   LRU ordering. IOW, if some compressible pages go to zswap first (old),
>   then some incompressible pages (new), then the old compressible pages
>   should go to disk via writeback first. Otherwise, accessing the hotter
>   incompressible pages will be slower than accessing the colder
>   compressible pages. This happens today because incompressible pages go
>   straight to disk.
> 
>   The above will only materialize for a workload that has writeback
>   enabled and a mixture of both incompressible and compressible
>   workingset.

This makes sense to me. I'll take this into consideration when writing
benchmarks for this patch!

>   The other advantage, as you mention below, is preventing repeatedly
>   sending incompressible pages to zswap when writeback is disabled, but
>   that could be offset by the extra cost of allocations/copying.

Yes -- hopefully, keeping it in swapcache allows us to reap the benefits of
both worlds, minus the duplicated allocation / copying.

> - The above being said, we should not regress workloads that have
>   writeback disabled, so we either need to keep the pages in the
>   swapcache to avoid the extra allocations/copies -- or avoid storing
>   the pages in zswap completely if writeback is disabled. If writeback
>   is disabled and the page is incompressible, we could probably just put
>   it in the unevictable LRU because that's what it really is. We'd need
>   to make sure we remove it when it becomes compressible again. The
>   first approach is probably simpler.

This is a good point. While I don't have the numbers to back this up, I have
an intuition that this patch really sees the most benefits from reducing
CPU time spent trying to compress incompressible pages, rather than from
maintaining a better LRU ordering. For that reason I also suspect that we
see much better performance gains when writeback is disabled. Following that
logic... maybe there is some future work to be done that just moves these
incompressible pages to an unevictable LRU when writeback is disabled?

For now, I'm still experimenting with keeping the page in swapcache. I'll
be sure to report back with cool findings! Thank you again for your review
of this idea Yosry, I hope you have a great day!
Joshua
