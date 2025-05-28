Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357CD246772
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456012; cv=none; b=fFtrExj6TOijCnmskqpBUaxVSenXZYyNg+dAxOkHBcsA9zsWIHWEqtgs6UJI63JIQO1EsXpvZ7l48C29/Gf2sjtKi7Wwy6D2MvOlymxm7nBJ4GWR8jxMFfDIVvA4hkT47xP4feXzHs6sTvhUpFkWC9YVTdeqwACRxvV+EQZdj2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456012; c=relaxed/simple;
	bh=U4kfnRSN59WkHY9Ler2V9T7GAxjBXkqvdf0hrH9hz68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD79UrZleR89cAmSEMZi9bLujZVMk/K3alt/Glk3496TEpNMW7rCqEYtSzBrRO/RMfUFaNIJd99R/hP8OSFqxisxeMJjGsZQB4rhv/UMIF5n9ew8pyDWjM59CoehxspsyeN4N/DolfhX1nzqxMxGgILH73fJBN2a4pLipxqEW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=WSRUVhIX; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="WSRUVhIX"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7426c44e014so9338b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748456010; x=1749060810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfQ5QF4QrPtGjwJGXo+I+tvoV3Ek+wsqmkmzYgFTPno=;
        b=WSRUVhIXZIuu6k3StI3+dhZR2b4IsExDcJBCTzQIt6FNNjawaTNeCqRwywga1I/dCH
         /TW/63eWoFfqKbLq8B3s8AWpKWmOLn3UQ/CekPPLUnvJKJsPhhoInTplUyjiEqRwRR7+
         lclkNML2hM8IUMLdNccb/Wk4jYXsoTbCqviZB7uhWde+7TNxzCMCOqvzW6QpXk6+b4p+
         tvXCotL2kFIRX5Rgf4JBK08mrbjCHKLVrwixdyOyg9cujon7ysyfqctD09M7a8fbOOAW
         Axd3XMz+Sn1uxXv+jBYW3dA6LhF5EdbKjef5lEGX44qyXABVis6zUcJVPF0DAigcTOpx
         ffEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456010; x=1749060810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfQ5QF4QrPtGjwJGXo+I+tvoV3Ek+wsqmkmzYgFTPno=;
        b=SjH+SnK8yK3EJWs3x/UDyZKIjNlHgj2QUAfLsV7MssPYWBbM8SVRDWRaAQYGdmaexj
         edy5DJ7kLoDVIb/owkKpD1LqjQqnGCOQCHQO4QkF6aBiLym9i8UbZVwFczkfPYLcbgw8
         MwfaRq1qMqHuin4B02TZIXOAuIJvsqJdJQnv/UrXipHvR1d7oi0CVA9g+jeZkvQYoN8f
         7PPKwbu3336ccM1VTXW4cAYQNyQ2ZxQXJXFizgt4VcAVXTioMoL9EoNfRimfHf99/06A
         EkpWOWKwOOnLnjwnWF87N22XsW102RHXcEcBOLRDPwySx7y/WdRMnPo3uyPlgh/ksq3/
         R/mA==
X-Forwarded-Encrypted: i=1; AJvYcCVRMxlKL4bfV56/k1iyHz5eOiWGKV2+iNxZoaVOTZmU3fOc8qkN9FdWnpZWXns3yEruPCxBn7XhVeajszw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfnmxjEMpEpUkQJWYhw9F0iglSN++1o7XEhGVkfxpWzrdQPW2
	pa6K6hVfCbEPVqv/rX4WxSZc6FPIopQw3S8oQVLb9LMCOlUH4KRalrDqw1+3pGIfiao=
X-Gm-Gg: ASbGncuGW5104NauseAPvhU2175bbOPWqM94GrEynkdw8TGAYZc+jYS5WepsOHK5yZa
	EACQOLDKi7H9vyKbIe7hhggd8iZDkq01bF1mw1qGSrLDnNvSMIrfhpOjDoo4Tl5j6CQaGfLlXkh
	GxsZUJ5fStEV5hGAMUp82n1ENJyGKX0u/qMkcojXjcZ4SKkxUNFqDR3OQVxviX+90AHSWDa7HLs
	3k55tSxL44DSL2rPlUN92MhgfhYwCyfWxbSkK7seDTWhOKfK3zima5y9KsRAwCtt5hgbp7wO3iB
	LHbd3aCWjSMtFwd8faDzt4bczc8mHHjbywlbJevyPFGezDY11YnJ+Wb3+TjcJ/A=
X-Google-Smtp-Source: AGHT+IGoXH5nWNXVter/7FoojUs8PwU60p8upKHgzmtsaMD1s8dITxfPj8ze1St+uUzaNtQ6OA7rQA==
X-Received: by 2002:a05:6a21:46c4:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-21aad87d03emr5439458637.23.1748456010381;
        Wed, 28 May 2025 11:13:30 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e345fe8dsm1571589b3a.174.2025.05.28.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:13:29 -0700 (PDT)
Date: Wed, 28 May 2025 11:13:28 -0700
From: Drew Fustini <drew@pdp7.com>
To: Conor Dooley <conor@kernel.org>
Cc: Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] dt-bindings: pmem: Convert binding to YAML
Message-ID: <aDdSSNeiveSrM9NE@x1>
References: <20250520021440.24324-1-drew@pdp7.com>
 <20250528-repulsive-osmosis-d473fbc61716@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="39RrpW82KPLL21NE"
Content-Disposition: inline
In-Reply-To: <20250528-repulsive-osmosis-d473fbc61716@spud>


--39RrpW82KPLL21NE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:43:27PM +0100, Conor Dooley wrote:
> On Tue, May 27, 2025 at 11:17:04PM -0700, Drew Fustini wrote:
> > Convert the PMEM device tree binding from text to YAML. This will allow
> > device trees with pmem-region nodes to pass dtbs_check.
> >=20
> > Signed-off-by: Drew Fustini <drew@pdp7.com>
> > ---
> > v2 resend:
> >  - actually put v2 in the Subject
> >  - add Conor's Acked-by
> >    - https://lore.kernel.org/all/20250520-refract-fling-d064e11ddbdf@sp=
ud/
>=20
> I guess this is the one you mentioned on irc?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, yeah, I've become too used to `b4 send --reflect` and managed to bo=
th
duplicate the message id and not actually include your tag when using
git send-email - d'oh! ;)

Drew

--39RrpW82KPLL21NE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaDdSOAAKCRDb7CzD2Six
DHbhAP9XlQng+snuCwTSEULcb16UVf5k2n1W3hLLrDVfGt4ZTAD/ZE3wUuc6HIbm
UMX2OND4pLWeegQhzQyiJYCOPJ/k8wg=
=3wuH
-----END PGP SIGNATURE-----

--39RrpW82KPLL21NE--
