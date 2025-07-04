Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218428A41C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618551; cv=none; b=iDb0n+OLLbiPMgeG+p7/IwWwLOZPM1iXoVqt/bFTK9qdAJ3nTSSPgEgjvjm5QBiagc+5EuzqCPCKFnJadiSCUJAM1gfKXidRGGoKHMfLwS5o6clXRdcg+MVtt0FwNSEjuf8qEcS2tIzEuzVqCeQahGobcUe2PoAmOwLCSvbQovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618551; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEUubeQd0aEk64y6lnDQ/C691llNspLI6M/fj9PZbWVsOXG1g2IawSH5DRcVOxvQrDE452xc7uPOXRbk1wvYGSR+Out/iNsv4ip0iNrbMyjZEa0DMls7kEqI3LsMMYR5UZpccgnpZ3OUoRpdlcydbwDlGcz79uZCqOZrrraJfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT1PQbZr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT1PQbZr"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b595891d2so5761031fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618547; x=1752223347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=WT1PQbZrsuPgO1qF1LG+wIXjOUzXj3bN4EZ0ZC+GnWATLCuKCtE1zhg7Q4sH75kXjP
         sDooLeu8wP18sjQCsEPxaQrUttPKVo078xPiNKzwGf5jlPy/EaEVqEk+OGPIeSO4kiXg
         IcYEESwCA7vLRTMk2VidIH5xdOOTU7zJwyexTAGJQi80H7WFpzjYyLfjE8cvteGaMXO/
         j39T3k+8TtyyntwlF5qOM4LUeh2WRRpnjbB24Yfw51Y7OcYvNvj9Zxqd6pejoKsJJrrO
         Bg247XBlCQKwFmJQQlXRL7TBRmWf5rvN+Oam+dfSvokR4dfjYUcNNSK/t254V4zpSVa2
         ENqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618547; x=1752223347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=YaPx8tp5eHLfSL95Dt8BtwVC2ap28s/+sy7HehtDRnVu5iLWMCqY33ictGrk0hzXoN
         sD6bnyErprEAgMPzYx9fereNhmWUnmPp2d0QB1UG2ac/FM6gD6R0MwZVukgerxjC3Rlg
         Uf7Nu0K/LOE2zsGOGnk3J8YRDIuSrgYgCWMus3vGXpDlO/UXj+2a4uqbUauurI5/IKFU
         FPDJ/6Llzthz6QlGhz489R+i0Ctiu6LrVX8RkrYupfB/Obvx3CiviaB9PnPaYzuj+lz9
         idFvGmV/lRb3hf2JXLsghcc2sm/FxK8dTRtbhKBFXOZZQJmBnDamm6eAwf5RWpdb1/yo
         Nr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwD70VXU46/EmpZWUrDm8rmL9CbV6NdMTWJ4Qj/+rofkUHLpXO//FhNmF3YFeRq8UBrZ0vJ6ACQR0GIns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKzbbarLLBB6zgTjAJu++aC5n1z5rQllXhi+7MQ6V5C686h4b
	Bsa7W9G12hCyLwIg2jrTP0YWyJmZzBGvh/65ITzQALG+G+Vp0AkouWcYmUFQqEUHIFlP6EQ5AWP
	gAvopU+m6ViCmfsVrlgFw7PQsxyBBM4RjBoBBdlL2aA==
X-Gm-Gg: ASbGncv+vvcmbgZ8MQaNKAj5H0OLe/IrRLquCbzYaRzBfZ56xzAXsYeUyNSBcwH4i2r
	xqJe/bw8hY6ihvyGNKQTQmg0fpmYbx2Z1hugncTWjOOHJQEdkzr8Up3xz1DpuTs1qXTgSI4Ju2u
	4dnnxvNL7k9bRj52AhGE/zRSNfpKfTSvIzsXNuXWojBcM=
X-Google-Smtp-Source: AGHT+IEAaBTLo3EbOBke4r+Qqb8oEiI0VY9CZIrYvxq+ehJ6Nqi1uPjI7Afw/XyEmGYHQQIcPc/bUSJo+rniRRe4A7s=
X-Received: by 2002:a2e:be29:0:b0:32b:3cf5:7358 with SMTP id
 38308e7fff4ca-32e5f61875bmr6171271fa.28.1751618547556; Fri, 04 Jul 2025
 01:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075424.3219556-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075424.3219556-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:42:16 +0200
X-Gm-Features: Ac12FXyNCQpVK4fo6g60VvOdFC9JZ82H-ON3QvDAbIzzJ0Cs1R5sjNEchTY81F8
Message-ID: <CACRpkdbdPqHVHhTjBiLPmZ1nGiaJqm5kSa1--uMkp6OXmAprhQ@mail.gmail.com>
Subject: Re: [PATCH 34/80] iio: light: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Julien Stephan <jstephan@baylibre.com>, 
	Waqar Hameed <waqar.hameed@axis.com>, Abhash Jha <abhashkumarjha123@gmail.com>, 
	chuguangqing <chuguangqing@inspur.com>, Shreeya Patel <shreeya.patel@collabora.com>, 
	Marek Vasut <marex@denx.de>, Al Viro <viro@zeniv.linux.org.uk>, 
	Vasileios Amoiridis <vassilisamir@gmail.com>, Per-Daniel Olsson <perdaniel.olsson@axis.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
