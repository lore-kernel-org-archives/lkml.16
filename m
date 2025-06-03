Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA2146A66
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952595; cv=none; b=nLpIlxuFgCmEvLrCgMiKlEmvd6oyEjd6CjQ0tG3jan1TSK/ULloa/CW7b1vinICQtE+mIl6tN8RZI9qVnmkUGKb3orqJLkGUuEUA/YqLVELzKbEvWmijWJvWShVaf7RDKv5imnDlHYY3+m9p5kc4TbaBfVmjMa28yJvB6NDEKLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952595; c=relaxed/simple;
	bh=YryBAYYqkusGLWOaZUx/ENPVrzfzihfvA3OAF4RkZyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBFQfJJUbUq/AFU55yxR2noe7fH+qogOU2+OMR7GfcJWwp3+chNtJ+wggaSFZcX5vQ96gTyGh50XQmPoLkLwGBAhqpY7TEivHaiwOeLcir/n4Ob5k1B3T99WR8PKx4ZdD1dXyJy40Vcu8srsvb4Kq3pLMrQbUzJgcA4gDCeQ+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKjE60on; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKjE60on"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70b4e497d96so53167077b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748952591; x=1749557391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=QKjE60on8C0B1uf7Wkdr4vd3wZEUNW/3x685xZ2L1Ujg5MCiUKYJVHko1af2IRHuCw
         eiZlimKJqQe561ASjCIvjujo/a63N+xe4UPdANf0Mk+eP172bgz2yHZQ5ZKgItNkps0d
         8bjOdPteDQF4uyTGMcvppPAeOERxrH+gdS1gvmyPh9phN9LCKcbXM7dMEqGStpPMaWd6
         fPzTKrePbM7X2xzNuiOxKfGnErudddrnTJoRo6luOt5ona3WXNTPktOj4HgeFNRsCyB7
         vZCC9fQycUzJqkIMqqatqK6CtGCOD28cecO9XgWuaZypgtdmUSX+VMK9NHfOtxU0YoQU
         xr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952591; x=1749557391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=ffLegEYNVb9DJccsHq1Jzeo8rIbsyz+pc5iHDuUiHEO4mQQeMqBOg5vNiexXaT8dZi
         juRXsiQLFWC4AvvdeNOU4gXG+K1wuyPkhN4MgkWpP6laujSeUol/NuGdqQISfFsSvNU2
         S+mUhEU696dbHZ40+yAaYfKI55l4wR0b97/2rlaKyJm83m9eABQMKt8jbBrlhhxiZp6W
         1CIMzDW0SL+J2HG2oMJjh9OMuux1P55U96K/qIfiNngLGa6ltG7xJQRI4prxXvZj8ncq
         THcmqGnvwVGORW6WyAv8DDeCGwchOKGuEp24LS/4O4MqMkVAv/1Z9NOZe0ynNh7gPGgs
         1oRA==
X-Forwarded-Encrypted: i=1; AJvYcCVnLnxPrh8JodZomLyE0vR9V0012SDVAUfwZ7L7hONQdNFcuolW3GN/fxd8aT5/lgPkumwvayVxPLF1Xwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lMIeCPbQuncZawHOiHqbgZpK6Vu4b2b3pE6NDpn/RcrEOJpC
	j90/uZrk5R4WCoSLTnKdWH4sRzwFEP1RgeT07SJYH7Yrj7QrMtq9SkZsysakKCs8PywFitpgtbR
	40IkV/3VDetBegH3f5ANW5YBr60w7aCiG+T2X5Lclug==
X-Gm-Gg: ASbGncv46k6I42TjOzKAajsWviS/cJbcSxzXjDKpp9VJM25rKbkcPnhqdFr4khKyjR0
	vvH7rXtLReutwY0UFOZNS0P+fVw8B1eYb95TLLvW0L0Ov9EtVSvcxQkdj11G56wQHHIgGQygi9K
	3r7O7biBTNeXTcft6GLZTkOnX1b0fne3/mGMAvkKBEs/s=
X-Google-Smtp-Source: AGHT+IEBu6kRLR+QihKU16+LErg47sPGw3yJ9MbHWp+STBlEAPmBRdPA2kKSotqf4d+nhihTdrEqxcQCav79Y/SEImk=
X-Received: by 2002:a05:690c:6888:b0:70e:923:2173 with SMTP id
 00721157ae682-71097c2a76fmr158597817b3.5.1748952591135; Tue, 03 Jun 2025
 05:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com>
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:09:14 +0200
X-Gm-Features: AX0GCFuMy0nMLljWiQ8PZlmv65MxrymGJ77Eb8A4CZbrmvODDSNF3Eq2H4oVdUw
Message-ID: <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 15:19, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under review,
> "pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
> this series is not going to work.
>
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
> powered on, the driver will attach to it.
>
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
>
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> v4:
> - dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
> - imx_rproc.c updated to use the generic power domains instead of the
>   SCU API call, which depends on Ulf's patch series.
>
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
>
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
>
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
>  include/linux/pm_domain.h      |  6 ++++++
>  3 files changed, 59 insertions(+), 7 deletions(-)
>

We are awaiting further feedback on the other series [1]. As you have
tested it, may I add your tested-by tag for it? Or perhaps if you can
send a reply to the cover-letter for it?

Anyway, for $subject series:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
