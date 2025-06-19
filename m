Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17019ABB6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353397; cv=none; b=K6U6TPgWHlUgq0OAzOiscZvmI1cd4lWdNCzC/phyncjS0/712oa+O6/2cMb1kWNpqVvS3l3i7Zmp6W8h4wOSEhUIS7AkH9y+ZSWPOitpNCIXQ7hN7VkoHOWum2gIaJbVTe+Wioz9K2eo0s1eFe26rj5QfuINHnrl/g6DLAdIx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353397; c=relaxed/simple;
	bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VcVjJ3Bw7MYjKPEuauJA/Z7+2HiqtgQF6MKCRWyuO3ULwoM8WLv2I8gV8tf8UqweWnxOQtFY5pwdQfC60pSId36WIwoyGGsqmZYrB6x6fqXX9C8OUtdCzoEFN2aoi58V1fwuG+HX5S1UezDTuWIB0MqDN54l/8UsRQ+usbmXB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=FDgbpl2w; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="FDgbpl2w"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fae04a3795so10993766d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750353394; x=1750958194; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
        b=FDgbpl2wK4Z3hPOt4a++qe38RCn3R4IlGGc2p3z4Tccl/hT5c03yTZsbobd/N5bIxD
         4n2eMvABYOpBwJVd0Eb0RDBKPj2Gp5zSZKaDoMC3bQf1eHMHB0+FFSVr1a2HZ9O4qEGb
         MKoF/Ma8uxZr41sM3URhEF3+cNIg+Y9aG84TC58I4URBNViyBNpyVkvFQqFK5GH0tXye
         yGd2ZwuDI+MMKrtWrkMe4n8tMx4Fyy9l+pMU0iODj029HCYVoavCnKanC6/Aznq7y5iF
         qiguE4kkxLIi5AlH0voWyHZY/+KusRKaSl5yZgU9K2mmkZ0+sYODLtTR0v9DtIW+h7X9
         +I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750353394; x=1750958194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
        b=ksx2+eYQyM08K/FXicFX4jyBy+lCvczvNF8iWJfVXV9SER5GldoT3AXoupVUBpEnxY
         +bgrRrk+auyafwC/vv42soi2CwbjuWnu/DdxBqcOyTEWoGFEYCtPd0aQwr53kX5gh340
         CQ1z4vSD2jDMkQCUULdEE2zlaukI5A4efO8qgS5R58W1z2B00kFGiWrVHSL/4mvrQGCc
         us4uhrL2+5XFw2ZV3R9Ey+kg7Yb9xvumQQE9qmZ2bRHBwZIgkSZrRMDW+CstVAhKpCus
         H/6DjsB2Hbi49scqfdxFWGuhR6eayR36nGn9/4ncChxQSUD44aDaW6XQktqpFPfx/3ao
         gArw==
X-Forwarded-Encrypted: i=1; AJvYcCUtny7aXUfclSGmt6/JiZ+DSIBZEzwVcYw9VySIYqNb33xO4eHNtRYcO/ZQTA5J78FbcROfCTswcUiBla4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTTCkkQGOEyN7Cy2PGppKuwEySk855HEYW2JnDYu2Mavxbksj
	am3ZKOVWF1Y7AgC1TXlbUPDFyQ5XtQ+w8w307zJErpQLkTUfz1WKqH+3YaaMBHJLICc=
X-Gm-Gg: ASbGncur+D/EsfJO1KoGRnRicgMgr5nzRXFJxdi6UNXnExGOVn69LQ3rUhYrVQASAcQ
	KjiZLGbGUbvpmPdp5qpmtC9u9SLZx4S2GPqLlrukDaNGcEAS0vGhteWONypEEjRfOHPFPeOvHMi
	8ePbh/7kKnsFynv6hZlhtV+0diD97ahgoboZutCsqGlcLWZM2zhsgeUvn/4fZAFxQspdrtaWPk2
	3JUgZky0eUIy41z+AHA7I/haUCtgQxB7DBFGQ3mKrXeO6LIpqok7lWZH7uQbPUSiB95h4X8pIrn
	Ac8R/POSeNHoMieyC2v6dlwz/ikgm3eAIr9rOLM4iLwUkd9ENwNCS9xOz4BQXoMHpJA=
X-Google-Smtp-Source: AGHT+IFZGR1oLZzp6cLHcCiYls3uKiELGOeDzcSxdXOkGm/XLOLstBIyI7bjhXg4re8Xuf3yDJehIw==
X-Received: by 2002:a05:6214:540c:b0:6fb:4e46:7f3a with SMTP id 6a1803df08f44-6fd0a4d68f5mr760206d6.16.1750353394282;
        Thu, 19 Jun 2025 10:16:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8e4b0f7sm19537985a.67.2025.06.19.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:16:33 -0700 (PDT)
Message-ID: <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	krzysztof.kozlowski@linaro.org, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 ming.qian@nxp.com
Date: Thu, 19 Jun 2025 13:16:32 -0400
In-Reply-To: <aFORokzx/sImgDtA@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=C2=A0=
:
> > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", whi=
ch
> > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combin=
e
> > > wrap and all slots together. Reduce minItems of power-domains to 1 fo=
r
> > > i.MX95 and keep the same restriction for others.
> > >=20
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >=20
> > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > Krzysztof, will you take this one once the DTS part is ready ?
>=20
> dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to me
> and I'm waiting for dt-bindings part to be applied first.

I was waiting for sign of life on the DTS part, we usually get some ack,
which is good sign we can take the bindings.

Nicolas
