Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2F2980D3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432012; cv=none; b=eGjSH5cYA15MnrAw3E6MwQNs8HEVw/qGh+NFZ6bdjbqpElEPfhtTdxIB+gj8PxMjdeHpLTGOdCrmX8F+0qfbcduUUOAWGfJnKajQY+CgulaBTdkKWdsku3naFc8kIOkUT96edZBQeyVvPx+x4CZMTIw43t/1q9d2DUcV2WRaMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432012; c=relaxed/simple;
	bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/dI3hNnKGUx3j6uOXP4moCg+fk7lbdTQX7Pwc4z0k8vFVYcTmOIq5ZPOo9e8GEKmkon2q0q9Yw/T12f7ZV0GTR3xmv6tpPaKeCF4ekOedwVr1XIR/Msn6uaJf2n7Loaey7sb/lJofzfjKnpGFNiRHrGv96vwCakrlqDLVRxdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zmv6Hlun; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zmv6Hlun"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fafdd322d3so21205316d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750432009; x=1751036809; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=zmv6Hlun5MD8eXUeWIFU/QwIGl0gg+q0NuMqEX5rk3xctKJ5wvM+AhlGgqWAhos15T
         muqK4nHHco6V2ok+CGfJ7/KXrXdiqEPvRY2kaLvYGD+fCgTLOojH4h90WpNDhQiyhDbv
         tUwm5+p4/j4UkSp8EYZF1WFWw+haRorRKKt0jHJ+OXarfEFbkuNzQcBotZLOAtaXzfZ9
         AW4W5pKXsLMu/Z7BrxhbPSWMr7FSPnLIw0Kme5cdZZUS7RVpbc0C9ajc5JxPELaWEnHF
         3+5akoEoVPNTmfXAR2bwVUcR8U/y2P0Vny5VVOjs+9P1EDnnll+VOxEArFJPREWGmOrG
         CfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432009; x=1751036809;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=kollfuiEdlPrx0dHhFx2vO/AcJ0v3QHHQImd66E1takAGx52ihtBZtCgfTgMs7IHl0
         LY27n3hJLvhQV4IuMaqom/seLxObUxO/PLiPJaaBp7Q2S7jNqc5Izaz5Hxu8Rhue6Xq/
         qwTSlu1VIUVhsLEFyLKV/1tiSuN+I0+iVcgQZKB7F/qcju0tdN4n5W7X1GIUzY/2buvt
         8qBTFiCDfRhlvZqwki3/Wmao+PxcpZxWau/EtkdCqTgXeYxfdJepTtatUfmyILAShkrI
         gdkU1A8a4ICPBFabFfdzKVPfcWi5SisbH5dRY/1p0tMUVH/5Dm6SyhsH3imDu+FnPzTe
         LqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqgTPjpNP7cf1oRiOURzfJeMGye+rzKLJA5sd/Jpg9X55WkdC7kpZG494nuaKUQF3lLLpoI28OZpoFl54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WGzODQ7/iko5cOER6BKVloNjnKrEEru8XaiSjrc2OqhjDDOF
	M6c4q1+bxhaKEE8SpMQzZR0+VNRLAA/59lANmsRzsola3ORT6yI8mlddIEhStxVuR04=
X-Gm-Gg: ASbGnctDlU3GeJ4ntI3VzrtE+QKt9pdQZj/4EtIXa1fdfiK6tmhvMzRYJUa5JPQSYWz
	BbRBteV2IPgBf4hcaakmjdaTl2YfMGkQztgFKkKmAOejRwCMIc7L9fZ2AShZ22teGRMSUqgEVKQ
	mojH+ezhMqcyNz6q7CgPXEhY+Y3LGZpNE2h/9lkuXZ0kXe9frIv+jV6IMjSRMiALSq7J7v/d8c8
	zXkXITXVca7anjj0alDqerQYSX8ukdz0Ylo2Vao3Y++BFNNeN3NsNUwk13GpWCrgMRFAH3vK6jT
	OFgdLqBsoG3UmJKTP3JGbkLDHF2xnh/VgLRPHl5pQakGwSVMigaiwCRGNFDYLCXeZoM=
X-Google-Smtp-Source: AGHT+IFSbdWcJq6maD1xUyD31N97nxqkeERkrPfl+oPHZ7odb6VWFZL/FFDSL0pRREpka1+wvb6uPw==
X-Received: by 2002:a05:6214:2463:b0:6f8:8fdf:f460 with SMTP id 6a1803df08f44-6fd0a461262mr40636306d6.9.1750432009010;
        Fri, 20 Jun 2025 08:06:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095a3f94sm12971696d6.111.2025.06.20.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:06:47 -0700 (PDT)
Message-ID: <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
	 <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	ming.qian@nxp.com
Date: Fri, 20 Jun 2025 11:06:45 -0400
In-Reply-To: <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
	 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
	 <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6BjHJSIIonN27c8RdqsP"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6BjHJSIIonN27c8RdqsP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 juin 2025 =C3=A0 07:54 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 19/06/2025 19:16, Nicolas Dufresne wrote:
> > Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> > > On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=
=C2=A0:
> > > > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc",=
 which
> > > > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which co=
mbine
> > > > > wrap and all slots together. Reduce minItems of power-domains to =
1 for
> > > > > i.MX95 and keep the same restriction for others.
> > > > >=20
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > >=20
> > > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > >=20
> > > > Krzysztof, will you take this one once the DTS part is ready ?
> > >=20
> > > dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to=
 me
> > > and I'm waiting for dt-bindings part to be applied first.
> >=20
> > I was waiting for sign of life on the DTS part, we usually get some ack=
,
> > which is good sign we can take the bindings.
>=20
> Such process never happens. DT bindings are the prerequisite here and
> platform maintainers wait for bindings to be accepted before taking DTS
> or even sometimes reviewing DTS. Why even bother to review DTS if it
> follows entirely incorrect binding?

You are the one requesting DTS with DT bindings for review purpose. You've
done so regularly this year.

As for review process, Ack are a workaround to a black whole in our review
process. Patches without any reply can either be un-reviewed due to lack
of time, or accepted. You do whatever you like, I'm just saying that clarit=
y
can help to coordinate.

regards,
Nicolas

>=20
> Best regards,
> Krzysztof

--=-6BjHJSIIonN27c8RdqsP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaFV5BQAKCRDZQZRRKWBy
9KazAQCZpPC27cOiLrCeirOx9KtegKeVBpOKvNdcjZFKHZg+0AD+OJGvNGaHn+Di
rFaOSJG8M735rmjWeSPrkNAWKU2s4Qc=
=Chy2
-----END PGP SIGNATURE-----

--=-6BjHJSIIonN27c8RdqsP--
