Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DB267F41
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741187; cv=none; b=YMWCJ2zTWxxjY0AHGXu5ptmSSwJKG0fNzK4bK2df8/Jwf65jkWSlDndf4fgx0jupeTy9Ix8P5+ta118EyYnEti69JDMrz0/ChG2W29cyhv5yxnjBFfEv5eMnIBwKQ30Emn5FldZh/bZm/5ouyknrThpE/YpfWSpxOHNPaw6LzWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741187; c=relaxed/simple;
	bh=waB6HNUkUzfJ+Fu3JOScZGyMKNkxAfv5Ek+p59SiRSI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=q2qocamRKG1nm5ZwF+DtANaIXoo5+XgGHdzczO4FAU3dxZMbUNf95YmkDIlCC5a1tteVcIQhIYTfWl55TM2WIIzkbcgVUXouFQqN7ylgw6yiVB+wrADKrOKzPfYlUZkpXKwIE5j6R26dbdr5K+rXCdunzgukPkSHdvzCZcsRzsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=AoqykRfG; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="AoqykRfG"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747741170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IHQQ72WR0uJaCYKSMFe0s4zfbhTKw+KEo8c67zUoozQ=;
	b=AoqykRfGY0eNCQZe3pCtucLUbH68xSCZYcf3tGww1k2ClaBe+2D684FSiAgrlzUvmz3tgV
	Uw+YIrjBvbQwnjaJEd8lo43Jajl75GPwqBu3ud+WKe0VdbC8GWvKOgTypBKOvJ0Tzjg36f
	/dJ9+8ZMtGBXieBs3wpobQ7kyz23IaCZzhpnOlCDfrTdsbR3Lxilt/Kwqmed94GObnEn14
	8TSDFjBuH3AnyoM4AdRbQeFZNMB7RbklFaE1CycjsIBnDSe1b4HpZ1Y5igJT2tDSk1FJ92
	iOuwkmr2RjIvNhGoARaTAc8k4IYIv1q9dUcWrKkCMd/41P11jN2BmOqi1KndUQ==
Content-Type: multipart/signed;
 boundary=d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 20 May 2025 13:39:18 +0200
Message-Id: <DA0YJ89890ND.3NKPS3RWC012P@cknow.org>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to
 register definitions
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Yao Zi" <ziyao@disroot.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Frank Wang"
 <frank.wang@rock-chips.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Shresth Prasad"
 <shresthprasad7@gmail.com>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Jonas
 Karlman" <jonas@kwiboo.se>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-4-ziyao@disroot.org>
 <DA0DU2P8UWSV.3U07EFFLKBPXQ@cknow.org> <aCv8vRu8gjrvK8wr@pie.lan>
 <DA0UO4TYFWAU.DOE3O1UBNN6U@cknow.org> <aCxjqDr3VivDCrBx@pie.lan>
In-Reply-To: <aCxjqDr3VivDCrBx@pie.lan>
X-Migadu-Flow: FLOW_OUT

--d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 20, 2025 at 1:12 PM CEST, Yao Zi wrote:
> If putting RK3528 at first really confuses you, I'd like to add some
> extra comments to explicitly split these two kinds of register layouts
> apart and claim they aren't compatible. Although to me it's somehow
> obvious, as most definitions are prefixed with either RK3528 or RK3568.

No need. This is just another PEBKAC issue.

Cheers,
  Diederik

--d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCxp6wAKCRDXblvOeH7b
boWnAQC5MIhxImiAlK1tUu+xrN+HsDpoKbj77BWe5c4WxhafxwD/Ulo4r6l68aWF
xF7+bQnpCwX2RacAOaELrsdy8/Z02Qo=
=ZrQ3
-----END PGP SIGNATURE-----

--d0bc349ebc3c06724e8275064f50ac7acc361a9610a706c47518c54416fd--
