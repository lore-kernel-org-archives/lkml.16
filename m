Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C7258CC1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627955; cv=none; b=g4xArUr7Ny9A3D+2VwuTcVqhn00AIUBSLHef8+Qu7q+yc51wwXWyXk96PViDQFbIMRhWwP6MgPkUQqtMGPzm5E8HHnB6WBNZW15F9U4x1pRT34pTHs7vyQxV8DNHEFYK2lpBQgluQTYrdQ2w0z42Vnk3IXMxdWA8ZHZgXn7Ka8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627955; c=relaxed/simple;
	bh=QdL9SjrGRnihVvSpoqL7V1MZ+Id0oxj48vooafPkONI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPCIh8d99Ky0vQbM35yU2l2KmPwBGFsT+rqYDpxkWR95r7ocs2Nnr4lOvwK83NB/jDuSv2kWGgjvEXwXZXNLECWEiY4/l2t0mZm1rilI0AsKwbYPgOa7OzFnWM11/4+4toxiqfVhoHJ+/ThY9jYfSAS31DN3jrfmmzaZNnQM3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oez4XtBO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oez4XtBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746627951;
	bh=QdL9SjrGRnihVvSpoqL7V1MZ+Id0oxj48vooafPkONI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oez4XtBOg8ZWSf7aYD03PdM/1bpvw4W0lDazOR2KCypkNMPblNlALNsePSBXLSUYt
	 tbHyKb92slx17n8h4vTDgHRiQ8vftL9o6+zKVphFzMkeNFiSI72FS4hhTjt09TXvbV
	 2d/ov8iAJm/p3jN4R3P45bc/oehQmg6KqJ8po0VCmxBAf7RpAugLppY6antTT1WKGt
	 bI5+fykS16cK+WiKBw4HKpAhEanfmEJhQBP+3jg/RsH94GTguPEEMKQD4iywTJKC1I
	 ulAOpFIT6NaFTvf4HQgwrLe+KyS2uNPrYBHfOkwF/gP4Q+aIGUwdma/v0BSGXkr+RB
	 pVGj5M28z4NTg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F95317E0286;
	Wed,  7 May 2025 16:25:51 +0200 (CEST)
Date: Wed, 7 May 2025 16:25:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Message-ID: <20250507162545.3475be0d@collabora.com>
In-Reply-To: <3mdoa5wslxmpp4jsjhtwgdkqqqjcovudy3ge45lye2i4eiruby@hpxkzhulpdvs>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
	<20250424022138.709303-2-adrian.larumbe@collabora.com>
	<20250506085453.0fbb5a02@collabora.com>
	<3mdoa5wslxmpp4jsjhtwgdkqqqjcovudy3ge45lye2i4eiruby@hpxkzhulpdvs>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 7 May 2025 14:01:04 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 06.05.2025 08:54, Boris Brezillon wrote:
> > On Thu, 24 Apr 2025 03:21:30 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > =20
> > > Unlike in Panthor, from where this change is based on, there is no ne=
ed
> > > to support tagging of BO's other than UM-exposed ones, so all strings
> > > can be freed with kfree().
> > >
> > > This commit is done in preparation of a following one that will allow
> > > UM to set BO labels through a new ioctl().
> > >
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
> > >  drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
> > >  2 files changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/dr=
m/panfrost/panfrost_gem.c
> > > index 963f04ba2de6..a7a29974d8b1 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > > @@ -1,6 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > >
> > > +#include <linux/cleanup.h>
> > >  #include <linux/err.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/dma-buf.h>
> > > @@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem=
_object *obj)
> > >  	 */
> > >  	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
> > >
> > > +	kfree(bo->label.str);
> > > +	mutex_destroy(&bo->label.lock);
> > > +
> > >  	if (bo->sgts) {
> > >  		int i;
> > >  		int n_sgt =3D bo->base.base.size / SZ_2M;
> > > @@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object=
(struct drm_device *dev, size_t
> > >  	mutex_init(&obj->mappings.lock);
> > >  	obj->base.base.funcs =3D &panfrost_gem_funcs;
> > >  	obj->base.map_wc =3D !pfdev->coherent;
> > > +	mutex_init(&obj->label.lock);
> > >
> > >  	return &obj->base.base;
> > >  }
> > > @@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_de=
vice *dev,
> > >
> > >  	return obj;
> > >  }
> > > +
> > > +void
> > > +panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
> > > +{
> > > +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> > > +	const char *old_label;
> > > +
> > > +	scoped_guard(mutex, &bo->label.lock) {
> > > +		old_label =3D bo->label.str;
> > > +		bo->label.str =3D label;
> > > +	}
> > > +
> > > +	kfree(old_label);
> > > +}
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/dr=
m/panfrost/panfrost_gem.h
> > > index 7516b7ecf7fe..c0be2934f229 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> > > @@ -41,6 +41,20 @@ struct panfrost_gem_object {
> > >  	 */
> > >  	size_t heap_rss_size;
> > >
> > > +	/**
> > > +	 * @label: BO tagging fields. The label can be assigned within the
> > > +	 * driver itself or through a specific IOCTL.
> > > +	 */
> > > +	struct {
> > > +		/**
> > > +		 * @label.str: Pointer to NULL-terminated string,
> > > +		 */
> > > +		const char *str;
> > > +
> > > +		/** @lock.str: Protects access to the @label.str field. */
> > > +		struct mutex lock;
> > > +	} label; =20
> >
> > Can we do as we did in panthor, and put those fields in the debugfs
> > field. =20
>=20
> BO labelling fields must be present outside of DebugFS builds.

Hm, right. I see those are not in an #ifdef CONFIG_DEBUGFS section in
panthor. I don't really see a good reason to store labels if we don't
have a way to retrieve/display them, but I guess that'd make sense if
we introduce a GET_LABEL ioctl.

>=20
> > +
> >  	bool noexec		:1;
> >  	bool is_heap		:1;
> >  };
> > @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct pa=
nfrost_gem_object *bo);
> >  int panfrost_gem_shrinker_init(struct drm_device *dev);
> >  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> >
> > +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *la=
bel);
> > +
> >  #endif /* __PANFROST_GEM_H__ */ =20
>=20
>=20
> Adrian Larumbe

