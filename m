Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35391E0DB3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431726; cv=none; b=YIQXZIttTQ7Nh+pqlMIk9EPsWf1ZUoGpvuojng2u9hg0S/nvCsiuB5K6tyCQIQL3ZxfCTX0s0Y0N8qeIjETAZHld6tzYL/J4Fk0gg4ePxvKXf99d+pRPI40j7tYIHAoiza8QQbujyGxNmlqR8QDN40AfrMFF7QCvS5OMjRcexBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431726; c=relaxed/simple;
	bh=b5unZ7PuaJEtaonb2hF4GGjXiywkQkOXIKVB+wJWYvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHmVoChf4hs2BwWjx/RJVwNJsUV6hensfKSyna0UmOnPVG8ajIf44ddd1xPzv9UXftgtH2nswjd2rCuVWeOCa3+R84dOTp/FQcBY4WL0rrm2Nx7kbiWetE5FFYeBIHJdZv6kHBPsYNuaupW3H/zMZDxiG1Ij8PuzZokVkPUQfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=D26mcP7D; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D26mcP7D"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so33448765e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746431721; x=1747036521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ByyOGZroZLeQ1OisReOsjO+WUJqIkTvlMsXspaNqO8=;
        b=D26mcP7DGbHs5NttRy6HykMt2yYuk69RPqthMKfRdC73s8OIX/A1naf0T3BGzvr9AS
         h3H2a+FdFzycHQAww7GeRM75uAXJHBS929ummHHAMjwBJjcmnwx0OIwmQb++Fwt5wLDT
         q31xmEt+ovKB/YCiW5z0pQQXLQrDab5sQszTV2p46rpAaYm2+trhM7QAV4UPtYjtv+S7
         oTOxhjOqlNdK2uAIQsynZWpiemw83NY0wD+q5At2HyB0//ETX8XPHTZXqHlRgmso8jJN
         P2Nmq2nDbLRnvACPB4uwqMcRvw1G8/YWjBBl2SY4bY+IPt+65ggp4xSuO+XTkKgB7hLB
         N9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431721; x=1747036521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ByyOGZroZLeQ1OisReOsjO+WUJqIkTvlMsXspaNqO8=;
        b=j4sv0QfbOOGLxTh9mhdEbv8H5tVTJnncp0/ImhrFp5FREn9SMbR2si6h4NNPm9autI
         wlf1thr1XRb4v3MqhAaHCiXAg68uUPmpwZetjrpBH+9Qivf2IGMEgtgIKm0UhMH/s7is
         kJ38HCT9o1e7VXYPZadyyxVmHOqETq7rbnyyCvpUzTURJ58yvy6o9Hj8F6r8QTY7nAXu
         agMIWk9QQmorcnMsnOTBAJ/sJvko4ALnki7mIhhxtpTyjngAioR4dXEI1lhUL5c45SJH
         IO5XYpzg2/8xq6souMQqT7xdg55Jf/0oH0UfVK3dykfnEU9Q7/GaIJILyMh8mmXDSeCb
         tLAw==
X-Forwarded-Encrypted: i=1; AJvYcCWlXUyjlUgOyGVENNly+iejoWQlXxr7a7b0wzzZIkvPOX9831Ox+Ytxo9eRNQ6LXVcN4FAR0ZK0yHrxiBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBpyrmAB4ifD00j9rC9hunIyNNSeeYkVccC03FzCpZJbPG3OG
	KXVSDvx9LuFQiMYoURqSoMaMSrX/rECszyIZigjVrafLXIwMe2iNtlOTrf+umuk=
X-Gm-Gg: ASbGncvoeieNfiuKw+cBgr/vpY7AVQAbj/iFC5NmcYWx+HrQEaayn8Y0IZbUWpWYXse
	j0GMQ+QrgVDiKWJRUeCin5B6vK8pOy4s5D2LKOMW86AdCeZJZYsfwtxj/Lapr+ebd63YTx2qDnc
	PctLqhbJcO7vrB+xpQie+vthK85JcS9YlNoJDAaIqGW1EkZjnuy4YvgtM73/OvPCuHAbksaMoIq
	eN951kSuTwRefnjFw2BxTf6qjISFplitXNsWxbN+AbZkINRD0+E/f9HGMV1Lhfe6Hx9IjiBCeuU
	UHNt52aRt3N7aDciZgm8ipDDkffjr3nZQR3U/bOKe50SnG1Org/nNZzlei9vkpzj7vR9SR69vzl
	/UXawA7KMXKNoSp3Xmw==
X-Google-Smtp-Source: AGHT+IGu8b/n1LgFExE7OuYx8nSsgIdxKAyU11E4xr4vzHrPzib2SORA7o/rdTvXrV42fOTr5RHx3w==
X-Received: by 2002:a05:600c:1f93:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-441c491a046mr37909825e9.23.1746431721152;
        Mon, 05 May 2025 00:55:21 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aece0asm169434565e9.14.2025.05.05.00.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:55:20 -0700 (PDT)
Date: Mon, 5 May 2025 09:55:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adam Ford <aford173@gmail.com>
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Marco Felsch <m.felsch@pengutronix.de>, 
	Lucas Stach <l.stach@pengutronix.de>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Makoto Sato <makoto.sato@atmark-techno.com>
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
Message-ID: <7wmuggeoslylq266u2bhunz5vcbbwaux4jv7glytxn6yer2nyr@7s3cfixtlau4>
References: <20250310-8ulp_hdmi-v1-1-a2f231e31987@atmark-techno.com>
 <v57uy3gddzcoeg3refyv7h6j3ypx23mobctybt27xzdyqy6bgb@atzdlqlytz3c>
 <Z861gsaGY6bGSisf@atmark-techno.com>
 <b2qwqacogz5vzfekhk5276owld6isgewu5a2iw3roag3lbtsgm@67vqf54c5tdh>
 <CAHCN7x+q-K067u6o=+E9ybREi_jopwhMTyMN=JKfCS4r6K=HWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6p7cskq32nmvghrs"
Content-Disposition: inline
In-Reply-To: <CAHCN7x+q-K067u6o=+E9ybREi_jopwhMTyMN=JKfCS4r6K=HWA@mail.gmail.com>


--6p7cskq32nmvghrs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
MIME-Version: 1.0

Hello Adam,

On Sun, May 04, 2025 at 03:44:26PM -0500, Adam Ford wrote:
> On Mon, Mar 10, 2025 at 11:12=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hello Dominique,
> >
> > On Mon, Mar 10, 2025 at 06:48:50PM +0900, Dominique Martinet wrote:
> > > [...] and I'm sure there are other improvements that could be made at
> > > the edges.
> >
> > One thing that irritated me is the function names. `phy_clk_round_rate`
> > sounds too generic. `fsl_samsung_hdmi_phy_clk_round_rate` is long, but
> > I'd say would be a better match.
> Uwe,
>=20
> I just sent a patch to rename round_rate and set rate functions to be
> more explicit.  I also tried to refactor the driver as you requested
> by simplifying the code, but I didn't have time to integrate my
> fractional-divder code yet.
>=20
> I will be traveling for most of May, so I won't be able to revisit
> this again until after May 24.  Hopefully the patches I submitted meet
> your satisfaction,

I don't feel authoritative for that driver, so please do stuff to please
the phy maintainers and consider my comments as suggestion from the side
line.

Best regards
Uwe

--6p7cskq32nmvghrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgYbuQACgkQj4D7WH0S
/k6GxAf+JlMX2lHGD1BihbruJ8xIk8XdYNXCnBLFlqpNK6fhXPNwhOdkhJ0Pr2Nf
wNExFkgF/GqclOtwrPy9HRy3PMlmUN6qpsMklgMTJFPHsaTheyOBGxvmanRbzp4x
ytZpdVPjeb54xTTTwHnMFcxcdpOOPQ1PpCHaF5NmobLBquZ5MGaP4PCC9/0Krmrz
NmlVF7kp1qw/9Wjnpj1DLJ7ZcO/GslEe5G52ucR4+r3qAF9w9mj8ggtpMUWtdjKo
OoEKaYZps80lTmL9tggG/4Dp8J/XhwORvWYSB6u3Ug73ULZ4kBtYn2PATfir3grq
C8ldPQ9/xJt+mM47sIZAvL0WcWCFwA==
=FeBE
-----END PGP SIGNATURE-----

--6p7cskq32nmvghrs--
