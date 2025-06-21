Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D78F5C;
	Sat, 21 Jun 2025 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750525691; cv=none; b=aJDM+tv/KMoKr5LEiAJA/lAZQpV4Zw374bACwIv4ndIqeMiinLLRkLDBocygnnT+TU5fLxjDs7xmua0aTLavG/bZppO7hlwTuxmFfR9N+/guGpsSrIExIyTssjT5pHxL40vJOUmA8ZTg0R2LevNjVoeGCb27dYyUrFRDg0lvDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750525691; c=relaxed/simple;
	bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4unSr89Ly97BcHUwpkUNSOmKwRG5te7DcZAQonChdzsbCqo6ulcWmKvFQqrSzliqQBbbPWEewMQMwrID4UVDhUNPYIDP/2OHOxiVLU2+WJckOxQ+HU1EPI1UZciHVIAqsB6bp0NGXG67w59qJYdVGR8GokWrLVIZTt02Cv8jxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Met5EmZA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Met5EmZA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso3278795e87.1;
        Sat, 21 Jun 2025 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750525688; x=1751130488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
        b=Met5EmZA6odtQggYnTTcLYw8bwb1YeGSXCxPCLXuEORDBa74vFk5URNLswch1FotTv
         Ls2FUXlJNx4ZP40wLRjEMnYqk1dTg8Y7P/EDT9tsJKJbGTBm318J1VFFWFKXYaL1j7MX
         QeH+VPufJWI1FWI4P0lLAQ2uK/JB+gpzJvxji37CFtyc8iN+yR9ESONJ4djCvdBSEMec
         Sf+e4bGxe4hNeTgLA4xVXsdXMpf0etouEHW61fXhKq8ewLr10MkR7wqOe0VE4IlagMxY
         ipJ9aLOcZkCzcWJvzfXucl185shhEGwJh5/2vOUs/qkqHA+BDa5f0/11uha6h7f7BSa+
         7Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750525688; x=1751130488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
        b=ID3hF/fSxMKGqeBl08qfyT8bOpY7dQ4SqGcHgxBMq/lT9SDiiw60iZ/qZdN2+g3oJG
         wBpQg5dPka0aEO5X+6RgaqRQGgLGFDrxem5E496mG2yJJYqMo5abjX29CfmlFzDFEO21
         xVn3QeNUrphMqsYhWDx6eu9PnkKq/hDWgxbAQ9z1nsnhDsu3fwXF0ikMyK0/CMKRyBXX
         pErSboQJH+h6RGeD7ZexNmn6siJevmtoyCfIRAc01/m5tWH4YWW8PZ8cNQOxL8CqAH9h
         9DapKTiIltebQEER+BO3ixbUZH6VTzzlQLboSmhk0FKxcaLkKaz5MyUUPMl/Fvl/VPRr
         C7hA==
X-Forwarded-Encrypted: i=1; AJvYcCVOhGv6nmYnb91BIStltNwc9eSCjeeba74WGpzfOAdDgNitXKsFvJ/+Ihdz5W9pDGdObTJM+nHNnCFmTjlZ@vger.kernel.org, AJvYcCW9LAuto8wRDIiilEwgWvxHGb9aRA0r/hbXrnev20X0KVI4xqJJJ63Gl412WNKHUxUc7PfHJXIkW+ox@vger.kernel.org
X-Gm-Message-State: AOJu0YydAMBY3norOePuXklLXPV5CzeamK2gmJfB/05D2TwHAfvwk846
	/qpnTMc/4l1lEusRGv3gwSfMNK5PcSBtAqS8hjRyLYNeIiGUamZM8j58nXRM6n2y6bq0ntxO+oj
	dwBThyMDWJJHh/vFHwUBrJnV4dApJPso=
X-Gm-Gg: ASbGncsOKxUEkersOSEeIDhR/jvdZc95DUOxiikhSHKeutCbSqAiQcDiqx2rawWDko7
	nzvB/mRbqPHz2l5b0pVZq/pF45yGDhfxr72vrPrXh0qLjcRRixkh7JPf/tQt6rOkZ9KBf7nggAQ
	oJEEsOJ95QtsJ/IKsNkqttIs+KRDwBh6HpCeTY6LoAXP3GQmsK9+5lTqSO1wh0XPYog7lqCxkTU
	zU=
X-Google-Smtp-Source: AGHT+IE9XukBFnfqYPGxv15LwD4aFI78caQyw/4Eu8EFUxN/5Av0fimYLTnJIM5a8dCDg+V1FF7pxxWduBGUw5Lpv/Y=
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id
 2adb3069b0e04-553e3ba865emr2715526e87.17.1750525687553; Sat, 21 Jun 2025
 10:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621112311.68101-1-aford173@gmail.com>
In-Reply-To: <20250621112311.68101-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jun 2025 14:07:56 -0300
X-Gm-Features: AX0GCFsyZkLAi_IdniUJd_5FXJgXSkkE5eshqUFluI-nTmyTXyPV2FSCarf00P8
Message-ID: <CAOMZO5DUVVBmxfrJPjcZPCQGFg-rVNTUch6APWfSKF6LY1DWHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 8:23=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recomended to not use the DMA on the

Typo: recommended


> console. Beacause, the driver checks to see if the UART is used for

Typo: Because

> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.

The same comment applies to the other patch.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
