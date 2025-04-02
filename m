Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F16F30F;
	Wed,  2 Apr 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603276; cv=none; b=rJj8Aqvw910dlzA4ZpD9pCPfAEaRbWBEckafXRP99TbAvLRIHi79qanbl+UjxZyw/9YuLST+bSVDdNlKh3SAcOkpV5zFFltjO269AKKsbGaalHMhShLHfDCK8APFfCmnRKHm2pyscWcZ1sE9v6hse/bdGZQvbGikmYc38yzPlY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603276; c=relaxed/simple;
	bh=7bNOI9I0kf+wMn+sfDL20G8Zsp+YjfaybSmLHywp6H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnecX+fAqsjS2p+LYqU6RzGpuPbYqG04nxKiPl7jBuFfIYMaYgeMyhLXywvNII7BZC/8oyYMUplVFvYYSlVSo8DKRU7zGEz0HiIjfwARvOMGvXiyRNMXRqL/rTP8pdHHIBgioalFYrfbj3drEpxo4wb6bxGdQVKiMEG8gbhcOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfU9sFWb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfU9sFWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EA2C4CEDD;
	Wed,  2 Apr 2025 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743603275;
	bh=7bNOI9I0kf+wMn+sfDL20G8Zsp+YjfaybSmLHywp6H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfU9sFWbuVpN9kVvT6UBrk+aEqGWzFyI6aOQx8Mu3ba4AW98wKsQJmWLqQ+MbBios
	 vXekZ3iyGZMe9tS1GBcWZThD42lQu75LQ1VRcV7/g6203g/VKR0uSwwrbI+iDwfSIb
	 /4lAZt/4Py/FkUXemgmbtDQfvkasWiMHaKM69U0LWSZT8mW3Mi9bZZClMid7AnVG3q
	 BxvSwC5StFwHVgHRKpITFIdJOinrsyWYvvrMmfPrNoDgsDwaZ6qcIXWRw8OB3SzMi3
	 XXCEfuo1UdEV+NyhetUbKyGLHk3YG+UAFWn0mPgRlkzsgy0Yzh61jvOfa57rZiF9mY
	 bQzNJ+mJLI/hg==
Date: Wed, 2 Apr 2025 15:14:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, linux-sound@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Ethan Carter Edwards <ethan@ethancedwards.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Add NULL check in avs_component_probe()
Message-ID: <b6d36b87-b1d2-4234-bab2-807c5855d776@sirena.org.uk>
References: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
 <ed1be43c-99e0-4afb-8f98-9c7f39611610@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4tauQWj9QjecO6X"
Content-Disposition: inline
In-Reply-To: <ed1be43c-99e0-4afb-8f98-9c7f39611610@web.de>
X-Cookie: To stay youthful, stay useful.


--w4tauQWj9QjecO6X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2025 at 02:00:31PM +0200, Markus Elfring wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> =E2=80=A6
>                 call?                                  failed?
>=20
>=20
> > Add NULL check after devm_kasprintf() to prevent this issue.
>=20
> Do you generally propose here to improve the error handling?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--w4tauQWj9QjecO6X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmftRkQACgkQJNaLcl1U
h9Af/gf8CvXLTRlNUhZSUDgZhkSg79TXsjHvqMhg0GINHvCqXYdcoei7hwY8OMbF
gFbAeeG9ArI+75BmR4tfH+MBoi7iuVn/WVAB//0dzG6RZkX2K0wI+ihPbEzYjKl4
iKWjjPqfhF5I52b+BgZYw1qn059lsP40mmwDiDJj3zOrIefUPosaDfJDoJnKAby6
p95roiRvy99r3Avjy4GiblK3/kYW6w+nJ6BP4yC22/IsY+X9yxh4x7XJOL5IPiGH
FjlnvcFeQXsOpWz+wXfVzT+OSuypx5y3VAmAL14D6MzfT3fXZMOXkgKVWEvErlFX
A58tPfnX9xFtgbfNr4CH/vBt3h94tA==
=kisI
-----END PGP SIGNATURE-----

--w4tauQWj9QjecO6X--
