Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A22AE89
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516338; cv=none; b=WsqRECJcNjGL35c7UWps9WKNH2KqZr2pQ9I3+EhJOwMeeFbOMrYRTWFswkA8rKTIsKgSa4gTaiiOSyEobv2M84K9drgAf0uo0r9cX5+LJFtERsJlss8V+TMVJAEzyj1WgcrBUdkJJGoDv5WK6Jx01dItDhuONEyt9FZHz2KDPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516338; c=relaxed/simple;
	bh=kJDk0KCfhQiOdVoz9lgfLVQXsmky8WgNhO+CuHpytoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amr2bkuBj33vM9shDqm+o/353+HwxpcwneV9wWsNyvCeo9AEfwNtID6pOngQ0qX358xeHKarg3fWZ678eS4graJizXCGz3va2PcXH2lLxTtdBE5oTH933B0UsJfP1kbR8HkiRjo5VS6jet74VcD3/ty0O9dvtAO4mA5QhV7wiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZJzaQ8X1; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZJzaQ8X1"
Date: Mon, 9 Jun 2025 17:45:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749516324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K20VVd+wIYPeI78t96QglGZe8BTe3O5cy4tZdboIubk=;
	b=ZJzaQ8X14i+j9T2bYFvj4dh4I3oEb0hhtA7D3jE2PTPcmQpV/adBveWSKgzgpcItHAc3Dp
	d6euJ28IP6Ii6ECu29b4DBhsg/UNjSdaAYeuv5JYRoRJt+54pNav0UQnKFa1vWHr9tHVfb
	BtTnDjf5giI3R1YNuz1adnCV2feTGx0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Michal Hocko <mhocko@suse.com>, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com, donettom@linux.ibm.com, 
	aboorvad@linux.ibm.com, sj@kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: fix the inaccurate memory statistics issue for
 users
Message-ID: <advwinpel3emiq3otlxet2q7k5qwl43urgewhicvqhqliyqpcg@vztzhkqjig6n>
References: <f4586b17f66f97c174f7fd1f8647374fdb53de1c.1749119050.git.baolin.wang@linux.alibaba.com>
 <87bjqx4h82.fsf@gmail.com>
 <aEaOzpQElnG2I3Tz@tiehlicka>
 <890b825e-b3b1-4d32-83ec-662495e35023@linux.alibaba.com>
 <87a56h48ow.fsf@gmail.com>
 <4c113d58-c858-4ef8-a7f1-bae05c293edf@suse.cz>
 <06d9981e-4a4a-4b99-9418-9dec0a3420e8@suse.cz>
 <20250609171758.afc946b81451e1ad5a8ce027@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609171758.afc946b81451e1ad5a8ce027@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 09, 2025 at 05:17:58PM -0700, Andrew Morton wrote:
> On Mon, 9 Jun 2025 10:56:46 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
> 
> > On 6/9/25 10:52 AM, Vlastimil Babka wrote:
> > > On 6/9/25 10:31 AM, Ritesh Harjani (IBM) wrote:
> > >> Baolin Wang <baolin.wang@linux.alibaba.com> writes:
> > >>
> > >>> On 2025/6/9 15:35, Michal Hocko wrote:
> > >>>> On Mon 09-06-25 10:57:41, Ritesh Harjani wrote:
> > >>>>>
> > >>>>> Any reason why we dropped the Fixes tag? I see there were a series of
> > >>>>> discussion on v1 and it got concluded that the fix was correct, then why
> > >>>>> drop the fixes tag?
> > >>>>
> > >>>> This seems more like an improvement than a bug fix.
> > >>>
> > >>> Yes. I don't have a strong opinion on this, but we (Alibaba) will 
> > >>> backport it manually,
> > >>>
> > >>> because some of user-space monitoring tools depend 
> > >>> on these statistics.
> > >>
> > >> That sounds like a regression then, isn't it?
> > > 
> > > Hm if counters were accurate before f1a7941243c1 and not afterwards, and
> > > this is making them accurate again, and some userspace depends on it,
> > > then Fixes: and stable is probably warranted then. If this was just a
> > > perf improvement, then not. But AFAIU f1a7941243c1 was the perf
> > > improvement...
> > 
> > Dang, should have re-read the commit log of f1a7941243c1 first. It seems
> > like the error margin due to batching existed also before f1a7941243c1.
> > 
> > " This patch converts the rss_stats into percpu_counter to convert the
> > error  margin from (nr_threads * 64) to approximately (nr_cpus ^ 2)."
> > 
> > so if on some systems this means worse margin than before, the above
> > "if" chain of thought might still hold.
> 
> f1a7941243c1 seems like a good enough place to tell -stable
> maintainers where to insert the patch (why does this sound rude).
> 
> The patch is simple enough.  I'll add fixes:f1a7941243c1 and cc:stable
> and, as the problem has been there for years, I'll leave the patch in
> mm-unstable so it will eventually get into LTS, in a well tested state.

One thing f1a7941243c1 noted was that the percpu counter conversion
enabled us to get more accurate stats with some cpu cost and in this
patch Baolin has shown that the cpu cost of accurate stats is
reasonable, so seems safe for stable backport. Also it seems like
multiple users are impacted by this issue, so I am fine with stable
backport.
