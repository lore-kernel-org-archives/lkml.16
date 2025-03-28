Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0717BCE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171908; cv=none; b=o1jxDoQ4C18lvKY9e/Sq8hJTS2K/7sU7gkIGAysZIhlKd3Z4cIiJ+n51lLuJOOa9MXGkcrVNYSgS3Te5shgiNovGYHjlLHpidl+3D/tmlKjlwrNYH6UWZy+6DujfVUwrQqyq+Nq6FqGc9u3Ht4eSfeLvfHp7CltcEuxy9q9Td2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171908; c=relaxed/simple;
	bh=yqjLRrrzJxZTT5NXzG3xCiModk9KppYPUkIwr7crgwk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbFRl9JYvr7dyffTaG7h3YO8/9EZZCUvMPuf7/9S7YDxAR7+scOcDwf/0et9hft9qFt/LWcI3KxcVAWZY5QYHqDsehOfcoHMMFDIfOeISX0fmOhlfH5/j8AkJ7SDFk7THPaP275zZcrGPcv65BJg6TpWOZQgGDQM5giywFvSMqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A9oxizvF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A9oxizvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743171904;
	bh=yqjLRrrzJxZTT5NXzG3xCiModk9KppYPUkIwr7crgwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A9oxizvFRVgjOtwLlU6QgIH62TlkTBpPaV2ubbLVCc56L1F78PBv8qVYIeUzKLR+C
	 f5PJPCzJzEVwT6rCHM1VxQCcRclpao+EK/m4M2iU+ai8fK7PAjodCsTrZu8s2JsVx2
	 jP0+E+goEIUoWuL2LXMySK9Au7gtY20EbfHBR2J9r5WzITuur5qeqxkrL9YquG9HfG
	 ofOVi0ykMW7XNUpFO+mn7UqEihfliJQrkAm6ZRDtNE7ftKSbylOGw3ETQBSA/g8duI
	 u87HoR9ZUxh7kveDU/o3yphbyRXY32YbM6ae5AoLsVuAyXnGWb9ID1JB/rgKWaocbO
	 giFDX8RzC0hKQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B594A17E0385;
	Fri, 28 Mar 2025 15:25:03 +0100 (CET)
Date: Fri, 28 Mar 2025 15:24:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panthor: Display heap chunk entries in
 DebugFS GEMS file
Message-ID: <20250328152458.0f2b119b@collabora.com>
In-Reply-To: <6jrrlbfis3nmd73grbzrtachh3uumgsnxsjpuqcekhcrmm7raj@wavtspjexwzu>
References: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
	<20250319150953.1634322-5-adrian.larumbe@collabora.com>
	<20250319180013.4d0165c1@collabora.com>
	<6jrrlbfis3nmd73grbzrtachh3uumgsnxsjpuqcekhcrmm7raj@wavtspjexwzu>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025 13:18:47 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 19.03.2025 18:00, Boris Brezillon wrote:
> > On Wed, 19 Mar 2025 15:03:19 +0000
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > =20
> > > Expand the driver's DebugFS GEMS file to display entries for the heap
> > > chunks' GEM objects, both those allocated at heap creation time throu=
gh an
> > > ioctl(), or in response to a tiler OOM event.
> > >
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_gem.c  | 22 +++++++++++-----------
> > >  drivers/gpu/drm/panthor/panthor_gem.h  |  2 ++
> > >  drivers/gpu/drm/panthor/panthor_heap.c |  3 +++
> > >  3 files changed, 16 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/=
panthor/panthor_gem.c
> > > index f7eb413d88e7..252979473fdf 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > @@ -22,16 +22,6 @@ static void panthor_gem_debugfs_bo_init(struct pan=
thor_gem_object *bo)
> > >  	get_task_comm(bo->gems.creator.process_name, current->group_leader);
> > >  }
> > >
> > > -static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> > > -{
> > > -	struct panthor_device *ptdev =3D  container_of(bo->base.base.dev,
> > > -						     struct panthor_device, base);
> > > -
> > > -	mutex_lock(&ptdev->gems.lock);
> > > -	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> > > -	mutex_unlock(&ptdev->gems.lock);
> > > -}
> > > -
> > >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> > >  {
> > >  	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> > > @@ -44,10 +34,20 @@ static void panthor_gem_debugfs_bo_rm(struct pant=
hor_gem_object *bo)
> > >  	list_del_init(&bo->gems.node);
> > >  	mutex_unlock(&ptdev->gems.lock);
> > >  }
> > > +
> > > +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> > > +{
> > > +	struct panthor_device *ptdev =3D  container_of(bo->base.base.dev,
> > > +						     struct panthor_device, base);
> > > +
> > > +	mutex_lock(&ptdev->gems.lock);
> > > +	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> > > +	mutex_unlock(&ptdev->gems.lock);
> > > +}
> > >  #else
> > >  static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *b=
o) {}
> > > -static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo=
) {}
> > >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)=
 {}
> > > +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {} =20
> >
> > Let's just define all these helpers as inline functions in
> > panthor_gem.h in patch 3. =20
>=20
> The only function that can so far be used from a different compilation un=
it is 'add'.
> The other two are internal to panthor_gem.c, so I'm incluned to keep them=
 there as static
> functions, but move 'add' into the header file as a static inline functio=
n instead.

I'd really prefer if those were defined next to each other, and given
how short/simple they are, I don't see a good reason to hide them.

>=20
> > >  #endif
> > >
> > >  static void panthor_gem_free_object(struct drm_gem_object *obj)
> > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/=
panthor/panthor_gem.h
> > > index 7c896ec35801..e132f14bbef8 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > > @@ -132,6 +132,8 @@ panthor_gem_create_with_handle(struct drm_file *f=
ile,
> > >  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char=
 *label);
> > >  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, c=
onst char *label);
> > >
> > > +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo);
> > > +
> > >  static inline u64
> > >  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
> > >  {
> > > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm=
/panthor/panthor_heap.c
> > > index db0285ce5812..73cf43eb4a7b 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > > @@ -180,6 +180,9 @@ static int panthor_alloc_heap_chunk(struct pantho=
r_device *ptdev,
> > >  	heap->chunk_count++;
> > >  	mutex_unlock(&heap->lock);
> > >
> > > +	panthor_gem_kernel_bo_set_label(chunk->bo, "\"Tiler heap chunk\"");
> > > +	panthor_gem_debugfs_bo_add(to_panthor_bo(chunk->bo->obj)); =20
> >
> > I'd be tempted to label all the kernel BOs, not just the heap chunks,
> > and if we do that, we're probably better off changing the
> > kernel_bo_create() prototype to pass a label. =20
>=20
> I think is a good idea going forward, but in keeping things tight I'd say=
 doing it now
> might be an overkill, since the only user of tagged BO's at the moment is=
 the gem debugfs
> knob.
>=20
> I think if in the future we find new ways of accounting or displaying lab=
elled kernel BO's
> other than heap chunks, then we can expand the kernel_bo_create() argumen=
t list and then
> tag every single one of them at creation time.

Yeah, actually I'm questioning the fact we don't register all BOs to
the debugfs list now. If it's going to be a debugfs interface, I don't
really see a good reason for hiding some but exposing others.
important to show.
