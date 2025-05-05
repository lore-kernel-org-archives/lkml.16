Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8A1DE2A0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746432095; cv=none; b=nXQ0/GxPEo+GgDuNJX5jqQS4SwnMRTSBSVjTD7zrDW7+WUCNZEZpff6XcY/KtCnb9q3eCuWZszO4RiGV7ho6hZCWrR9t2vfFfgPNzdxiMx+ACH0wzncAEKj0e8XDgrEziSpQ6BBw947bNJrRPjD2LA+AVxvfIFoKmw02A07kRMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746432095; c=relaxed/simple;
	bh=9Am8BOf2UXcIbgIf1LWznXDOqFDQaXzGVxzqGJtWZYQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=VF9fOnyTevKac51eLRD+8qFkvREtdbDeBVrXjezXVirwrWl7hLIoM7luI3J7CGLjWkefPt3BoMX14QXKS5EBjKZGbieNOyZL/3xSfKc2Xz7izQ8wuld8pVLelPTg6EFwG3rZ7g+lhfay18lemHAQkoTW5dkX7KVZd5H0rRHexU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zht8N0or; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zht8N0or"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acbb85ce788so1063453766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746432091; x=1747036891; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1D14DESXgEJssAmCS0DlckceNK8D0Dq2lVptoRgrgc=;
        b=zht8N0orAJ+2M093Ly4fDrgNOgydu3IfxjDaXvQywuD6KOb/8c0RwnXJRX4bEN34Pg
         s3RHhq3BCPNrod9/VSqsYswKas0LBYxDlCsub38TLscvJ4UtjCiQs0grraZj4vRiLCV2
         rXESc8l7rY5N0nO78dI3sfjCayxmFY6U4VJxp1V4rRTJEGxHWedmMuBi8XgrAd77oiRF
         /wmC7+PHesW8kT07R8l/PmXH4oNTWpIW5E1Qxj7xvm3FuHGPXxEWW/ArqSZTh7a3kybU
         FaDw4CQMMSZxLkwepYn50YKib61RoMQA0OHWurf9gLRDpNg8O6SfCuJDOgZdhwQ+WcTT
         DdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746432091; x=1747036891;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1D14DESXgEJssAmCS0DlckceNK8D0Dq2lVptoRgrgc=;
        b=HHj33XfPOvBEEApEoPx+VGNP+iGqnMbPvb/xE9gmYQMxWvMAenB6TSLBhGq49UI5TJ
         Qf44zgzFhcPBR4jVaF5C8Ceqtkk8iLmr43b59lUZTSnbZo4oliU3aznfjqzHu6x2SJvq
         cNuCsF2u9aHUZvXCGe+JJmwE6LOZYdPhww38VpyuNN5/yHphqj87pr1i5rxyOu/O1Qqz
         4hIvnbLOZbldZi8zMB9uDURwYS+W3gTu5wMVfTLOFM6ZEX6VHHHtkR7F+TSbZzsgfui5
         t40x6UiewMH8pfZnUviBDmNQj1Yczxm1kByJfENmA93cqsTQPmDhk/BjSwS5FywzewOy
         rFxA==
X-Forwarded-Encrypted: i=1; AJvYcCXUjdX7dBkaD84rF5uEo28WM49wY1hJAMjemC+WUhgJ8/v9f7IJewwNnsIF3eCIvfSWRgJNeGuMuTIzXak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK++igMKoVitTP3trUa/hFu5NJ8MGcvoP8rTZe8iiiSg8at3U0
	x4yOAhMPx1Bou4H++5wzSjELw02f6kO2GfUd6KSvw2F5xx2MR2qrsThz+evr/KY=
X-Gm-Gg: ASbGncv5xb/PkJzmXPcD4GnWrpy2+8t7AJ54ji4lud8OHm/eLqM3IbFKL/YkUbXa2oG
	/u+cyabkrtYVyygpQvNQen95o8QsoGhpHPrWFPg4axfEkHrVOaO3Fj/+Bt3n8WNfHT9+KrqIY0w
	0RAPbUyg8ftSM6ERXKh1YYDq8z3OjFnAVCRXRxqcb9GJNg6IYcneMNJP3ANpZOjD/tF9xxW+Q28
	9WQOR0lWZm+rq269P/Mb/vkSScVgdq+0y56P9V48firCFuBgx554rSqN2bZNct83goGpoYDH9IV
	qubbQoeV8WxVgvZIwdkC8zITdNrC6X/+gbn2SJzgPCnTJQa2yGZW5kiti+KreCzMm5kkzWvEaev
	0VagdrthWyXRLMw7QMOmb
X-Google-Smtp-Source: AGHT+IGp4PfYHD/YxcY0Mn7oA5l0dQ/O7fQeMsiDfpR5dpQOL/r9zkCVIrRqDBHZGZeydZuEK+PkNQ==
X-Received: by 2002:a17:906:7f99:b0:acb:b0f4:bc77 with SMTP id a640c23a62f3a-ad190858b7amr637113766b.57.1746432091180;
        Mon, 05 May 2025 01:01:31 -0700 (PDT)
Received: from localhost (dynamic-176-003-040-035.176.3.pool.telefonica.de. [176.3.40.35])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad18914736asm449923366b.7.2025.05.05.01.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 05 May 2025 10:01:22 +0200
Message-Id: <D9O2I6OT6RSA.JDWMLFP77KSX@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Thomas Kopp"
 <thomas.kopp@microchip.com>, "Vincent Mailhol"
 <mailhol.vincent@wanadoo.fr>, <kernel@pengutronix.de>, "Heiko Stuebner"
 <heiko@sntech.de>, "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
Cc: <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 3/3] can: mcan: m_can_class_unregister: fix order of
 unregistration calls
X-Mailer: aerc 0.20.1
References: <20250502-can-rx-offload-del-v1-0-59a9b131589d@pengutronix.de>
 <20250502-can-rx-offload-del-v1-3-59a9b131589d@pengutronix.de>
In-Reply-To: <20250502-can-rx-offload-del-v1-3-59a9b131589d@pengutronix.de>

--64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 2, 2025 at 4:13 PM CEST, Marc Kleine-Budde wrote:
> If a driver is removed, the driver framework invokes the driver's
> remove callback. A CAN driver's remove function calls
> unregister_candev(), which calls net_device_ops::ndo_stop further down
> in the call stack for interfaces which are in the "up" state.
>
> The removal of the module causes the a warning, as
> can_rx_offload_del() deletes the NAPI, while it is still active,
> because the interface is still up.
>
> To fix the warning, first unregister the network interface, which
> calls net_device_ops::ndo_stop, which disables the NAPI, and then call
> can_rx_offload_del().
>
> Fixes: 1be37d3b0414 ("can: m_can: fix periph RX path: use rx-offload to e=
nsure skbs are sent from softirq context")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

> ---
>  drivers/net/can/m_can/m_can.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.=
c
> index 884a6352c42b..7c430eaff5dd 100644
> --- a/drivers/net/can/m_can/m_can.c
> +++ b/drivers/net/can/m_can/m_can.c
> @@ -2462,9 +2462,9 @@ EXPORT_SYMBOL_GPL(m_can_class_register);
> =20
>  void m_can_class_unregister(struct m_can_classdev *cdev)
>  {
> +	unregister_candev(cdev->net);
>  	if (cdev->is_peripheral)
>  		can_rx_offload_del(&cdev->offload);
> -	unregister_candev(cdev->net);
>  }
>  EXPORT_SYMBOL_GPL(m_can_class_unregister);
> =20


--64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaBhwUhEcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU3urAQCJ69IFypvaFtVZN9A3KA4EhHPYFZnLhKhP
Pk2HK1dA9AEAlZm7/1uU/TAuxXN+0/6NZUVxbJO2yOQNMI6MhbuvGwY=
=/3qK
-----END PGP SIGNATURE-----

--64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b--
