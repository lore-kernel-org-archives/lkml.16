Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E62417F0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680189; cv=pass; b=T/ANZh0gJTJ1fYiZOdxehegC5bILVLpdusm1drPVIFuI5nE1bi11Xmm9NSrCnFRtySnc3FYvjgPif51bhnygin8fibo5W4ZOn9oeziaw/O5dwSTRiDdQ4fTmkjBdINDjsBI77e28H+dMZTUfw6UZ120gmHbwEPh5pbJ8zKSmGQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680189; c=relaxed/simple;
	bh=uAoHuX1gjS1DqxUIDY3j8c8e7+esgywDv/fHvp55QkY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XjvTc9fvooOeGad+t7eLRhK+5jgZhjhX5os2CiVRh4UNop9ufLD8VDK2Yq4t2d8LpzX5RIuSpw2iKpGzp8udCgVRyQxE08YAH7EvkjuAR1h2G/jBUN+gVWbdoGqeSa2mcI01KOVMSJ7n3STzT+QIpdba5ufh5elA0iWXHn8Fyc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gert.wollny@collabora.com header.b=MbwXf5+O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gert.wollny@collabora.com header.b="MbwXf5+O"
ARC-Seal: i=1; a=rsa-sha256; t=1750680167; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YH4sFFDjORTCbDM4u5fyy9J6JR0S7GL5W1BoMk2HUurVuUccMNx03GXg7TbrAajidA3YPS/mdwHl9XP862u0IP1ww/Ox313PhN929auapZRG/Jj1DrTiwrNjx+BOtWlv2FYaf2A+9cHrw7eaq4UQhCj/Px19RkRcA4tYc4yU0Ok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750680167; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+2G5Oc8bg9km4uo1iR9FAfo0ipQPmDTdZujVVUvZ5XE=; 
	b=kOXZAlZFX/PkvRe6bGJnTHkfYb+I8hIkP0Qf0a5UkIvN2zT3T/YP4bn2bqBgay8wER6zsPM4FuhDmuaQEkbwg8u4hC10T2r0bw7FijEBj/Bh6lmvfoxQgyTd5Nzcw6LjJMaZVPMNi7/KhhUb64QtE3BYXv7StBum+IYL7YwVlR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gert.wollny@collabora.com;
	dmarc=pass header.from=<gert.wollny@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750680167;
	s=zohomail; d=collabora.com; i=gert.wollny@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+2G5Oc8bg9km4uo1iR9FAfo0ipQPmDTdZujVVUvZ5XE=;
	b=MbwXf5+OHY+Z3psfEVqbT9vl0YWx21ykiHELbMkLpRdfCr1bkwzDxCn78QBFb9HX
	EGYFuDqAPnzZNYTT5GrDcFyy1GaAciy7FZPEIeUce/QEXxbsqOTdzYgLriTouDIqJbD
	4nvn+cbECL7gDWrPueO9SIwyKEWafsSo2fvJDMEg=
Received: by mx.zohomail.com with SMTPS id 1750680164845368.277656923059;
	Mon, 23 Jun 2025 05:02:44 -0700 (PDT)
Message-ID: <7c8b78f040d872f7f119f849e7969a7f2a4e9c86.camel@collabora.com>
Subject: Re: [PATCH v2 5/6] drm/etnaviv: Add PPU flop reset
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Jun 2025 14:05:07 +0200
In-Reply-To: <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
	 <20250618204400.21808-6-gert.wollny@collabora.com>
	 <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Fri, 2025-06-20 at 22:22 +0200, Lucas Stach wrote:
>=20
> > @@ -1807,6 +1808,11 @@ static int etnaviv_gpu_bind(struct device
> > *dev, struct device *master,
> > =C2=A0		ret =3D -ENXIO;
> > =C2=A0		goto out_sched;
> > =C2=A0	}
> > +
> > +	if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> > +	=C2=A0=C2=A0=C2=A0 !priv->flop_reset_data_ppu)
> > +		etnaviv_flop_reset_ppu_init(priv);
> > +
> I don't see why you would need to do this in the bind callback. You
> should be able to move this to etnaviv_gpu_init(), so you have the
> needed identification data. gpu_init is also executed serially over
> all GPUs in the device, so there is no problem with potential races
> there.

I moved this here because you wrote before:=20

> But then you should allocate this buffer
> in etnaviv_gpu_bind to avoid races between GPUs starting up and=20
> trying to allocate this global memory.

If etnaviv_gpu_init() is fine, I'll move it there.=20

Regards,
Gert=20

