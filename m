Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686F13B2BB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743809557; cv=none; b=RB6YrjWx/Bo7nt+rb9BybD4ZXav+v17BNyR29dcSu/zHzYLfSnShoA104nQK7yvVts5dZFAX4ZJiJ8lKeaX5BZBlj6TaGOA1Oy9NttJbtfFpMkYCWjYmJbyQwMsMWfJJ8P1ZByM++S1QcBeRp80s2TXeVKiOP30/d5yQ7m00Lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743809557; c=relaxed/simple;
	bh=QWHvkuK7/BjyMNtfSSarlERTr+8nkO0xsbug7SlJrFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsY/T9/s5Wh17nXe1q7VD5a6wG8IDtwVnrZypctXmROqK0obEpnaryQ6ufQqmzyUrc7nMjSXDrE+wTzCisAzf/bPpmJYeyOI/CElNvmzeh/5C0cW07XpxxUACEv/AAFve3BuYz08UgwnUSVFvbpZDcf2t6NN8tJk6GXv/vIDJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFxn3T88; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFxn3T88"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso3259453a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 16:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743809554; x=1744414354; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzspiJbW7QmXEAVW2g03GHzOnq2e3N4wowbiLpToSCY=;
        b=gFxn3T88DDS37tQdRp8CZKSRkybZURvkDae04imXZItzozWU2qqY4Ni3aJTQ8UL740
         Igq+ZoYuiD2PMrgyfnO2RaJDEXBbhzcfBoEVUpXzjFlY3k8sAp0nDiKmDr+ICN7ruJhp
         Vbe8lF1jVcsEOiG2sRm2YDdCUXH2/sPAy7TwWYYGYGi+nUZMEmNZYqB0y6zVBLs/I0WV
         cv7DfwwrA3Q2p5jocnVl+kig2bxTYm6UjtygrXTCn8TZFC2Zjlfu0QuUOv+TnDUIB73h
         Vsdl2bT0LIOTGnqlR1AyRP8n/9GWCOS/SPsRAmUsSW/L1B9MQQtpUGQlmWnTKze/cbPr
         4kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743809554; x=1744414354;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzspiJbW7QmXEAVW2g03GHzOnq2e3N4wowbiLpToSCY=;
        b=wTOO5KX7hSjoif68ucLbf5IO3EVUB3N76RPezrqumQSF5/VqLcxXSUKdeITGFqXnbd
         RSNae4qXKD5xhXcVYr4fKBif86wtwXIkYRw7tpJ1MDGKlodycREJDbCRiBDpYN81X76p
         0geJ/RpAa8A/qV0T6cua1CiCxQ5EB7PsGXejhQu06tgG8R9/7aTE7nX0fiq9rCFzAGed
         bdMKRZbrMB6qIPSKeknOepjRLoVhKYpCLZCy595tToE2Y0w8WHXe6W93iiXx4JyeRRC3
         T3C3WSuPhkVmuojvtbKWoF9xOd/Ed2QgpX5dyJuJznC1nDlCM170X0bvw3cCHdtiGy70
         H52w==
X-Forwarded-Encrypted: i=1; AJvYcCXZfQf1jTmkKAn1awZvNX4gzXLKVibaUC2fDCgzub8h1cxdOod0YzuYckGPGbuRzTIiacqQemt0VDke5p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR7PeNbfMm2QuV/vBH+Q5voRR4R7CRthqmYRD2M3FGCZNZ325U
	Vod4ItI/y3YbID3gae5vPbk5kGbEfwfBoJxam+PEZjySmOxGzDxX
X-Gm-Gg: ASbGnctbNHI1uQ0G2Vv2mrAIaPR7yThMCLnKlo/2UQ24rFaNvE3jW2OdyfDZ8CtklG3
	xrbO1MZeHOZo/vmT9xlFJa2gjyjX56sN8Z6v1H4l8pp+gd6+xe20bE41Z9g+PhQgXUJHSHQh6V3
	L86Qk8fl5OvxwK3a5KUBcXfO3vcUTzJuOX+EFbisobFG8tBAxumx1ZYmQ+Nv7ihRmbN1T/HGv5d
	kFQOQ18SMxohOxJf81iUiZGv4O02swyevz6o/TScogeJQQibWeLYNyW+WKdoe/FrqvL2qPA7rL2
	KwNKk5lFnUGWvxikJZU7IlL1gLXYPZwfJ0aHkmx+oMYq
X-Google-Smtp-Source: AGHT+IE/vv1Smr2HKVwTss1S5tFHifeZYvCC4qt2WX7qSbvEhE97vHXCEg2l3mtN64QGaf4gVHTF7g==
X-Received: by 2002:a05:6402:5c8:b0:5f0:d893:bf8a with SMTP id 4fb4d7f45d1cf-5f0db82be32mr619706a12.20.1743809554106;
        Fri, 04 Apr 2025 16:32:34 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a476bsm3047900a12.72.2025.04.04.16.32.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Apr 2025 16:32:32 -0700 (PDT)
Date: Fri, 4 Apr 2025 23:32:31 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <20250404233231.bk62hjwq46vnrpmz@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <ab86a655c18cf9feb031a9b08b74812dcb432221.1742245056.git.lorenzo.stoakes@oracle.com>
 <20250404125315.5bou5ays7u7sv4rb@master>
 <2fcd2760-0116-491e-add2-c3277d5bb19b@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fcd2760-0116-491e-add2-c3277d5bb19b@lucifer.local>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Apr 04, 2025 at 02:04:10PM +0100, Lorenzo Stoakes wrote:
>On Fri, Apr 04, 2025 at 12:53:15PM +0000, Wei Yang wrote:
>> On Mon, Mar 17, 2025 at 09:15:03PM +0000, Lorenzo Stoakes wrote:
>> [...]
>> >However, we have a problem here - typically the vma passed here is the
>> >destination VMA.
>> >
>> >For instance in vma_merge_existing_range() we invoke:
>> >
>> >can_vma_merge_left()
>> >-> [ check that there is an immediately adjacent prior VMA ]
>> >-> can_vma_merge_after()
>> >  -> is_mergeable_vma() for general attribute check
>> >-> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)
>> >
>> >So if we were considering a target unfaulted 'prev':
>> >
>> >	  unfaulted    faulted
>> >	|-----------|-----------|
>> >	|    prev   |    vma    |
>> >	|-----------|-----------|
>> >
>> >This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).
>> >
>> >The list_is_singular() check for vma->anon_vma_chain, an empty list on
>> >fault, would cause this merge to _fail_ even though all else indicates a
>> >merge.
>> >
>>
>> Great spot. It is hiding there for 15 years.
>
>Thanks!
>
>>
>> >Equally a simple merge into a next VMA would hit the same problem:
>> >
>> >	   faulted    unfaulted
>> >	|-----------|-----------|
>> >	|    vma    |    next   |
>> >	|-----------|-----------|
>> >
>> [...]
>> >---
>> > mm/vma.c                |  81 +++++++++++++++++++++++---------
>> > tools/testing/vma/vma.c | 100 +++++++++++++++++++++-------------------
>> > 2 files changed, 111 insertions(+), 70 deletions(-)
>> >
>> >diff --git a/mm/vma.c b/mm/vma.c
>> >index 5cdc5612bfc1..5418eef3a852 100644
>> >--- a/mm/vma.c
>> >+++ b/mm/vma.c
>> >@@ -57,6 +57,22 @@ struct mmap_state {
>> > 		.state = VMA_MERGE_START,				\
>> > 	}
>> >
>> >+/*
>> >+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
>> >+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
>> >+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
>> >+ * potential lock contention, we do not wish to encourage merging such that this
>> >+ * scales to a problem.
>> >+ */
>>
>> I don't follow here. Take a look into do_wp_page(), where CoW happens. But I
>> don't find where it will unlink parent anon_vma from vma->anon_vma_chain.
>
>Look at anon_vma_clone() in fork case. It's not the point of CoW that's the
>issue, it's propagation of AVC's upon fork.
>
>>
>> Per my understanding, the unlink behavior happens in unlink_anon_vma() which
>> unlink all anon_vma on vma->anon_vma_chain. And the normal caller of
>> unlink_anon_vma() is free_pgtables(). Other callers are on error path to
>> release prepared data. From this perspective, I don't see the chance to unlink
>> parent anon_vma from vma->anon_vma_chain either.
>>
>> But maybe I missed something. If it is not too bother, would you mind giving
>> me a hint?
>
>What you're saying is 'we never go back and fix this up once unCoW'd' which is
>true, but I don't want to write several page-length essays in comments, and this
>is a sensible way of looking at things for the purposes of this check.
>
>In future, we may want to actually do something like this, if it makes sense.
>

Ok, this is the future plan instead of current behavior.

My personal feeling is it would misleading to readers. I would think if all
pages mapping in VMA is Cow'd, the vma->anon_vma_chain becomes singular in
current kernel. 

A page-length comment is not we want, how about "maybe_root_anon_vma"? When
vma->anon_vma_chain is empty or singular, it means the (future) vma->anon_vma
is the root anon_vma.
