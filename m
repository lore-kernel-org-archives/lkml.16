Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5EA35948
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746588657; cv=none; b=dnL3VvC5ZA8zkenwcWLCiULKsUh8jCzuwT3G1yq6QYo1A3fcK4woGUwLxfRk0pXhSzp9ULu4TYAADdy66OijwkhXUPrdiMzI03akIKbZaNvfEGyJQ9RbgNZqu+qEhkWHuovOltzKTdAOYfsqzW1P4JhhkBThssxuNQMnS42GIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746588657; c=relaxed/simple;
	bh=6xHK2mZb9YSozxZk2Q7AKfM4E2+Diy2ewPVdV43zFxc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZCoH6Rl7/z0ARFLolOef+w8gTn64Pr0nmmkPnkH25rnKaUjiLAnn3RQQTRQ95NcbPEKi2mnOc4lyCzDfC9CO8SHfujR8ljVzA6amO4pfaVjfve3ZEcW/gh/nyFdiIZamlGdkVeGOTDJooJQACNWEOrLQBHl8rj0JTDZUvzXGHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CigDcurq; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CigDcurq"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746588643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qowYpm3BAfgX31Aen7B4hyVsFkHKwyebwwN0Uq02GZI=;
	b=CigDcurqPGRd8k5xSbpf580mvx+9WkVag2UWKtb4AN06/0wy+xnZ9jslOaKFCy+tCBfh6i
	Dflh1yLTPUZTotl+GWXwynmNCNtaF5VzOW2uYq3EcnD0hWmjmJ9UQ8JahTJrkDwmFUGe3N
	YOansLkXgmo9MnmdUD9ujQhsLtfve+Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH RFC 07/28] mm: thp: use folio_batch to handle THP
 splitting in deferred_split_scan()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <7fd0262d-ff36-d621-191e-4f623a2038c0@google.com>
Date: Wed, 7 May 2025 11:30:01 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 mhocko@kernel.org,
 roman.gushchin@linux.dev,
 shakeel.butt@linux.dev,
 akpm@linux-foundation.org,
 david@fromorbit.com,
 zhengqi.arch@bytedance.com,
 yosry.ahmed@linux.dev,
 nphamcs@gmail.com,
 chengming.zhou@linux.dev,
 linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 hamzamahfooz@linux.microsoft.com,
 apais@linux.microsoft.com
Content-Transfer-Encoding: 7bit
Message-Id: <ED148952-0144-48CB-ADAD-012D58025035@linux.dev>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-8-songmuchun@bytedance.com>
 <20250430143714.GA2020@cmpxchg.org>
 <235f2616-99dd-abfa-f6d1-c178d8ffb363@google.com>
 <7fd0262d-ff36-d621-191e-4f623a2038c0@google.com>
To: Hugh Dickins <hughd@google.com>
X-Migadu-Flow: FLOW_OUT



> On May 7, 2025, at 05:44, Hugh Dickins <hughd@google.com> wrote:
> 
> On Mon, 5 May 2025, Hugh Dickins wrote:
> ...
>> 
>> However... I was intending to run it for 12 hours on the workstation,
>> but after 11 hours and 35 minutes, that crashed with list_del corruption,
>> kernel BUG at lib/list_debug.c:65! from deferred_split_scan()'s
>> list_del_init().
>> 
>> I've not yet put together the explanation: I am deeply suspicious of
>> the change to when list_empty() becomes true (the block Hannes shows
>> above is not the only such: (__)folio_unqueue_deferred_split() and
>> migrate_pages_batch() consult it too), but each time I think I have
>> the explanation, it's ruled out by folio_try_get()'s reference.
>> 
>> And aside from the crash (I don't suppose 6.15-rc5 is responsible,
>> or that patches 08-28/28 would fix it), I'm not so sure that this
>> patch is really an improvement (folio reference held for longer, and
>> list lock taken more often when split fails: maybe not important, but
>> I'm also not so keen on adding in fbatch myself).  I didn't spend very
>> long looking through the patches, but maybe this 07/28 is not essential?

Hi Hugh,

Really thanks for your time to look at this patch. 07/28 is actually a
necessary change in this series.

> 
> The BUG would be explained by deferred_split_folio(): that is still using
> list_empty(&folio->_deferred_list) to decide whether the folio needs to be
> added to the _deferred_list (else is already there).  With the 07/28 mods,
> it's liable to add THP to the _deferred_list while deferred_split_scan()
> holds that THP in its local fbatch.  I haven't tried to go through all the
> ways in which that may go horribly wrong (or be harmless), but one of them
> is deferred_split_scan() after failed split doing a second list_add_tail()
> on that THP: no!  I won't think about fixes, I'll  move on to other tasks.

Thanks for your analysis. I'll look at it deeply.

> 
> Or does that get changed in 08-28/28? I've not looked.

No. 08-28/28 did not change anything related to THP _deferred_list.

Muchun,
Thanks.

> 
> Hugh

