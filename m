Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF81DED7C
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243823; cv=none; b=VXtwky1iiKVHeFEMJNYBm5ny9CSNXKegbAlHBG/BQXuZt7m/jFybeygRg4KKIi7Q4AXq/j+3WW+4iX0cvnkb+jEFvK3q/OPrlqHRi3JtUORpRufbg9WTzyayMEtc0H18OjZoMABRnwjnbrHaw0fk+BDuWxNZUMhKIXwrAB9uXYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243823; c=relaxed/simple;
	bh=8gn5LbBQEkFULJ3ZDscL8xrfAhay13lthhQ4R2fzu6c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XL6t3VTlLG+Q9HPzpoCL7pGqwsdzzw4FX52O85AcwFiw0gZIBvpmkoLA2Qumi4207eIktWYlm3OtuSVQimwiAYwLVBwiahi3qIRa7MM5tf1gTvcdsnYEl2mrDzlxYp/+XsA343aFg5y3QMT8cS9EN4dQOe4pL3gcqEP/ItLbSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Yf2vxTeE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yf2vxTeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748243812;
	bh=8gn5LbBQEkFULJ3ZDscL8xrfAhay13lthhQ4R2fzu6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yf2vxTeE8XB/mF1FFWc66WR7Qx5PXfcbQakmz1Hr3A271Oum7mczEEa2YMkIawEz7
	 SorgTiXjXF2TUd6yeKQbDG+GMstn3OIhK53RSMngJfIfvpwD++zyrcUob1GeEtIEye
	 KxLhcN9hyI2BoUHvYIShwPjp2v6Jq9/wS6g/lVQFW+bVk9k9U1DEPt/i/6pZjoV5Ib
	 7qIDp+NMdFFU0KALKUk3/9SUdhKpUCB+L8za5AJFbiN0FoQmsffZgMHd10DRN1tMXA
	 GGyD7R331+gRUZjc0oL1pRCyhibF7glK92b1oCb9+CXSe28zBabogMG5KqFMu5JWHg
	 g2ejRWvPg+ZnA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6B1C17E0E89;
	Mon, 26 May 2025 09:16:51 +0200 (CEST)
Date: Mon, 26 May 2025 09:16:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Ashley Smith <ashley.smith@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, kernel@collabora.com, Daniel Stone
 <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/panthor: Make the timeout per-queue instead of
 per-job
Message-ID: <20250526091646.7020bcff@collabora.com>
In-Reply-To: <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
References: <20250523150815.3066081-1-ashley.smith@collabora.com>
	<CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 May 2025 16:03:37 +0100
Daniel Stone <daniel@fooishbar.org> wrote:

> Hi Ashley,
> 
> On Fri, 23 May 2025 at 16:10, Ashley Smith <ashley.smith@collabora.com> wrote:
> > The timeout logic provided by drm_sched leads to races when we try
> > to suspend it while the drm_sched workqueue queues more jobs. Let's
> > overhaul the timeout handling in panthor to have our own delayed work
> > that's resumed/suspended when a group is resumed/suspended. When an
> > actual timeout occurs, we call drm_sched_fault() to report it
> > through drm_sched, still. But otherwise, the drm_sched timeout is
> > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> > how we protect modifications on the timer.
> >
> > One issue seems to be when we call drm_sched_suspend_timeout() from
> > both queue_run_job() and tick_work() which could lead to races due to
> > drm_sched_suspend_timeout() not having a lock. Another issue seems to
> > be in queue_run_job() if the group is not scheduled, we suspend the
> > timeout again which undoes what drm_sched_job_begin() did when calling
> > drm_sched_start_timeout(). So the timeout does not reset when a job
> > is finished.
> >
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Tested-by: Daniel Stone <daniels@collabora.com>
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")  
> 
> Unfortunately I have to revoke my T-b as we're seeing a pile of
> failures in a CI stress test with this, e.g.
> https://gitlab.freedesktop.org/daniels/mesa/-/jobs/77004047

Note that you need [1] too, which I don't see in your tree. Ashley, a
note for next time: when you have dependencies between patches, like is
the case here, it's usually better to post them in the same patchset,
so that:

1. They are applied in the right order
2. Cherry-pickers/reviewers know that they need to consider both to
have a working branch.

Regards,

Boris

[1]https://lkml.org/lkml/2025/5/15/742
