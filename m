Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992451885BE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781200; cv=none; b=k9d7J/r/8QuMS18R7fQJ17vq5HIhbEMIAFQvhjOSKx/IRrJq7Yz+x5j+PGENGCSdN/K+3HrZByhQZhKRciOhMk7pIN0YAn8u3JgV9r1VIghRDZY6vc3Ku76poQ7aNZvvgNpM5jz+ahknY5rsb9wAMdAaZnBoadeAk0XZOmyX3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781200; c=relaxed/simple;
	bh=T8gMU+/K/kbLdkGaqF6WLCgq2VbFATFRi22ywpXb88M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA3n/Lm4Fy7VXTDRp2VS4LgbBmIHZjtohE5hixCSHpH7xTuO3Uuh3/JdMUA8rCavY/uMLBaPOHPp2wcSAOBcSYKJqwrqLzpmIc0YSMeDh+yPm5igSTBahkd0UqPOhLTdCQTKssYzJ+wGJNKVWGEd3wkk5PUsAbEI24bcYnL53l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LDMufWY0; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LDMufWY0"
Date: Wed, 5 Feb 2025 10:46:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738781186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3B9HQgB2lIvdMoF93udk/hVUhWsuTPXwL/Y7LyVovXo=;
	b=LDMufWY0oZe5avAFVRX64ZYoQyVuQVUR2X6Wdfc81YHSt0wFIuqtPi9ncq36PayNjrTtKE
	DgmwR1AtGgEtZR0ZKSVqiB8OoYCEPfIxIqcv1967BzVGcWFFPldHbrPaJ0cRyY/MiTKM/B
	bT8OX7JwOnHt33s3irUY8nZabDq9wYs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, linux-mm@kvack.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Allen Pais <apais@linux.microsoft.com>, 
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: A path forward to cleaning up dying cgroups?
Message-ID: <7nqk5crpp7wi65745uiqgpvlomy3cyg3oaimaoz4fg2h4mf7jp@zclymjsovknp>
References: <Z6OkXXYDorPrBvEQ@hm-sls2>
 <ccd67fd2-268a-4e83-9491-e401fa57229c@linux.microsoft.com>
 <20250205180842.GC1183495@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205180842.GC1183495@cmpxchg.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Feb 05, 2025 at 01:08:42PM -0500, Johannes Weiner wrote:
> On Wed, Feb 05, 2025 at 12:50:19PM -0500, Hamza Mahfooz wrote:
> > Cc: Shakeel Butt <shakeel.butt@linux.dev>
> > 
> > On 2/5/25 12:48, Hamza Mahfooz wrote:
> > > I was just curious as to what the status of the issue described in [1]
> > > is. It appears that the last time someone took a stab at it was in [2].
> 
> If memory serves, the sticking point was whether pages should indeed
> be reparented on cgroup death, or whether they could be moved
> arbitrarily to other cgroups that are still using them.
> 
> It's a bit unfortunate, because the reparenting patches were tested
> and reviewed, and the arbitrary recharging was just an idea that
> ttbomk nobody seriously followed up on afterwards.
> 
> We also recently removed the charge moving code from cgroup1, along
> with the subtle page access/locking/accounting rules it imposed on the
> rest of the MM. I'm doubtful there is much appetite in either camp for
> bringing this back.
> 
> So I would still love to see Muchun's patches merged. They fix a
> seemingly universally experienced operational issue in memcg, and we
> shouldn't hold it up unless somebody actually posts alternative code.
> 
> Thoughts?

I think the recharging (or whatever the alternative) can be a followup
to this. I agree this is a good change.
