Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425891EB5C3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159105; cv=none; b=YV6/pGiBB+4KKzLc96cwzMHxX04oAVyXQMem82SpbdEpSKXDW0rPh0ladQsBasfHKovX20uzNA6biEIGXr4hCHKVevBddC0NAZL62Kzf3Dj1vqkAQUuGeFBUZmu61tRleKCCor3HSBjobiJV9Kvw5uaF3GCu288ehvg8L3FzveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159105; c=relaxed/simple;
	bh=LkzlG+pBoiSkyRjk0E7OFypBkVMsA3bIdLz8m1UOnGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8G96fuuop36lmJGRPCPBfMk7sCbU4Y8ZN35u/8FCFOR0krmqub2JgVpJB0xlKhvdbYOUb1H5lpfEsdPiTN1FWKSPLgLW/FjTnQGYFrbga8270ejiIJv2RHsqkUfp6MQdU+LkT3T4oqlpY7A7u0Xp8bYuvCKqeUB2cFqIftoQao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhcAqOlp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhcAqOlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCCEC4CEE5;
	Fri, 28 Mar 2025 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743159104;
	bh=LkzlG+pBoiSkyRjk0E7OFypBkVMsA3bIdLz8m1UOnGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhcAqOlpTETvTp1X+4CVCAS7SEWqJ+Pas3UQYyoMuSg+Y9Rcp0vH6a23zqxXmLG9s
	 /GKw5XS63OilH3/glA6eDGuDYXFOA3bxdNjxFRtj9TWWngyajWET8PdkJ4Ugu2dUbX
	 9qmBuEL3ybNy3fpfDFG1IoULz8VMNzIsx2YXEFFX8Wic1cO8Zs4yWrqmp8OkiY+43G
	 tcflU6POL5ZTLg67WfHwbHnpA+6i0qxT9kgJlJFZ0b96iXV1fST55F+B8DPtugs61l
	 iaatWcOYn0tMj4GZmex0dAbp5yLDgjGmyPFkKr3ZagFyrzluaSMS6fzfp18v+iwE6d
	 qqkhfjmjH9OrA==
Date: Fri, 28 Mar 2025 11:51:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org, 
	tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, 
	liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com, 
	libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
Message-ID: <20250328-hopping-ibis-of-gaiety-f7cac3@houat>
References: <20250319032435.1119469-6-shiyongbang@huawei.com>
 <87frj8c9ol.fsf@intel.com>
 <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
 <875xjw87dm.fsf@intel.com>
 <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
 <87v7ru6bfk.fsf@intel.com>
 <51bae617-cfc7-43f9-968e-5f2a3ad9af40@huawei.com>
 <87pli14fgh.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4j746ysgea56osor"
Content-Disposition: inline
In-Reply-To: <87pli14fgh.fsf@intel.com>


--4j746ysgea56osor
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
MIME-Version: 1.0

On Fri, Mar 28, 2025 at 12:28:14PM +0200, Jani Nikula wrote:
> On Fri, 28 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >> On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>> =E5=9C=A8 2025/3/26 17:32, Jani Nikula =E5=86=99=E9=81=93:
> >>>> On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>>>>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>>>>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>>>>>>>> From: Baihan Li <libaihan@huawei.com>
> >>>>>>>>>
> >>>>>>>>> Add registering drm_aux and use it to get connector edid with d=
rm
> >>>>>>>>> functions. Add ddc channel in connector initialization to put d=
rm_aux
> >>>>>>>>> in drm_connector.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
> >>>>>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> >>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>>>> ---
> >>>>>>>>> ChangeLog:
> >>>>>>>>> v6 -> v7:
> >>>>>>>>>       - add if statement about drm aux in hibmc_dp_connector_ge=
t_modes(), suggested by Jani Nikula
> >>>>>>>> I don't understand this, and I did not suggest such a thing.
> >>>>>>>>
> >>>>>>>> BR,
> >>>>>>>> Jani.
> >>>>>>>>
> >>>>>>> Hi Jani,
> >>>>>>>
> >>>>>>> Is the modification of v8 correct?
> >>>>>> I never received that for whatever reason.
> >>>>> Here's the link: https://lore.kernel.org/all/20250320101455.2538835=
-1-shiyongbang@huawei.com/
> >>>> Thanks.
> >>>>
> >>>> The EDID handling looks fine.
> >>>>
> >>>> AFAICT you leak dp->aux.name though.
> >>>>
> >>>>
> >>>> BR,
> >>>> Jani.
> >>> Thanks for for reminding me, actually the dp->aux.name was written be=
cause I misunderstood what you meant in V7,
> >>> and I deleted it in V8.
> >> This is in the link you posted:
> >>
> >> +	dp->aux.name =3D kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
> >>
> > Hi Jani,
> >
> > I got it. I think I can change it to devm_kasprintf() in next bug fix p=
atch, is that ok?
>=20
> Maybe. I don't have the time to look into hibmc details.

I don't either, but it looks suspicious to me. devm_kasprintf will be
freed when the device will be removed, but the DP Aux bus is probably
staying for a bit longer?

Maxime

--4j746ysgea56osor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+Z/PQAKCRDj7w1vZxhR
xRxcAQDS3AootCWXiWaJfRGrgfposhmKuunZpfO7o4szkRq4jwEA5EWAcT/KDU8l
8PgYfkh5StA+IpIGNhxPGAa9CxlSFAg=
=TQPp
-----END PGP SIGNATURE-----

--4j746ysgea56osor--
