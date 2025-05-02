Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF119D891;
	Fri,  2 May 2025 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175642; cv=none; b=ITU4YuqEPl6EAiqqC3ynwKMplCq/JLWTtuS69CEzYPHmfJRzMIZiJGshVFBzmG987JFPLG3A/7v20QLzhzAaRDpVeeXD9zc+xI8LwAKfaTDCWyyj/NV3/U613IDLDdc7RlkDRm8dXQu2B42lZmA3OoT8ia/GtYtGa2osgjC611M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175642; c=relaxed/simple;
	bh=9jBEmF43nusgTr6KyTmUAJm0NR2nhBaGOUcA3wtOdK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcMolMnSQSgAFBfFYFmnYA7kkxrMCu8AMNRl5J6RrLrbxFxPetH1Iti8Ett3NlpDzV3A2OY5WLxpmIH8O5Is3ZvkwT//o/sQPo3r2Fhq40UvHoJiOWoFKtKdTJ6+vecdgE2kpRDSRG1N/Yn22sWeQA43wnxmxPDBA4gik3Szaww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Ayhuehes; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Ayhuehes"
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 7CF532E08A45;
	Fri,  2 May 2025 11:47:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746175625;
	bh=ohQ4wDME3+jOfuoNUWNuty5n8n/agiEfl/vn/jqYItw=;
	h=Received:From:Subject:To;
	b=AyhuehesFwovsPSmR0MZyoajTVTni2qhfxW79mnN8YToxlRWDmJJBV0IghempDIt5
	 WcMMsTieq/Eiiqx6VAprgIR1wTaeSqM+YmJg4Bexcm9Bfttzeq7u+8L1PX9MKuzesI
	 rWLGXwZSkEindfsVPjfwa2Cah+hxn3rFhHI866Sc=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso15256371fa.0;
        Fri, 02 May 2025 01:47:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJpjb3GOKGsRjLO8EbwOVnurMkxC2pSpvzArouscXIlko06xsFYS9YEFZCiJUjCozWz1lMpadK79VhSqjh@vger.kernel.org,
 AJvYcCVe9M0f0CoEOJTEwtXiUwNMaulCYvgfzyzqfxPR+O2YtEGoNeb7Y6nJC76sQWTyGmJIy1ItEVgQLqoobx7dDJW8VVxIpQ==@vger.kernel.org,
 AJvYcCXmhjZbrQKVYjl0FbhvUC9iP/YRgkP/5sC+yetLlQTlB5BAmRsiz1fvBMLciraWHHeSg25UhzIEtVGSNlXrmNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6x0m8MRq8Oa+HxC/+0xS1X9blFYk6RDRTxDGi26++3/Auf//
	fEmZg69mePFyBRhpO/JnfhaZVoYlBeIRHV/fq+paS4qxUuPVKrurMc1FofnGq0aDo9oHFDHis7x
	IghiD6tRnf5ncDemivspXbJpEDcA=
X-Google-Smtp-Source: 
 AGHT+IF2KuGQUkaQynK7BvHDDgcmIvf+dtrqh24xlrv01gfQDql9QFAC3rjArY5rugDsp4TPyfbzCFjBGU71NHrcUUE=
X-Received: by 2002:a05:651c:543:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-320c5be287emr5435431fa.32.1746175622620; Fri, 02 May 2025
 01:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBSE71VKfBlQg_fZ@stanley.mountain>
In-Reply-To: <aBSE71VKfBlQg_fZ@stanley.mountain>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 2 May 2025 10:46:51 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFcLKRZv9_cGacJSEmOZ30CaQzS75_Vfb1DDWaNBXUvzg@mail.gmail.com>
X-Gm-Features: ATxdqUFHSB-iugiUyjDoWuzAutbINVAvgH5CdPUAvbLxfNlUcPpwyQ8n87sJuWg
Message-ID: 
 <CAGwozwFcLKRZv9_cGacJSEmOZ30CaQzS75_Vfb1DDWaNBXUvzg@mail.gmail.com>
Subject: Re: [PATCH next] platform/x86: oxpec: Add a lower bounds check in
 oxp_psy_ext_set_prop()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174617562406.8474.1202650304836171656@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Fri, 2 May 2025 at 10:40, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The "val->intval" variable is an integer which comes from the user.  This
> code has an upper bounds check but the lower bounds check was
> accidentally omitted.  The write_to_ec() take a u8 value as a parameter
> so negative values would be truncated to positive values in the 0-255
> range.
>
> Return -EINVAL if the user passes a negative value.
>
> Fixes: 202593d1e86b ("platform/x86: oxpec: Add charge threshold and behaviour to OneXPlayer")

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks,
Antheas

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/x86/oxpec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 4b48f4571b09..de70ca7e8493 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -582,7 +582,7 @@ static int oxp_psy_ext_set_prop(struct power_supply *psy,
>
>         switch (psp) {
>         case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> -               if (val->intval > 100)
> +               if (val->intval < 0 || val->intval > 100)
>                         return -EINVAL;
>                 return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
>         case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> --
> 2.47.2
>
