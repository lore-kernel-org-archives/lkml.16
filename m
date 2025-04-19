Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727E4207F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088549; cv=none; b=nQK/VuEdfFpNGPBYoR/QrehOd7IXkIVMxy5+sfDJc+QXY6Z7+IZXVc9r/ACitS973D5LAAilfjuO8qBcWcBFkd66NlOq/zBqXuj7MfHHsec467LyIymnVFhvi10MEL+FrtM3sWSq8RmenhNNtu50+De+HshoGvbNcgaOShaO3Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088549; c=relaxed/simple;
	bh=24eD9HsUZ7vKwgeNXnA/D+RAVe2asRJVKU/aPVQYrRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGbcm9ayh/GzxaQFHO7DrbnK0UkcG0C+//M2ZQHSNIasBgB3aRGhWYSUJ6cJGI+irM68kbKnviDfViRyCPH87fsD4WEJjI/oXEHRnfdK88Ts69qCg8bsk78TYk99VhNkeVe9qKxllCKICi9MrrKktN8N8RjsM07h7Ez1n4ZzjoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wb8VTJLX; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wb8VTJLX"
Date: Sat, 19 Apr 2025 11:48:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745088535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ApAd7dHfvc/cXoQ6QveWIWCoCJKlspxr8Ja20JxbU3M=;
	b=Wb8VTJLXN2S0qzIP1vjKMSyk03NWvsDhyJfUYQruSzn/bgkivRhLO8BYf5vMgt/iz8grsL
	8mj6Zew7eGxb911EDcYjR5r6+5W07YHSR1HZPXCcOCCE5EyHQrvRU7f+4ATD7vVtjBAPYj
	WPSOi5mVXY7oFKE3dAIphm8V7HVSSqs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, longman@redhat.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, muchun.song@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v3 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <ro3uqeyri65voutamqttzipfk7yiya4zv5kdiudcmhacrm6tej@br7ebk2kanf4>
References: <20250419053824.1601470-1-gourry@gourry.net>
 <20250419053824.1601470-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419053824.1601470-3-gourry@gourry.net>
X-Migadu-Flow: FLOW_OUT

On Sat, Apr 19, 2025 at 01:38:24AM -0400, Gregory Price wrote:
>  
> +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> +{
> +	struct cgroup_subsys_state *css;
> +	unsigned long flags;
> +	struct cpuset *cs;
> +	bool allowed;
> +
> +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
> +	if (!css)
> +		return true;
> +
> +	cs = container_of(css, struct cpuset, css);
> +	spin_lock_irqsave(&callback_lock, flags);

Do we really need callback_lock here? We are not modifying and I am
wondering if simple rcu read lock is enough here (similar to
update_nodemasks_hier() where parent's effective_mems is accessed within
rcu read lock).

> +	/* On v1 effective_mems may be empty, simply allow */
> +	allowed = node_isset(nid, cs->effective_mems) ||
> +		  nodes_empty(cs->effective_mems);
> +	spin_unlock_irqrestore(&callback_lock, flags);
> +	css_put(css);
> +	return allowed;
> +}
