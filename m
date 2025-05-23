Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12920E03F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748043821; cv=none; b=cm/0eAlhMLWTliBNyuJ/mObzsxCMOuUUh05/prJ/Yr1fI32HD2GbZZB4E4CSnogQBl4imYN4BJyu2l0dLV80FHdvx8pZ2RPkch3AriGVQV7O7kkyg1MDkUL92tTSXtb0QoLL4WYWU4jNBMJRYIo4IQZpD2kzaS1hRCyCeHvEOjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748043821; c=relaxed/simple;
	bh=k9KjtiV+PiDtoPOrToEtuj7jUmEVUeCsJACDo2gBegU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qxTkvDbhSCl0hm00ilKOWAJt3FOAwPjTpzvTWLyAi5t3SgBt3Ej1SiAxBMi33iflVoK020Ai2Qg/AnuatO3LLCUagK9dAyt6m7uXQuh7rYUEAihQzvpMSHjoq7Y13jQq8utDwro1UFWInRo9RnYms9P5inhb8/VpHtflte8Vi4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jTeL4IGl; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jTeL4IGl"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e2fe5f17so28976585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748043819; x=1748648619; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7zggxeEM1VuNpThKR7q73DmQv8IjJQEYo75UvBGpmS8=;
        b=jTeL4IGl/cNHb/gwmonHCDE0TdgC+Hn/BiEYppQ3z03eVUQY6wM733bXAw2HM8cj1j
         75WxNTCH8nEj6uem+fv6reOwKhf6LUqnYU0YP0tNwhI1NvAEvbsEddeJ9MmAGdHIHcmj
         0zpWg8KD4QjBKtL9Tk3OTBuS/WqxdNEGH6W/tsiRLdBUJbGCfCVjaueIP1pQGMhMiYdS
         0PovrM/vX5WNYhG2u3sDNCp+fPaE0rA0bomb/d18EMVmaXgGB+4H2MdvcvX9a8m1pkSI
         SQ9uKBYbBmuGOmlmKfNkmmAc0TYROFA5HRBVxzJ/Jgzj8cELCFxWEcPg3Nh+PRRhx87L
         7n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748043819; x=1748648619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zggxeEM1VuNpThKR7q73DmQv8IjJQEYo75UvBGpmS8=;
        b=u1z/HlixQIGm4fZ5AuFRd0ixU9EW8s9tV+ZMm0+dn5IxKAOyDhXF/nTR5hWeMI++MJ
         rB61YqOwOy4EYLwPQ37/FO6baM4avocmOWuhM2A56aJPI4y3UMrRwD+6A69Ebbf8bYe9
         wfVEhxgiEWbQUsn8s0rGhE1LEX2qxOcYXIlsaQ+llx1y/dV9JNsGzs3BfJhiO8YzFWvn
         CIjMd0Y3T0XzmWjugC655gcpi/6yvYRAvNmNlr3me6aDnWQGzXhf9uXmXtgmTgcmmN0E
         vA6bDgrNzHscx3qPKASHVHS/ciwHpQ6iyb7vnJDDIW1LnS67zNi2goqRFx3nHEzok8ZR
         MJfg==
X-Forwarded-Encrypted: i=1; AJvYcCWiEU4UmBJvH8jH6rW/zR6eaRxHF+NTldzUnoQ6s3PcEp6jjNVFHtDybvSnSx5/u6VhL6/XKdstCaJzXKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ2HsPHJtIf4jQ22OfHMEaQ5ebzY7fxSnvERSnyiQoQX/pIipY
	u2VmE9k8F1x41nCB6ZugpecMqZE4FbVcQBpf5fnQy/tdewaqxtjkAbG6FaRsx7v7x3U=
X-Gm-Gg: ASbGncvIRp4cj/O2hfz9gUwQXxmjgjQMxtO/wF51/z1g72DZD6PyQbh9o7a6MArO2o8
	5t2Wxq1zsA8k7QR68k4Tk+W7yfI0tfup7wz1IiVEwMAfTKL4MABttKDJAScqsasvCwdQTmarFFC
	PlvRgiYpAJEZS3HL7Pat19GeeN0nD6/jjErTYscT2/Tx+U7P582jssNlpkZpBkyhEaadaEQkZth
	Nx4oAJMonp2dC2AaeKLBSSjWnKv5mgomVcr2TD8RoWVH3unsRZct5iGjQO/6D7Viy4BXU60P78v
	uXIP2GcA/6mxjJRWWK4HFq7khZ1CZePbAyKC8ab7O4b59FPtpHaC3O17SxnCeLrbfmo=
X-Google-Smtp-Source: AGHT+IHByNzyY6oCiSuhcX9yJa0PSYDQ/oDn7VlkK6Y0rjy/r1Ckb7cOwqseJzfXUTQR+mYeFAC/4A==
X-Received: by 2002:a05:620a:424a:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7ceecbf9500mr192577385a.48.1748043819168;
        Fri, 23 May 2025 16:43:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cb4e0sm1245514585a.91.2025.05.23.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:43:38 -0700 (PDT)
Message-ID: <8558fbb295be82e2288750048aba1a1dbc396093.camel@ndufresne.ca>
Subject: Re: [PATCH 01/18] media: coda: Add print if irq isn't present
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 19:43:37 -0400
In-Reply-To: <8eea466608530e5082639ded09b6502e58a04f9c.camel@ndufresne.ca>
References: <20250314152939.2759573-1-serghox@gmail.com>
		 <20250314152939.2759573-2-serghox@gmail.com>
	 <8eea466608530e5082639ded09b6502e58a04f9c.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 23 mai 2025 =C3=A0 19:40 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=
=C2=A0:
> > From: Vladimir Yakovlev <vovchkir@gmail.com>
> >=20
> > Use dev_err_probe for print and return error if irq isn't present
> >=20
> > Co-developed-by: Sergey Khimich <serghox@gmail.com>
> > Signed-off-by: Sergey Khimich <serghox@gmail.com>
> > Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Please don't forget to move Vladimir SoB first in v2, while adding
this Rb. This applies to most of your patches.

Nicolas

>=20
> > ---
> > =C2=A0drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/dr=
ivers/media/platform/chips-media/coda/coda-
> > common.c
> > index 289a076c3bcc..84b9b75b382e 100644
> > --- a/drivers/media/platform/chips-media/coda/coda-common.c
> > +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> > @@ -3178,7 +3178,7 @@ static int coda_probe(struct platform_device *pde=
v)
> > =C2=A0	if (irq < 0)
> > =C2=A0		irq =3D platform_get_irq(pdev, 0);
> > =C2=A0	if (irq < 0)
> > -		return irq;
> > +		return dev_err_probe(&pdev->dev, irq, "Failed to get irq 0 (bit)\n")=
;
> > =C2=A0
> > =C2=A0	ret =3D devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CODA_NAME "-video", dev);
