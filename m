Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107AC1F4631
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826352; cv=none; b=UJ51uScX0nipdhxekEAED2Qk6q3QuJM8B4tc1BgJwvRrwBp1MXvxBJYI89Kinx14kUcWsbuaDPzVGlPO7y8aG1hc3OyhJZdKA1Ue+uB+Sh9+7Qpwf0Mu85mJeHwlHGqMOoh94lxN22wR18NqQvgl49qBwslYJkM7Ecbbf8YE2SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826352; c=relaxed/simple;
	bh=dKdwld1K15qYqC7KADuP8DoNmglOc6igkyzr/XL0LKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlQcKdypZrC/1xliumhHvC5OpD1sF6srqx8IaG32Un33+5ySr/LBQYZenjJHv13Qx8apX5JrhRHyqX48UAacfbFQ2UoPp6RSgi8jABt+6v0TD6kO1pzrOeIP/v3zPqFUjATp/oXHBBGVJnJP027R9qLO/GkD4a2ewq07sUNsNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRH9g+Oa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRH9g+Oa"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d6f933152so5980527e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745826349; x=1746431149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKdwld1K15qYqC7KADuP8DoNmglOc6igkyzr/XL0LKQ=;
        b=ZRH9g+OaoAaKEMW9eiISvITJdHnx33OGA/dj/DM2wB/MsBtyaxBB9bvABdB2u/r3kW
         oUvW3XoFOdwLHS97YkaONHoTNJHlY08QimH4FpgKJCf9q6XgQIbUeHRUo90kep7uHT+3
         oqFl6QW6CMgwkvh4P9L+MjZ8X4NUp5NP9yNS7axEtmDIn788wpCaiOuxbkNWGwE+szL3
         tZXdOuZDrDLcz2s3nbT3DcfiTIVOlz5hGGmQfGCjBXuKPbgMRMS/uwy+dXoZWuQyXOrm
         TkJcmwrJO8skPiiDr4S9WZFcH7AU157ANdcAaJb6ub2PH1OMYSWNVLgirOyScCqG1S+z
         kpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826349; x=1746431149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKdwld1K15qYqC7KADuP8DoNmglOc6igkyzr/XL0LKQ=;
        b=RMLsaG2Lj6wN+uf/RST8ICa3K8EV7WlAx4sjDRcAdJr54WKJzDDhZYtpNPXGHRUXkJ
         V+tXGBTYsL3Pesl9Dflj11oFvwzHRKNa3qi3zS3E3v10djER0ukSC1J3Zc4yxBoJh/AB
         tTBUPy0YI2fYtUMGf7Ee4eGUr7SXTCL7oRtU+QjwCi1KufJet9GqPQO/xMFn8U4OiEme
         ry8vyaun6e0EEvN1gtX4xUOh+wDplI4Oz4Io3MgJOUZckah/M/S9snY3NL5sx6C6Mcaa
         K6CzmSoAeUsNAkGj4t2BuxO+tr5SBn1jo165nTkq+MmxhQlmnZSW3lWzNdvnz4n55QUH
         /RiA==
X-Forwarded-Encrypted: i=1; AJvYcCUq2Mu9dT4POuzowDGdZGFclKXOuCFEAgQLNBV7pQrWgw9Tt1vX8qEka5RbxDrm0fHzD7WxfV0+05/JgPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hxyeULuLejU62gmw7lgSV7OVuW1c8W7j7AJD24xnVl6oEIt1
	FlwPrWpahf5/CdyzlmCmjYzUdKOdmaszmh35Hxr12drSKkb7R1QH
X-Gm-Gg: ASbGncuqX3ByoQnPlQENWYlPYInIzfqQr5VnQlzccSyPwkIar4WQVAOaxNhpziyRcuK
	ayeNDEsvDdIASw6ln/Vzq2OPamffiw+iSXZsXLnX/7liP4Ca+ITjMODcs3KZn7Pq7ywaes6PAv3
	waieUGmKMt4Bf/h6ElxTu4SIDyV1/wDxEQIZTHpn23FGgM5n97SmDbR5SjVn2r0FVX4KSLAo70d
	apQz/9kKRFzcNHIos+ndBiCb09m5QumYv+U7GZo/XaIXf0O+jtNgxhs/raASKyX7AvfbcarTbWP
	zOW1fpO4Gegx9WvJpkCrU4SvAWJ4f/5RNt8m7h7sd0ptP+Di8ikEn19pU5WIghsJlYnT7alKgxd
	Kmw==
X-Google-Smtp-Source: AGHT+IEWTkLzNXmtUJ1cyJ6I8VC5CcRe2grkI2qhYbv567ugil6j6yVGJUpuggrbLqJgyixmX+oOIA==
X-Received: by 2002:a05:6512:3b22:b0:54a:cc75:3d81 with SMTP id 2adb3069b0e04-54e8ffb7fdbmr2198951e87.4.1745826348821;
        Mon, 28 Apr 2025 00:45:48 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb803fsm1582164e87.228.2025.04.28.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:45:48 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:45:46 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
Message-ID: <aA8yKi0QDCg1k8mS@gmail.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
 <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3/OfVP2ovH6knViW"
Content-Disposition: inline
In-Reply-To: <877c3421tb.fsf@minerva.mail-host-address-is-not-set>


--3/OfVP2ovH6knViW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,
On Mon, Apr 28, 2025 at 09:16:32AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > We start to have support many Sitronix displays in the tiny directory,
> > and we expect more to come.
> >
> > Move them to their own subdirectory.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> You can also include the following if you feel like it:
>=20
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

Oh, yes of course, sorry for that.

To whoever applies this patch, please add the Suggested-by tag.

>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--3/OfVP2ovH6knViW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgPMiUACgkQiIBOb1ld
UjKEmA/+Ns0AjP3rVWn0ZDwzM7oCpcYNsMQAloJuJBGEQlKWShRXkhUkMf3OwVl2
pnb7joWHLWqDtbqWk5zwnRAiY5aHp9LNOIicmWSyt/dJaVr8afICTL1Z/s87JmSu
ygcxv96iAwPu07CSTAh4F0vySz6nEHVbX6lOzcTIQqPQKBohbuJ5pFPeA79qoryY
xdWVdPhAm9Y1TxtBMAZnkxrzharn8WCzmIMWwMtbEh3a7kef78qAbQuSdjofJyGx
/H6LiVtMvr0MV71VOuyY9jFo3DtL/KgJrj1/URLJajhL2nREv+4FNer7KHZp8u31
TEQR8EL8Xf99rOjrPjsCfdcHKjRIkNcwciuq8j12rWKSIuw2+lPuWRuihe4oLWYf
h+O516gXx7CYwGrk1ZVc9MvSfI2EgXI4jC4SP9wtyCBgYdYsZ/v48hzw25tD7aTg
30GLWM06dmJuNwoVx5ihqL6piT37bpZ4KaNE+09f0DmQNOp4Ht4YqfTV7KrvOY6f
oMH3Jp4ANO8/cUCbrnfVRsmAIakKQRiGmkbqXVJ+G9euuCfbfVJ7K+U82zPLZY8m
Yk/SMKr6JBHN1ofvZRoJTqdkqXnqpBxIrFeAY23SdHmbel/ImnSyQWvj2PbWmPo+
nz4HeRzDGyL5p265VB7X1OqJGr/C80XnKzA9Tmf6LcoQwjRjaQE=
=dBye
-----END PGP SIGNATURE-----

--3/OfVP2ovH6knViW--
