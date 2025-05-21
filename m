Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173C23314B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747807797; cv=none; b=M9FHe1Sf165Oof4vBt1XEQsGz3EaNY2VA2e2rOIxUGV+T13Ol8KCobJ6XJHXPowgk7Xj0JMrrNvyk8ShKpbT91xBptWiUwmvkqiZtiG9zeXsjQ/P8UxDONaL19zLiUnScYXIFcYUREg3hyyIuvK/V1yzpNBUVYaoXrfm5AlY3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747807797; c=relaxed/simple;
	bh=lsoNQydVBe6kyb2yf9EKCr711zBK69XTFkmPXqoOOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UW1hJWMtUZpn5En/VUEfwfdiWB22Jrh8P7JnlPKCf3aKkv/CFlPiewpnKdFA0p+Bk+69mgUdxF6ujAz/DFoscEzSYfBXYUB1jKPtQZt4moV/5oYVEAz6lT9fCLsakOxUzVxr1yd7u5GEjmOJ4qTXZ7BxdBYRT0sfwKuMUGDAf/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gh5hGvmq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gh5hGvmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747807793;
	bh=lsoNQydVBe6kyb2yf9EKCr711zBK69XTFkmPXqoOOGM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gh5hGvmqHACRwikgRWx0e7RR5z8SkiGFX7Q8bj+XVZUby8zWmIZnugenLArIdtiqk
	 GxB2PwHSPkQXpvZAKYu1byfL8zC6RHovb2NaSz+FLLUWZ0Rtr/t5jFSWGA7DQfdPOo
	 ijKEhuonB5G4bXuvh6pxIG/z6OkVqU6Md7zVUikkLUyy0vmAFUepmRuqanQ9UWlNZH
	 Kg6a6Xo+jiTnM9cd+xuvB6xktGsE1l2Rbgry1wsGEinAtjuhxVSVFGomyRMRIdCxaM
	 S57zQPLIrFmLKrUdq977kSYE5P7cuDoGbrLBTG3M/AAGPQhxjDU5ROGdMWXGUTvwHv
	 IQdEH5+gXAUIQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEF8317E0FBA;
	Wed, 21 May 2025 08:09:52 +0200 (CEST)
Date: Wed, 21 May 2025 08:09:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 2/5] drm/panfrost: Internally label some BOs
Message-ID: <20250521080948.1b68a6a1@collabora.com>
In-Reply-To: <20250520174634.353267-3-adrian.larumbe@collabora.com>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
	<20250520174634.353267-3-adrian.larumbe@collabora.com>
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

On Tue, 20 May 2025 18:43:59 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Perfcnt samples buffer is not exposed to UM, but we would like to keep
> a tag on it as a potential debug aid.
>=20
> PRIME imported GEM buffers are UM exposed, but since the usual Panfrost
> UM driver code path is not followed in their creation, they might remain
> unlabelled for their entire lifetime, so a generic tag was deemed
> preferable. The tag is assigned before a UM handle is created so it
> doesn't contradict the logic about labelling internal BOs.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c     | 10 ++++++++++
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  2 ++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 4c5be7ccc9cc..04483d5fb45d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -305,6 +305,16 @@ panfrost_gem_prime_import_sg_table(struct drm_device=
 *dev,
>  	bo =3D to_panfrost_bo(obj);
>  	bo->noexec =3D true;
> =20
> +	/*
> +	 * We assign this generic label because this function cannot
> +	 * be reached through any of the Panfrost UM driver-specific
> +	 * code paths, unless one is given by explicitly calling the
> +	 * SET_LABEL_BO ioctl. It is therefore preferable to have a
> +	 * blanket BO tag that tells us the object was imported from
> +	 * another driver than nothing at all.
> +	 */
> +	panfrost_gem_internal_set_label(obj, "GEM PRIME buffer");
> +
>  	return obj;
>  }
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index 52befead08c6..563f16bae543 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -111,6 +111,8 @@ static int panfrost_perfcnt_enable_locked(struct panf=
rost_device *pfdev,
>  		goto err_put_mapping;
>  	perfcnt->buf =3D map.vaddr;
> =20
> +	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
> +
>  	/*
>  	 * Invalidate the cache and clear the counters to start from a fresh
>  	 * state.

