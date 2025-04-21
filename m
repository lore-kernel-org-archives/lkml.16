Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D801DE8A8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745256537; cv=none; b=u7Gt+YG5AcfMV47Y0xf9B6/i5HikZL40iDEe69t4l2S7DOJoZmVOSpfqVsrGDqR3M5MD1h9SY+NHmddlAscEwAElJADz9KJe/R0hnY4jIFro7WG9AhXGWaCRzgim9An6SMSs1q1tG5FTx/aRdhAfwrzFKsz7mCipqYr8a1zgRU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745256537; c=relaxed/simple;
	bh=wSD15zZe1xhmLJKxFic7wEhhslrq+k0Kcd4AMKop3I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGYo1hc0nBIvoNYHR7tNtFJ8VWFfCaVn+g4x9nqLEPQr6h7+msLgqqpA9uWS/EcbMRsbNlxr0p+Bm4dQndTQOTcpJHGKZPpATlznKv3KOfVZBK7mYUnpoAxgBTwsJC6Vp0H5T4Snttscg1+xVOVyGo2NDwxMhkYbMgCFx58tf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FwPg2vh6; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FwPg2vh6"
Date: Mon, 21 Apr 2025 10:28:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745256533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vG4L1oHMagTDUnGqJG8Pj6sUOyHcw1R8xhgw+ZpiQQY=;
	b=FwPg2vh6/QXx0x8p+cDPsZYRgoRp1GzFG2qd3JJhdgVc9j7aSpDrd5zJK0XaX2J2clVX3y
	M1uyNlT7F+0yQB7zwvi5uMMFjXBgbiMkg2FD5mmQqU7V74glo+wAq8fCummrAPBl0qjCI4
	UBYbWpJ5L9Bh23t8rPnLug1cw8Mod8o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Thelen <gthelen@google.com>
Cc: Tejun Heo <tj@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: introduce non-blocking limit setting interfaces
Message-ID: <awhadja7fr5uqkhj54mqlbrrcyzjnjhw7wayfa74llamlcd3ya@netfkab3mvee>
References: <20250418195956.64824-1-shakeel.butt@linux.dev>
 <CAHH2K0as=b+EhxG=8yS9T9oP40U2dEtU0NA=wCJSb6ii9_DGaw@mail.gmail.com>
 <ohrgrdyy36us7q3ytjm3pewsnkh3xwrtz4xdixxxa6hbzsj2ki@sn275kch6zkh>
 <aALNIVa3zxl9HFK5@google.com>
 <nmdwfhfdboccgtymfhhcavjqe4pcvkxb3b2p2wfxbfqzybfpue@kgvwkjjagqho>
 <aAMVWsFbht3MdMEk@slm.duckdns.org>
 <rgze2xgrslssxoe7k3vcfg6fy2ywe4jowvwlbdsxrcrvhmklzv@jhyomycycs4n>
 <xr93ecxlsauy.fsf@gthelen-cloudtop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xr93ecxlsauy.fsf@gthelen-cloudtop.c.googlers.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Apr 21, 2025 at 10:06:13AM -0700, Greg Thelen wrote:
> Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> > On Fri, Apr 18, 2025 at 05:15:38PM -1000, Tejun Heo wrote:
> > > On Fri, Apr 18, 2025 at 04:08:42PM -0700, Shakeel Butt wrote:
> > > > Any reasons to prefer one over the other? To me having separate
> > > > files/interfaces seem more clean and are more script friendly. Also
> > > > let's see what others have to say or prefer.
> 
> > > I kinda like O_NONBLOCK. The subtlety level of the interface seems
> > > to match
> > > that of the implemented behavior.
> 
> 
> > Ok, it seems like more people prefer O_NONBLOCK, so be it. I will send
> > v2 soon.
> 
> > Also I would request to backport to stable kernels. Let me know if
> > anyone have concerns.
> 
> I don't feel strongly, but I thought LTS was generally intended for bug
> fixes. So I assume that this new O_NONBLOCK support would not be LTS
> worthy.
> 

I got the request asking for this behavior for distributions on older
LTS kernels and I think it is solving a real user pain, so worth
backporting to stable kernels.
