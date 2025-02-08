Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE9137E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738990726; cv=none; b=U+MRrYQBeCaMvzZ+pJBXncDQBblHgUgw4oPf5yZfmMZuRlCP+4EiguWWfKWOE+GOWKxQTIkhFeMd4RNbQT8B2eLqRdolZILfDOcomHz5/v9M93I2hNSkJV7Wg269hOo1vO0+F0yJOTVQySAGheBlkSCs+ivgL38EqA9616OeJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738990726; c=relaxed/simple;
	bh=/29YvJfNYx4cOak9f0BCdC7DkksatuIrpDsCdCnsKvg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5uLc81hw1cvrBLKBOEObYiRUqvlJVCwo9hvSzLE+9W+ZrqFBul5Trd0iExiCYUi+NC/lI1zth6GsUY8aDRIP/L3aKgl8sFaYUYOvmm2E1vny29ldOX93v6Vv9f6CbJgFbaOZwXOxUH5n0xIXOoJAw5T1UnNetsZu9tV6LGCivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k+gmPzKf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k+gmPzKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738990704;
	bh=/29YvJfNYx4cOak9f0BCdC7DkksatuIrpDsCdCnsKvg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k+gmPzKf9ByrFYBr/1+WehnEB+als8wu9hFN1WGY9kZ2eHPyx2vk5Mum1xbVk0TlM
	 mvUWi4P0YxVGCjuurPmmaxpJdWbZ/0wI6V70lLm6tVtQ2cDgO20mpVYWkGJkus4cE6
	 nx022O/6VnFdRCwP9Dsuqnrd+JQw/kf3LY/WQwlS1CTc3EiaDV8VbesVw/Q9fsb5Ar
	 m0geuKcUd6kN0jROqSb1b2/KmdDZhqN1Za90XnmaDoKPYT4ps0xnXV1sZdb07AOcgy
	 VyaaAUawWFQaBlOhwCFjHu4MIKEwhaxUB1R/uiCwM/PLvK/Q0Rec7LRV4tu2q9HpZJ
	 i/pbavZn76S2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yqdrv20v3z4wcy;
	Sat,  8 Feb 2025 15:58:23 +1100 (AEDT)
Date: Sat, 8 Feb 2025 15:58:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: writeback: Fix kernel doc name
Message-ID: <20250208155831.762f3d5e@canb.auug.org.au>
In-Reply-To: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
References: <20250207-b4-fix-warning-v1-1-b4964beb60a3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WzKXaXyQPu0/ayuViPhSa4N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WzKXaXyQPu0/ayuViPhSa4N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Louis,

On Fri, 07 Feb 2025 18:35:22 +0100 Louis Chauvet <louis.chauvet@bootlin.com=
> wrote:
>
> During the creation of drmm_ variants for writeback connector, one
> function was renamed, but not the kernel doc.
>=20
> To remove the warning, use the proper name in kernel doc.
>=20
> Fixes: 135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_=
connector initialization")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250207142201.550ce870@canb.auug.org=
.au/
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Hi,
>=20
> I don't know the process to merge fixes for commits in linux-next. If I
> should apply this patch, where should I it be? drm-misc-next-fixes and
> drm-fixes does not contains the problematic patch.

The above commit (135d8fc7af44) is (or was yesterday) in the drm-misc
tree in linux-next
(https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next).

So this fix should be applied to that branch/tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/WzKXaXyQPu0/ayuViPhSa4N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmem5HcACgkQAVBC80lX
0GzaGAf/bvNGTPPN/BCbc74C1yNh57GJPpii/IoQJBF0sstFg23ShkvQ3qE0HK7n
TIZH6p6V1KlI32TfEmVN1mtxVa1rm5lDpHd4XOpWKt/Ufa6ezAb1mTpWTANjIkgI
POvDcwu1EUstMNloSSDQxGCkHDxZnyP1JIsH7QYd/4YE2vzPfCoq1/+J4O9CTIQG
80XM4YXXyHYgxWhPXh41NaeXcL9lxhCviVw/nzmKhDjDJbh8f2U+eoYKaQOhWUcB
P+Glt4ZqGfffHSVJYfHsbUKHyrcvPrBm2Uhk1y+qlYxjPECMj02ZkU74w0jf6IfJ
kUOo+RB4d/AQJky928ezyx2HUiuf2w==
=enLQ
-----END PGP SIGNATURE-----

--Sig_/WzKXaXyQPu0/ayuViPhSa4N--
