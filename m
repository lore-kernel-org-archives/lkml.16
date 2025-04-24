Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8571DF988
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520942; cv=none; b=d9atnfi6T4y06sbDvAqNIp8KuQuHcX5Nr16dTWQpTOZpZhtuejrRuCZm731JYVWbXsW5o80poLhLb3mZ9kzEfU4y3CLqs14Sf3xt6XLTPMHU1dex4J0PaS7Im99huQgqu9RYsGbQH+eB/uPH4kyIFGKWHMuao55fhjoSjxEDmmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520942; c=relaxed/simple;
	bh=9luXPkAfWQZEy9kxCGlTJcgTCyTtaWkQiVmo6ICzOE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxsrpLnrp60VGcOGIOgRi67wTmn23nk/HhNKYAo2tqg6PqzDrdX8PTBmU+LQdtTnYPKybDWh/pw9JJ6RSxSxwCqscuX84rIaV0JZr3wwA6XOrgG77ZpV0QidF5/ky151m8Qejbn3+OVre9eSQUEvHADDicqX4hn7lOV4s4f3Gmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/3JMN4v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/3JMN4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE7CC4CEE3;
	Thu, 24 Apr 2025 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745520941;
	bh=9luXPkAfWQZEy9kxCGlTJcgTCyTtaWkQiVmo6ICzOE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/3JMN4vSPiEN59Sp3vsLVx8PHKp7jVTWlN1epERz91MJYGvmHhQdD9BAZbIhKkbO
	 rwITqK05hQuIYlh5v6M2T+7MUeYcxQfHQtXWZxGNZNlDvBbJHjUIGPPVocq4/fD+hs
	 KiXNmB5lJC4TuRRcB/1Yj53P9yV5AP2R5jx536CHjs4QizP+FzrCsIWXm/T5DqveZ/
	 BjpklVBizxNq6/8vOcvE+aPWCXxMRsKfLndQE/T/Yb/g9cLHgcwmoJ8u53g53H3yKe
	 jR6CFJc8kldHfJBofG+sKn5RlducYUiqUbdKAr13gPUa7OyxgGu1+bd4ww74hhvzck
	 Bmb8MikF0he0Q==
Date: Thu, 24 Apr 2025 08:55:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Chengming Zhou <chengming.zhou@linux.dev>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/12] sched_ext: Avoid NULL scx_root deref through
 SCX_HAS_OP()
Message-ID: <aAqJLMbmNpnisNcN@slm.duckdns.org>
References: <20250423234542.1890867-1-tj@kernel.org>
 <20250423234542.1890867-3-tj@kernel.org>
 <b9814fec-a9b6-4cd5-a0b1-1c2ddb214a03@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9814fec-a9b6-4cd5-a0b1-1c2ddb214a03@linux.dev>

Hello,

On Thu, Apr 24, 2025 at 03:23:40PM +0800, Chengming Zhou wrote:
> > +	/*
> > +	 * scx_root updates are protected by cpus_read_lock() and will stay
> > +	 * stable here. Note that we can't depend on scx_enabled() test as the
> > +	 * hotplug ops need to be enabled before __scx_enabled is set.
> > +	 */
> > +	if (!scx_root)
> > +		return;
> > +
> >   	if (scx_enabled())
> >   		scx_idle_update_selcpu_topology(&scx_root->ops);
> 
> Just be curious, does the comments added above mean we shouldn't
> check scx_enabled() here anymore?

There are two things happening in the function - calling the idle topology
update function and calling ops.cpu_on/offline(). The former needs both
scx_root and scx_enabled(). The latter only scx_root, so we still need the
additional scx_enabled() check for the former.

Thanks.

-- 
tejun
