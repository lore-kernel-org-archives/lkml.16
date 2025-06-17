Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847182E7191
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168609; cv=none; b=ns2w0HxoWn9XhTdBVZfEdfMHJ9b+woO+G9CClytrQZ8itcgC0WgpIk6A0Qbk2tESB6HVIOlA0NtFHOps3XIYfiBELlGHEWCxKlOI1HGz9uHCuYQ+eGxi6+X6d+CNc+V8nF5kyNsmh63FTrjQcqvNVdB1XJvh6V/i/TUdsnwTjGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168609; c=relaxed/simple;
	bh=3zbvvtG7YQuVKX9TYGQMUeZBbqaW7QzuUhVqFlHBOaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UE+k28cGm/UCW8pWLPW3EwAtY/wDmuaKEqg9GJVW4gBKaCPR3W49Av5R3MOAS4oxvToWBmlACIMHFr919xKZLtyQCnoWWC0uAA4uWBdn+1EL5e2oCy1BuQc4phdtmhKMdkOwmf6HBwr1Lp6U9KSPYEvDuT6JtKAejqgW0GyK4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lc6HioDs; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lc6HioDs"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81f311a86fso5451128276.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750168606; x=1750773406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xofT8fwCIcw3ss7J9p9tyTyHI6bgKbUW4cnKWlrbyJw=;
        b=lc6HioDsR8xWZDKQ9gdlqf5qRxHNWNvCkGJuP2EY8RUswu9W/4Kls77VCdEITwslWh
         6MXrzV6q6MV4iASm74QHizstBUy/xFgZd+ppQpYD7sbFmuE/tY+9RGJAS32u0OFx19Yq
         r2RLciR4xRdDJzbPLycrb2sTahnQM5gW+SdtLZYk0TpiKOrSFfBz+4EcTT6YsYYoi8az
         HPeaQoRln5u55zFjOZIfvUtA0Oo1SF2AfB7pHziqmwXKMjcQ1iTmIHp5381FrpS7EXku
         FBM522ukZptoB5oQiZhRRraEfTMdGxj+Z52H0fe03crLn2EDPDM7JY6uw84H6eGSfAr5
         xuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168606; x=1750773406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xofT8fwCIcw3ss7J9p9tyTyHI6bgKbUW4cnKWlrbyJw=;
        b=Txwm4sT2hKrbUvVKZpVOIp+haye0qJqRtW1ASqFulxRV6a0MPcdGcbhVY+mVQSkyP3
         wtc8j/0wB+x2N79Fr33j/6hNeraOpxDf3C1musoIrQR2AaWktGOUVkhIAqrsqgdMLRf1
         xjSkPoD+FnIu9V4BaLZrx1MLX0mVIyPdPJ36wQMpQEwEZcpzCEVeTzn6ZNX1qiJcG+Gl
         p19ngFS5vRfGI57su4ua5EdGBw3Idy7d/p22Vg1vMwDDwAKFVJHnORDAR1ElTbCLcacX
         V49WqpZSCKXD8Z5wnqIV+OJcS0YVfsh1NY8jtk5nLkMHQOwA/c3EckyQjWML9kBoG+eX
         8MVg==
X-Gm-Message-State: AOJu0YxbHbBnRQLKQiqPTyrTrnNGX/ijMbpM1MkbdRZDvfykWBkYiSXk
	Ot6H0b9I9EqoXb23FoQ5WLUJkQ4t9Sjjsl/Ne/wYpj4FiBPcoU9eoNHSD5hNvIjY53VPeLcrNk/
	WFNrQarIoTZGmsb6CHZndsD+NR4G/rxkIzhuM6Vn1hcPBt/P39RYR
X-Gm-Gg: ASbGncuLlnFVju2ggKOiaehFOchxBZ/fhTr5XE1qDAeOToj89CiPExt8LBsFJArUjXJ
	a9J/eiQUz2ndriJ4BLVvwI1uSvyRi78gkHqMSxzdWev9vVnvSZB/CtseaCphTb7m7Fyl8WBMis3
	EXd2xHrw5fAsmxyZtg5gG1e3snpJ9Zu+IxSPf/65zMzFKp
X-Google-Smtp-Source: AGHT+IHuXsga1oBDQoLkES6fJaLQd3hottwmMudsb72N1YF49HztC//8v/4qepEDNCi8SqWDXlsgFDqxRNIpopuLq+w=
X-Received: by 2002:a05:6902:1687:b0:e82:c36:feb5 with SMTP id
 3f1490d57ef6-e822abf7a10mr17023480276.16.1750168606542; Tue, 17 Jun 2025
 06:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610111633.504366-1-ulf.hansson@linaro.org>
In-Reply-To: <20250610111633.504366-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Jun 2025 15:56:10 +0200
X-Gm-Features: AX0GCFtmZtjXZ3TSs816xYOPxJZIfqU9jxiY-vmD84gGmwkB_IMpvHaAnZiwJew
Message-ID: <CAPDyKFpWrBDQjUdGkhnRVxrYGLMfqmyd9U8Kv44aRZWwhqTG3A@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: rtsx_usb_sdmmc: Improve sd_set_power_mode()
To: Ricky Wu <ricky_wu@realtek.com>, linux-mmc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 13:16, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> The code in sd_set_power_mode() is a bit obfuscated and also has some minor
> issue in its error-path. This small series addresses these problems.
>
> Ulf Hansson (4):
>   mmc: rtsx_usb_sdmmc: Fix error-path in sd_set_power_mode()
>   mmc: rtsx_usb_sdmmc: Print debug-messages at power-on/off errors
>   mmc: rtsx_usb_sdmmc: Convert sd_set_power_mode() into void
>   mmc: rtsx_usb_sdmmc: Re-work the code in sd_set_power_mode()
>
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> --
> 2.43.0
>

Ricky, I would appreciate your feedback on these too. Or at least an ack.

Kind regards
Uffe
