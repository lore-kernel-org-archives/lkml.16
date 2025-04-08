Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8E70810;
	Tue,  8 Apr 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128058; cv=none; b=RcLXWUOCMkqc4BFWhBhyMxT3HVJ+MlehDBghvTlxuGXIZQL+CEt0YX+EDLyUN7A47NaA0+kwJWGHsmv76xAXyW0QuH7IkZmlUff5A9asGHn5EydlChFGqBMX6RdbDqpq0yCUuxRMjWX+ohDQgNeRrIVMep0ePfkXmOUmEe09huk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128058; c=relaxed/simple;
	bh=jkgXxLUBMkqg/rZGyHJkSw9cQHDr9laf5rIMLucqkEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMiMDskzQ9zJXT4as1tb9aLC/wNu69S2miiTOf013BL51rtOy8xrcWi13oeGTMeNxnU4wKU4Jww0iAvqESfox4mZ8aNe0rBPOaGW2JBXgKoZqxcqthkcV5X4YDNMnGuscg5mjw4uBBnxoAFzACrV1t/mIr3OLbGOrtChHrZDNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/BpiHVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/BpiHVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D1BC4CEEA;
	Tue,  8 Apr 2025 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744128057;
	bh=jkgXxLUBMkqg/rZGyHJkSw9cQHDr9laf5rIMLucqkEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/BpiHVgqr+1FVaTVdNW2WEpEQNzaMs9aE72D5uLOSg7HAtUTQBgRwiiIKuHyQokc
	 qMvuYmvBnf/P5DR3ct1FLP4n8eBrWTwSBFgCE1IQA/8sZJXkrOqyE3U4xwK2weOt6V
	 wQg8Js6xzPXtliJVLpojNbr0IBtGBM12jOz+SR9u3fpdMBjHcmXeX2GEu/KBbvuh5L
	 jFsPbh/wob5dT84IqF2EDZhx0+te5XRk4sMoA4L0ozbXqvdNR771P7/n++6ikXTQsR
	 s4G0bI0imZOK0/GTTW4ho0Wve833P9IAtkn92OnhRn/XXNwcC9BxKpBvSyQTL8dVfL
	 cVDqt5ewDdQkg==
Date: Tue, 8 Apr 2025 17:00:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
Message-ID: <f9fcff2f-34b6-4291-82d1-3b40c0f7e8e6@sirena.org.uk>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
 <c1043fc8-40e3-4ff9-bade-bedfe7a19a18@sirena.org.uk>
 <e3447ca4-ea19-4c84-802e-dc3832ea2dd6@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Rg+Va24dUM562IR"
Content-Disposition: inline
In-Reply-To: <e3447ca4-ea19-4c84-802e-dc3832ea2dd6@opensource.cirrus.com>
X-Cookie: Meester, do you vant to buy a duck?


--7Rg+Va24dUM562IR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 08, 2025 at 01:58:23PM +0100, Richard Fitzgerald wrote:
> On 07/04/2025 8:16 pm, Mark Brown wrote:

> > This is fine but note that this is the use case that the regmap_field_
> > APIs were created for, that also helps deal with things if anyone is
> > clever and resizes fields or shifts within registers.  It's purely a
> > question of taste if you want to use that.

> The regmap_field stuff looks like a lot of unnecessary complexity and
> overhead just for 6 registers with alternate addresses.

Yeah, like I say it's a taste thing.

> (In fact, the regmap_field stuff looks like an over-complex way of
> solving a non-problem. The original commit is talking about replacing
> masks and shifts "all over the code" to make the code neater. But
> really, all those extra structs and pointers and allocated memory just
> to replace a logical & or | ? Every struct regmap_field has a pointer
> to the struct regmap !!?! So if I've got 100 fields there are 100 copies
> of the struct regmap pointer that my driver already has.)

It was for cases where the shifts and widths may also change, there's a
bit more than applying a mask.  Like you say it's got some overhead
hence the taste thing.

--7Rg+Va24dUM562IR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1SDUACgkQJNaLcl1U
h9AB/gf/aPB3fd1AiqxM3ZHtujjzPfIgfItndnRRROC3CtwDwHJUNHCBOvWMD75p
reP5Kd5KDHn9ZsK4C0E45crR2eQONCwVaXIE218wpLbSq5LvkGFB7kU39K2X62bV
kzq3CMSNLAe8qK7U9ycfXDG7krMytQAo1YTL86/sIlpmqZiCux52ue+O7mLErZTM
g5nN2CDT4/Fzkj5G0lkbUs2Qets7Y4nxuosXpQiLeM80MrR6qzmZQh5fodsrP1tS
zWqv2+cdp3eEW0vjGxKa316vmqwUnioeeQOqNHZh9M+9xkgwvUL2zBtc1IHzYKb3
mv+LB/TzQ2ju2QR0iAOiOlf9wCWL/Q==
=Kuss
-----END PGP SIGNATURE-----

--7Rg+Va24dUM562IR--
