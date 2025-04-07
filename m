Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4665120896C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043385; cv=none; b=Xx/pcTgy5sdLZM/fNKqWRp897I1dARkQYjjBYnIs6OJUjsiy9tPspSuEr6QhseN54tHjqNCSbHbElQg2PLtn92PdjLxp3VpqNd24qiuneG7VGl+kvqI31sk0SR9NWmCwtgZ01ohQky67T4RnzDFkgymZU090KfDvS8oelAdPlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043385; c=relaxed/simple;
	bh=yXMQBu0GyLTPoE3gkFmC2nns5przlZL4HLcX1yZT9K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efbKaQY30FInCDOkftHYVcydt+IHB2qNnNq2/3RrkK6kdDSJtTcZkVXUFwPQ28nuZhMmhbvcEVLkIpj48RncuTm4I8CUtRf6XtUh1Jg/FU0MCfWnLBdV27dsohB6ewgt8xun4QIqyLq1/ixrnKfPE1hWJUp65OuuFNzsTzi+1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3wgLohg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3wgLohg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C86C4CEDD;
	Mon,  7 Apr 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744043385;
	bh=yXMQBu0GyLTPoE3gkFmC2nns5przlZL4HLcX1yZT9K8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Y3wgLohgM6p0/u1FBKyY9LdGDuYN7o1z8zqPiEkjSgLE99KhL9PIqpau83C0DpkM8
	 jpscPof6Lsskj18VSPotDeh349sBQKzsns2ItNlumNcqQzR4MUXEoh/WigKWzVScLy
	 iOVuj55ZjVytajnAzA0MU53rvuWJ6eiE+uFF7rWTTgQMYv3mQ0Cj3DpzC9PhDmZPyS
	 OpG9bZWSV22orn98bUFmRt1N+hVfTiAuCyUOcHUYMiuI7UBS0AF/bhBZc+V+sgIDng
	 8WETA3tjW6rXJ78YldVvLUAuM1kysmp6m2v7eDcXupuQJgYEt4mq0e7yeQQGizcm+Y
	 jGGYiRpphGs2g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BF5DBCE089F; Mon,  7 Apr 2025 09:29:44 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:29:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	kernel test robot <lkp@intel.com>,
	"Feng, Kenneth" <Kenneth.Feng@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of
 ratelimit_state structure's internals
Message-ID: <bcf4ab09-5b87-404c-9231-567a10fd9764@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-4-paulmck@kernel.org>
 <BL1PR12MB5144A3990501E76BB96F9557F7AA2@BL1PR12MB5144.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5144A3990501E76BB96F9557F7AA2@BL1PR12MB5144.namprd12.prod.outlook.com>

On Mon, Apr 07, 2025 at 02:35:59PM +0000, Deucher, Alexander wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Paul E. McKenney <paulmck@kernel.org>
> > Sent: Thursday, April 3, 2025 5:15 PM
> > To: linux-kernel@vger.kernel.org
> > Cc: kernel-team@meta.com; Paul E. McKenney <paulmck@kernel.org>; kernel
> > test robot <lkp@intel.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; Deucher,
> > Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Xinhui Pan <Xinhui.Pan@amd.com>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; amd-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Subject: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of ratelimit_state
> > structure's internals
> >
> > The amdgpu_set_thermal_throttling_logging() function directly accesses the
> > ratelimit_state structure's ->missed field, which work, but which also makes it more
> > difficult to change this field.  Therefore, make use of the ratelimit_state_reset_miss()
> > function instead of directly accessing the ->missed field.
> >
> > Nevertheless, open-coded use of ->burst and ->interval is still permitted, for
> > example, for runtime sysfs adjustment of these fields.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-
> > lkp@intel.com/
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Feel free to take this via whatever tree makes sense for the larger series.  Otherwise, let me know, and I will pick it up.

Thank you, and yes, this does depend on a patch that is earlier in
this series, so I will be happy to carry it.

							Thanx, Paul

> Alex
> 
> 
> > Cc: Kenneth Feng <kenneth.feng@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: <amd-gfx@lists.freedesktop.org>
> > Cc: <dri-devel@lists.freedesktop.org>
> > ---
> >  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > index e8ae7681bf0a3..6adf4e8822108 100644
> > --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > @@ -1663,7 +1663,6 @@ static ssize_t
> > amdgpu_set_thermal_throttling_logging(struct device *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = drm_to_adev(ddev);
> >       long throttling_logging_interval;
> > -     unsigned long flags;
> >       int ret = 0;
> >
> >       ret = kstrtol(buf, 0, &throttling_logging_interval); @@ -1674,18 +1673,12
> > @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
> >               return -EINVAL;
> >
> >       if (throttling_logging_interval > 0) {
> > -             raw_spin_lock_irqsave(&adev->throttling_logging_rs.lock, flags);
> >               /*
> >                * Reset the ratelimit timer internals.
> >                * This can effectively restart the timer.
> >                */
> > -             adev->throttling_logging_rs.interval =
> > -                     (throttling_logging_interval - 1) * HZ;
> > -             adev->throttling_logging_rs.begin = 0;
> > -             adev->throttling_logging_rs.printed = 0;
> > -             adev->throttling_logging_rs.missed = 0;
> > -             raw_spin_unlock_irqrestore(&adev->throttling_logging_rs.lock,
> > flags);
> > -
> > +             ratelimit_state_reset_interval(&adev->throttling_logging_rs,
> > +                                            (throttling_logging_interval - 1) * HZ);
> >               atomic_set(&adev->throttling_logging_enabled, 1);
> >       } else {
> >               atomic_set(&adev->throttling_logging_enabled, 0);
> > --
> > 2.40.1
> 
