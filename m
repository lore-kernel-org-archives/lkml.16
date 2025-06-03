Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6087119049B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971799; cv=none; b=IovtyY5ArXXTuOc5kf42V7e5uHFNwHSl1Bpm2uZtUw49hZeS9PJHjDXB24w7OrSDyBRH22bMCpL0ZjV0ohOjgrYvIOaE3aUCOhMeohdwH/gyVnGE+L8Rswlm8xEP60a/yEuSazYA54HwM2B39A72CtICbDxEcV49vE6aFe6oDiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971799; c=relaxed/simple;
	bh=NeuRqPV7KSJq1wbC6P3hQE0NcFH3J7sZ3ufsGryjZoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbzhAjMynKmxYqEW8CQ1wtKnsA16Xu016yivaI4FTYFLAU9tEb68kHaJRxMTzZ6DMeqyWsLJ5OyVkpxWBFBk0MFftu3zq2e+snxu8kHew6SuPqqpEbJiiRhH2pRQv2Qm9yTPuNJz14ip/yDw8v6+4z5BPcK56azjB/NDHzoMS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mizm8038; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mizm8038"
Date: Tue, 3 Jun 2025 10:29:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748971794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f/DQf1x6I31oeApBRZfoUsma0VTKN1+fkRmQ0qgmY0s=;
	b=mizm8038bFZpD4Nm3NwtDzDJO6adEogcjWCclc6Ie//akw7hFwcQTx6/e9xz6sy15mosGe
	KHREMWuZnwh4e4vkLUNii1HY1lO5XL8Cxnt9iOKQQsvawwr1Kb0z8UtAih63G6KZNcxyaL
	Ebh6fDugT5WzOh+XLJgy4SxM5RLYC+Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	donettom@linux.ibm.com, aboorvad@linux.ibm.com, sj@kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix the inaccurate memory statistics issue for users
Message-ID: <obfnlpvc4tmb6gbd4mw7h7jamp3kouyhnpl4cusetyctswznod@yr6dyrsbay6w>
References: <4f0fd51eb4f48c1a34226456b7a8b4ebff11bf72.1748051851.git.baolin.wang@linux.alibaba.com>
 <20250529205313.a1285b431bbec2c54d80266d@linux-foundation.org>
 <aDm1GCV8yToFG1cq@tiehlicka>
 <72f0dc8c-def3-447c-b54e-c390705f8c26@linux.alibaba.com>
 <aD6vHzRhwyTxBqcl@tiehlicka>
 <ef2c9e13-cb38-4447-b595-f461f3f25432@linux.alibaba.com>
 <aD7OM5Mrg5jnEnBc@tiehlicka>
 <7307bb7a-7c45-43f7-b073-acd9e1389000@linux.alibaba.com>
 <aD8LKHfCca1wQ5pS@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD8LKHfCca1wQ5pS@tiehlicka>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 03, 2025 at 04:48:08PM +0200, Michal Hocko wrote:
> On Tue 03-06-25 22:22:46, Baolin Wang wrote:
> > Let me try to clarify further.
> > 
> > The 'mm->rss_stat' is updated by using add_mm_counter(),
> > dec/inc_mm_counter(), which are all wrappers around
> > percpu_counter_add_batch(). In percpu_counter_add_batch(), there is percpu
> > batch caching to avoid 'fbc->lock' contention. 
> 
> OK, this is exactly the line of argument I was looking for. If _all_
> updates done in the kernel are using batching and therefore the lock is
> only held every N (percpu_counter_batch) updates then a risk of locking
> contention would be decreased. This is worth having a note in the
> changelog.
> 
> > This patch changes task_mem()
> > and task_statm() to get the accurate mm counters under the 'fbc->lock', but
> > this will not exacerbate kernel 'mm->rss_stat' lock contention due to the
> > the percpu batch caching of the mm counters.
> > 
> > You might argue that my test cases cannot demonstrate an actual lock
> > contention, but they have already shown that there is no significant
> > 'fbc->lock' contention when the kernel updates 'mm->rss_stat'.
> 
> I was arguing that `top -d 1' doesn't really represent a potential
> adverse usage. These proc files are generally readable so I would be
> expecting something like busy loop read while process tries to update
> counters to see the worst case scenario. If that is barely visible then
> we can conclude a normal use wouldn't even notice.
> 

Baolin, please run stress-ng command that stresses minor anon page
faults in multiple threads and then run multiple bash scripts which cat
/proc/pidof(stress-ng)/status. That should be how much the stress-ng
process is impacted by the parallel status readers versus without them.
