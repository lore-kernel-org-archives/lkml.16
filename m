Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9541531E3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746514503; cv=none; b=tSX7h6Yof66zBJAt/4Tfy0lgnNQuIeawtr+Dq73C+bvJdY8v5AsIuG7GUEIPqLx68c8sMOmZihbmaz21ylAxuE7ost6teBhJ+M6evuhG/NBaSfiJ+WuezvjY0b7j8IRi0neYJW3UoYzUUACRiBG0SVYWBlouCuJvKBfolJGReoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746514503; c=relaxed/simple;
	bh=nrkTI1dtM+WwFCGzBvosSQ3soD/yxe2Tp6eXOwg3j/M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmTj3BFB9WlR52you51pMXaXcBIrA5oFhG+fqmdKpou36SDnWiFzlPz2SqsnHXozumVpKG/PRyLrGOyHgPJ4I/SEOaAtgGglpR+//pFsnAGm2rv7cxmYNyLDi1/r/BcP4LNn1zzWONpEZtHLNqCYXSwCJzLiWFXfyU/DXZLZXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AL9rdBUU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AL9rdBUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746514498;
	bh=nrkTI1dtM+WwFCGzBvosSQ3soD/yxe2Tp6eXOwg3j/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AL9rdBUUXQv0Oi9RIrle4b87b87egDvKTvo1u++JUgX93WfMUTSMbPMRKg83ex5MB
	 bpluDFyzMa99YgAgz7Ba1JtmrywEjRiC9u9g7opoGQt9hGvlt5uG/wepfK3EbxcxWE
	 E6ZGJaAjXX2z1zWiKifCUKV7VRA9hqazm245ho/3UkjIONv5eRoMGYyes5xEK2shP5
	 szLgUgd4zHoClLAeCutQlmy650AaaMCIp6i2j/q1qcSct2on/iVomMToB3EjehgPnf
	 P0KSRwiAQkb1VRSl3esHMweqBRN1TBn/NIu7hRwIykSji5+XW4ZjjJUFYfBrJh3v4E
	 v76BobNSlONIg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66CE517E0630;
	Tue,  6 May 2025 08:54:58 +0200 (CEST)
Date: Tue, 6 May 2025 08:54:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Message-ID: <20250506085453.0fbb5a02@collabora.com>
In-Reply-To: <20250424022138.709303-2-adrian.larumbe@collabora.com>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
	<20250424022138.709303-2-adrian.larumbe@collabora.com>
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

On Thu, 24 Apr 2025 03:21:30 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Unlike in Panthor, from where this change is based on, there is no need
> to support tagging of BO's other than UM-exposed ones, so all strings
> can be freed with kfree().
>=20
> This commit is done in preparation of a following one that will allow
> UM to set BO labels through a new ioctl().
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 963f04ba2de6..a7a29974d8b1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> =20
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/dma-buf.h>
> @@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem_obj=
ect *obj)
>  	 */
>  	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
> =20
> +	kfree(bo->label.str);
> +	mutex_destroy(&bo->label.lock);
> +
>  	if (bo->sgts) {
>  		int i;
>  		int n_sgt =3D bo->base.base.size / SZ_2M;
> @@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object(str=
uct drm_device *dev, size_t
>  	mutex_init(&obj->mappings.lock);
>  	obj->base.base.funcs =3D &panfrost_gem_funcs;
>  	obj->base.map_wc =3D !pfdev->coherent;
> +	mutex_init(&obj->label.lock);
> =20
>  	return &obj->base.base;
>  }
> @@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_device=
 *dev,
> =20
>  	return obj;
>  }
> +
> +void
> +panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> +	const char *old_label;
> +
> +	scoped_guard(mutex, &bo->label.lock) {
> +		old_label =3D bo->label.str;
> +		bo->label.str =3D label;
> +	}
> +
> +	kfree(old_label);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index 7516b7ecf7fe..c0be2934f229 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -41,6 +41,20 @@ struct panfrost_gem_object {
>  	 */
>  	size_t heap_rss_size;
> =20
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.
> +	 */
> +	struct {
> +		/**
> +		 * @label.str: Pointer to NULL-terminated string,
> +		 */
> +		const char *str;
> +
> +		/** @lock.str: Protects access to the @label.str field. */
> +		struct mutex lock;
> +	} label;

Can we do as we did in panthor, and put those fields in the debugfs
field.

> +
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  };
> @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct panf=
rost_gem_object *bo);
>  int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> =20
> +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *labe=
l);
> +
>  #endif /* __PANFROST_GEM_H__ */

