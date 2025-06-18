Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A129B8FE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246043; cv=none; b=atv4+uBJNkATT3WEsBUZCJbD3Us6jxChTtL/Aw693IM4Z/G8OChDcEzds6rH8KZEXXTXEVp4VdiNugmOAX7NJL41R8SzUU0pW4MTZT56OC5uGYFr9u55fXLotIJgN7KOjHSTpuiQ7ZNtW0djOKYlsWoDrZ04CbYkti3Vbj1AqVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246043; c=relaxed/simple;
	bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKT8GpnxJZ3q1TAFmwnPj2nAOpZW9kOyPb+XiyDmDLJXlQA8AB6lN/e+mG5pLJy5u6sNh0QdsktkaixNgHkuqxqadKOd6a3DWstXnnKtOqTQ2MuwNNuoM72igHyDndmYTnDeggO/P2xNLjjlqVjozgKIID9tduj0/Awo0g5UeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/pyDwyM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/pyDwyM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so7023431e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246040; x=1750850840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=s/pyDwyMJvSCAVC0O/FbLpfEEpa7bM+dfz5CfpngCdhVtUEy3w+W011mZDkiV/WJM/
         DSw/FgpJbjcEw3e87pg+Y/NpKT/OUd+/O0M6StjuGP8fsskAaDNBHCL5eOWoM3KiwEil
         rpid/gh99Q/qrjULVsia3ykGoN0hoLrAiUqq9UWBjq3DCNLXzJCimpwMFmzssjZuvNrJ
         fMTIcK1dQCMiS503OnJ5kCue7o8nfO2KrVSoFAqxkKKK2GcCy5u5+KakBnc2csnSVa1E
         gqcqn6GLHtsMiY8/WGTmB4QrnTYgDP1LqsSjixD2iF9SR0+4Nnf4AMK0cwdZXuin7cSH
         ipVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246040; x=1750850840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=jyfdmVmYUtyxTN8qnMsjs/W0tgbteVcgB/4Lif/m/iwkZFNSaOaxbN9OvaFffA1NHk
         AnbaEBofC6qp7qTo/91IDWTcm0uhMAWAU3mNjQZA/D8LWWeMOYr2lT+CWHxaW/RgQ9PH
         /2cHACloczSj0CDWPCifxOq1ae9qGMOMDwku0uS2Kg5NtyJ7eXV1Eq2MX9o5KR1r8CWx
         lRGGb+BP93mlPui8lA6BeVQvXVgY2YFxZgd3hziyYF+a3wRQJMZImcw0It1OMcDB+wBz
         2L40t49jjFcCjBSlg0+HxJaM2d6C+LjdD/Bfq6ypiGI0OWfEbKayr3PteZdpX8u4eED6
         43ww==
X-Forwarded-Encrypted: i=1; AJvYcCUMWdEiX+Mn2vvV7VPAwt6DeBCmoDVDPOCzN18hd0xzdMrfeYSHKh74linh3RLO0foTovTCTtgGW6LEETU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTG9D8N1PTrxuq9vmdLDE3tCkMgGEdOa6iyIXoN/OLglKcGM2
	+tLldMObcp8xnXCChM3rm6T0lBB3shiVoxkehGEhikFjefSOQaiCtQ5FDxuW8USVSgzidxh+mYn
	tt6RE7O2IHcZbAvQc7jGFZe3EKgDY6+rEEiC8qrFUEg==
X-Gm-Gg: ASbGnctHfnedEd/CTrqRq520+vbm1imP2z0cvyWNV6rTljmebxxVA95tkcS/DFncXua
	+Ex2Ip8ejv3d671H21UBiIhZQ6YV00BPIV6IRFT5EoYj/0VGDphcZjyZj/II+2LltJgVGxQ4WYZ
	+CXx44xKBChKJEaX8Z09KgkbYdIzhcruXFYkB1/x+b0Jc=
X-Google-Smtp-Source: AGHT+IH9N3s8eV4QAoWcV3ZISC8T6rNpJ4leRaY7YHuJFlZ4bPXaxx7Hzh/4jfbIVAzp1tapzbe+4WLXZFpaeF/7BEk=
X-Received: by 2002:a05:6512:39c8:b0:553:2bf7:77ac with SMTP id
 2adb3069b0e04-553b6f15af6mr5016567e87.41.1750246040209; Wed, 18 Jun 2025
 04:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:27:09 +0200
X-Gm-Features: AX0GCFuhKOslIDouO5PgG3-FBiOJa3cs6VfF8AgbesblIRkK52-2f8uLA9uvwos
Message-ID: <CACRpkdb1YqS00tEeyAUTjjJ-EQQbH5wfE8QzZt-UFwQYCfNHRg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 8:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Changes in v2:
> - Add Rb tags
> - Patch #1: rephrase commit msg (Geert)
> - Patch #2: fix/require dependency on OF
> - Link to v1: https://lore.kernel.org/r/20250528-pinctrl-const-desc-v1-0-=
76fe97899945@linaro.org
>
> Description:
> ------------
> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.
>
> Dependencies/merging:
> ---------------------
> Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
> prerequisite for all further patches, including RTC patch, therefore
> probably everything should be via main pinctrl tree.

Patches applied!

Yours,
Linus Walleij
