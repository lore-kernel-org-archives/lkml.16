Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1FF1E32DB
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044169; cv=none; b=Wt+WUJ/iwxQuDcN5CCQPhfPp1d+IuyNk9aCWkSD0zFN02WOBIrYxFOqZj+rNKkquE2qZnbKZSadSNa+3a3FE4OIwQvIYuLfl4e1bOUN/9IIQwkXiojkUjD5Kp3+ZOLNG81j98qkeJLUFftRy2QwtUQnPUAj7u5HpzRLtBJMw6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044169; c=relaxed/simple;
	bh=f26ORO3jX81PquuMo4XTHBE7Mm+ge7RdFpcxKhkqGdM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H740cwjahlKDJAcX3tblK2hhav0EWpkvX9o3rIX94VZUohoxYHgxBuEpwlnP1PXmTsxFkp9BbpxWnZrWufGiDGZFr8Q+fliRpl16Vn25DUgj/TvCYmYcPiFLiP8CDLLSmG50g+NIH8phIKrb8in7702qH6IJzOPdw4Y3dX237Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GcuzAvKq; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GcuzAvKq"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-48d71b77cc0so4201301cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748044166; x=1748648966; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xqjlsa9/FZ9D1FAa7a1DHs9dAsfq4MjISh9P4nEB+jY=;
        b=GcuzAvKqRfh8wzCefQ9B05lnXJyOZdm8wrPt3CITphwn2Y4uzakFwi9+5KE9V6QK0J
         8asFHP7AjdOozmlg2QlMLexWPpPSVl2AELkw3r4kc7GJVg+hv25ZyT/nok6Ws1e1kzHJ
         Xnbq0h85jorThadJ5NRFbS4yW27opNLdd4RioRSPM9/ebuEpxXOA7ia3XP5HcQpc5vo6
         F0ZyDxKVCE0QebRXdpTE6fSDfFU665Emmci594XWygMm2y3OSWxYPkOcB2T+3GngayXZ
         4mUXIfECy5YURoIKSKS34HSKqP4T/uGk9OW02Av1zv73Rq3FL3gXq38FMTIQWIgRXX+B
         tIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044166; x=1748648966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xqjlsa9/FZ9D1FAa7a1DHs9dAsfq4MjISh9P4nEB+jY=;
        b=M8VF4D2zUoSn3mv5y2KdIjPotZjnRESw3P/p/rcJ4ZIeGE7rKawE4y7rOY6Y0LUOiJ
         qx3oZAXoDiVLLs5F2AfLHjYRg5oyBRAfoVtjiqdkJPEJIxIuiPYAJZmJsDLru9cKIa8w
         DLJlL+Q6/it1n3x9THQcS62Y6cI7jbyyJE86wKzgcf1kRC4rbW3UXHdwUi9KTbDrfTE5
         2JmHaXHbqjYsBu4mb0VprfXWyxrWLwI2Xv/lAZ5b2WK4PIjYK4x+UkVg6gnQAcoMSSg1
         p23AB3BzqcmxHXer/SzGGIydMIiiCjCmt5BfEBD632m8eqWqBNcAEfzReIK/gDzOqRpT
         Pl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnm9zujJvIvLmIgnoRCocL9cmboMQ43jD2fVp7SL51o/7IjAVP0AjtUJttxUui+v6z/BVZrUSEuxnA0pQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEARV1vogGqlswryJrxRoZHUAZulOXiYPtWD+lCgJnR++OWKDG
	DTHGn45EnDNA64cBUyTVXITUyln2mPat/nBaERc6qQCQ0gJ3NLFEuldGGprpITVOrYwxmuM8hsS
	UgHlprUQ=
X-Gm-Gg: ASbGncs7lXOZ/YRl/MmUWuF3pIRz88oI9CbLXXeFtntBYTehyiUr7JfqJiNAp2we8Be
	UdaP4F8jEegqRBfWMOmwL21gmrvVfNTnQN7VRjZwuFhkqV6zjQ8R+/xGJbl8jw9uCCMYGQhWmDV
	rfAtZ+gQ/MqZQli/XHBKx2ho0a6NTiBItROF0dPGan438+XzhgXl5PAt3C7t27CEWiZNLyWEfmJ
	5KlBhFxQI0BCnqquIV66Fyii9oFJWVDYIZ2mKLG8p5pwMSLSt8dIITw8qLjfA+/2XxID1p6tbsU
	qmTtq/9vADwmt6hI7YF3q2wiY3pDPX1V3JrXchwcUw7hKs1iS/r01Yvg
X-Google-Smtp-Source: AGHT+IFBRgwWsDiBOTSJXB0l4yS8PVXq7cVT5X9FW7UqFFqu1lQ+k3Zc78e4CEVQJ+be+isgAGHW3g==
X-Received: by 2002:a05:622a:418f:b0:490:8ffd:9a90 with SMTP id d75a77b69052e-49f47de53f6mr16731361cf.45.1748044166550;
        Fri, 23 May 2025 16:49:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae42498bsm120366631cf.35.2025.05.23.16.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:49:25 -0700 (PDT)
Message-ID: <90392fc3ef037a5d2878b9f50145304132891e56.camel@ndufresne.ca>
Subject: Re: [PATCH 05/18] media: coda: using threaded_irq for 0 (bit)
 interrupt
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 19:49:24 -0400
In-Reply-To: <20250314152939.2759573-6-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-6-serghox@gmail.com>
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
> From: Sergey Khimich <serghox@gmail.com>
>=20
> Use threaded_irq for 0 (bit) interrupt instead of lowlevel locked irq.

You omitted a rationale for that, and don't find anything obvious, please
drop or defend this change further. Also, Jackson in Wave5/6 actually
maintain a hard IRQ for status register handling.

I'd say drop, or explain.

Nicolas

>=20
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-common.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-
> common.c
> index 64ba17d8adfb..b240091cdc9d 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -3184,8 +3184,10 @@ static int coda_probe(struct platform_device *pdev=
)
> =C2=A0	if (irq < 0)
> =C2=A0		return dev_err_probe(&pdev->dev, irq, "Failed to get irq 0 (bit)\=
n");
> =C2=A0
> -	ret =3D devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CODA_NAME "-video", dev);
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					coda_irq_handler,
> +					IRQF_ONESHOT,
> +					CODA_NAME "-video", (void *)(dev));
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
> =C2=A0		return ret;
