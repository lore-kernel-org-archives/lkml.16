Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D1209F2D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041926; cv=none; b=sIT73/5Wy8b6D8PeKnoZDfOK4ZrkEW46ZEdEMy/Pn6YM7Q2zPAd2vGs48FEoAg7ei47XeU3bMYXZYEdqbqZ264I4qu04S4tX38/LS3CFEnddgNS28xcQNlhObicmBVVHdGdquHVzgK94IshhoPQiKsOkUzliQNNMWGUhvHciILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041926; c=relaxed/simple;
	bh=CRYlMNWz3u/08ZIs/XIMA8AZpRqVPaRQC/zaOHLZvkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtEVdC98tkHmf072y4maqMSFX9eOS+7IIxTua7XO6/iUkOviaXe+dCs5cvyO8/IPfiedapwJlrIctDB98+8WsSDl5bcMW89FBdMNJ7q6iZY0cOQFVpLbGthROnNKqXcTUCfFsFaIEF/8Zn/eTm+dOwSlrcgpdRKTg6y3F30u16w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qNNEfvCJ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNNEfvCJ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7040ac93c29so14715307b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041923; x=1744646723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYl7YIVWVZsKQC/OOQAULpw8JbGgIFbvz1XDkCe8Zvc=;
        b=qNNEfvCJ77BEr+qxk88q7kddJCYuJMdKPc35csvyh+BiIgIBr/70ARVjlORU4Rh5zo
         CWUtDMZNqJfZCKKmY7kT7wAIcA4GJPQw46oPzm3zBgUfSsSODsWIThFB8ax+YI389Ioh
         5SF9hn4k9DoSaOpAIJ7jPLygSBBqGrfFz8Twb27QcuAJ9xnF+5a54GCKr0pNYw+0FHFX
         sxjYFZMlj4vCSiMwa/a9zOWfnhIUyxXkaaRDjMjHQFKbLIrSbVSfm7Mj3q5SiqhIj3EW
         PTsvhpy3Y/3mmGJjzIFuuMa60uuvlWWfqAey56geF69WjjL9Wt3ZCB+Un13q8vKK4GjU
         ui+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041923; x=1744646723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYl7YIVWVZsKQC/OOQAULpw8JbGgIFbvz1XDkCe8Zvc=;
        b=vW/hYlm1S5V38QmJgESnuW9Fxa69xeIsk+PBzNnPp60ueuQlxLyJZtZyXERFhdDHTY
         8VfubrXXGiEbh9B3O7PkbnTkMr3o3EAfOTQnChp6WXMcPiKqhEJINFMHsLqsa5BsCe05
         FJydB+uoio0ZQciweYMc325RlITxTLnLZp4abK5rSLMReU4X5ZqvwprCzvqfW8S+cXcn
         N84aiehgqoNzM1DuPxM6+rzH8QKvtqPVWlcJ6PzYDHrtYkaFol7VF7I+I9EW7S8MhrPY
         R9TGc2+5miWbByNsjOX/znaE/6KFthsFd7eofb3MvO4QqmJWi4jmloxAcM5zifEFBtlL
         YCNw==
X-Forwarded-Encrypted: i=1; AJvYcCU1HOihr+eXHJDv9+8y1U3l0ExGmUhXpoTJ1UwODQxNaqg7abqeuMXf4/3x55NMsk1j9K8bBRPDGVrV4+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFum1jcqMMT5yUEYNYQ/tpa/Vr/KzwwomkC6tsPkQ4WSzAOPH
	JpEw8/aqiIXT1/wxHdOgKqCyiHOdwVjDzekAZEx/Ib+8RKGO3VeVJZ+E2yXhhjZ8CSkQJfqgGcA
	jVL8NC5oBhEpwxV3I2QgpY0EtsTpBNLtSn/Xmpg==
X-Gm-Gg: ASbGnculAU5vEPmZdSQHZtnWyfLbBuqaI5mmTAQVthIJT6Y4HZCO8aBPS7K1IzTAZ9N
	fpmyAtECchmMIVaIxexFvT/oRGea3kkp131H0QDWdkDiNLuqq3KF4BpKmw6mM3OePeZcs49ULSx
	fPtxNKi78aiNSYyKvMeLOI9q73y3u6HPMU7aJ2+Q==
X-Google-Smtp-Source: AGHT+IGDxc9ZlPb6nb5Z2zd90PGYLT3LmyVgNtNoQN7ui3U6zwBCuP16mCNDz0Fmuae4RzFpi7mdoWPuoFtnsuh24n0=
X-Received: by 2002:a05:690c:4d01:b0:701:fa3e:83f5 with SMTP id
 00721157ae682-703e3357338mr248959627b3.35.1744041923239; Mon, 07 Apr 2025
 09:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
In-Reply-To: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:46 +0200
X-Gm-Features: ATxdqUEMjWbobTx2vMpoyw4W4dRlizG6XIsBx3n4NggtPSnHg8-j2sy33AaH5wo
Message-ID: <CAPDyKFoMdp6b2p4jWi+K9nDUV_cQhkWjSmQoOmX25LfQx3AehA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
To: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
Cc: wsa+renesas@sang-engineering.com, salauyou.ihar@gmail.com, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 23:08, Ruslan Piasetskyi
<ruslan.piasetskyi@gmail.com> wrote:
>
> After moving tmio_mmc_host_probe down, error handling has to be
> adjusted.
>
> Fixes: 74f45de394d9 ("mmc: renesas_sdhi: register irqs before registering controller")
> Reviewed-by: Ihar Salauyou <salauyou.ihar@gmail.com>
> Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index f73b84bae0c4..6ebb3d1eeb4d 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1112,26 +1112,26 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         num_irqs = platform_irq_count(pdev);
>         if (num_irqs < 0) {
>                 ret = num_irqs;
> -               goto eirq;
> +               goto edisclk;
>         }
>
>         /* There must be at least one IRQ source */
>         if (!num_irqs) {
>                 ret = -ENXIO;
> -               goto eirq;
> +               goto edisclk;
>         }
>
>         for (i = 0; i < num_irqs; i++) {
>                 irq = platform_get_irq(pdev, i);
>                 if (irq < 0) {
>                         ret = irq;
> -                       goto eirq;
> +                       goto edisclk;
>                 }
>
>                 ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
>                                        dev_name(&pdev->dev), host);
>                 if (ret)
> -                       goto eirq;
> +                       goto edisclk;
>         }
>
>         ret = tmio_mmc_host_probe(host);
> @@ -1143,8 +1143,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>
>         return ret;
>
> -eirq:
> -       tmio_mmc_host_remove(host);
>  edisclk:
>         renesas_sdhi_clk_disable(host);
>  efree:
> --
> 2.34.1
>
