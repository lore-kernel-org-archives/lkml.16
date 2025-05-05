Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEE1C549F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431921; cv=none; b=oPlYNv091hUkwp/s1Rs/7zLd4G6W3wYzVAtxc8PrKbkazr8HPczPhkXU2uIxPoD+ezmzFi0UZihSg7tx8mnOw4edMoVYyLYoBFH9InonJ0R2leof/AClN23XlbNXBEYAsjTFO/6eVZflg2hroFwGQWJcjZWdMzqeYZnlO5REqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431921; c=relaxed/simple;
	bh=AmHa3ycc004iyFGHsYYX4kIfuniFqTXHQQYbVxzJKf8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RPxU/1EDyVeLWOR2K5oOuN4VhbmUt/lb3woRX8rla6IDxaRppomR/pYezIbsvSQ89Vopn48ngIEkc1YtNwk1mtYXFR+eNkzKOdeMjjPn6NG9fKbPR1D4etGUrLXSWb3l93Ut2urE09f2tLq3kGyo15VsWFnffTwB1gPTkfTeSeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tgbMITn2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tgbMITn2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fafcdac19aso1148658a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746431917; x=1747036717; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8qy8x2VM4E33zP+Ul3MQgzUGob/DpDmmEpO6CEf26s=;
        b=tgbMITn2/f2ETTwPFrP93IMlFsLd90+CvfPcVD1QLAFKoBoEeqNFZ15dGAjijEGpya
         +LmSoF87/BIqjb1f4D+D+/RDVQSG1I4fV3uVktjbqQEb+3Y4xsvjfsewYoOSYYSnDp0m
         g3Nsy45eP6ZlpWfsY1rLF+0rmzXBcQNTQhvn8TX0dEOOhOjsRz7INF3y2DRzdbyt6ftd
         FD14xM0bO2yOFSHhzksOuMMTUhl7KOufLk6b1lWIunZq8Iw4Wgm367VkcmJ17+EJNtJo
         MdwlsIk/Tkp9DDoY6dOVevLFMUcdNtCI+O4/H5ikLHX0d+eIaDE+q1PSWtKXOJjLZfpy
         GJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431917; x=1747036717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8qy8x2VM4E33zP+Ul3MQgzUGob/DpDmmEpO6CEf26s=;
        b=KYP8ac267tgpsPqGVaU58MoWfwSqPfYS/qBvNvEz9YaXjSihOkavpre2+U/hvJ7XjC
         MQJzALgI0eZph93m9RrMgZChGNAqysP+DrL7X4BrPCoUMhu+0eCqRaQ9VeAlbCX/6HfK
         y86pa8qpzO6cHpYTGwzJOEaEbzktW086UrLLTRjiRk0NdJlaFB6yau0AFeUDUtFNT76j
         CCOwYzv1vWwXr9hLbuWdpmW8HOVCwNtfQGIG+BoqMoYuKRrYZQa+WGTDObdxz2aZlNe4
         xnndQ8aWtjdHECAts//T19PrBjxnTbKcJckhddxOInziKVGsq1JR1xtCmgREAyixI36G
         A5cg==
X-Forwarded-Encrypted: i=1; AJvYcCXTl/6HX56LtNHj5w/6N1phQXH30pW6h6I45KkSft/eIsWDLpiv4vvc1MqqPjLK5k66dK5j6b7ZVWAyX78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfSmyP6jv+Z84yf8dOlc+7VsTRcptXBoJ1q6m2P/rAPmKbXbS
	XQ3/PMev4i2yoK23YTBvYAbsyWU853ZjH2Dx19xygeoi4JzWvErECKGf+/rlY6o=
X-Gm-Gg: ASbGncs2V7mkdwPNnyPt6MMgpuW2HtzNTGxdrq0hpVDPFeEdHfkMoHLScAw2S68WYmd
	EMFdacS0ybtyJ7RRVP3VRHxgAjk27OnPQnmLcNn9yq5AmAJDFfvJ05AwB/78hizDKC72wiUh7Dn
	d6xQ+N/HZdwk1r7AYdQn/Ttd4EkBXUCpEnONuEUv3BtHyxeotl4XOF1lKGWZ6sm1Ijc3xaPFp+X
	w2S68SxWnQ9V9JSvxTiHsJR1pCGKU/NU5SBBY9L0eaXKu0TysidX/M1t1tBDYmBzB4IbxMh5xpj
	hWpiXLMn0Yh3OtPz2Ipy97q0qlMyo6GUN1Now99DdbcEKWISpXOIXagkf3Sg2BEcWTanzgtxy4E
	hOuO7cs+uNw==
X-Google-Smtp-Source: AGHT+IFZHl2dy4J+tovJB10LLReM42ovfZPhO257ZgiPrn9c3pUOWsbvfuKWtuAGkwm+2riUzR0qbw==
X-Received: by 2002:a05:6402:35c8:b0:5f8:e07c:7746 with SMTP id 4fb4d7f45d1cf-5fab04bfa83mr4760665a12.0.1746431917138;
        Mon, 05 May 2025 00:58:37 -0700 (PDT)
Received: from localhost (dynamic-176-003-040-035.176.3.pool.telefonica.de. [176.3.40.35])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5fa77b8fbadsm5148712a12.50.2025.05.05.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 05 May 2025 09:58:23 +0200
Message-Id: <D9O2FWGG83V6.L6IQOPRGZL68@baylibre.com>
Cc: <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] can: rockchip_canfd: m_can_class_unregister: fix
 order of unregistration calls
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Thomas Kopp"
 <thomas.kopp@microchip.com>, "Vincent Mailhol"
 <mailhol.vincent@wanadoo.fr>, <kernel@pengutronix.de>, "Heiko Stuebner"
 <heiko@sntech.de>, "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
X-Mailer: aerc 0.20.1
References: <20250502-can-rx-offload-del-v1-0-59a9b131589d@pengutronix.de>
 <20250502-can-rx-offload-del-v1-2-59a9b131589d@pengutronix.de>
In-Reply-To: <20250502-can-rx-offload-del-v1-2-59a9b131589d@pengutronix.de>

--8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 2, 2025 at 4:13 PM CEST, Marc Kleine-Budde wrote:
> If a driver is removed, the driver framework invokes the driver's
> remove callback. A CAN driver's remove function calls
> unregister_candev(), which calls net_device_ops::ndo_stop further down
> in the call stack for interfaces which are in the "up" state.
>
> The removal of the module causes the a warning, as
                                   ^^^
Minor typo here.

Otherwise this looks good to me.

Reviewed-by: Markus Schneider-Pargmann

> can_rx_offload_del() deletes the NAPI, while it is still active,
> because the interface is still up.
>
> To fix the warning, first unregister the network interface, which
> calls net_device_ops::ndo_stop, which disables the NAPI, and then call
> can_rx_offload_del().
>
> Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD=
 controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  drivers/net/can/rockchip/rockchip_canfd-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net=
/can/rockchip/rockchip_canfd-core.c
> index 7107a37da36c..c3fb3176ce42 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -937,8 +937,8 @@ static void rkcanfd_remove(struct platform_device *pd=
ev)
>  	struct rkcanfd_priv *priv =3D platform_get_drvdata(pdev);
>  	struct net_device *ndev =3D priv->ndev;
> =20
> -	can_rx_offload_del(&priv->offload);
>  	rkcanfd_unregister(priv);
> +	can_rx_offload_del(&priv->offload);
>  	free_candev(ndev);
>  }
> =20


--8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaBhvoREcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU4zTAP0Yer+WBSFojQ6DiWBCD/1wd9ENW9dsLm7J
ZLeShRvCOAEAgIm8MmcoLnCEO11f0Kg+X9mgAKtZb7OpE86RubTnags=
=jybR
-----END PGP SIGNATURE-----

--8941660c9a8c947b1652ed122688064937432aafddb64f2deaaf508477a9--
