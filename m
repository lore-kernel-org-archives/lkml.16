Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9773977102
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292258; cv=none; b=ORGJ1E1kTmWLJxH/Kl5rkWp61K5VzMxWXwvTs/mp7Pf2agNurMif8XEVKZWHI/MSNLp8R+YpLyAsRjMfyX/RP/bqXOaVw15iTVHkgl7jqpPKFYW2kvAs0xEJPs9UFSUatxexxik3UsYsaBw6Wp3fUtSWtQaqZ3cPRlTWLM6r754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292258; c=relaxed/simple;
	bh=8fbIlJVnhK8RsBM3PS14Qusu49bcxi2X3XaABa1477A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxVeOVa40XjBp1nLWoQue0dAuFkoG11Idvwh5LG+KSN5BXgmcwdKIni9XYeoeKNE94z7n5faN/ncxTIkb5VWks8ylnLpAPbd9ICreDF/SbS0RdRaYaNxfZ1leAV3GLJy7hpwztLDk6fGPUoRr68cB6AX8J0RZNYHXpzfOOoS9zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CHIrHXPc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CHIrHXPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744292254;
	bh=8fbIlJVnhK8RsBM3PS14Qusu49bcxi2X3XaABa1477A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CHIrHXPc0N0fh1kYfJmCpBO8Qcgk/pQAnQAfzsQTKa/jc32ugQidoiF7Nl+nmHRxC
	 0Ng+6Wb01l1KBF2P08bQoNrXd/9xCjqvgI5usgwV0PtfiVURMHWOMtOMNNg8JxDigL
	 wC2jUmgY5nEhxGMtIZzvGDwpmgKn/f+v9tQ+huvhSbezlTDDH4o36Y/nk6FWr0MxJA
	 FsUij43qSAc1YnTNS20tnwpxRZ4tYgu9YjFvzgC/Pd1XNsY3yEA4fxFIeDnh1AxWkr
	 W05oA005TtIUBwmlH078jsjvHvBfImpSgJYObbx0PpuJh661QRRqUGLsgeJdump2LH
	 eeDP76yk2DtAg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 250C517E017D;
	Thu, 10 Apr 2025 15:37:34 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:37:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] drm/panthor: Make getting GPU model name simple
 and extensible
Message-ID: <20250410153729.1fb0444c@collabora.com>
In-Reply-To: <a661ba42-9393-4070-9e52-dd19df2d6880@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
	<20250320111741.1937892-6-karunika.choo@arm.com>
	<20250321090254.667a86cb@collabora.com>
	<a661ba42-9393-4070-9e52-dd19df2d6880@arm.com>
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

On Thu, 10 Apr 2025 14:20:59 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 21/03/2025 08:02, Boris Brezillon wrote:
> > On Thu, 20 Mar 2025 11:17:37 +0000
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >  =20
> >> This patch replaces the previous panthor_model structure with a simple
> >> switch case based on the product_id, which is in the format of:
> >>         ((arch_major << 24) | product_major)
> >>
> >> This not only simplifies the comparison, but also allows extending the
> >> function to accommodate naming differences based on GPU features.
> >>
> >> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> >> ---
> >>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
> >>  drivers/gpu/drm/panthor/panthor_regs.h |  1 +
> >>  2 files changed, 18 insertions(+), 46 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/pa=
nthor/panthor_hw.c
> >> index 4cc4b0d5382c..12183c04cd21 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> >> @@ -5,40 +5,6 @@
> >>  #include "panthor_hw.h"
> >>  #include "panthor_regs.h"
> >> =20
> >> -/**
> >> - * struct panthor_model - GPU model description
> >> - */
> >> -struct panthor_model {
> >> -	/** @name: Model name. */
> >> -	const char *name;
> >> -
> >> -	/** @arch_major: Major version number of architecture. */
> >> -	u8 arch_major;
> >> -
> >> -	/** @product_major: Major version number of product. */
> >> -	u8 product_major;
> >> -};
> >> -
> >> -/**
> >> - * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely id=
entified
> >> - * by a combination of the major architecture version and the major p=
roduct
> >> - * version.
> >> - * @_name: Name for the GPU model.
> >> - * @_arch_major: Architecture major.
> >> - * @_product_major: Product major.
> >> - */
> >> -#define GPU_MODEL(_name, _arch_major, _product_major) \
> >> -{\
> >> -	.name =3D __stringify(_name),				\
> >> -	.arch_major =3D _arch_major,				\
> >> -	.product_major =3D _product_major,			\
> >> -}
> >> -
> >> -static const struct panthor_model gpu_models[] =3D {
> >> -	GPU_MODEL(g610, 10, 7),
> >> -	{},
> >> -};
> >> -
> >>  static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
> >>  {
> >>  	unsigned int i;
> >> @@ -66,29 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor=
_device *ptdev)
> >>  	ptdev->gpu_info.l2_present =3D gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> >>  }
> >> =20
> >> +static char *get_gpu_model_name(struct panthor_device *ptdev)
> >> +{
> >> +	const u32 gpu_id =3D ptdev->gpu_info.gpu_id;
> >> +	const u32 product_id =3D GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
> >> +						GPU_PROD_MAJOR(gpu_id));
> >> +
> >> +	switch (product_id) {
> >> +	case GPU_PROD_ID_MAKE(10, 7):
> >> +		return "Mali-G610";
> >> +	} =20
> >=20
> > I a big fan of these ever growing switch statements with nested
> > conditionals. Could we instead add an optional ::get_variant() callback
> > in panthor_model and have the following formatting:
> >=20
> > 	"Mali-%s%s%s", model->name,
> > 		       model->get_variant ? "-" : "",
> > 		       model->get_variant ? model->get_variant() : ""
> > =20
>=20
> While that=E2=80=99s certainly an option, I wonder if it=E2=80=99s better=
 to avoid
> additional string formatting when it=E2=80=99s not strictly necessary. The
> switch cases provide a straightforward GPU name without needing to
> handle conditional "-" separators or similar.
>=20
> Also, with the current approach, if a GPU is misconfigured with an
> incorrect product_major for its core count, the switch=E2=80=99s fallthro=
ugh
> helps ensure the correct name is still returned. A model->get_variant()
> callback wouldn=E2=80=99t give us that same flexibility to adjust the nam=
e based
> on such mismatches.

Fair enough. I guess we can live with this sort of switch statement for
the name selection. Hopefully the variants are rare enough that it
doesn't go too wild.
