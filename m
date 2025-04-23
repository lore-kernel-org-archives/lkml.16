Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5282581
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367077; cv=none; b=gXCQ1j57RKVC9JY8r0PvLsQ7iQiVsvGQCipeFsP0H6p11mYCPyEY0NPHAIpzLN433jvUkzd6FgZrzKmIwLTG1jtSjE6LJC4O1zcp3q3SWGprd66bHqvACZrOR2xRdiX4LpjOwPjP++A8eZHR8s38y7OlUdWIzNkH95bRnfeg9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367077; c=relaxed/simple;
	bh=tOdyDpcmSPuna6OVZeVmCsiyEbkbe0V8h/LovKA/HVg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Th/XvIrff4gau6cRb0nlNw76Jr2BJXrqRjQ/ssiOq2+n3jLrQWO0AygfuK7HhGtZdD59BR5wgQNzqGsLuHTHG5tbEg2qtryTYJlcOC9nUryoR+3Ni8/vrzWhZ9HaDLSII4mFXNdZzCMp98Tgp0Vdo7hD3OBENO2Tdn4pGtLZB54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U+6wmdj4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U+6wmdj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE034C4CEE9;
	Wed, 23 Apr 2025 00:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745367077;
	bh=tOdyDpcmSPuna6OVZeVmCsiyEbkbe0V8h/LovKA/HVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U+6wmdj42j4fJfaZ4selTaZxFyi3hfSY8e0F/wddiayP8G+UrCEwR4OzOWxy0aAT6
	 epMr7qCVxhP7G7w3gApscqw87I6WOXG/0xBGC1ld/rX98Ysr6RoWcbzmgc0IINms4I
	 ymEe5lWvo/4kDTQsd411jX+zROYYUH6FeJA8exy4=
Date: Tue, 22 Apr 2025 17:11:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Brendan
 Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan
 <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by
 cpuset race
Message-Id: <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
In-Reply-To: <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
	<aAYXP4f417_bx6Is@harry>
	<025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 20:10:06 +0800 Tianyang Zhang <zhangtianyang@loongson.cn> wrote:

>
> ...
>
> >>
> >> Simultaneously starting multiple cpuset01 from LTP can quickly
> >> reproduce this issue on a multi node server when the maximum
> >> memory pressure is reached and the swap is enabled
> >>
> >> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> >> ---
> > What commit does it fix and should it be backported to -stable?
> >
> > There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> > Andrew's mm.git repository now).
> >
> > Let's Cc the page allocator folks here!
> 
> We first identified this issue in 6.6.52-stable , and through root cause 
> analysis,
> 
> it appears the problem may have existed for a significant period.
> 
> However It is recommended that the fix should be backported to at least 
> Linux kernel versions after 6.6-stable

OK, thanks,

This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
see some review activity soon (please).

