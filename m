Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9C1519A4;
	Wed,  5 Feb 2025 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765054; cv=pass; b=ELWxq+M/f/v08qrccH9eAim4WlqOc4nU/Jvac2KxkXKbCzzthNGUbPsKMxWxx+9WiKbxDIQeYyanDtNt55olj7A9yOY33kZ1J5J232HKD9vBjei+NAgpdk5WV/hIjvQVO0KAxXNIDsTpaQM3yByJ7lkD5S8c08/NNbazESY2fIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765054; c=relaxed/simple;
	bh=/5nZDCjLyGnwxJz6A0qnCvxm2/QIWuQ6DawflNePOXk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VFnnmldITlFenKuCXohJKysbRh8q6nU2PWqH5D/QpbCGOx4Jzelv1oFMdxbj8++jUP+BjqGSQaDc2xeg1LuXYGibD2Z22am8tTeyusaf2aCl+c/BMNs3obw3LnzdvHQcgkpCefDyTHPQo6rWNtQ1EDTypZKkkndMVupIgaE1T5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b=Xk74pzWf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="Xk74pzWf"
ARC-Seal: i=1; a=rsa-sha256; t=1738765025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fZ7cE1UWPM0+gdQgiym3XV0vDxoWETHID7NHKM3npzB+dY3RuV7T+3TaPI5W6wHT4ipusuloIP8w/EIGL8L7weZpdat25cmeyMpI6o/NbbglvFIhWEq4+8UZq5wYS/vft098CrOu3dMlQuGP6fk6EhZdxJJUaJK65EInGmbPzUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738765025; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wD7Mys+0n8dZvpXVYi8I0dCyI436MJorydkg0/w9mPI=; 
	b=Y9KSFU/qgrHsk7p60COetzRA2pVerW9t5339H7w6XiC6caInoIXeEGKf+XOyw/tk4ejaR50/rZNSLFf+VuO4wGYVw9tA2+3ybREGtMv2L7FHNkNDdmWiMBghnbB3ykL7S11QEluymsOpQuTpyQUTVFd8WSkhI5HyM3X2t4OrEhM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
	dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738765025;
	s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=wD7Mys+0n8dZvpXVYi8I0dCyI436MJorydkg0/w9mPI=;
	b=Xk74pzWfYbymVwWtFnTzESAclYEWQ4tajrkhW25q/BYUyVMzEeD8LZAYgnhESA5m
	085NvwfQ9jHxQJHHxEIwsBE+K2GRjv8tBdliyIUmmU+tx3QH1EUbJYTU6wWI0AJXcRu
	buQy04NOzFQqGD/ncobkN+3gqUWS4XgAy9/9Edw4=
Received: by mx.zohomail.com with SMTPS id 1738765022637736.3031780655587;
	Wed, 5 Feb 2025 06:17:02 -0800 (PST)
Message-ID: <3b8147f56eb0ea1c9815102edaa023d95b2d84f7.camel@collabora.com>
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie	 <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda	 <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng	 <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>
Cc: Beata Michalska <beata.michalska@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Wed, 05 Feb 2025 15:16:57 +0100
In-Reply-To: <a6ecdb6b0a50e1fe7b0293eaaed27880e99a5258.camel@collabora.com>
References: <20250204232824.3819437-1-robh@kernel.org>
	 <a6ecdb6b0a50e1fe7b0293eaaed27880e99a5258.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Wed, 2025-02-05 at 11:53 +0100, Erik Faye-Lund wrote:
> On Tue, 2025-02-04 at 17:28 -0600, Rob Herring (Arm) wrote:
> > Use an enum instead of #defines for panthor IOCTLs. This allows the
> > header to be used with Rust code as bindgen can't handle complex
> > defines.
> >=20
>=20
>=20
> Unfortunately, this goes in the opposite direction than what I was
> asked to do here:
>=20
> https://lore.kernel.org/dri-devel/20241029140125.0607c26f@collabora.com/
>=20
> ...I still intend to get around to doing that, because we have
> problems
> with C enum and large values. I don't know if we can solve that while
> making Rust happy without requiring C23 (which allows to specify the
> underlying type of an enum), unfortunately...
>=20

Seems I misunderstood Boris, and he was referring to flags. The enums
are of course fine to make into real enums.

> > Cc: Beata Michalska <beata.michalska@arm.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > =C2=A0include/uapi/drm/panthor_drm.h | 86 +++++++++++++++++------------=
-
> > --
> > --
> > =C2=A01 file changed, 44 insertions(+), 42 deletions(-)
> >=20
> > diff --git a/include/uapi/drm/panthor_drm.h
> > b/include/uapi/drm/panthor_drm.h
> > index b99763cbae48..97e2c4510e69 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -129,48 +129,6 @@ enum drm_panthor_ioctl_id {
> > =C2=A0	DRM_PANTHOR_TILER_HEAP_DESTROY,
> > =C2=A0};
> > =C2=A0
> > -/**
> > - * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> > - * @__access: Access type. Must be R, W or RW.
> > - * @__id: One of the DRM_PANTHOR_xxx id.
> > - * @__type: Suffix of the type being passed to the IOCTL.
> > - *
> > - * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
> > - * values instead.
> > - *
> > - * Return: An IOCTL number to be passed to ioctl() from userspace.
> > - */
> > -#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
> > -	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ##
> > __id,
> > \
> > -			=C2=A0=C2=A0 struct drm_panthor_ ## __type)
> > -
> > -#define DRM_IOCTL_PANTHOR_DEV_QUERY \
> > -	DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query)
> > -#define DRM_IOCTL_PANTHOR_VM_CREATE \
> > -	DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create)
> > -#define DRM_IOCTL_PANTHOR_VM_DESTROY \
> > -	DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy)
> > -#define DRM_IOCTL_PANTHOR_VM_BIND \
> > -	DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind)
> > -#define DRM_IOCTL_PANTHOR_VM_GET_STATE \
> > -	DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state)
> > -#define DRM_IOCTL_PANTHOR_BO_CREATE \
> > -	DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create)
> > -#define DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET \
> > -	DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset)
> > -#define DRM_IOCTL_PANTHOR_GROUP_CREATE \
> > -	DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create)
> > -#define DRM_IOCTL_PANTHOR_GROUP_DESTROY \
> > -	DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy)
> > -#define DRM_IOCTL_PANTHOR_GROUP_SUBMIT \
> > -	DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit)
> > -#define DRM_IOCTL_PANTHOR_GROUP_GET_STATE \
> > -	DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state)
> > -#define DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE \
> > -	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE,
> > tiler_heap_create)
> > -#define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
> > -	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY,
> > tiler_heap_destroy)
> > -
> > =C2=A0/**
> > =C2=A0 * DOC: IOCTL arguments
> > =C2=A0 */
> > @@ -1019,6 +977,50 @@ struct drm_panthor_tiler_heap_destroy {
> > =C2=A0	__u32 pad;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> > + * @__access: Access type. Must be R, W or RW.
> > + * @__id: One of the DRM_PANTHOR_xxx id.
> > + * @__type: Suffix of the type being passed to the IOCTL.
> > + *
> > + * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
> > + * values instead.
> > + *
> > + * Return: An IOCTL number to be passed to ioctl() from userspace.
> > + */
> > +#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
> > +	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ##
> > __id,
> > \
> > +			=C2=A0=C2=A0 struct drm_panthor_ ## __type)
> > +
> > +enum {
> > +	DRM_IOCTL_PANTHOR_DEV_QUERY =3D
> > +		DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query),
> > +	DRM_IOCTL_PANTHOR_VM_CREATE =3D
> > +		DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create),
> > +	DRM_IOCTL_PANTHOR_VM_DESTROY =3D
> > +		DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy),
> > +	DRM_IOCTL_PANTHOR_VM_BIND =3D
> > +		DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind),
> > +	DRM_IOCTL_PANTHOR_VM_GET_STATE =3D
> > +		DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state),
> > +	DRM_IOCTL_PANTHOR_BO_CREATE =3D
> > +		DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create),
> > +	DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET =3D
> > +		DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET,
> > bo_mmap_offset),
> > +	DRM_IOCTL_PANTHOR_GROUP_CREATE =3D
> > +		DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create),
> > +	DRM_IOCTL_PANTHOR_GROUP_DESTROY =3D
> > +		DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY,
> > group_destroy),
> > +	DRM_IOCTL_PANTHOR_GROUP_SUBMIT =3D
> > +		DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit),
> > +	DRM_IOCTL_PANTHOR_GROUP_GET_STATE =3D
> > +		DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE,
> > group_get_state),
> > +	DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE =3D
> > +		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE,
> > tiler_heap_create),
> > +	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =3D
> > +		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY,
> > tiler_heap_destroy),
> > +};
> > +
> > =C2=A0#if defined(__cplusplus)
> > =C2=A0}
> > =C2=A0#endif
>=20

