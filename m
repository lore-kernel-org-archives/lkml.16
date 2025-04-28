Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B52270ED9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856560; cv=none; b=o5rSNtXqcdXXUfi9wljtkb+aSkRlTc5xSpImSIgEXlR2V6atPp7/QzQ5xUMG/DRL8nMvKcT/awD6/rHpB5QIc+RTLaAyc8utfhG3RYXTDmhrsEk60mlP1corIkMxC87qlWSDw+o5cOmn4ioaKpfiXSRfx6CjP7b/Ms0s49A60no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856560; c=relaxed/simple;
	bh=FxpVlTj9Og0fal9AGjqztLBuWeXzj8BFTeMP3+xLTPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1lI/dVJio5C3QJlmYE/PLa/Kcr/rBNHOgHSTiEhPw0Ojc05Rba4OEONzqPTE+wZ+ohhAwGB7plhtp5CKd7FuP9vzHwV8x7hoxHhZyJLonifljRgOto4JfKL1FGwxIbkTGMF9ALba95Y2QZzJ8gqbkgxZqzaR7kPL5xtLaQVbbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5jIOwE0; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5jIOwE0"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ff1e375a47so51790607b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745856557; x=1746461357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqcC00DctTwElBMGXfCuGugRSRS3FAHgs7qozz2W9RE=;
        b=n5jIOwE0DWmAW06B+ZC2nZwA7AzTiognNPjeOs8wRH78SiwEUr3jwXA7+0orCXuzdV
         vvXizioTevDKVxckEmQ7/bJecDI7fCiPCKCaC+xb0pFrs3jrK+tzKRf/vHGduCD8cZPi
         WtEUyh5Cw1f+BH/l5tn7V/NGS2frrT8LV6QWewyVJV8LeIp4GRdkCzj8/b8AkA5UEJNK
         OS4tJQY5Xnm1Tb/Lp9+esDM2X6vpCU4HG0MqbulPmhOcwajTDYJm8N3pJI2PvDlQaG0Q
         E69LKrSokfiMVco8xmvLMZ1hyxqnX35eVyfqfiOGFhzVHlG8YRgRpZb4Tnzlp5xXf9jt
         5SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856557; x=1746461357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqcC00DctTwElBMGXfCuGugRSRS3FAHgs7qozz2W9RE=;
        b=Xs9fdY3CoZxiG3wWvzWVbqtZVVkYxGTv/Ik1orf5clI2aXfyBE6FG4DfXYY8SZkWv4
         +DmuQO0ObqrA0a5l1gcxavmJWQifIBlKMxQgB/7rABtpaPtL+YvH12ENIcWi1Nq1xWTQ
         TAqZTe/8hzjrPu+G/tef6XCeMj7e3OOEy5+A7LrkceEhHX5WRViYBlka+lLYF7Ox8AyP
         AeLojn5ZBJlPPHIaluxsM1bwRE04GCkjik2kbwX4cuOlzLpLajx63JgRVc7qSvgG1zEo
         e6owlRTdQ2fiHymSvQvEe5/Kd99NlvjAksX78IHjnGuC0ZjP/wrs5NWysFuhlj6ijqOt
         9YEA==
X-Gm-Message-State: AOJu0Yx74H4kKlgw35PZobdfQeHn4FxuyjfYx+P5KiF/EOiB4XF3cvdc
	9JbfhM9D8IBBWme3+faRGh2UrWsgkjqOIk7We7W7FvAR/rWyp4/bBPs84viZmGG7w4a6vqKQ95J
	LQwi7KsIgawMQYuU0cznqQZG8LT51f65QPBnPMA==
X-Gm-Gg: ASbGncvUvmLhHVfjVcyaXmGqhbm+gK/fCevV+jnuEnxoGXXZBrQLMTtIWTv2AJuDR6p
	DrUJsJx+9HwIH7e8xpRO4U2nJ/BkxbXVoO0HWG2kZRvQO1wyPeQU7PeATFfQxmeNYe4piwwxLRP
	aqOmLlXWYchHOI65WKmNTK3Ys=
X-Google-Smtp-Source: AGHT+IFEFlpBt75E9EmIVPvfAWV/hGclcHZhuGr+yR9C3ot2RgIFPMVPhVt5NG3pmNSvDkBdKNsEDpJt2mO9I3DlqTs=
X-Received: by 2002:a05:690c:b9b:b0:6f2:9704:405c with SMTP id
 00721157ae682-7085f183418mr133016977b3.15.1745856557599; Mon, 28 Apr 2025
 09:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421031536.1173373-1-ricky_wu@realtek.com>
In-Reply-To: <20250421031536.1173373-1-ricky_wu@realtek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:08:41 +0200
X-Gm-Features: ATxdqUHSoZXSXQAQyumHjEg_3CVlyJjSwwyw2GG_4aqVXDoXNhtZeDVWMOl3qBE
Message-ID: <CAPDyKFqNWirdJMA_7kpWjUcNYh4q9RLOLW+eY1hPztw4roEsMw@mail.gmail.com>
Subject: Re: [PATCH] mmc: rtsx: usb add 100ms delay before power on
To: Ricky Wu <ricky_wu@realtek.com>
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Apr 2025 at 05:15, Ricky Wu <ricky_wu@realtek.com> wrote:
>
> this delay make sure the last time power off did the discharge clean.
> During the card recognition process, card power will be toggled in 1ms=EF=
=BC=8C
> and 1ms is not enough to discharge cleanly
>
> Signed-off-by: Ricky Wu <ricky_wu@realtek.com>
> ---
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_us=
b_sdmmc.c
> index 1edfe2acf809..e5820b2bb380 100644
> --- a/drivers/mmc/host/rtsx_usb_sdmmc.c
> +++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
> @@ -952,6 +952,8 @@ static int sd_power_on(struct rtsx_usb_sdmmc *host)
>         struct rtsx_ucr *ucr =3D host->ucr;
>         int err;
>
> +       msleep(100);
> +

Wouldn't it be better to do this at power-off instead then? Otherwise
you may end up adding 100ms at card-initialization even if the card
has been off for a long time?

Or maybe this is because we are worried about bootloaders turning on
the card and leaving it in that state when the kernel boots?

>         dev_dbg(sdmmc_dev(host), "%s\n", __func__);
>         rtsx_usb_init_cmd(ucr);
>         rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SELECT, 0x07, SD_MOD_SE=
L);
> --
> 2.25.1
>

Kind regards
Uffe
