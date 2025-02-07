Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131710A1E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933122; cv=none; b=AlT7Zwr5HdVhQcY3qB9xqCcoP4LOx8Ek30BHP3fSMS0T1joeV6/uJvfN3SVhpN3xXNgClwiYfyYzdmXq7ALo5jVdgIVjwr77nDrGak6MpcFPu4ytA0K121R2oK6e8p1lIlIIO64S39mf37Mkwi8/KqroGUXVODPZwPLqGMy9Zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933122; c=relaxed/simple;
	bh=7ZXg2XB06xWpBNMZ0dTbbkcl16qEqV9xLoGtYjIsNRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h11+4cBUEBT89QAOPfaD7wYZiH8ZxZXuHQL+/PnW2luEx1y3Vr/QDDNVsjHNAF6lUS9N+l8r9yKN90EOiRb4yxmfQMA+4uzlCQg6FPKbDQLmKr0nHqL4ZFEXDWeL1JSppk8UvqRYdsbjGecNQZrZcoIfeH14Lad2xcvRBGj6Reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zBBCHajZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zBBCHajZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso377754f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738933119; x=1739537919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8cC7hZ6uzXANNqymrxNxizKVo2FCcoOnerezExOsqY=;
        b=zBBCHajZgFDC7ZrTZK0Ehnwm2o4NsqC6kIWs7ME2UcAGqyt3+3zZm7xt0o4oPrMJaf
         DfPYqZqePlJ3BxDEQD27h9C3HnxReyEg5Fh90gyrKYA9jjjM6/El8d7Ufq3Ys9hIgtoR
         IuVvNQtT+0W9bCuWL3d887yJtnM0AKw/XHyLCDcv8fW0TKnWcla4+A6MwE271OG1zLuj
         Heuervf5ZkZL7afOj/uwRYg7IXhtY8keZf/5O6ONBGZaVPmM/b69pldEIhjPZWtCcRrt
         S6X0wmCDyhYfcSM+8bF4HvXeDdPYBtHpL72opjsVyDaBOXnxcljUaVM97OgX6YJmIAdp
         c84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933119; x=1739537919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8cC7hZ6uzXANNqymrxNxizKVo2FCcoOnerezExOsqY=;
        b=rXHw9EVdDuUac3CdBhPu3rcWzpUeq+UzPRP0617PpSR5BEaa5+BiY7DQq48nmWJsRZ
         1wsLg4cimr85zYNoU1YhAQfCVSzqOCGOggFt0pD2VmcmShYzRIUUWyNY7pYxS/jOyAX9
         j8ghfCVLQhpY4ZSdEpTeIT/hLtBLIGhN8z7+ET2kIr2xstPJ/R+UDvPEtFfUZCqE6VSK
         BtlAZTbKGLbr76d1/YLuVYPRJ87uB0vl5Y0qnsijVkHlmpevYIuYq6p6nQZ4P4SKOtT/
         U+N+dNrnzlYtSSczvlrt06dLQebX/lB2AlneHGO0NIiUYkvwmQsjE6JovkK++T4ne9Uw
         SKnA==
X-Forwarded-Encrypted: i=1; AJvYcCXK/6KGq3NYPsCMw1wNNbaladc5qTTfgBiaKzqy2Q/D9f+BGZnCO0RP7foWDzPKzbgQSLdGbR1VjosmfW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOpMzimdIdvx+rJMO/kDSP41d2ovDCf7HObt/UkHjRcpWFnZs
	o+u1CwrEi8PftheQ9BMkFLhj1W8Txa9YaJwr4mZWVuc7C6s0j26T3qVDfQe03/M=
X-Gm-Gg: ASbGncvBwjk7N2SxxZXnNKVmNYdK5oyhxUPw/y2wkyBst62XZh6vIykhquBMYh93soS
	CsSs9zHcCf1q5xs24JnvwSWylBvUiJvCpnLjdK/7NT051yC2AY4ieP7KplWL5gksfyMOA+F8pq9
	5A/XlTnsjmh9BikzOXLKiP+fI3RCQOeY58gpYHzdEiTTk2c1FxI8XpxrmFaes30g5sp7oTWVItL
	Lr+GKPYA0awiW8GH7A8BBo6bmmHP6gMl2b18mmGn0AEKy35Vqp+/9fPfvNH5S1IrEXeq6PnhHP0
	NFEqij3kVf4=
X-Google-Smtp-Source: AGHT+IFpU8AdoWbYYXJlvM/MfFLSme8UqHGmJ/5bUzZ7c50zlMkStKZjdwZcUymCsIcM48r7kspDFg==
X-Received: by 2002:a05:6000:1ace:b0:38a:87cd:6d67 with SMTP id ffacd0b85a97d-38dbb11f0ccmr5697324f8f.0.1738933118601;
        Fri, 07 Feb 2025 04:58:38 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f1b570sm85882655e9.1.2025.02.07.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 04:58:37 -0800 (PST)
Date: Fri, 7 Feb 2025 13:58:35 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial
 aliases
Message-ID: <voapiqjxe7vbavy463pjz3kjboc7pjciesqts3wbc2zueckpav@fuela22hbuwq>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
 <20250203-topic-am62-serial-aliases-v6-14-v1-1-f26d4124a9f1@baylibre.com>
 <20250204035329.jzss2ar3t5arpgwt@reoccur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zb4o5bgchnlxnt4t"
Content-Disposition: inline
In-Reply-To: <20250204035329.jzss2ar3t5arpgwt@reoccur>


--zb4o5bgchnlxnt4t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial
 aliases
MIME-Version: 1.0

On Mon, Feb 03, 2025 at 09:53:29PM -0600, Nishanth Menon wrote:
> On 10:34-20250203, Markus Schneider-Pargmann wrote:
> > Add aliases for mcu_uart0 and wkup_uart0.
> >=20
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm6=
4/boot/dts/ti/k3-am62x-sk-common.dtsi
> > index 2f129e8cd5b9f127b1d1baab17be868938fae013..d52cb2a5a589a8e5eb325fd=
90324d57ec1e3783b 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> > @@ -12,6 +12,8 @@
> > =20
> >  / {
> >  	aliases {
> > +		serial0 =3D &wkup_uart0;
> > +		serial1 =3D &mcu_uart0;
> >  		serial2 =3D &main_uart0;
> >  		mmc0 =3D &sdhci0;
> >  		mmc1 =3D &sdhci1;
> >=20
> > --=20
> > 2.47.2
> >=20
> Are'nt these reserved nodes for DM/TIFS and MCU? What purpose does it
> serve for us to have an alias in Linux?

For IO+DDR mcu_uart0 can be a wakeup-source and pinctrl needs to be
described for that at some point. So I thought it would be helpful to
have these aliases added already.

Best
Markus

> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D

--zb4o5bgchnlxnt4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ6YDdwAKCRAkjLTi1BWu
P0UAAQDUgpQnZ/6RTBTDAwSqmUrzspde+nHHN5BMHTYX301IsAEAjwlTmV2ouLgL
yJ3xNNhONU5ZnXKeC/iTWYpwZ6CmaAU=
=+yFw
-----END PGP SIGNATURE-----

--zb4o5bgchnlxnt4t--
