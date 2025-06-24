Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC492EACFB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794352; cv=none; b=HXiEdBchiti+4MLayC2S3bxft1NvSWu7aF2SFlDPUy2zSgEEQ/+MgMiWLGbYK2R0wsIP/+t2PghAGG+Cbn6bxViK2mp71jpABePkGc7mAmbFKBJsS/qRTAdBBYT3GJtz9YUSQvDdnv+7QyhwkL0OUmg+UYAEvJRFgwhvkUAVF2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794352; c=relaxed/simple;
	bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4qB/fc5/x9neq0yg6TX4p2gZiwBKlLxEg6MRs9DCqcE+H3E50o63+7cUFtCg2r40O60BYj4gzo5E0wcENFCxKrpR3hGWtzVAxKzOQIHlzYAGkZclXJKLL9oUcCDFhwDxtdP61dYlQsOD/FnGOXuPhVKMH1ugbFBFyrvcwXb6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uvz+GWRp; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uvz+GWRp"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32addf54a01so8793351fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794348; x=1751399148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=Uvz+GWRpTRnT8nKtxhEc/eCo7ZG5NAvzQCPFuUyl+e7x4xx34/OQVluMhmvu2AMSX1
         afYwoBsuAd1iyqI8sJGGp0VLXRYjybuRn1C+Z3FdRI0+PJyfx05xsjhGZnr1alWI7taj
         9UY3ldcznOUMO77Dtryz/RDlY5G35wQt1xyq17iL8qSzfDXktUtM97Xk3G7zr0fdxHIa
         bn03ruHMVzVdAlW8z6EPnIPdDwDbbZ8qHsV9N6XoyxjgUuffNOQeWAr/3W3rlhK3bHyb
         ui9ne4B1nQQWlcZ7zsAUHBPwBycSu9tDthaM8YesgizqXmRdQFI8fO7AVAkzKn3sQu7S
         oBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794348; x=1751399148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=jbiOgGnfW0vA2YQiDCE4J97Iph0+ghiNBKBrkdVJ/KMcY96tAEmAq3NtRIOnGDpj2B
         I+JLyjgy6UwFmzkC8SFLkiZ/6Z0JgmYBLuHHv5kMRjISsCPXG1Ms3JEk0wiM8QeBipz2
         VGMMYaTk2nkcPhfXLEJ9MYbSflusd0JYg3tfMTLlsmoyskGcwVTx5OBynDOZBoUwpzfY
         kIKn2QKRkVLUDGJJvsrVNQZopQ6rO/V7bjN3xWquEDQL8ap+X1C1yBJ3qVhqCDO+Fcpi
         rZPCIPLczmQFiiTcjKwvf4fz+DWLg9UdxTDTCUxmY0rR5ELmh36JAktsM827BlstYsGA
         oAOw==
X-Forwarded-Encrypted: i=1; AJvYcCV3b0W8y5gtxTw3DQXvFroMqLu+ODpPaFeoj6Gx4cBUAlkDn6bPfhzy5SerxDfIJcUxrTGReEcrZuGERz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vODEJEwl7kvSw+vn837aWSvg3oDcguDTnFaNBa0H4ZZI4viG
	Q+dTaT13QEqgl/GsHFUvcLbLJaiW4P1Ws+k1K6Xx+yaLxywE7xxHqRLhZsZlgcvhB+bHmIAMt7l
	2Qo5K4ebVO+S2Q0FMNM1BBS1PQcZSpaZCQjK2Vr/Kow==
X-Gm-Gg: ASbGncu6jCAqCdDuWzimKEz3ouir7Kwah73RkaloWzm1sCXnbotvjwn6eldLCdAYYdF
	nGlg0ZxVHji62GQK0CZagWuOIUmzHGc+IPvo01ocBm9kEhcGzQBuuZs76ZCgBk3Fka0ArbYhqQg
	Meh3QVjTzSDDAyKF4xrvxvizqYxAKLBw/4PbQVnEf5pCyFaeAS9d+b3Q==
X-Google-Smtp-Source: AGHT+IFmqiLtBv2UOTh1D8iZHZIySmZyFDbcKWQIsCqDE3SSo4mBAPZZgwKH6/ZLVohgVWg9CA+g75neATAOTu7gWuo=
X-Received: by 2002:a2e:a7c1:0:b0:32c:a006:29d5 with SMTP id
 38308e7fff4ca-32cc6432fc5mr199911fa.9.1750794347783; Tue, 24 Jun 2025
 12:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:36 +0200
X-Gm-Features: AX0GCFuxMgt5rF_SL0XMbgco8X42yBA-5q-4FLSXTx6fBKQwC2WxaI2emdRh8Cc
Message-ID: <CACRpkdYTQywBeO_NSdjHZFAc3GizCpM9bSU2W+o59vtkp=Cf8g@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
