Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651522D78D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775341; cv=none; b=QIhbi9Xzk7x/L+5l0B6CvR61YWM9YREBWQ1LuY5Tvmqx2HLe/aC59NshZwxq1mQZMX4nvpHly43kXT34ZCGB3+4ov2sqZSaCmMR4aoUt1dZnHLq9iGPPgFz2BC3fKqzNZb7mpDr2gXEOIkuZKut0z02Bjfkbosni943xLITd2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775341; c=relaxed/simple;
	bh=ihB+rwt5XDis//1sTiN024h8VjUw07QCmCpDrWYU5hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1fhLG/6uncehJyywz8cAZ0aqw+dAvi9HFyGrU3QuWf4vjT9r2FgwzpXaD1NMdk42JH/plNZgGNT1FCMEIVhHOEDJk8cYKQMoPDSgmBM24TiV7JaPb4lnLgJCVyjErvbWFzxu79Dnle8OmtD7xhfOMdojZGBZPcINr+jmPeNdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=x6n74Akw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="x6n74Akw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c5f3456fso2559291b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747775339; x=1748380139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihB+rwt5XDis//1sTiN024h8VjUw07QCmCpDrWYU5hw=;
        b=x6n74AkwAFpbYkt7ERe96mP5gD8BqCUpitL4qEtoQNve/3Ky4A6OewY3JkZWBZz4GY
         wL6fTPt2fUhtTmc9bhOumBSdbK1Z816ZRV0o+CiNq7TEmavE0RqiMZV0VrZINQGkceFY
         B2vdA+vawHS/LnjfJJwxxHxzJPDTvKOzQSZywb0w/yQQeZK5uGbJAcMdszv5wSp3HGvq
         XJufoQDFZQo+DbLZyVZLFEr+kcQHP0qo6J1wAAjlvRdNVO3z41JS46oub2UH2q49uPjC
         RtucD6z83BzAY23u1DjeUnIbZxmG6lxv7RElvHtp07P1OxnAOcDdguMiFUg1ozDxP5TF
         ttlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775339; x=1748380139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihB+rwt5XDis//1sTiN024h8VjUw07QCmCpDrWYU5hw=;
        b=dB00LxM8/FC7N47yJQD5+IRUIDAv1yjM3mioUrLhYtemF94XFbSgR8HHukGyrCIyzL
         eXbBsvcKgfarjRWbbNjOtV8PTd4G9AQ9MNLROMWH8u5SrwbmRibYsprEgLGb4QFx+d57
         Vj0u/XkjW1Rp10zc7zqsu2B9OqxIX97uP7qZutgwSjinZe9HcUV4c+R//XVLK7AhrMVz
         n9Lw92th8HknmOB1WI4DMRVCw8vwBmnMPbeRCLMlqLiEDJBNlfIdqgSD2NfuwjzOXrTl
         Eo64Mtvd9LIHlXN/S7L+D1AF5DAElkoofvBkcEBd6wSa1E6JFNDpil/A6zWU5hX9kRQt
         TkiA==
X-Forwarded-Encrypted: i=1; AJvYcCWuN10tVYvr0h3B3/k4Wp/yjemj7twyvc/3RT7Gc6A9zvBD/AwlHVy9rUVMFfa1ftqa3vxffIho1DIhwLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT3uB+kiWL0Bco8XUZwhdpMyR/ylLEx6zpluRpK9DYOeYBT4ac
	wRfmnwC3ZI3wdAOGwa5fgSQJk5dUKTb0hBvvNBHYeX5kXJ6HG7rxVLUvL0r7k3pQyZo=
X-Gm-Gg: ASbGncvIPjVCVYjco5OC8a0aMvIcD9K+jN4D2azPLns8ylxuLnhcLvBzpE+FMDC+pCM
	xwWUrf4eTBdHGCV2P3CDkLPZvIdydDmr+kPl87CiM5PmU9ZBQXmT3W67kekL5oMRAVAvrLlgUQ3
	ONfzZXexN19piHQW7sARFFQBxKh6oO/KbrCpCVtyHQb8tMGdLb6qFe2+mauDgcnfbhLvaePWOw/
	QjzAxvQrUbVl5xsYxRo58hZihSsE0RD28UsgQXtUqGip+N1A1/9ncu2cAKdcIXa7o2mcHUpGQLl
	pDk7qcC2wlknNUHyOFufUZfqrKtK/IOrsob1U2pj+NTWTIrdEf7u4165GABBC0047litLUmWSg=
	=
X-Google-Smtp-Source: AGHT+IG0jhM90gGAp66mKqR5qQF6fDuQGVKEcTsZXkZTJKrN/agp03BwEkWo8NiFt8QodeRgqFhKrQ==
X-Received: by 2002:a05:6a00:1414:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-742a979528bmr23777834b3a.6.1747775338866;
        Tue, 20 May 2025 14:08:58 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829bbesm8361472b3a.89.2025.05.20.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:08:58 -0700 (PDT)
Date: Tue, 20 May 2025 14:08:56 -0700
From: Drew Fustini <drew@pdp7.com>
To: Conor Dooley <conor@kernel.org>
Cc: Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pmem: Convert binding to YAML
Message-ID: <aCzvaPQ0Z3uunjHz@x1>
References: <20250520021440.24324-1-drew@pdp7.com>
 <aCvnXW12cC97amX3@x1>
 <20250520-refract-fling-d064e11ddbdf@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OZWMYPezFAgPwp6M"
Content-Disposition: inline
In-Reply-To: <20250520-refract-fling-d064e11ddbdf@spud>


--OZWMYPezFAgPwp6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 04:51:42PM +0100, Conor Dooley wrote:
> On Mon, May 19, 2025 at 07:22:21PM -0700, Drew Fustini wrote:
> > On Mon, May 19, 2025 at 07:14:40PM -0700, Drew Fustini wrote:
> > > Convert the PMEM device tree binding from text to YAML. This will all=
ow
> > > device trees with pmem-region nodes to pass dtbs_check.
> > >=20
> > > Signed-off-by: Drew Fustini <drew@pdp7.com>
> > > ---
> > > v2: remove the txt file to make the conversion complete
> >=20
> > Krzysztof/Rob: my apologies, I forgot to add v2 to the Subject. Please
> > let me know if I should resend.
>=20
> I see how it is Drew...
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the Ack and sorry about that :)

Is it now just a matter of Rb from Oliver O'Halloran and this patch
going through the nvdimm tree?

Thanks,
Drew

--OZWMYPezFAgPwp6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaCzvUQAKCRDb7CzD2Six
DCUOAP9sDOAZPBBh/QTUuTF1j14KmqDTeNB0fB4FKon6h0DjcAD/ZUEtPbEC3x1+
kIv4K/IlzKAkFPw7HYaorSXa3OynQw8=
=TyR2
-----END PGP SIGNATURE-----

--OZWMYPezFAgPwp6M--
