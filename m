Received: from mail114-241.sinamail.sina.com.cn (mail114-241.sinamail.sina.com.cn [218.30.114.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049E1B2182
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.114.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273554; cv=none; b=IR32ce1CDuNXVWBizjZK+9ZAizi9Clws1bSz2Ayaol2oP/WrBkYeViHjkxI+i0KWT6qo3QUdH96XsAVDM/yAZj+QNFYnxiVcnqoWDI1ZNpJHa1MxH//8/ZOgAspLZn4WSktKN/Q6SJdYeqIcrksJ+Rk7+4hFjp5xgpnD0ZU4DNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273554; c=relaxed/simple;
	bh=RKw2rxKkxkbRdLhjV2yfcyb87Yijf8xys3f1r7YMp70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8xtPHb8kcpTTh06pU/h7JTwMQKUnDcJQBWWnOIbWVKLJPXsTkJpi53YMEuGJRDz88dMvOoXVTeYgBo5GJl/U8ij7H0QpEdTjv3YHLMeIt3eaIggEqbEpK5u5Fdqr7hGGYU35fMayhta3Oj3KUkDdrxU+O68IuT9Y1V/zWUANsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.114.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.71])
	by sina.com (10.185.250.23) with ESMTP
	id 67AB351D00002393; Tue, 11 Feb 2025 19:31:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7774448913581
X-SMAIL-UIID: EAE02422860949019E53CEEEC6ACCC64-20250211-193143-1
From: Hillf Danton <hdanton@sina.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
Date: Tue, 11 Feb 2025 19:31:31 +0800
Message-ID: <20250211113133.2176-1-hdanton@sina.com>
In-Reply-To: <Z6nnJEpL8pPVtvAj@localhost.localdomain>
References: <20250209223005.11519-1-frederic@kernel.org> <20250210105028.2134-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Feb 2025 12:46:44 +0100 Frederic Weisbecker
> Le Mon, Feb 10, 2025 at 06:50:26PM +0800, Hillf Danton
> > On Sun,  9 Feb 2025 23:30:04 +0100 Frederic Weisbecker <frederic@kernel.org>
> > > @@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
> > >  {
> > >  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> > >  
> > > +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> > > +		return false;
> > > +
> > >  	/* Check these in order of likelihood that they're not zero */
> > >  	return folio_batch_count(&fbatches->lru_add) ||
> > >  		folio_batch_count(&fbatches->lru_move_tail) ||
> > > -- 
> > > 2.46.0
> > 
> > Nit, I'd like to add a debug line to test your assumption that
> > isolated tasks are pinned to a single nohz_full CPU.
> > 
> > --- x/mm/swap.c
> > +++ y/mm/swap.c
> > @@ -767,9 +767,10 @@ static void lru_add_drain_per_cpu(struct
> >  static bool cpu_needs_drain(unsigned int cpu)
> >  {
> >  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> > +	bool yes;
> >  
> >  	/* Check these in order of likelihood that they're not zero */
> > -	return folio_batch_count(&fbatches->lru_add) ||
> > +	yes = folio_batch_count(&fbatches->lru_add) ||
> >  		folio_batch_count(&fbatches->lru_move_tail) ||
> >  		folio_batch_count(&fbatches->lru_deactivate_file) ||
> >  		folio_batch_count(&fbatches->lru_deactivate) ||
> > @@ -777,6 +778,12 @@ static bool cpu_needs_drain(unsigned int
> >  		folio_batch_count(&fbatches->lru_activate) ||
> >  		need_mlock_drain(cpu) ||
> >  		has_bh_in_lru(cpu, NULL);
> > +
> > +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE)) {
> > +		VM_BUG_ON(yes);
> > +		return false;
> > +	}
> > +	return yes;
> 
> If the task isn't pinned then the guarantees of nohz_full are broken anyway.
> Also if the task migrates it will simply execute the work elsewhere.
> 
Coding in kernel depends on the smart/stupid activity in user space, but
the dependence sounds no good.

> My only worry is kernel threads. Those are simply ignored in this patchset but
> this is not right as they can do allocations. Yet they can't execute anything
> on return to userspace...
> 
> Thoughts?
