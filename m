Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386C17A2E8
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746964489; cv=none; b=FEuOL0fR8wc3ih1HJuNtWpcKIctumuWYIF0n1w9A2BlT0NhONjmWEkdlSW2CYxfOodZnBL2yDVqZxEGipvoZZwhX2VFHDwN8NO09G7o36Z2hnS1VtJDODSuJ2e5bHWdpvfAjdbDN0xUxfpeAE3ttat7phHyXgt7wqY56Xxqs8rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746964489; c=relaxed/simple;
	bh=oKaqbQN6dXrQwDy7cEcE+3Z7tky5uJDztZOfeAuE59A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUah9wIUsF0Al7Ur7TfDhy/5uQ2VI84UG7SVosU6/iFG+yxZ/GlkQ3qLQDHvhUdyixCFix43wndIMj8WMKV6RI7dKpPSYtdaAaKyzqVDKAWFFzktF4hZpEcPCq4290F/dCEUKLjEL0WI5Sab0qXm8+UqWMS1m2tHLBVjb1edCjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN0HE6YW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN0HE6YW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAB2C4CEF1
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746964489;
	bh=oKaqbQN6dXrQwDy7cEcE+3Z7tky5uJDztZOfeAuE59A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bN0HE6YWZtyknnpo+ItdOBG2RwlPmGUsE6pxYct6bVUgQ/djtThJDs95Wl2tauEMp
	 6IB3l3FwakdrYPW3bwjfDBTMVTft2BX0KiGm3+WY/OE80EUDxkDwpOyR0FVztV/Eyh
	 h/1jMEKCzhaFunt3zlfTZMSwB/nWH3SF/5yd5jQrXsHtPAoM9yeNATBf7rEbAOoOks
	 9w5PtKJp859OrRSRQNPuNtIr4YxgbM9NyihoiGt0KswVRHWPrHQQM7M4ddDEhUNDdQ
	 DzD58L9iS+IZkLN6zBiLSY2EuTbYF/ABBBU6U7B92vslQg3ojqnsShR/sxxbRw/2qL
	 f6rmlez+PAjnA==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2d0920ce388so1931944fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUv6jRfGbE7O39aQGuzm5caqTkeuFYaPeQc+29x79XRHOx26y7h/NZH95XrXGOGdMP1i1IP4SzKLGweIBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/ODMFUEdhCmXdFIdyIdNapd5P14fXB1Sm1muPF2YRqkEJdnw
	NhKoxGxwYVN/H665EkAUxrYlatQqsohU4Aeut0YdALMsUh58wCH+hme+EVU/nRLgcv8nz3L2OSq
	GmmV7ZxsuaAYFYXRPYxH44/7zP+g=
X-Google-Smtp-Source: AGHT+IEK4KdRqlLMj5yLm9Ad7XkLooKIBEJ1MvTuduGup812mvYJUz7vgXbgmWPGcFj/mkXha3Q0C48ACtrZ4uW2oIc=
X-Received: by 2002:a05:6808:17a9:b0:3f8:8977:7294 with SMTP id
 5614622812f47-4037fe7a40emr6562059b6e.31.1746964488357; Sun, 11 May 2025
 04:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509071703.39442-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509071703.39442-2-krzysztof.kozlowski@linaro.org>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 11 May 2025 20:54:11 +0900
X-Gmail-Original-Message-ID: <CAGTfZH2KXuX4d3Ox7CEV4gcVAjFHPMhPC6AzT5LAc3UN5Dzj=A@mail.gmail.com>
X-Gm-Features: AX0GCFv_VZ-ZmjDC-4tFWUUtkdv7SHSloGp_LCK-BP50W7s519k2dL-YBnzAiTc
Message-ID: <CAGTfZH2KXuX4d3Ox7CEV4gcVAjFHPMhPC6AzT5LAc3UN5Dzj=A@mail.gmail.com>
Subject: Re: [PATCH] extcon: adc-jack: Cleanup wakeup source only if it was enabled
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-kernel@vger.kernel.org, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied it.

Thanks.

On Fri, May 9, 2025 at 4:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Driver in the probe enables wakeup source conditionally, so the cleanup
> path should do the same - do not release the wakeup source memory if it
> was not allocated.
>
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/r/22aaebb7-553b-4571-8a43-58a523241082@wa=
nadoo.fr/
> Fixes: 63c223dcdd49 ("extcon: adc-jack: Fix wakeup source leaks on device=
 unbind")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-adc-jack.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc=
-jack.c
> index 557930394abd..7e3c9f38297b 100644
> --- a/drivers/extcon/extcon-adc-jack.c
> +++ b/drivers/extcon/extcon-adc-jack.c
> @@ -164,7 +164,8 @@ static void adc_jack_remove(struct platform_device *p=
dev)
>  {
>         struct adc_jack_data *data =3D platform_get_drvdata(pdev);
>
> -       device_init_wakeup(&pdev->dev, false);
> +       if (data->wakeup_source)
> +               device_init_wakeup(&pdev->dev, false);
>         free_irq(data->irq, data);
>         cancel_work_sync(&data->handler.work);
>  }
> --
> 2.45.2
>
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
