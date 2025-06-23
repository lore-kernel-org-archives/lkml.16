Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019123C390
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681511; cv=none; b=iLNkbk5psX481jrXD7fSo3LgY8X2HAxsNOT0Pxdj8qZ01iTYJJIDk0UYNd1SG20Xo1DK7ey/KjWhZM+VG9L+XhCpTwxVdIi/6FkMjEO9FyrGcRMNugE2ocuprw1VqwsKuDLrjqrYoRkYiFNVOSc1hOwM2MHDwIgPIe8j8sL64Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681511; c=relaxed/simple;
	bh=esObjBxrSfSNguJL1ozbvTSlev1HB7qOsBV2FDiqjMw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FD8bqw7t13ZjZvBzU9zjxZgFyz6sIfXugKNOH3n3tTw0ffD1tY0GMpybDjrypnn7RNW9mzRgRJAeg5+jrKJYXRaorrehrj8896KoYI6PXRAH8Wwfqv8pnZ6VvQILg8j+J1tGfGT6JU1H8cO1xKV41Tww4f9szPk7BEee8ob5xUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1uTgEQ-00084L-4d; Mon, 23 Jun 2025 14:25:02 +0200
Message-ID: <424c7fbf417c6d13c5842d78e83d72f705e021f1.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] drm/etnaviv: Add PPU flop reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gert.wollny@collabora.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Jun 2025 14:25:01 +0200
In-Reply-To: <7c8b78f040d872f7f119f849e7969a7f2a4e9c86.camel@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
	 <20250618204400.21808-6-gert.wollny@collabora.com>
	 <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
	 <7c8b78f040d872f7f119f849e7969a7f2a4e9c86.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Am Montag, dem 23.06.2025 um 14:05 +0200 schrieb Gert Wollny:
> On Fri, 2025-06-20 at 22:22 +0200, Lucas Stach wrote:
> >=20
> > > @@ -1807,6 +1808,11 @@ static int etnaviv_gpu_bind(struct device
> > > *dev, struct device *master,
> > > =C2=A0		ret =3D -ENXIO;
> > > =C2=A0		goto out_sched;
> > > =C2=A0	}
> > > +
> > > +	if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> > > +	=C2=A0=C2=A0=C2=A0 !priv->flop_reset_data_ppu)
> > > +		etnaviv_flop_reset_ppu_init(priv);
> > > +
> > I don't see why you would need to do this in the bind callback. You
> > should be able to move this to etnaviv_gpu_init(), so you have the
> > needed identification data. gpu_init is also executed serially over
> > all GPUs in the device, so there is no problem with potential races
> > there.
>=20
> I moved this here because you wrote before:=20
>=20
> > But then you should allocate this buffer
> > in etnaviv_gpu_bind to avoid races between GPUs starting up and=20
> > trying to allocate this global memory.
>=20
Yea, sorry about this. I hadn't noticed the dependency on the HW
identification when I wrote this.

> If etnaviv_gpu_init() is fine, I'll move it there.=20

I'm not saying that I may not again miss some implicit dependency, but
as far as I can see right now moving it there should be fine.
gpu_init() fulfills the same properties with regard to init ordering
between the GPUs as gpu_bind().

Regards,
Lucas
