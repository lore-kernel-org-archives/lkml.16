Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A2B223DC6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554853; cv=none; b=cAyo2FHJZuDcGOJXSVnM/LhzYlndzoxqe+pOnV1MQxVYrZPwDYzOIIV1ArGLZuGw1PrLDBPi1P1AFIT0DDJcvNwVAzYbTkWpD+depiV9zYyd9di+MHlOO+9edBSpw/QP8GHkA9oKBmWFjvh8lcMmSVkEh6Y5O8S2OLStYZp5qT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554853; c=relaxed/simple;
	bh=++paXkfzIRt5dAny/JqTSD/t6fgSvg0HbfmPYN/knUg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YIrOv4CHHSmBbUvknDIRxuQZPjki0+mGGvgFq1uwB1w+oTlOh967Elh1MqMUGYlKSg/2C2A0wYHZ4Nsazl93GqAsDBofPKYDb1RDVeHDAXsdoFyOVPySh/F3VBsCSHG7gZLzjHRSm6xojkFVdb57/MAS9HNlwolezLEyLtwewhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=qEphA0by; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="qEphA0by"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749554848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d87frpROuVlGjEVB2mDm08MDEd+CmIU52hSdyqvceiU=;
	b=qEphA0bypSgalnt0eO6vtYktEmcT1tqDQmDGVchsVK7Vutp9rmNvpR40+2CQme4157wFp2
	xAHP+DlDfd83sPJM3UB69HaZd04M0dDSTFUjuJRwcEKEc+JazVGgydcLufOrUyxnyLaiTJ
	pMiHUVkDm/+k0rwIrUhr5+opjCEzF2Pb8/kKG8mu2DAD8uyXFSEMSeDldf8z0L2S5sYsv+
	/5YayGjaSEFoS8uQkeaRCPYFWC0yGxk6GipS74DAdFkf+ltf1jhEKGCB31zq14SdxoubCl
	EckApz/WnAvBer+2JYvU3PZijI4uLTl1s+Yuz0FVmgK51RcGC7oMSWArIx4L4A==
Content-Type: multipart/signed;
 boundary=1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Jun 2025 13:27:13 +0200
Message-Id: <DAITFEPGXB6Z.38FAE9O9NSSLX@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me> <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org> <4z0y_F1ZT_xfO0-DwU-D5NwL3t3wHuGmivOB3QFjDsn0hzpz_hOeU63pRVBIgSU1j89jmYPq-TJHPqMCj3fAygwwX6IaPoVsqKqVi2jxmCc=@proton.me>
In-Reply-To: <4z0y_F1ZT_xfO0-DwU-D5NwL3t3wHuGmivOB3QFjDsn0hzpz_hOeU63pRVBIgSU1j89jmYPq-TJHPqMCj3fAygwwX6IaPoVsqKqVi2jxmCc=@proton.me>
X-Migadu-Flow: FLOW_OUT

--1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

On Tue Jun 10, 2025 at 12:37 AM CEST, Piotr Zalewski wrote:
> Hi Diederik, sorry for late response

No need to be sorry :-)

(late? Less then 2 days vs my ~4 months before the git bisect ...)

>> Interesting that it also happened with drm=3Dy.
>
> I actually checked now and i don't have the issue with drm=3Dy, sorry for=
=20
> misinforming you all, hopefully no one's time was wasted.

Good to know, thanks :-)

>> > happened twice and at short interval and since this patch allows for g=
amma
>> > LUT update regardless of color_mgmt_changed state this makes DSP CTRL =
GAMMA
>> > LUT EN bit to be unset twice too. It seems that VOP does not like it. =
I
>>=20
>> Happy to see you found the cause :-)
>> Do you happen to know why it was unset twice? That sounds suboptimal.
>
> It is due to DRM modeset which can happens when CRTC (display) config cha=
nges=20
> "significantly". AFAIK modeset happens def. when you go out of suspend or
> display timings change. I might have been fooled by serial console last t=
ime
> as it does not appear to happen twice in short interval when i review the=
=20
> journal entries.
>
>> But (IIUC) setting a bit to a value it already has causing issues,
>> sounds surprising as well.
>
> Depends on what hardware does, when you write to a register it might caus=
e
> many other things to happen and seems like for vop2 it messes something u=
p.

I didn't know that, thanks.

> I made a second patch so that the first write is not permitted but all=20
> subsequent are permitted (regardless of lut en state) - issue disappeared=
=20
> too. So it might be that very first write to dsp lut disable happens too=
=20
> fast (in relation to something else)?. It is not intuitive because when d=
rm is
> a module it happens usually like ~second later.
>
> part of the log with drm=3Dy
> ```
> [    6.543099] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
> ```
>
> part of the log with drm=3Dm
> ```
> [    7.944120] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
> ```

My first (uneducated) hunch was a timing issue and ``=3Dm`` can reveal
issues which you wouldn't see with ``=3Dy``.
Andy already found an issue "that shouldn't happen" and my latest test
also had an unexpected result. So (eventually) we'll figure it out :-)

>> Sounds like a plan. It could be that this issue surfaced an underlaying
>> issue and if so, fixing that would be even better.
>
> When i have time this week I will check on what version of the kernel i=
=20
> tested gamma lut when i sent the patches and test there.

I think it would be beneficial if you'd do the tests that Andy asked
'me' to do too, so we can compare results.
FWIW: I have the 4GB RAM version.

Cheers,
  Diederik

--1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEgWmQAKCRDXblvOeH7b
bga5AP46kC7i4GeX+4vWp7Yxj8oZG/p/M87NvkPeVbBlmVSxNwD/aKazZBYfZhA9
N8AQj5r2cn8N8/pLuRozO0FJiPY+iAk=
=thoO
-----END PGP SIGNATURE-----

--1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff--
