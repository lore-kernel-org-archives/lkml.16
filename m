Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083722D4F0;
	Thu,  6 Feb 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840302; cv=none; b=cikokCBsGGaec0uJ5/GMCMYQ6nE3pIgE+1xyAXVycoM4SXJH8VUCEjBMKsqWo6sVBsmoy1e1/136wU9Ri02XQoxAnFbjx9nbadR4WZFCob1ZSQLnxuzVqYjvHUsjBLisQLiJGz5zLp1x/kkK6EN8FfYhtaSfpjXgOP28XGLFfoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840302; c=relaxed/simple;
	bh=7bIM8RLVlw1dsQqh4JWYGpOGe9rxbWiKMJW8cR+r280=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWQn7BYV5AKm+fH+Z4Qf8sKxlnTVjjw1IuN4I3ddy9ikQn8wYYVGu0g/rj0UOuVDqerJmPLEtJ50uCvDzAImOVMLP3exG9LYwwjWBQqHm+mYaZZQIMdnHD4vCJJSYqUbcnoCealGYKfnuiChHeDZOskdW15E3k+eJfDaYXkKea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3cTc4+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3cTc4+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D25BC4CEDD;
	Thu,  6 Feb 2025 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738840299;
	bh=7bIM8RLVlw1dsQqh4JWYGpOGe9rxbWiKMJW8cR+r280=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3cTc4+QQj43tJW4qadIWqSq/CetrqU7GdrAVX2t7ybE+0R/GtnfcwkZpw7W4YguG
	 TxtzXIQ7Txs54DLPx4ZjxkINoe1cCJaHwA+RvPBhOvItCnJ0KOQ45m2w758kcYDEna
	 lOc/Ukn2WY43hyZi3BoepR9P4tSGizd1esvwdp4jtESyO135aZX06cnbw71axtPYjB
	 3cb8BjsXnChQHPpR7PJao7RnQRwAIrE+x5rIrNkluOfYUjScnWpELBOgxdRlyx/7j5
	 U45okLwC0etITzcED/4P0dQNvu3zlIUrN+FRCCV51qGr/1HpmA1EW4jZp1PuJTGTBW
	 uS4FnTGyFBskg==
Date: Thu, 6 Feb 2025 12:11:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Message-ID: <20250206-sepia-fox-of-tempering-fa5741@houat>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
 <20250206-caped-premium-squid-595ecd@houat>
 <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fz2wwsy7w6gdmkf4"
Content-Disposition: inline
In-Reply-To: <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>


--fz2wwsy7w6gdmkf4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 10:24:43AM +0100, Sasha Finkelstein wrote:
> On Thu, 6 Feb 2025 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
> > Sorry to figure it out that late, but how do you plan on maintaining it?
> > Where will the patches go through, and who will you send PR to?
>=20
> Downstream development is done via the https://github.com/AsahiLinux/linu=
x/
> repo, then send patches to ml. Not sure if i want to send PR personally,
> it will probably go via one of the drm trees or via asahi-soc.

If it needs to go through a DRM tree (and it really really should), you
need to make a separate entry, with the drm-misc tree listed as the git
tree.

Maxime

--fz2wwsy7w6gdmkf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6SY4AAKCRAnX84Zoj2+
ds7VAYDsP4HNpT0nP3IPTy+FPKUVmdQUC8cmAWNb+RF0p2FXzJMNyW6izpv9Bj+k
NG0MmjsBgNSO10rMGrhydZ6BDFHoFMS62ZM0AzBd06pQjkKOgyuZucjnkiwszs11
H9hYooAdmQ==
=kyPi
-----END PGP SIGNATURE-----

--fz2wwsy7w6gdmkf4--
