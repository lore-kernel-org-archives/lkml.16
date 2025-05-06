Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E64153BD9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552205; cv=none; b=konnUXwmR6FL5BUE4gbPRJHzqUa/Ij6LVuEaobKxZSUQFgftuSkHDxcH9YyMJ2CASV+Xyw0Z1kO8lj2pZCFxI3gF+Oinmh2AtwUtoXTzsmvB2VFEiHeGOdcpSDTaT+qHB3lgoaLLJx6r4KlMhQqA8sYNM/IqA+QEb4HdTKdWlj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552205; c=relaxed/simple;
	bh=fJVuLvipZaODLDOPSHa5k8oaRgCbH6Lmgvt9FeaV11A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzM6VDq+tappGILecYQsO/QDt8037RHL1WafxxT1ZdXgm2qa3/Bi1V3kzUJx1iPEz9jrxL+WgCvE5tdjBxAa/EB9ho+/mXz4POdRYaJgt3en+gy3FPS3OvbCC/JPVERdnRnlboZhV9bQi1JJxV4Blg0A10v23p1wGfJxMaDsd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hlk4tAXJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hlk4tAXJ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2aeada833so23077066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552201; x=1747157001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CH+3YE8oQ2hbQKxa7VI83wPBVwlMSC91rnq+CEtI5/8=;
        b=Hlk4tAXJn2BqNfqtd8DkGZ6135dFLh+IEoNVVirED6/ojVoACWiWuTNY8suPfF2sLZ
         s+LRgXn5bpBBXv0fXe4A7cqCSyugDFhYXi8zllDMkKmxji+sUh4TdOnGbj7al/Zi6oUt
         rQQu4934vzqmWlxavoWBTCWuQT6RbVgYwZd0yO/X9cbvlUUCVNIm3vPqoKRf5fY0IkpR
         PTICC6qt730QQ014iZSK0SpaZD5z6x+tnsyEHgJSl6s1TBsMFmgW8/6AJHw6KiIaU/oa
         +Ee1MwfzW/I0NrAuWtUdMm/Bdz4yDmsfrU/gMuTYZx1xP3MlTJcMik9j/tJuZzu5Mie1
         esOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552201; x=1747157001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH+3YE8oQ2hbQKxa7VI83wPBVwlMSC91rnq+CEtI5/8=;
        b=gLBSxxfr2OO1fARqiVXqC8FWHEFh12D5Jrr23h6Bcm5P0bwY6HEwC6siP8F/omYCmU
         0IJ5gPmjo6jPmVJX4mU2MpWvfDuty3N8kBZ/zFDWIjoq7Fu9c1yncqOJIa5ekjCUElJs
         VGteNTMFWUZThGJyn5tpF8ySzfQQzeVKashu2kNXbCd/okiySFQg4Ac29RsBQeeOOVvx
         zOONRsAltfEfCxPyCmvjV1Tr7aLRKC8tyD5m8GpyohaXx/weYJyXsAOsMHslctK5qaE4
         9XoH5ogJUCxKcnlZdfe6zsj9+oEhtlPx0DQj0+9+D/XvjtpCCGpecQ098rRGRYSgJ0Jj
         kwcA==
X-Forwarded-Encrypted: i=1; AJvYcCX95Qmp0NrjhlRbZOCNP0fqQtoHDOsFwLTNuSHC35fq57QY8solOfQfLpkZSjVPeRhGTS6XBAwbmhWjiWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0LAjh5RwwZyQrZBea3/f+PSmiRLnNxAj6gl067VoOdWiRSGVT
	HgMp6U+Vm4+7HBG160JzJcwNnVI1NoNAPVcJ8o16RHK/T0NJVzw1LfAGAutwQVkEsWWP5Od+E3O
	pBAnFA8zotajLFcO3UMbK4bXB//wbDmiqclswGw==
X-Gm-Gg: ASbGncv0KJ6rHegTAaWRzqtpLaWYq9fy0aIPQSl0Q0QqnYJXPvdSRUtaztvhhM5/BFK
	bhVIiVr9TwJWwz2SzgTX5pVF7CXXlXW9iNHtphV0Hc8J0KzWzIWJULIvVA25eE2MoJ99TkFeCGz
	SAdi/dq6eM5m/a/p9PbgNmO7tp0OqoiVTaxLJLV8tpUP/aTT8+L5k7hg==
X-Google-Smtp-Source: AGHT+IFnrJNrgy1m/oRww7px8z7UAiAL/GjQDOBzHgoOoLO675fM7OGX500WyhrjcbjscragoGRNgo+LSuwB+tFMAUw=
X-Received: by 2002:a17:906:c10d:b0:ad1:8dd5:e69a with SMTP id
 a640c23a62f3a-ad1e7948a11mr58747966b.20.1746552201542; Tue, 06 May 2025
 10:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com> <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
In-Reply-To: <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 6 May 2025 19:23:10 +0200
X-Gm-Features: ATxdqUHOS3jqOuPdOa1ceB9XoLev0t0jfeVU0XwwsL27s3_XDnEK-YfaAN-y_GE
Message-ID: <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 19:18, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > In order to simplify cleanup actions, use devres-enabled version of
> > gpiochip_add_data().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >         girq->handler = handle_bad_irq;
> >         girq->parents[0] = pctrl->irq;
> >
> > -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> > +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> >         if (ret) {
> >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> >                 return ret;
> > @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> >                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
> >                 if (ret) {
> >                         dev_err(pctrl->dev, "Failed to add pin range\n");
> > -                       gpiochip_remove(&pctrl->chip);
> >                         return ret;
> >                 }
> >         }
> > @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
> >
> >  void msm_pinctrl_remove(struct platform_device *pdev)
> >  {
> > -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> > -
> > -       gpiochip_remove(&pctrl->chip);
> >  }
> >  EXPORT_SYMBOL(msm_pinctrl_remove);
> >
> >
> > --
> > 2.39.5
> >
>
> If you're at it then why not remove this function here and the
> callback assignment throughout the pinctrl/qcom/ directory?
>
> Bart

Ah, it's in the next patch. I'd make it one commit though, no reason
to split it IMO.

Bartosz
