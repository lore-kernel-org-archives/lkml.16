Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1430E853
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447230; cv=none; b=RTuUc6Igc6sav2X31uVV64cPlzrSzZBK+ZetApWbO9fqRE/frGG1GKi9xL68Ro6fyk2FozgOc5L+yfbERiRqY6JtiPWKRj/WTeyUIAjh4NyIqcc3boweudMQTvPe6X57nEXFqTP86saPeplOum6uqiKDUGRMZrPw2sVSMTO3E1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447230; c=relaxed/simple;
	bh=55bItDRKsEjta8AJoEOfJnHPqiu8Ki/FFhVlTFtLGGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxbzORHHHrULPME2arJeJN38AEpCyGG6xZppv6cF+vFCmgIm7GpPyLAhy1xMrqfytjE2yzutBhhwqJ3V59+GJ1+aC6+sbE88ITZNnpue7FOTxP+R9WMudBYQJw06ilP5OGtvppDXCEjOhKCeU/tqkwiQO9A/tSAyV7gzlL8MvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hJ8xgjPB; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hJ8xgjPB"
Date: Fri, 20 Jun 2025 12:19:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750447223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wnb3+7YYcQmzZi1LFKUlaCTanC4q+OnEMohvdbsaXwc=;
	b=hJ8xgjPBHxe3UrDZ/68RSk+PFt/sTs+vBLnNwcD1ZfxbCn5wmHyn128t3GwTlvhrv35UWL
	4FOI9x0NLpQv4D+TH/acL5VnSQ8+k12QZSlvDE7MvZOLjK5rH/3jFE4cBgpBMrhMukp/Wu
	qjbWaJJLQZVyJTlccctzQYL5VMiRWdQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 05/27] memcg: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <ps3ld3lvabkdonldljtscmq5kgvwk4zr6qxwxmy2v4sibv6hl5@xohjmnrqgmpe>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-6-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620152308.27492-6-frederic@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jun 20, 2025 at 05:22:46PM +0200, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifyable at
> runtime. In order to synchronize against memcg workqueue to make sure
> that no asynchronous draining is pending or executing on a newly made
> isolated CPU, read-lock the housekeeping rwsem lock while targeting
> and queueing a drain work.
> 
> Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
> workqueue flush will also be issued in a further change to make sure
> that no work remains pending after a CPU had been made isolated.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
