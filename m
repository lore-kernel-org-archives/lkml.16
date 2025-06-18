Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22162E3B12
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251424; cv=none; b=FnLfSFoPdHhLXi6klfQGShtwYB3b/fLnQmWYCT/esBnYjETl24p39w4RCoNLtkht2BhGABWzLAEg+VGH0dNP/cROpm5LK4Z3+VZ1p8Ok2dEqr2ZmlUsw6pqut+OZ2vl3lF8Keo/6YAcVPervFPWjISv6WiONcULNo9t58edCOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251424; c=relaxed/simple;
	bh=NjVYGChQDbdYIHe4Sr86or+FiSbuf0vYfumtIy7G6CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZzypQ5TUn70idPpbXQ6hR1TL1vmnkEX6usOn1oLb31LPUYczEFmihj8ARxKwqljVSeXLOtC7XlmuodJOuKvXSkE+UIC1ZTfSvl6+DDTB3LWuuC4rLYLqBP4zyWFXZlJk146DynGzuuZPFLK+Ln2CGFeDYZ9FjvvjPsHc0iJL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aNhu4IIY; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNhu4IIY"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e8273504c67so1857850276.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251422; x=1750856222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=;
        b=aNhu4IIYC7J5516GOhCztiHgcRHX0bX4gsr6bSisGGewTaf0t2244FyScdcooFgn4M
         yEP8LTseQP1F2TOCwgbbURqCs/X6o3tWIA6EP1eaUtk93uUOQ6y1sRRj/4Ca6VkLTTto
         J/enl7/Eo/Oco9/SHDmPE6cUmXre/76Z6v7xk6swpd2MUNZiaUptTHogR34khVeO2iWY
         4pXv9eRRqCmZcmJDpeQaxLUqvRnCrPRt1iWdvo6pHobbj/q8AeAq2oT20C6UL0AvEyoq
         SCJ/Y7QGj3teUNiIHFid2sZMLC2ipmFrVPqALShDw//pWfMTeUPwC5vhm84KVbWBa2Za
         9lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251422; x=1750856222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=;
        b=j1koZ1OEiS7G8ceGkt+2MqhqgDPD6mH2LLaz9gP9SB47ymLwilVwzjo0zSX9t9iYpS
         oRwude79yqk62HdNQ0f/rkGHl4yMeTjhD40/QIYhXQRGwu6C4fEqQInJkC/B9HkfbScY
         HtZJJjbjCZIKFuCtKNCG4C25wrJTMUHQUoc2ZkTonm5CNu7fuDrkR89b7YzdDHH773k+
         F6Uk+YJ4/UquqpKe6/J0Dq2y8arhQSs1VMc8yKbXwJhOINtI10BqSS7mLqF93fZ6JKLD
         3Tdj9wAvDKFKAAMxX9Xk03pa6xuibyCr8Sm60KA43yUSv9cAlOTLOSdlTz6yNJl2GGYj
         1bGA==
X-Forwarded-Encrypted: i=1; AJvYcCXDHVOLohCYsdhYqrQu9A2FnPzwtSt9f2UiFaUZeMywPSawOVPq54eP9yk3vmOTF48J3kjj1siOufV/sZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YymsSbRBm92Sv7nPe7uwKph3qYkYXTG3bqg3BlmQNLzv8DQFvNi
	VBgEerSq7pvaQ4uBoLNy5WhQ0eN1qcGFtVmW1SbWqlfGpAu9nxF4Y6pPU6iA6DDso+y3IVcBz0D
	UjP8i9NzKRLshH0u5B3lwlv++mMTGj4PKR5dwoNPCcw==
X-Gm-Gg: ASbGncuFSzElM6IAFKg/SVNtba1p46fMz5xnJDduawysX6wg45EebEYHM6AXduDdfcz
	WB74iywQG4hKEvFZTHavz2jWg81Xm8hkcC7Na1iUgYN3JZPxkXGo7LL0lSIHO3t1xjSe/eaEPtm
	zwgq+3+xPXDCZRWY5wBeIP0TlCrColv+Lf0XjRJ3QWFrM=
X-Google-Smtp-Source: AGHT+IGKJ/9nezM0CjL8LTlmXkuqqs1XvYRULfznlZkJ00Zas9fy/8SeNVFH78QNFQr9m4QBfV7T9IMSOGKFGfTViCA=
X-Received: by 2002:a05:6902:100d:b0:e81:9aa9:88cd with SMTP id
 3f1490d57ef6-e822abe0669mr22502028276.8.1750251421799; Wed, 18 Jun 2025
 05:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <m3ldr69lsw.fsf@t19.piap.pl>
In-Reply-To: <m3ldr69lsw.fsf@t19.piap.pl>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:26 +0200
X-Gm-Features: AX0GCFt2trdH5lvp26KlouAeiTYZ2alEevH8lFXOfNjGnwSoGAScAqPAkE83GxQ
Message-ID: <CAPDyKFo_oTWWX-PNNA_Dpq0fjbmhzoLCgd77NfDO=Q_JZ8hZ-g@mail.gmail.com>
Subject: Re: [PATCH] imx8m-blk-ctrl: set ISI panic write hurry level
To: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 May 2025 at 11:26, Krzysztof Ha=C5=82asa <khalasa@piap.pl> wrote:
>
> Apparently, ISI needs cache settings similar to LCDIF.
> Otherwise we get artefacts in the image.
> Tested on i.MX8MP.
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

Applied for next, thanks!

Kind regards
Uffe


>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 912802b5215b..5c83e5599f1e 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -665,6 +665,11 @@ static const struct imx8m_blk_ctrl_data imx8mn_disp_=
blk_ctl_dev_data =3D {
>  #define  LCDIF_1_RD_HURRY      GENMASK(15, 13)
>  #define  LCDIF_0_RD_HURRY      GENMASK(12, 10)
>
> +#define ISI_CACHE_CTRL         0x50
> +#define  ISI_V_WR_HURRY                GENMASK(28, 26)
> +#define  ISI_U_WR_HURRY                GENMASK(25, 23)
> +#define  ISI_Y_WR_HURRY                GENMASK(22, 20)
> +
>  static int imx8mp_media_power_notifier(struct notifier_block *nb,
>                                 unsigned long action, void *data)
>  {
> @@ -694,6 +699,11 @@ static int imx8mp_media_power_notifier(struct notifi=
er_block *nb,
>                 regmap_set_bits(bc->regmap, LCDIF_ARCACHE_CTRL,
>                                 FIELD_PREP(LCDIF_1_RD_HURRY, 7) |
>                                 FIELD_PREP(LCDIF_0_RD_HURRY, 7));
> +               /* Same here for ISI */
> +               regmap_set_bits(bc->regmap, ISI_CACHE_CTRL,
> +                               FIELD_PREP(ISI_V_WR_HURRY, 7) |
> +                               FIELD_PREP(ISI_U_WR_HURRY, 7) |
> +                               FIELD_PREP(ISI_Y_WR_HURRY, 7));
>         }
>
>         return NOTIFY_OK;
>
> --
> Krzysztof "Chris" Ha=C5=82asa
>
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
