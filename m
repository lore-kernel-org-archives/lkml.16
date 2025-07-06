Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D831A9B3D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751798279; cv=none; b=FQ+dD0kDT9FbpuxkqpnETONmkn3ZUWoFeA6+I38wfhTdnM7DcNvWJ4JOr0jfBbBgdlO4PM9nYJJxQ/Fcchei4qGyTL0J7pgwKFp9w5XOzCFaTon8JdboAhMsul7Cl72um9QIVkROk9znOifFGQ1U1lLA5Ydk34vxczcCJ+xm5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751798279; c=relaxed/simple;
	bh=E7WbkHCv89+rDLqIaI2wpWPIl9rauYcYwaKabic4VV4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dfU5lykZrDGLo7x1DSVW8pOqeoF417o5rYl77LqWoBit/iOxZCCoMhNbgOyUNC0u2DhVZmJXIkAJPmTwSx8sgULdGFAGK0J0mg8GVpnH2Ug/wMnolEJ5U36dTlh2rSz//BlWdJDEX8Vm9/h0AU4WqhP/1ys9K3bwX3H0tdr/iug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Vt8GoLra; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Vt8GoLra"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751798274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PnW12e1DZsxOkvydzK2HotnR5pZwii2x2f3jZwicm8A=;
	b=Vt8GoLraIM5ywXcd7lswFjjkdTl92SP2XM4E6PxZMkUlHGLM6t1FT4FOkuMuoh0kx6Cpjq
	IOKS4t7aid/kF7tRlc1rhEfKJA+RmyQTquc6oDfnpmwnEZbrovIQtLyCBiBZ0OKbMzpj4J
	4C29m+1CZYiMhrSGscHQX4ZTCqiTnW/5WVoD0GziwaeULxO8at3Hhe3bV4yJq+ktJkfGgs
	hMDF8/YL6f1P2mseJshq8AszjutKxCJ0KfX0JUhsc1tu9v4IGmqHIZpT0Qgq1qtCm9DiAM
	KXkg8Z0Tku/37sJIDh34vkQKOEhsQ5o8vFUki7JmQtB2/yyvanUucpTodjrAzw==
Content-Type: multipart/signed;
 boundary=aa40d9dc28db920960fba5ac249def83a08213f8b1a374e4a5946d696ea9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 06 Jul 2025 12:37:40 +0200
Message-Id: <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me>
 <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
 <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
In-Reply-To: <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
X-Migadu-Flow: FLOW_OUT

--aa40d9dc28db920960fba5ac249def83a08213f8b1a374e4a5946d696ea9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

On Sun Jul 6, 2025 at 12:20 PM CEST, Piotr Zalewski wrote:
>> With a new version of a patch, you're supposed to add the tags you
>> received for previous versions, like my Tested-by tag [1].
>>=20
>> (unless the new version has changed so much you feel they should not be
>> carried over; you then need to explicitly describe that and why you
>> dropped them)
> =20
> Forgot... Should i send it as PATCH v2 RESEND?

I don't think that's needed; the maintainer will let you know if that's
desirable or that they will add it (back) when committing.

Cheers,
  Diederik

--aa40d9dc28db920960fba5ac249def83a08213f8b1a374e4a5946d696ea9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGpR+wAKCRDXblvOeH7b
boTTAQDVgBuxetL0DzvGcPFtwx7T7bTDcAoRnoFed53ZDkf+HQD/brK8092SqQNi
RV1KGSdH+z83fO99mi6WCkgzDwRGFAQ=
=8I9F
-----END PGP SIGNATURE-----

--aa40d9dc28db920960fba5ac249def83a08213f8b1a374e4a5946d696ea9--
