Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96C42E3B14
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251434; cv=none; b=Hmap1zHuPcRnOQ/Cugu+Pa8dSPS1GNAxIcZrb8LzP1xf3OdjyV9VByvAmIEL9vc3lCJjKDDmBP7NXeXfjAG4BEtXaKH/FFK87dsNU+YaUm0528VqPjVRPexTy1jiz9tgzKr6tbVdOU+uNLY+08nA+Jwf+18HKp8K1wXYvc/BrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251434; c=relaxed/simple;
	bh=3FYqq38fif/LxKqKHUHq3crgrlGF8y09qgJq5ooSqws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cs77EJlTcHtJkL/iWr7nrNzmWIxTAKJ9o4gz1tE33M5IrIltE1r4DX2SslpYd5R1Ak5y1wHZBZp3qYjs7j74Jdt96nHMQIAdHP57OS+vekBWrWoYjBI4a2kSY8DESyQvrpDPOs0tsPWbfW/2tNVKK7nLunVCqqn1C+AngFtrG1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7H9MyIT; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7H9MyIT"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e824793a1cfso3238683276.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251431; x=1750856231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=b7H9MyITUwy7yCriEiLoOO2l5RI7y6VMfnXqPYBZAxRaJfkOCg2GY//y9VFsQB0V6O
         0vPcYb5Jy3ALKPNu9iPhZMPrv601Hd0//ZVH/TkU4GKxhPymQyTOFLagRCw1w6XlWSop
         Y0S8b3dtAo9uMx9P4mn/uMWWNrF+/7CCocwr/UOY8ozpqBwnDusriN/rZIexYv8bZtWF
         /kKRk3kcxJq9rkaiV/9s6W2ZyIxDeU3vjSk2H0L78iJnjDIXplks6z5ISWxqsW+IevC0
         qTaE6AdQGpPMVxVmumNTkz3DBjPdV4XZaQWbyhDT62+zUdceA4MiTgcxaHWjUbTvpSpg
         sq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251431; x=1750856231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=p131xILcJ8FjrethrWFLxdfUuqGPR7QsNImZHRddE1TXsPQVt0ikNQMtD54fEppjCi
         MxwSe1J7vx7AwJmdtefczly3qXq8QeI0tQRIFApgE9MPUr6W/VHiv6VUoTQPeC3LWpZo
         /U0cjHrTMjrsv20FMqKgaHCpYmHn++AC2df+T/i+Cl5sQT1xndoYOxo3fJqM5wAQU1HK
         7YKW+O1dzF89gx6hLnz4XIz1QkepZ48WU/V2wioZf1UQHKqLbZwZvFTACwQOBLUuv77N
         MofWSACICflH7SdJ4gOBcQNUA1/HWvPtVYHIwpOYfZ7jxnm4LezmvBna6o5PPfr07qy7
         OyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOqMD/6YqZGXNjAGXtU+lJ0iGpN5U1BNiVTwv6C60n49bFgolgCTSNIIQpcmQHlrjtdeqJTUewMUXNbUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyD1Preqy3kltCv8CsAP1L2EGGHqUGN1bo26OC4tGWl58AqYvd
	oc7moO27XP9VRUa/WeKB1Yuh5BVhRTrIjQ3wAnZPfuzg9YgS+pEJ0FhpqVsPIpnUvck/VAfLleU
	URFO1TrTWTHY8x6xUIb/OTPGiH5Izk5OHGWC64/m1zg==
X-Gm-Gg: ASbGnctAluJZbkPC3uweHNSlsQ/3ODn8SrD+P/sIu7L4tQ4hCBR3XiqdCsjBv5/FXiS
	lXhz8J6odbtWF3f6X+FVO457uMYt4R6pjXtswtn1W14sSmxF35W2HLvdSGE5jUQbY/UWSwLLCDM
	h2AWIB8HB32Yetq+sAWIkmY6nNydnLPGBd4/QNx27Qzuj1WFpeDwh+nQ==
X-Google-Smtp-Source: AGHT+IEyQuheTBiE1KNn6YZq2gnYBnep5nmoSzdbAY5+FjuWnU41fcajc0wk6HzHKqHouIVNOHfqKE34E1wAn8AbOSo=
X-Received: by 2002:a05:6902:108e:b0:e75:c2d7:53d6 with SMTP id
 3f1490d57ef6-e822ac5c6e6mr24203748276.13.1750251431566; Wed, 18 Jun 2025
 05:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:34 +0200
X-Gm-Features: AX0GCFtmn4waDQnDGcBuyuBWKSA5kWVg6aNQw87L31M-o6t6ciEMxOkcF-FE8sw
Message-ID: <CAPDyKFoPdqfz-3+XAMpg23VzaLUZ6xXJvmknQH7pjNZLPq6eAg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 11:08, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 2a213c218126..8fe1c0a501c9 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -22,27 +22,21 @@ struct scmi_pm_domain {
>
>  #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
>
> -static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
> +static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
>  {
> -       u32 state;
>         struct scmi_pm_domain *pd = to_scmi_pd(domain);
>
> -       if (power_on)
> -               state = SCMI_POWER_STATE_GENERIC_ON;
> -       else
> -               state = SCMI_POWER_STATE_GENERIC_OFF;
> -
>         return power_ops->state_set(pd->ph, pd->domain, state);
>  }
>
>  static int scmi_pd_power_on(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, true);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
>  }
>
>  static int scmi_pd_power_off(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, false);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
>  }
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
> --
> 2.49.0
>
