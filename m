Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E89220F59
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551909; cv=none; b=U0dlJOOP58yK5Xm9hkusN152LP7HL8o9P4Ai2LDsNvl219RJaUWolInYgZxIa4rkUtJI7XdcRuiXDFJS7QgKKlUEynBeLiiI7o3wv4yvBufWeX7sJqesKx05SRWC07xMHacHFtEF/HhhBo3eWxOfjgLNZuqzN3nEdRush+yiko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551909; c=relaxed/simple;
	bh=OQYAgODVpINZnz+yw7v2ECzJe/sFXzngEsMGegGS4oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXdRlYs0drQsOAUwc9425yQ61ev4q4skXvSJRqZamsh+JpzA0cmasVITqrzmdjHBKDbeGCoFFqSqGUDY7rMdDiTG9A+gMOluzFAeUEdJ2yJhcA3XgvwvUVo78UIu0L1acl8MveMtyfJQhc6wZPl7kwpfA3QcOjDj2lzB2N47ShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OCLDHUw+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OCLDHUw+"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acae7e7587dso956596366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746551906; x=1747156706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hLpQQKNN/MIjkhEPtNp036EW9veXKKXnE5G67+atsR4=;
        b=OCLDHUw+8L40u0CJlZbpAxVl9DYET0jNIGuxSJm0gUCsB9Vjg1ThdwLxDMVsD6M8/W
         /AwUGW1od2bj5aFws+tzzLlOf+HFEt4bHger8BRDEscjD/3CGRE3TrR2a4wrzOKuQgQ2
         xPFrO3vChHWVmAhy+IXhZQkw8SBUcBIEXd9P1ubs5zFFR84tR3TXUOUYN2KFiWalOJdS
         Zf/SlpbAWXQtSVOWHS9pDGOHvxlZcNVqPRLPXSjZuZFbBQYPtvyd9F5ivMNo6jUoaIVM
         4si5HyJxSeDQySlZkANVQHtS3tNCaXlyU+nt6/AhhE44BWesu3FgOYl4ijKBMwPDW+SX
         6A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551906; x=1747156706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLpQQKNN/MIjkhEPtNp036EW9veXKKXnE5G67+atsR4=;
        b=lm3wh6KCNWuGjXfWUkqX4EvBU9989T6g0iR3bdw1o4hGQNtV2q4YQYHMUoJN6KfMwH
         DoJVhPPKiPGdFlQgtyH+mxdu1dveDE4uYgEO9UhJED9aBDImT/UBwt5usqBXvwk7t/hC
         96k83WbdQPBqlk0+iCGxK1IK3jH1OiETlf52lu02sTD4cehyQzXyF5zYklWS8VnJUv9m
         CP+r/1+z+EO3OtXfXAd2rw1Xty5X2khTQP+hVR5JZfeesBd8kER/P8JrjNweW2H6Fdc0
         EWrGwmGn+7Pa5tNhyBd89+fPb88L87Tx9If/n5Tyg530mpvsWz7ocaQ0s6/CIZa3ypxM
         J1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXucdwPVzn3ZWbtnY5JjNRw2DcGoTpK/iEklV2YZ87+d09Mvea8qFpv8pgzj0oQPzMhjnrm5pnw7AiR++4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyylbxCMcobabt2V6mQFg1y7QbKJX9YDcI7M/I5l79M2uwJNk
	NI6pJ7hUaFkRQLqjkfr2/3HJmu6Kty0E9AMG9Z8aWgWs5jTKDFVjj5n4uLQOQDfhwIdugQpqAkV
	MMuxgSs/XktlARfyfbBqNzaWuTnfaEDKFkRIwdg==
X-Gm-Gg: ASbGncuySeIrKmGyb8+sILd95NII2Ul0vH8/sSnXy+Z5+xD+TIKv0xthiwaEzQHXn8j
	3Z2E/oNG/48GtonMZobMUs4RIxsj6qvG0OmYn7cEJCDQ6+lXIC5ryduwf4cKc/5n6bGH4OhAS2D
	LjuMp+h8cSukAct6H6ALA4sLOjTnaMSQUuKZHvK9Oo/N3NLUuX2vRlqQ==
X-Google-Smtp-Source: AGHT+IHE66Vgpa971cMKK+duyPRa6SkPlWJvDTybSqVOU3NLmgHpf+zEI6gVYKmySXbRn89yPrqAvZDICOtPIeFmSJE=
X-Received: by 2002:a17:907:720a:b0:acb:b900:2bca with SMTP id
 a640c23a62f3a-ad1e8a03c6dmr34414766b.0.1746551905998; Tue, 06 May 2025
 10:18:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com> <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 6 May 2025 19:18:15 +0200
X-Gm-Features: ATxdqUGWZrl5YOiP7Og6r3-nl2H9A1mVWnPA1IqXnDAC-_8SNMX6_toeynsOt7M
Message-ID: <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> In order to simplify cleanup actions, use devres-enabled version of
> gpiochip_add_data().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         girq->handler = handle_bad_irq;
>         girq->parents[0] = pctrl->irq;
>
> -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
>         if (ret) {
>                 dev_err(pctrl->dev, "Failed register gpiochip\n");
>                 return ret;
> @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
>                 if (ret) {
>                         dev_err(pctrl->dev, "Failed to add pin range\n");
> -                       gpiochip_remove(&pctrl->chip);
>                         return ret;
>                 }
>         }
> @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
>
>  void msm_pinctrl_remove(struct platform_device *pdev)
>  {
> -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> -
> -       gpiochip_remove(&pctrl->chip);
>  }
>  EXPORT_SYMBOL(msm_pinctrl_remove);
>
>
> --
> 2.39.5
>

If you're at it then why not remove this function here and the
callback assignment throughout the pinctrl/qcom/ directory?

Bart
