Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C591F3B9E;
	Tue, 24 Jun 2025 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765237; cv=none; b=Up/NGvSdh4Iizn+ny7B4HpqGtq+pymRXsn4mYegZtZSfqRYKVIHDtY2RGLS4FGIKll8mSdDKhHQyiJe5ec4ZE/jyRiD0nS67Y8iiaQD4zMv28oAGMGYb+6Oi/YoCYe1K0JZZZjOM0efJOJVF8fh65GdJ4krlMMYBlsKrK/Mbeyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765237; c=relaxed/simple;
	bh=Bsi3qRvTVg7k//VlKsMErJGpmCdcdlceivD1xcVHnQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hV84y5MRY9jgIJqS0horryiSDCisgEiA8+tbGrAqZrszoRAX40FNrNW5pUN0VXQCkWq7TR/1Qv3/jOZqHAKcEH03XxZnK0xG7G5lcQWiK+kN+XjjBhxDJweapV56TehguI/XqKmMGL4laHbNQ0Vvy6rmhucO3xPalq97GIwhAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIsRzLKq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIsRzLKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDC7C4CEE3;
	Tue, 24 Jun 2025 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750765236;
	bh=Bsi3qRvTVg7k//VlKsMErJGpmCdcdlceivD1xcVHnQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIsRzLKqpfczY2hsGUYf6FujkpKTd1I/53QnfqR4ohrHzyNExJQyZNQ+V0GLpdOzm
	 UPsN3i5+234h3dOwD5z+WHJnPbqAPjBXvgFiA6L5LUIj6xbTzk5mcOyzXuW4dYMKHW
	 IELnxAaH0wJaGdQExrydhqKMIMnkLQXEXMbtBCQ+Hgwad9U5N/38+9oINhipE73GNN
	 MHmu6igOgiXIYyoaW+SmudV7Y2BHDN0Mk+lMNZ4QzT0iyT6AFteD20NsEWmZa0vKTP
	 8U/dl//0v9Dft9h14JRSScvrBCx6Rqeh2/WTvDA81cIxAyhW1uUfNLHkhwE4K40gvZ
	 88IPiq8iaYhWg==
Date: Tue, 24 Jun 2025 12:40:31 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: colin.i.king@gmail.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, thorsten.blum@linux.dev, tiwai@suse.com,
	u.kleine-koenig@baylibre.com, yijiangtao@awinic.com,
	zhujun2@cmss.chinamobile.com
Subject: Re: [PATCH V2] ASoC: codecs: Add calibration function to aw88399 chip
Message-ID: <601c4455-cac6-441f-a8a3-15fe2d81b3c7@sirena.org.uk>
References: <aFVgVTIe5oT0MkZy@finisterre.sirena.org.uk>
 <20250624065748.60509-1-wangweidong.a@awinic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h0n6VGwxTCS/aboF"
Content-Disposition: inline
In-Reply-To: <20250624065748.60509-1-wangweidong.a@awinic.com>
X-Cookie: Do, or do not


--h0n6VGwxTCS/aboF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 02:57:48PM +0800, wangweidong.a@awinic.com wrote:
> On Fri, Jun 20, 2025 at 14:21:25PM +0100, broonie@kernel.org wrote:
> > On Fri, Jun 20, 2025 at 07:08:44PM +0800, wangweidong.a@awinic.com wrot=
e:

> >> +	ret =3D aw_cali_svc_cali_re_mode_enable(aw_dev, true);

> >> +	msleep(3000);

> > Callibration takes 3s which is a fairly long time.

> This time is because the chip needs to wait for=20
> the data to stabilise during calibration=20
> in order to ensure more accurate calibration values.
> I will reduce this time to 1s.

If you can do that safely that'd be great, but if it takes 3s then it
takes 3s - I was more noting this for context on the comments on how
callibration is triggered.

> > AFAICT it's triggered if the device is powered on and userspace reads
> > the control that reports the callibration value.  That seems like it's a
> > bit too easy to trigger - something like running amixer would read the

> > BTW since the calibration is dynamically done the control should be
> > flagged as volatile.
> I will make the following two changes:
> 1.Add an additional "Calib Switch" Kcontrol to=20
>   indicate whether calibration operations can be performed.
> 2.Add "Trigger Calib" to Kcontrol.=20
>   This Kcontrol is write-only. When calibration is allowed,
>   perform the calibration operation.

Great, that should work a lot better with diverse userspaces.

--h0n6VGwxTCS/aboF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhajq8ACgkQJNaLcl1U
h9AkxAf+IxemK6PePTKW76HJJlEncHwIzksdIbEGgzouBmpoe6ggmjn209CKAuyT
ry2bJtx1JbN3nyU+ZhG5onmAAeSDA2tJ+6GREBnrERI9GeSFBzkWOrt6lEOMEWvN
JyAnHOCtD4ftdv6xkzMtYdHJE1YCN/y/QPG6NP29lijBH4p0bH6GNWmlVtc+P1Cc
CHwPgIypEKcJsQGWG7GRqxwjbguL+jBZC4a1f4dPvIdslz7ayyza3XerYenKeDYD
T9YDb1bki40+2vUNgJEztpyk+Aw8cy1henYNZnl+GN0U4ymKbpWGcFn50FELE0pU
tia7+PBPU2fJuwfB/kniGctElefLMg==
=7jUg
-----END PGP SIGNATURE-----

--h0n6VGwxTCS/aboF--
