Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D861D1F8AE2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188007; cv=none; b=NL88nJTr6dhKYGL6Df9qPUyYu1pdliHfFSSyf2SCIqMzSEbO1gFCihFLDUTQlNQmY2Gb5HYub/dnWIJaEWK+9yrmynZWsu8lEmy5B8AyliXkyUVKAQaMDhebHmwuodE0RpuXE/rI8FXxuON5nn6zSCm0IrQhVHuyvmFegpcHz7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188007; c=relaxed/simple;
	bh=eNTpsAJhLALvxRd0NaX/jpg1TUnh6W/8SH2xQ8wggr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ0Q9ApdsOsQCsvqkv0to+EJ6D8KBoDdt4EggQ/jPyDqlsCwqoB+D0TDvN5UzuWh9aqovXXyrvccKeKm4mGrvp6yBlI5MM0t9pIGu5QiJV9TmCJ3L9UNrPTuFKNATxpNqD+b7OElxj15A85a5tggnP8eSVOMrOgOEWlZtmE26JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJkv4biH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJkv4biH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06133C4CED1;
	Mon, 10 Feb 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739188007;
	bh=eNTpsAJhLALvxRd0NaX/jpg1TUnh6W/8SH2xQ8wggr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJkv4biHjaeHXaG/QR8gKwCbXflI5PUDYBm55bAuUpuV7zUXqEFHWNztkKJBbVoSJ
	 YVoANOBxvENm25SPqWWXLXm3lOT5WAByGDv6kW13qo9yrMlTRAGV/beF5eGQc+1IAk
	 fGXiD1GaTk60KNcyni8YyVPkmubGL6xy+Nth1x9ZgCIp+3kCHbLiySqeB8YPuv19Zc
	 jAr0jTqpCTSnfLXQhP4TGokcrTEUaN6xCj5HUESzXnFu26c9Tb5ChG84Mi5CiOiBQA
	 BEgGLu5zVgVlaPW6wDn6RVRXCwFtrpV8mOHD/rUeqIHL68vcZNyySer7A8gHm9hIAp
	 2q7XbNyQPF3Sw==
Date: Mon, 10 Feb 2025 12:46:44 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on
 nohz_full CPUs
Message-ID: <Z6nnJEpL8pPVtvAj@localhost.localdomain>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250210105028.2134-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210105028.2134-1-hdanton@sina.com>

Le Mon, Feb 10, 2025 at 06:50:26PM +0800, Hillf Danton a écrit :
> On Sun,  9 Feb 2025 23:30:04 +0100 Frederic Weisbecker <frederic@kernel.org>
> > @@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
> >  {
> >  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> >  
> > +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> > +		return false;
> > +
> >  	/* Check these in order of likelihood that they're not zero */
> >  	return folio_batch_count(&fbatches->lru_add) ||
> >  		folio_batch_count(&fbatches->lru_move_tail) ||
> > -- 
> > 2.46.0
> 
> Nit, I'd like to add a debug line to test your assumption that
> isolated tasks are pinned to a single nohz_full CPU.
> 
> --- x/mm/swap.c
> +++ y/mm/swap.c
> @@ -767,9 +767,10 @@ static void lru_add_drain_per_cpu(struct
>  static bool cpu_needs_drain(unsigned int cpu)
>  {
>  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> +	bool yes;
>  
>  	/* Check these in order of likelihood that they're not zero */
> -	return folio_batch_count(&fbatches->lru_add) ||
> +	yes = folio_batch_count(&fbatches->lru_add) ||
>  		folio_batch_count(&fbatches->lru_move_tail) ||
>  		folio_batch_count(&fbatches->lru_deactivate_file) ||
>  		folio_batch_count(&fbatches->lru_deactivate) ||
> @@ -777,6 +778,12 @@ static bool cpu_needs_drain(unsigned int
>  		folio_batch_count(&fbatches->lru_activate) ||
>  		need_mlock_drain(cpu) ||
>  		has_bh_in_lru(cpu, NULL);
> +
> +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE)) {
> +		VM_BUG_ON(yes);
> +		return false;
> +	}
> +	return yes;

If the task isn't pinned then the guarantees of nohz_full are broken anyway.
Also if the task migrates it will simply execute the work elsewhere.

My only worry is kernel threads. Those are simply ignored in this patchset but
this is not right as they can do allocations. Yet they can't execute anything
on return to userspace...

Thoughts?

Thanks.

>  }
>  
>  /*
> 
