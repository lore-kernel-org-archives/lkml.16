Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79F299933;
	Thu, 22 May 2025 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928385; cv=none; b=ZBclbIHjtq2ZPHtx+WScQX++6WpN1VxgYJfBe81nCuWlwrW3E74++cxU+rr+loDGPqOti+HRQR0WLDoRUQDV8pFF7LemUrUW9nvS/yMmwLVr1kJs+59UhUet3+MQxJkouoR8qU2BGrsFpi0mHojnwdpYvsOZmDrOvr+ZKea8Pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928385; c=relaxed/simple;
	bh=CPi3P7jr6JFRORjiXXFveNVGwauIS/kgfrlDymYbccc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSefigYeGjTEt6pgaRpR14XMb4izf/+fohyUkVNRZQEo/eP8S3leMSGnVB1b6pQQO1LYKWyFMI+INHBrVPgE0I+/eK72HujCAhk0Z1ZbV7JZR5DpNRP6e1w5TgNpVkCM+AEBuYFivFAOJrE8LHq5dD/+wyT6swX3wMz14J6VO3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Anjm9aSA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Anjm9aSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8293CC4CEE4;
	Thu, 22 May 2025 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747928383;
	bh=CPi3P7jr6JFRORjiXXFveNVGwauIS/kgfrlDymYbccc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Anjm9aSAsuHo3ENznnquuzdRNbgSHGUUeujx7ysJMowV/uhh22uXPmDALjGifH3d3
	 ULngrWVg7qQsen1VaKy23xlualto2uVjtTupbVtFxzXQjsW7YD3m6etSgKlmYDIK5j
	 KN5aAU8fftXrTbxUX1pfwe04fze/ltObtfqpb3gBC46nVZXRuKqTgy+uXeXgufS/1o
	 Huk6E/EI8k7XsBIBob1vejpro3myLuWAvybfJayOqhgdpoGB65sDRcQtQMe2w8A2h5
	 UyBRoTpm+I2SYvUAOaPnSm1j30166w+sH0dBLFfpglNGUtQte0KC6dWq6wuhjCOJJA
	 WLX1HPiXkTlmQ==
Date: Thu, 22 May 2025 17:39:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <melissa.srw@gmail.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, rdunlap@infradead.org, arthurgrillo@riseup.net, 
	Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
	miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
	marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
	Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v18 6/8] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20250522-skilled-brawny-parakeet-e5cccf@houat>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
 <20250415-yuv-v18-6-f2918f71ec4b@bootlin.com>
 <adcd3356-5aae-42a8-8b55-9761c95d2e52@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xpgisissbrxe6gel"
Content-Disposition: inline
In-Reply-To: <adcd3356-5aae-42a8-8b55-9761c95d2e52@bootlin.com>


--xpgisissbrxe6gel
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 6/8] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Mon, May 12, 2025 at 03:07:55PM +0200, Louis Chauvet wrote:
> Hi Maxime,
>=20
> Did you have the time to look at this patch?
>=20
> Pekka added his Acked-by, but as you made some remarks about this patch, I
> would like to have your validation before applying it.

Yep, thank you

Acked-by: Maxime Ripard <mripard@kernel.org>


Maxime

--xpgisissbrxe6gel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9FOAAKCRAnX84Zoj2+
dh+KAX4mqKD9x5Fk6yBHL1pfN1Mec2kWU97o8exhTKoyyE6kT4UGK5O8He8OidfF
kIpGu1gBgOPkMHqDS023UAhv638NS9w6hZVLcAQLuNHVw6Z8p1qbYQQowL1p3qur
0DyjhWk8dg==
=7Z0B
-----END PGP SIGNATURE-----

--xpgisissbrxe6gel--
