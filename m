Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933F146D53
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748043659; cv=none; b=dBYodmP0IYYTvVm2xXBkrsQTYUITAYI80Htd3BpKecmLwxQUPIXlvB5NbgVEZQbFikBS/Xfaf6M+zsSoC4tygWXpvweXAGQRPdUT+p4flvc/AU4c7lt16mWFR3NNEFiO8In/sjHOafXl1w4F5eji7Ho+ZKw5X0ukLD+BKyBNmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748043659; c=relaxed/simple;
	bh=TmHV1sXu6eZv/JRYeupiETlR0adpYUm9TxGHfJHVzig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gGV42ZQ7AA6t1TEDZEfHDi9YwC2yr1sW44CHFGphLX4liwI708sT4xnpv9D16nKL+0gtDph3JVZuEEHiNkhPg8pKbMxUpi1hzF02osf22I1YyFt6Id0W52/f5ZW0hRQ71xMlTKbyGLO82qQNlzetKpqRo/IDjEaGJSVaDNrvnG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=I47pEG3t; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="I47pEG3t"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4774ce422easo2829331cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748043657; x=1748648457; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IOzBD1aL8dsKjJQeBJjiucXm3UhqEo0InhGhBTkFiBw=;
        b=I47pEG3t2vJYR+C1SBGjek/RA/zjP6Ac2p/4cIuEFYDpz/ibLEYpC/ALPuC8D5rQRb
         DBjqTAisgp2o1eC7/GBDC88Muol3QWxP6Tq7DjP1YufPpUW017H/LPJqIdWX8SHCyCYR
         s7W4bZa0ZY5aJtsituvSAuJ4+D+vHOS7icW2ZEqc+e13jGAnmnAy+VfyCcw7QsJDS3N9
         iyD3hR+1+qRwN36IChXuBhLOVeZ6kJCqEvJqlD7LRlQCdGHVkH8NYOWmRCyQeUdfDkbt
         gELBGU1H1+tkw2Zj/Kcv7L5W7B3X5nrfNwMP5ajUKyjqO1EKSWq8bs+rmz1qvrpT78Nw
         m5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748043657; x=1748648457;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOzBD1aL8dsKjJQeBJjiucXm3UhqEo0InhGhBTkFiBw=;
        b=otQoqP7uKwf3DM+TqlWiangZTWI8eXsQWkLyhSBd2ssTtpksv0PqlS7qHjxq6US6nC
         x22xLC+u6nNhyhnTcgQbAsxIR5PjFD/xmeMKWlXxehPxl7I28LvsVrTWHM1yF4tilQZa
         /sUT4Gw+RYrF4rxqxkgLvjgj/6AwEFJkY1BrrHOwxkbZ0C8pvFuRPYoyni3fTFvd1ebW
         i58FMgaW17B7KGJCLCxImALzmIrQRnR3YUv2dO6va73x2t7OygFVdtAm5gthdxfO+pR5
         9fbNVr4DO6ScGZwwaNVvcMg6uUJlN3hwXehuC/18MW/C6Mif/H2hIUkkfSuc4dllrjgI
         uHAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcKgTteSi8nXqVtiWWUH24QsVlsDlyqsMZKW7zPE0P9yG4VE8EZlR6gZdNBJF2bgxt1Geor4EhWKivEyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwqY/NlHn40EPRLmZRKC6k6mlBmcFN0jz6CUWJTWmYk3ZoR8Z
	oJI3YC+SBiE9+e1gIrfSdkRg7itaQdD8mdX8HiEJ6CNvyquLjLUP4OtA5Z2M8tcqaIE=
X-Gm-Gg: ASbGncukVaIOGK0xXq9pkltCl+Z320fhPb0IBkKKpWTR1LNhpwgyLXzE4LMjrLd0Hfv
	Nq9rvY3U79abNYZ5h68ygEzJRNoguutMAoXdhvTmSsgmO1ceJbGNJwWmxzAKG+MlHs4hranjfMp
	R42Rvb6tvA7Sa5WXrGzsMPmGW/gJdXEgYnT9ZLkIwLhiUUEuj8Pvhgl3a6qZrg25tVIK9nGbROb
	ZqXDS6FszkiZLeApyi4pEdtVWOLdXAmUI+TXi+/6JidmzIAJVhtrxlqF6pAGt5qVPe1XBeD7zgD
	QpSHf2rEdNlZrKumzg3nCWyYVLomvv+hnRE5vFavUeu7xfWc7qKQDX1t
X-Google-Smtp-Source: AGHT+IG4oodUjaXTga4t6C40NcsZKS2A4RyotjXGm+OWluouqID4EPax9FtTF5UG25K6jBxNcNmweQ==
X-Received: by 2002:a05:622a:5e12:b0:494:57af:bf9a with SMTP id d75a77b69052e-49f480c8e6dmr19729461cf.50.1748043657279;
        Fri, 23 May 2025 16:40:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd75csm120483901cf.51.2025.05.23.16.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:40:56 -0700 (PDT)
Message-ID: <8eea466608530e5082639ded09b6502e58a04f9c.camel@ndufresne.ca>
Subject: Re: [PATCH 01/18] media: coda: Add print if irq isn't present
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 19:40:56 -0400
In-Reply-To: <20250314152939.2759573-2-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-2-serghox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=C2=
=A0:
> From: Vladimir Yakovlev <vovchkir@gmail.com>
>=20
> Use dev_err_probe for print and return error if irq isn't present
>=20
> Co-developed-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-
> common.c
> index 289a076c3bcc..84b9b75b382e 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -3178,7 +3178,7 @@ static int coda_probe(struct platform_device *pdev)
> =C2=A0	if (irq < 0)
> =C2=A0		irq =3D platform_get_irq(pdev, 0);
> =C2=A0	if (irq < 0)
> -		return irq;
> +		return dev_err_probe(&pdev->dev, irq, "Failed to get irq 0 (bit)\n");
> =C2=A0
> =C2=A0	ret =3D devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CODA_NAME "-video", dev);
