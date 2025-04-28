Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA8327A10D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857629; cv=none; b=r2sfNFnGV/bcy1LXMz1jy+AGNir1gkQUuYolRPJJebEt0k7RdWe2EAsPjjy5rpiE90mn56Bt1RBz4FWioGDKN+2NfWggFggpSsPyRGoxxvvA7yAoZDUzeblIC3FnmG0bQciwA1cBjSqf+TGLAYy2LL74S7wbfvsJ1aWF00BOknc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857629; c=relaxed/simple;
	bh=NEz+7HnlSD9gBpRqA1Xm5hcc+9kBO2HYG+echiMcxYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLaYPBaKthWjtkZCj8EvsE7il9PQyMKlPR4ALv5daIyoTkH/uN1emcY22kplmOo5JlgtqfLE5ctYeXE/Y4BIVk3AhjeAD/3pe16f9Uow5cai8yJHx2xx/xJmXmTQ4AEZAj3myK5a4Ra3nkNmpEdxtpPPE8Ssww3co3+lZqv/TUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKPgrRqH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKPgrRqH"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54998f865b8so5100248e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745857626; x=1746462426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NEz+7HnlSD9gBpRqA1Xm5hcc+9kBO2HYG+echiMcxYU=;
        b=MKPgrRqH66QBcrudCaXTDpmsngKLrO4fQ5XzkGlWRC/pj4IwhWesbEEDvowrJ5a6tC
         5WrhQ9aMIuZTahe1LV6E7E/NxhSbpkG4rV8E5zNel0ZGneix2oYxUfKRBIYocJwkke9P
         1oof3ul/YySCTHGATJaPlaN1sHQoKeRIN5qsmIbUYtO4MEuy4txV8fDeGnj59mv8vqP/
         aI0KswYiLX0cZDmtdZEree1ApAaO/wiGo81K6+seckxMN8npF+mwzkyxPG2k1qb7izm+
         g68yLfV3Y8xUnz5y0xP7si80QTgA8Wr7ohJYgbFP3bqU9M3UVbJIj++DxqTUiwAWV8iP
         jDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857626; x=1746462426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEz+7HnlSD9gBpRqA1Xm5hcc+9kBO2HYG+echiMcxYU=;
        b=gNAXCGgovTX4EQ7AQyrbWgyPKprT3PAQ8Y+wqEK6SlbDVQOQNlawc3ZtNuK1xtvN0M
         JYfFEXu6M9t4LCnLDdMFG7AYXG6MJA3ijmIIsTTYbtB4LcOY3iZoWM6vmRMscH4s/XMc
         p0I0tW01gysn6GvX3/dcgrFE7BBMQy/9W5dhaC4Xb5wJAz2ejC6VRWhqs943RvDOV9iX
         qwKLwrAgvgLCIhDRNKltPnsiHh7ye6Urg/wgDMvHeFUC2tmlfcj2/rgemzK8JZa8YmX6
         bYWioMh5qhpcAMENy0BWt8LiRoVwBkIlZs6Ycag17chxCudlv71IpvSOddXqc5nUxK0G
         Sw9g==
X-Forwarded-Encrypted: i=1; AJvYcCWTXvaX1yVuXdFxccs6e4JUDKvQ5e/A7cKJO1BFPm9EIGefDK8vztEJoFZmlGNniE/VN4zIoyW0Ls/G9kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvsnqZGlq3ovOTnTcC6Y3wSWI6qfELfIvE2csAtIlpYUSqbsg8
	mMHC2MF+9v86PNqEHrObwAKfFPkMefCN18zr0oRLDXUdRyRNAPjy
X-Gm-Gg: ASbGncvafJgxp3M+1NaY9f1LRb9+SdnVRJ+ASxXUZdAQMXIgt1YoVG7TU6krmdhgm1Y
	O4td6cjnrX7VcybsRMfn/h1NyoeG/c1cebodzNAqRcpr91jeXfU6gfhFRjwJRLc5aO4mB+26+ae
	orO1NDabqZaUuiXr3zC3ay1nTzVZOhLqE7IlxuhzKs2QkEyxBiDYi5Pt19SxoDyRl75ciFt4aVM
	HYgE77BRTDDKD2+hQ0mszVgipQ+EgfshV14kijxyv6fer0tlHZkebqwrMrMAGRo4HLSPFLa9NUM
	y2Mds7icymxoYknAAkv2gS6uk7CUE1PekkpdJP6ZwNRg2yKWqnDpOCw8ytvniXNMl9UNLKa0NBQ
	/Vw==
X-Google-Smtp-Source: AGHT+IGr6BX7don/g6ZzfnnNUrD4Fex9BPlhWoDzwbCr+DZza31LV5r8+5jBFKfRTAtrCQtlTb7OFA==
X-Received: by 2002:a19:6458:0:b0:54d:6aa1:8f5a with SMTP id 2adb3069b0e04-54e8cbd5b23mr2738532e87.13.1745857625379;
        Mon, 28 Apr 2025 09:27:05 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7cf7sm1648779e87.214.2025.04.28.09.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:27:04 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:27:02 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, David Lechner <david@lechnology.com>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
Message-ID: <aA-sVpH4JprVJfvi@gmail.com>
References: <20250428150752.3970145-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3c6wV1GzZxPmN44"
Content-Disposition: inline
In-Reply-To: <20250428150752.3970145-1-arnd@kernel.org>


--o3c6wV1GzZxPmN44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 05:07:45PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The newly added driver calls drm_client_setup(), but that is not
> always built in:
>=20
> x86_64-linux-ld: vmlinux.o: in function `st7571_probe':
> st7571-i2c.c:(.text+0x7b7119): undefined reference to `drm_client_setup'
>=20
> Select the appropriate Kconfig symbol.
>=20
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD=
 controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>


--o3c6wV1GzZxPmN44
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgPrFIACgkQiIBOb1ld
UjLJRg/+OXeqfy4JHuaJu1E/9ak8qieFsIFnvYtHXHj42ZXnyeaMV8lrdx/MYlA7
ci/Ql/XnIA4Dh9qFMNPBrfRw5zRs7pSXBQY2Ic61ocvTtVS3XRATYKLSIcCDRhFF
owscA1AZMXAMru6+jOg43b4L2TqRMT+OGa7Xj3m3oUW+atlnRDPGRxrnOHKDjZmI
9X1g+vm36QkLFIoVoMTrPp/oa4kgKxr+ZRRdqIfPtsr5MyG/yLBgrr1IOI2fF9kX
wsWEuaBDEQtLgPmBo4iK8FLLeQHkYOBNKmR2za3ItOZEe2d1OKCHqXk4T1nbit4I
8DqMAV2mc19hM7mHGE0/+DfBAmhvJhduJJ5aln+lacYJsUZotJZP2oSI9qqEpygw
JvQb44d1JLoVIETuqC5tyNtKo9nuQD4ylingsy/1BIul0FcSqtBVIADoNSpY2Ed7
iyT4+GV1dX16AjGPJx4kJEGGk7uoL6KX4jG1muWHkSGqEDrJNIfc3egDCkZziHJ6
Mgm+uD8gphzFh6Q7SIAYpm4lxY/Mcidk7slhow+QtRvsEfkQ6peeU4csUkUjfCfg
zy/plSitlaVAARLzF6jJ8oWXa4267Ve1ivpkxC4cFebYSajCRABHW4NN8rqJfaRF
XGr2EZCdk3Q5CzJq61QQFJAwF/ZncTY/N6N9xxheYeiDNS7fTB4=
=WotX
-----END PGP SIGNATURE-----

--o3c6wV1GzZxPmN44--
