Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888E38C11;
	Wed,  4 Jun 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022678; cv=none; b=OvrBt20sPvePb71VQra/Hvb92ZP0/2Dus+tQXP+sSg+2XarB/uTotsifeoYiFGAm+WmYqcvBzmumi2Qth+u9gZNLsSpbOMK5xP+u7xuxEMndh3kK9o76dMZy2YYbE8MXkbAUzjsVYfukw1SMLDfeSQtqM+ipE7bAMFc1gJOOsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022678; c=relaxed/simple;
	bh=zIk2ydo9E6QXmGm0ISkrWF68PhwzLa29sD+7eFnm62k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjKSAHstiEWfNH2KxtQOBVRj8tp5Jx4MLc4keYmSeEKgZdPEElZvSkltj4DDO9FI3lKqtjBwrLJcHfhq2VDyTNYU2JHhZlWipkobjzV/Viav+1Oo0fnq2dleu4uj4FWzcpvpX5X9oBqNsRub8IrMIqQ3+1SxmgplNJcOJ6/QVT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnyWREcQ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnyWREcQ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7080dd5fe92so58892877b3.3;
        Wed, 04 Jun 2025 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749022675; x=1749627475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=;
        b=MnyWREcQZkagbm1uFlAd0i4nnwBtdgQZ0vG8XOIeWh4KMWr4urV3ZMuybUwis3yHKh
         7IuB44sX4QV1sSERyvmo+7OVBy8/vc2VjZtt7bjxsJFu7ceCY5wxmYacf2qWaQ0vqSyr
         ercaY9Td8uR9RL0hcRV3sctpbpCGvAD0RLOjFdqA3C5C2AcZhqDPKuTuLyDJjueL+dKz
         Lep3hSZW+SiXe/GbwQMTtTloaS4gL1EZN4tSvwdUvzIRbIbdZtAnuHjZmLNQytwZIrrJ
         2Y1s9tK/WCDAJ0K3uYgQeCkQZ2nE9qcef8KweROZorGZhrVJzc3xKALqhPM6BQwkkHLz
         tcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022675; x=1749627475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGyEvteZgKnU06vg7rbdizKIZLoS7zNjKeoB/6iPxjM=;
        b=DGHVORGqlMvjY/7vngu3yS7VDfHibz9fFglSWfT7UOFDoKTojgwi7B1Fsufn/EuNEb
         9SCuMP9ZWvvP/FQ86uO86QcJPr9NUoyphEGeeSuckmimF6EaoRMImRlq7rp/Ieh92jHW
         2ev8KrbEiCb/y1YNltXnM2Vc9ZlLxOlvE9dcLJaLVKArWmMZDHxS9pIdb7gpFLSOjjyp
         X5qt957+wOSSjIXCu21sca6XhX6AvRq0W9cyHi7HzqJqDLofjvUm3ZeNXfipRxoBjzL0
         313124YLJpDXIJMXykBd+SDRs6fpQBmVnaIFsan58vnzK5cgkicQLxov7Etz5EJMjGUE
         rvMA==
X-Forwarded-Encrypted: i=1; AJvYcCUYjx+Hhju2f8YgWf9kdg1eiz43tH4UqXfsr7qsL6VyNCLOgaKP60bmmQ0iQlvISm7vcOdJfOFgmD3LzXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOwl448xEz/COjrPDDgV//q1GUHpUCpQoylfNdfn1zuCiio27
	qUB2Yt5ttT/wvN8UVi8fpC7jWnra823SVwIIvKTHcWZz/IBkhIJ/zXNv4oxbMSe7tIEeoVFAvzI
	hUv97Mh8CiPfoSBQOHrF1fqLSeBS3QKl6RAG6kco=
X-Gm-Gg: ASbGnctXl31Wmwrptq9lPN6F60GsLeOKJDVQ9mCuy0gsOniVI5dfRBoudJkDtYrH4s6
	oRgDwryGB+DVwoQ2rkOIMLD6J2vEU5Gov7a8zUzXQtYdKZ043HELyhsil7/kbeLyYl+1kM8pqWb
	ykeNVoZNlIAwmU/o8F0ocDuygBfYGPUH0=
X-Google-Smtp-Source: AGHT+IGHg4yQNqLxlEDyCRgZJI7fvT2fCV18b3MewIJSWl1vbtr5SlMeusJ8GHaIW23IfmQnep32kSeTquJrDU0sBd0=
X-Received: by 2002:a05:690c:fc1:b0:70d:f6ff:cc6f with SMTP id
 00721157ae682-710d99fd79bmr21852057b3.4.1749022675335; Wed, 04 Jun 2025
 00:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com> <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
In-Reply-To: <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 09:37:39 +0200
X-Gm-Features: AX0GCFseUcNPKK85MVzyXpWJtxDlkMihOveN5Hr-KtFZ69h6Q8KR1YgWhWyHsUg
Message-ID: <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

I double-checked with our hardware team, and it turns out that all required
RGMII delays are already handled by the hardware on the SOM (trace
tuning + PHY config).
So "rgmii" is indeed intentional here, no additional software delay needed.
Thanks for pointing it out, it made me double-check, which is always a
good thing.

Best Regards,

Stefano

Il giorno mer 4 giu 2025 alle ore 03:19 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> >  &eqos {
> > @@ -39,6 +26,7 @@ &eqos {
> >       pinctrl-0 = <&pinctrl_eqos>;
> >       phy-mode = "rgmii";
>
> I know this is not in the scope of what you are trying to do, but this
> is probably wrong:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
>         Andrew
