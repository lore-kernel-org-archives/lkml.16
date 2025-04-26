Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19925C708;
	Sat, 26 Apr 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745690454; cv=none; b=k/9yp1mJRR9zW4hfJXX6/aoohSyNQ/JwYUehQM8LGZYmKlprdKeXiCZCAGFoF+lQIH4HsQr0EcE4SLVCiIvnhm0bo6oHFVWUDUfekmOkvhGJJyfcPi9xmC3Sk5qgRrSU29ows0q6kFWlq2xFVUDIhveXih23U9kWaxv4Ht45RSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745690454; c=relaxed/simple;
	bh=PEMMQuRLMmuObss6aZpzBeo6DJxl3rhuVaA5bJo36nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdWL1om9QqQVmp8aUCdEVxTyIx1QMFHsgzSGEiI6c1bsTlUQGxPPSpfiDvk0lvtDFNvBu0IluN5rSX/dJkZVXU5nUNK/XSZM64rbhAMjCIJ7q1x2A0fuph5yNasb9d9bX5mN4bgGvy5HhlfRBxCjiC/srlF1K/X5gThq1Liv0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpc2njmf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpc2njmf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so3768850a12.0;
        Sat, 26 Apr 2025 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745690451; x=1746295251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=;
        b=Wpc2njmfuwL8knCfIi+8Tt6h1LuO7HCF60xx5DywrEfOPG3k+9djZ3vyPoMB0Ik5jR
         aYOtCC9Ywn5qeG7jEkI84X+WEsQaiALB/xdKteVo0xr9ROKpd+j9AcSjmgBM0wUwCqV3
         bnktjxLfeg0x8ZCq4S5fOeRL6jKJvUvGUV6bSvGDCks+mEZF+8E9f9gJQJljlnwJrvLq
         dQcu559ZNEcwsQX0/R54oXT6fy5iYHnGxjAbxqK2T5f8oohi9Gs3LPU1vGfNXxQvn4lQ
         DgJUl1SQNPtsujqC+NXZUVUQjTMPeE1blAbBrSMDsYoiL0EgLwWEIlLuxDue22rfQmmU
         2V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745690451; x=1746295251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=;
        b=EhAvfNOlTezlXmEFapl3x76u+8IH66FYpy12jKWTT0qcEz8VeTF7zElbQqTVFwW41f
         tKyTqzTcEv24LiidyDN1sp1Fd+PRPjE3IgemovZ133kvOSCxq5k19Rv+D7SDG8V1ESUI
         sgxccWgMfTvE1mNs/6lFHafphLl8fX6C1uoLHhcNf7CtzTuQ8WaCTnmhK4H+SVNJwY5I
         7y+ofSu6li9pz3j2YzT2rU0FDhYd2XCXZ/0+HB3+Nb/OBY5RCPXE2A1NwcCix0Y6/h7h
         4Tqi0M0Zc/syzXYT2TVlu/zBFqVhS09PCtaNAQvQJpU2drBIYFsbeKf7t71debu0jZ9O
         Nu7g==
X-Forwarded-Encrypted: i=1; AJvYcCUELoY11C/8wHt+RMSVWon5y43ylzgmYUokrVErVkgp7kKFi2opqf8T4HiweHiXwA9B/IidwZc+MZcA@vger.kernel.org, AJvYcCV0euluO8QvRTrj2Bv64VukyYVok/jW4xQX7f4ZekhpDYJeymkOjoYR8ZH7BBfTxmuAErLdZ4kLGJjuadFF@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFeC5Qs/3FiSKIyS2AkaV/a11jDwNscE+/yR0QOh+NqB09FRC
	Z7KBMauFPp9WL6aopGK3+rfsJyXk6t7JxZZUKVbFzyvxWhfWONVs
X-Gm-Gg: ASbGncv/PleNTmJcFEZu4OhIN95VcICy+lKHyQoasKnfCI50Ws/sCqoZ202pHvi+4xb
	uiPcD73vczwlbGCV5LfzFMzDJ59GfvxJ98b0iiVWPq6pVKWu7CLY41zbs/74sPoZd2oYa9+8ONO
	meit7rmZwaEQxAGs6Q4toEiQt0UwvLiQhE6So2JAl0zjyqce95GyNqIOU7RPW3q7rkhcQHjxV6m
	hsKPtdzMkYtUcvK2MTqymNel41Tnq2wS5Gx1imSK5ak/OJWlSgOqtb/5U3QRY1eMYafzHDVjfqk
	kieiss0zTJAsEj5amZH8CVZcBqjaPk+FtuynBEYQ50qMHyIjGYCpu6X2RIYRfg==
X-Google-Smtp-Source: AGHT+IGcpmUd6V//Dy8oAGqBTp+EMOuxREYwc/MqDM/gwlxvfz17SlAjfX0874oELfIxArWQUWoL6w==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr822844966b.26.1745690450982;
        Sat, 26 Apr 2025 11:00:50 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f7c3csm325590366b.68.2025.04.26.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:00:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Sat, 26 Apr 2025 20:00:49 +0200
Message-ID: <2219754.irdbgypaU6@jernej-laptop>
In-Reply-To: <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
References:
 <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
 <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=8Das je A=
ndrew Lunn napisal(a):
> > > +&emac {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > +	phy-mode =3D "rgmii-rxid";
> >=20
> > So relating to what Andrew said earlier today, should this read rgmii-id
> > instead? Since the strap resistors just set some boot-up value, but we
> > want the PHY driver to enable both RX and TX delay programmatically?
>=20
> Yes.
>=20
> There is a checkpatch.pl patch working its way through the system
> which will add warning about any rgmii value other than rgmii-id. Such
> values need a comment that the PCB has extra long clock
> lines. Hopefully that will make people actually stop and think about
> this, rather than just copy broken vendor code.

I spent quite some time working on ethernet support for this board. Once
I've found PHY datasheet, I confirmed that there is added delay. So this
particular board needs "rgmii-rxid" mode.

Best regards,
Jernej


