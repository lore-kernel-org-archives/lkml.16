Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4F28C852
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299692; cv=none; b=V97yt9rMuSEYos5RdTZ96U6445k/P9k6uuZqYyg2p5SVjsun05Y/mXjcfLAFiZqNqGwzro88KGHOIhKbmD5hPNImhB4A1mmo3g4iTdq4MYP+MltYWvc4xE8kTjJFsCFRt/d3XQxkpp2JI/kMpBcDaFVCsDne4vAhNy1inSnbCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299692; c=relaxed/simple;
	bh=KUhf8SERzvdiCLn9fW2L6uyuAx7hPsYKzLHTTTD4Ea8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWBxhhn/Ye4BGFG2rTAQBDnCylT7pgxKtoj5Q9+G6TmLxu2EtzTsKaY3+CZoqTc3ugHfXYdrCHIRmdoqha7EDtpIQbuD0ktoHe1Xrj6U3o06hXHyKiXI75+MmFiYFpMF6I82kdBkT1mLZ1Z1YA5gjSsAs5yXgOyuhAoZjqj+6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=WGazDp6K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OCi1vLgq; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="WGazDp6K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OCi1vLgq"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED83C11400DC;
	Thu, 15 May 2025 05:01:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 15 May 2025 05:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747299688;
	 x=1747386088; bh=b3ahQN5lr3oJ3AfF2prxpnWCbluc8OWnhn+4dKgtlLk=; b=
	WGazDp6KJG2+O5Usk60OKAsQXW5VQAIoXfpcjdwtXrC5twsO4vG+z5zYdwOsQuw9
	CTngWy3kiE/YAU6PF+0MOZ9zgyWJIsn1TzEHz+Lk+5p+K4QO+dvUTZF7pLj29t9G
	GDZkXS6CjjvGSfLgspqcWxY3NPlEXnfl4aQLXcS0lvwvw9pH6x9Nl34pDaTnHY+R
	E5R7kRWiLnYA6893zlhjrBF3KlbPTPHZtq0XGRYxmunSAg68M/2pOu/XJ90gT396
	fsrkQiYXOL+umHj0O20l/3I2xpfcMvdBwGqtukt71VNyk/N7e3RWGn6Qq89AK7nd
	6F7i4fA5PEaIYy9kyfbUSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747299688; x=1747386088; bh=b3ahQN5lr3oJ3AfF2prxpnWCbluc8OWnhn+
	4dKgtlLk=; b=OCi1vLgqf7GZMOqBeIFRplqOk8bZ7H3jv1gswlI7geazPJp90zi
	/W5ndMUBTtUwn6Cd0C/2q4aStcct32CjuHr+EKT3ztlCoxT8ts0jy2oc+5cfoQHW
	knjG8C4PZ/Smk5UUSVhUkHWD8FA1CfyR7JQM+XF5/66HbS7KNL3NLPT0v7VPjw0l
	TA/XWpt6xmzrWV5ypkVClxkCChOUeDezezm6wPt8++QyyEwi/A2p8fI2CW6ziDH8
	G2bXyaaiEb7dIhYTBvs/y+BCe5+sj8uTUrI95A/4XP3oJNjKhLThl2KbcCcTtAY3
	azcuA7U9o5PLIC9jnBcqDdfSxT+YN0qeBng==
X-ME-Sender: <xms:aK0laAtn9g5XdhMFhoS3MlurAsciZchi5Aa3JHcH5CX5q-NDQ6rc6g>
    <xme:aK0laNfdl4-ksm7LqZHrLzfPY7RJ7pJqI8PM_n40hy_bKLKjvw9rcSHJ6PUweR3-U
    2LKHgzvOrG8-g>
X-ME-Received: <xmr:aK0laLz2jIB5aDkGtaaetXDP4o2NhKqppKH2JV_CDwJq8kauG63edSnjH8N5MlFx_JTd6KyqytBUzCSmxfBi6rmpeo5CnttFgW8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepjhhgrhhoshhssehsuh
    hsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgu
    rdgtohhmpdhrtghpthhtohepjhifsehnuhgtlhgvrghrfhgrlhhlohhuthdrnhgvthdprh
    gtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthho
    peholhgvkhhsrghnughrpghthihshhgthhgvnhhkohesvghprghmrdgtohhm
X-ME-Proxy: <xmx:aK0laDNi5SO4-xpDw0q8tGU_H91lXHKszX3KpnZtHqHfVK3N-U0Zgw>
    <xmx:aK0laA9mLFzlRME8vSVqn3JF68i_BJC5Fjj_ZwaxqyqkhJMqHL4zEQ>
    <xmx:aK0laLWKU7sr84fe-C47qXZ_diOOjkmNErX-is1E6FPyKzNhl7xpog>
    <xmx:aK0laJc-qhh3nmCyhgOoI8Ti-GbpNQyLEvRR4sY8Yjdaz0ej9BoTng>
    <xmx:aK0laOyNBIE4Mg-7-J7-5uqz0e6WuGBstCrSKuO1W1zERTVTTO35gZu6>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 May 2025 05:01:27 -0400 (EDT)
Date: Thu, 15 May 2025 11:01:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, jason.andryuk@amd.com,
	John <jw@nuclearfallout.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target
Message-ID: <aCWtZNxfhazmmj_S@mail-itl>
References: <20250514080427.28129-1-roger.pau@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HYAuCMW0ZFMoY7vd"
Content-Disposition: inline
In-Reply-To: <20250514080427.28129-1-roger.pau@citrix.com>


--HYAuCMW0ZFMoY7vd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 May 2025 11:01:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, jason.andryuk@amd.com,
	John <jw@nuclearfallout.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target

On Wed, May 14, 2025 at 10:04:26AM +0200, Roger Pau Monne wrote:
> When adding extra memory regions as ballooned pages also adjust the ballo=
on
> target, otherwise when the balloon driver is started it will populate
> memory to match the target value and consume all the extra memory regions
> added.
>=20
> This made the usage of the Xen `dom0_mem=3D,max:` command line parameter =
for
> dom0 not work as expected, as the target won't be adjusted and when the
> balloon is started it will populate memory straight to the 'max:' value.
> It would equally affect domUs that have memory !=3D maxmem.
>=20
> Kernels built with CONFIG_XEN_UNPOPULATED_ALLOC are not affected, because
> the extra memory regions are consumed by the unpopulated allocation drive=
r,
> and then balloon_add_regions() becomes a no-op.
>=20
> Reported-by: John <jw@nuclearfallout.net>
> Fixes: 87af633689ce ('x86/xen: fix balloon target initialization for PVH =
dom0')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  drivers/xen/balloon.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index 8c852807ba1c..2de37dcd7556 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -704,15 +704,18 @@ static int __init balloon_add_regions(void)
> =20
>  		/*
>  		 * Extra regions are accounted for in the physmap, but need
> -		 * decreasing from current_pages to balloon down the initial
> -		 * allocation, because they are already accounted for in
> -		 * total_pages.
> +		 * decreasing from current_pages and target_pages to balloon
> +		 * down the initial allocation, because they are already
> +		 * accounted for in total_pages.
>  		 */
> -		if (extra_pfn_end - start_pfn >=3D balloon_stats.current_pages) {
> +		pages =3D extra_pfn_end - start_pfn;
> +		if (pages >=3D balloon_stats.current_pages ||
> +		    pages >=3D balloon_stats.target_pages) {
>  			WARN(1, "Extra pages underflow current target");
>  			return -ERANGE;
>  		}
> -		balloon_stats.current_pages -=3D extra_pfn_end - start_pfn;
> +		balloon_stats.current_pages -=3D pages;
> +		balloon_stats.target_pages -=3D pages;
>  	}
> =20
>  	return 0;
> --=20
> 2.48.1
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HYAuCMW0ZFMoY7vd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmglrWQACgkQ24/THMrX
1yzk4gf9HepcWZO18gT+Ey7O+UqEd6psGfUZ6g1aP24bzNDa9nFkSLInQxPcIIZj
s/vVZBJ3lrEfvjRLqWlvAeWVOmeVU2LpkZIE/E19LKMrPtd0Zr+VU4ZohnnqIqvC
prnVJ+WviPbYg4vzrOuOKeGWjaawdotzfDmCTYvDogRClNyg1f8FdnmFmEqNGjo7
yQKThrXzVJTRUJ02SrqVZ4l7iS8fci8hszheWWPR33SYyWIrt7ec2qq1zrp2DjkC
87p7vaLceSmWN2fN9uZ2GCSjx+56Y9ZmKa1UjxzMLE1FNs1y3NBYeX+Vkh4XpRvy
Ubzw36nzSY/HbzBmmHcjaRir5qY91A==
=sqjV
-----END PGP SIGNATURE-----

--HYAuCMW0ZFMoY7vd--
