Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A091DE4E6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669686; cv=none; b=bTVpVh1to5EuhuZ1islhtqcb1DN0t8zcQVBqE0zRjfWHFHxeP4CPb5d2iVpVvqt01xVyCQLkmG4JzVOaq+xiveFa7twb0QMXlkVJDq++zqpSLKt58mTMh5LAyaGy0AeauU1BD1zmCzDkA6khB7Dhk4jH5rY6dUVuB1czuQ8IklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669686; c=relaxed/simple;
	bh=0uapk+DWD0XhgZbzznjCzzbg/PQmzRBtyEufS/bjRHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt6nOS20AFvd0pjQb5yVC95/7cb5MfWmbw+aVKMTMSTqvbnbUCz8eZyb3YHYK+2S/R/j6LggSxWSYJClg7/catC7+6zhw2YMGQWNCmy5WMCkwgb9THKPwMwgy3AB/ElO/WB8ik0eCjSzjJcxuXVXKPJHWMoZEk3lJaOvJMy6va0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2E94113E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:07:45 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E86923F66E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:08:03 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:07:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] panthor: save panthor_file in panthor_group
Message-ID: <aFkZaoPXkZWaqWID@e110455-lin.cambridge.arm.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
 <20250620235053.164614-3-olvaffe@gmail.com>
 <20250623082122.62f69579@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623082122.62f69579@fedora>

On Mon, Jun 23, 2025 at 08:21:22AM +0200, Boris Brezillon wrote:
> On Fri, 20 Jun 2025 16:50:51 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
> 
> > We would like to access panthor_file from panthor_group on gpu errors.
> > Because panthour_group can outlive drm_file, add refcount to
> > panthor_file to ensure its lifetime.
> 
> I'm not a huge fan of refcounting panthor_file because people tend to
> put resource they expect to be released when the last handle goes away,
> and if we don't refcount these sub-resources they might live longer
> than they are meant to. Also not a huge fan of the circular referencing
> that exists between file and groups after this change.
> 
> How about we move the process info to a sub-object that's refcounted
> and let both panthor_file and panthor_group take a ref on this object
> instead?

I agree with Boris on this. One alternative is to put the pid and comm in
the panthor_group struct as panthor_file makes no use of the fields.

Best regards,
Liviu

> 
> > 
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 16 ++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_drv.c    | 15 ++++++++++++++-
> >  drivers/gpu/drm/panthor/panthor_mmu.c    |  1 +
> >  drivers/gpu/drm/panthor/panthor_sched.c  |  6 ++++++
> >  4 files changed, 37 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 4fc7cf2aeed57..75ae6fd3a5128 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -256,8 +256,24 @@ struct panthor_file {
> >  
> >  	/** @stats: cycle and timestamp measures for job execution. */
> >  	struct panthor_gpu_usage stats;
> > +
> > +	/** @refcount: ref count of this file */
> > +	struct kref refcount;
> >  };
> >  
> > +static inline struct panthor_file *panthor_file_get(struct panthor_file *pfile)
> > +{
> > +	kref_get(&pfile->refcount);
> > +	return pfile;
> > +}
> > +
> > +void panthor_file_release(struct kref *kref);
> > +
> > +static inline void panthor_file_put(struct panthor_file *pfile)
> > +{
> > +	kref_put(&pfile->refcount, panthor_file_release);
> > +}
> > +
> >  int panthor_device_init(struct panthor_device *ptdev);
> >  void panthor_device_unplug(struct panthor_device *ptdev);
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index 775a66c394544..aea9609684b77 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -1393,6 +1393,16 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
> >  	return 0;
> >  }
> >  
> > +void panthor_file_release(struct kref *kref)
> > +{
> > +	struct panthor_file *pfile =
> > +		container_of(kref, struct panthor_file, refcount);
> > +
> > +	WARN_ON(pfile->vms || pfile->groups);
> > +
> > +	kfree(pfile);
> > +}
> > +
> >  static int
> >  panthor_open(struct drm_device *ddev, struct drm_file *file)
> >  {
> > @@ -1426,6 +1436,8 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
> >  	if (ret)
> >  		goto err_destroy_vm_pool;
> >  
> > +	kref_init(&pfile->refcount);
> > +
> >  	file->driver_priv = pfile;
> >  	return 0;
> >  
> > @@ -1442,10 +1454,11 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
> >  {
> >  	struct panthor_file *pfile = file->driver_priv;
> >  
> > +	/* destroy vm and group handles now to avoid circular references */
> >  	panthor_group_pool_destroy(pfile);
> >  	panthor_vm_pool_destroy(pfile);
> >  
> > -	kfree(pfile);
> > +	panthor_file_put(pfile);
> >  }
> >  
> >  static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index b39ea6acc6a96..ccbcfe11420ac 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1604,6 +1604,7 @@ void panthor_vm_pool_destroy(struct panthor_file *pfile)
> >  
> >  	xa_destroy(&pfile->vms->xa);
> >  	kfree(pfile->vms);
> > +	pfile->vms = NULL;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index a2248f692a030..485072904cd7d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -535,6 +535,9 @@ struct panthor_group {
> >  	/** @ptdev: Device. */
> >  	struct panthor_device *ptdev;
> >  
> > +	/** @pfile: File this group is created from. */
> > +	struct panthor_file *pfile;
> > +
> >  	/** @vm: VM bound to the group. */
> >  	struct panthor_vm *vm;
> >  
> > @@ -919,6 +922,7 @@ static void group_release_work(struct work_struct *work)
> >  	panthor_kernel_bo_destroy(group->syncobjs);
> >  
> >  	panthor_vm_put(group->vm);
> > +	panthor_file_put(group->pfile);
> >  	kfree(group);
> >  }
> >  
> > @@ -3467,6 +3471,8 @@ int panthor_group_create(struct panthor_file *pfile,
> >  	INIT_WORK(&group->tiler_oom_work, group_tiler_oom_work);
> >  	INIT_WORK(&group->release_work, group_release_work);
> >  
> > +	group->pfile = panthor_file_get(pfile);
> > +
> >  	group->vm = panthor_vm_pool_get_vm(pfile->vms, group_args->vm_id);
> >  	if (!group->vm) {
> >  		ret = -EINVAL;
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
