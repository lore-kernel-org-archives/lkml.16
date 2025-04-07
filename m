Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29D02309A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017691; cv=none; b=u5jw+J6z9MLTwZafqETcpWSvU78Xa5D92sm0u2jufuZaWXJUYuIQP2VUJVVoJUG9PVILK9CRuNZxRpCTavahlwkUdyqQ83vlPMMHY64GWRhTTIRA0KFG+jxPN/H6T6oDwCoH89hap9kYtbHFemyEgpfujiOUP9ymYP6iEtJgiew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017691; c=relaxed/simple;
	bh=iSlSsIy8a8fjMFvyVm2tJ7hdd5DE5BK0cDXC7vabG8I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3clRxpF1GC52q9zHt2kXDfdwMJva0hFMxtdT5AnvvouJ4FAqOOHS5mEkXOkAEWUla0S5smzbaR9UJcmr2sEWlr5+mBZiOw5j9q8WdwZ9wdF9M+QYhBRBUqCyOFm+0yMaS7p+ERzamTM6ZNH4Ahmdaim+RRvlxtTXqpJkS8tF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=WIuUMTLG; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="WIuUMTLG"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 478B53F174
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744017688;
	bh=HEaLDYOXOEmeBww1pBLiPCAb16rSoW8x0h/ino16yYg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WIuUMTLGpRNmBVTi2DEEHlyZ8A2QvCOQWbbsGFmuLYqIBZh2e9FRYRaJrRBLTKfw6
	 UE2fSkSBJWt0nnRwQl24YzMG5uwCIH48j9zADGa4HM2c7SNjXm1QC/jrLkH7qe3T5v
	 VMNF/rFebHSa0twMcFJ8sTEeoxV9lLcFn61kQGqFlinW9S3yjG4bWAEzaXEoGXpTSM
	 YEy5oVfmFLJgvaJw62i2UT4rQDhT9EpDBKWcJEUjbA84Q1+VNBAWf6cQdiB8WWLNYS
	 zt1qlJ/L73RLKmTjFvwPwi22Qw/8K0+WPmMMDX2ZQvJwbKaGQLHer//ifwi+j6/oMT
	 W6pZV1aalPnMA==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac27d8ac365so311438366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017688; x=1744622488;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEaLDYOXOEmeBww1pBLiPCAb16rSoW8x0h/ino16yYg=;
        b=Wan0lqA7r2iv9Tm3k6v4WTNzBPBPaQUbTfSPiG4UzKNxBaXgv6LzZ2s1DWLCsHz24I
         1oKwXK5/6Yug1zrOTLu9w+mNF269MBmnpg23JBSS+jtEkh/LOYmScDbXr0kxVN2cKePq
         uDbJFbf1NvWmIdkUAVfCGIXZIqS1+MHqmc/6wiazYtTW6C17WAdQduGu7c9eMhuQk8d3
         Gd/axzcuuKkgWgFu9fdm0oKFTjFgt5mIhDoLPlpmKVh2xQ6tlIvpy9B5tCLUsxssg4LM
         Ia6wPA+aAdqanabOlNiHAu1+8Qi9w6jOuzQTwGVLt84S0piqxuKJXV0fmSSQJGo5+DR/
         3g3A==
X-Forwarded-Encrypted: i=1; AJvYcCXp3lBqsj/aCSXfPb/xJHH9MEKSfg3LRkI7KkIlj439SvGcaWzURnLSN4GufNmDhtrTAff3xxGlc+GSB14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdnsyOZYDKjZRsH3vXrJvGG16fHPN2CosBgRT/p4ZkZu3ZlKT
	zVXs1+lYEW9w1hY4Ux3bLV+SOuBaBhR6jHuY6k6SkqGM73uYv2E3yMjJRlI7ok80vFgkR/pmKqF
	Ajzkkt3sqMx8X2/tu4JpoYjdiNiAqgkSm08HvKAlUsmk9NMkLbGO2oXsIvy7X6Y78GFnw58L3+O
	SwUQ==
X-Gm-Gg: ASbGnctjaImukFy72KQxSlXTiiNr7jQKjbq864m3Ky4dAEUJ50mXDWfPVGLWdRbPsZs
	z0krjuGWVeIM9EE6/D4ZaTRMQLRbRXara6zDE/YfKP8JwHY62wwydhWnHDNjlLB3F+XxgEKIsKX
	PZoMsdn9MfPkVvJqgQsPbskDybIatDHJBqTFpuIGfIjpay9zkp1A2AR04B1XWE1TPR2k5Pxy6cS
	Kcz7N6RnOFMU0FgZ4kwAjoo3xcUsOGSfakxgE9Rw76iEjFJhEebDQtLv/I48SwdV++FVCMsxfhV
	fWedQU99ITrmw8wkaIeOfgf8rLGJJsHJ/8e06B4TYVl12e8y/1KWl53/
X-Received: by 2002:a17:907:da6:b0:ac3:24bb:f1ca with SMTP id a640c23a62f3a-ac7e71704b1mr706494866b.7.1744017687893;
        Mon, 07 Apr 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyEZWiuDaF2JJ5GJs6D6+FEn383IkKkAsNepFXIH0X3u6o9dK8jmGaIJRw6XAhqqRc3z+sng==
X-Received: by 2002:a17:907:da6:b0:ac3:24bb:f1ca with SMTP id a640c23a62f3a-ac7e71704b1mr706493566b.7.1744017687557;
        Mon, 07 Apr 2025 02:21:27 -0700 (PDT)
Received: from gollum (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe986a4sm714636166b.39.2025.04.07.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:21:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:21:25 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create
 and include a dtsi
Message-ID: <20250407112125.65f22dd8@gollum>
In-Reply-To: <20250404153339.GA1463808-robh@kernel.org>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
	<20250404090108.3333211-2-juerg.haefliger@canonical.com>
	<20250404153339.GA1463808-robh@kernel.org>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/axXhoG65m197/2vTrG.U=7j";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/axXhoG65m197/2vTrG.U=7j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 10:33:39 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Apr 04, 2025 at 11:01:06AM +0200, Juerg Haefliger wrote:
> > Create a dtsi for the HP OmniBook so it can be reused for the HP EliteB=
ook
> > which seems to be the same HW.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
> >  .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++=
 =20
>=20
> Just include x1e80100-hp-omnibook-x14.dts where you need it. There is no=
=20
> rule against including .dts files.

Ah that makes it easier. Thanks.

...Juerg


>=20
> Rob


--Sig_/axXhoG65m197/2vTrG.U=7j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmfzmRUACgkQD9OLCQum
QrcITA//YRlVT5IeMhh8Va/712MvwiTgJtdw+bN4W88wwrIt/RuZ/q+KWNx6kN7U
JvFeBZ5lOY3A9ncxWmoGO9b7vX3lqdqVbvDzsSyEUQi6feuMRgIY7SAaY2uSH6lB
C6HdmuhczWpYyWfkzSHV3A+LBXXnY2joO17fEWsHnEDa3zQOgmpUJ9to7ZF8jjSH
zVXDkpPw+GJSPDaiEHKicnzzf87i4hETEa0KB5kbGxNfzhCpmjpdFv2anvt9Hj2J
iYzK0guG7yZTpQWrilOdkVuhbyG2ZLRu2xn2VF7QtvJ3kpRkKQFmUUEovnWSyEdk
OLAzOG69frF/FN42VpSJb9pYvniWEPi5EvrluBZRK3L8G5S2F6kDucnWTnjBWw3/
P+1sUu7bTYsE3f2dF0dNluKy75a4d5f5GKlMO5luFCJ+hfunyESdfG35j6EcbgJ3
xnNecFC3c9CDIZi7UcdO+voQjaZGRd0e4riyq2b0VzVyOyFmgapkmim82e/C+5Np
CdrOjF5rlPN1xqdd7lRPKNIJfQ+zjRUngP5nYy85aDDdJF/YVxjMNuTAPeWKC2W7
o4B/6MWWsCxDkbee0QovnKRt0pT0raj75OinNE19hj+10PriZRVOTAvgSqGuowUr
HtChUgr5t2NMaE0xToNIl5IgShS981+YEZpvbjRa4/Kjr2q3eTA=
=rZfb
-----END PGP SIGNATURE-----

--Sig_/axXhoG65m197/2vTrG.U=7j--
