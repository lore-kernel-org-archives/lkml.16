Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC6B213E66
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157341; cv=none; b=KdyNw/45uHmzM795E8NpyyilJ34yRbg8o04Pjbj5ZqazLI6wk4Snmo8X0kdcNpEnxroXPpPxY1ISoefI6SIKZJ/V9+vqL6tbpEIvKpevHCCC/81k4vBc2jbV3VCYYqjLW6HG9qAJGzBua8G5X66404s96bOMBluV4tT1Z5A1rIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157341; c=relaxed/simple;
	bh=1EvdB14G9dZ9V0d+gy+JSmSb+iAYQGCNgOKmRsIyMfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QA1pVsBBkYC9I2hahvgKc1fQJbR1YYlei5cHD62ALlYFFc9IjbPYumkr6iSePAE10eCSf7DZWK1xOrWUMIX0vEhhEPnGl0klJl64Wr5F4GakMzMcmEZC7B5zFy/dcLq4bCvZHCs1QRpNb9V465BGumqC3ybAlZ/qOOdiQYyEk9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIXIVEL3; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIXIVEL3"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e60b75f8723so1429059276.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743157339; x=1743762139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QWcdknvSCYeb4zRihPe/MxApMaJfE7/coMmdm58k8mE=;
        b=VIXIVEL3iR1pses4SVICAvRQoYKm3GrKW/gGsNf7jjGVM7GkO2q1XQb53KBo/m4Obz
         r8n5PEm5q9hJ83FrOpNfKyY+W1hwzleT79Dpdl+03WqmAQOrNoUzECTDjRTWhNafhPZ8
         N30bZ1g04ofeeTnP2keMVD6gndXLWONS1PUE1mYvzOzHDQ5QZhx0kCeJxOfYrv+5Rl3g
         2q+lXnf+6VsEvLUd1enBmPba+C0VZrxYcxWKm459zsjJeVnmAwko8a1oMPV/dK7aiMWn
         pazuDogB6I0SkpeuVmXImAI8SNzvjBm8QtiyOEnOnDQ4LxsX1hjYkQKURJi7IeYH4ECr
         hY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157339; x=1743762139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWcdknvSCYeb4zRihPe/MxApMaJfE7/coMmdm58k8mE=;
        b=TUCpuLeU96dc7w1dtdU8/h/9ftmh/0khJlJjUQLmxvEOx+oRSzs8Z4ZNTmuurrnivt
         AtWRnROeeVvTCLQ6MZFHoT6D682bdRzCrrwW+idOEud67Y7CnbFesn9TQoU0UnrdEOfp
         7kLf8ldVc5yyHpwTbllchruO5vHnyVBS7Tx/h9KYo+U8ZnlgANcX++ls+p+IJ1dZ91FQ
         5ELUc73D3oW4O83XuLbJPHUTTHslrRuojr8Y9Xa36HiY/SaxQMLpM+3RDQZ08XOx2xkY
         zFQPkihOoCqkLPdCNkSF78Y+9Hhtigf7/ZUMN3C4+Am4RWQA17umH0N1CWUySw59jxWi
         T8VA==
X-Forwarded-Encrypted: i=1; AJvYcCVhCvJx0HKeXIVWewNH5V+KC4+ZC561WwwZL9hj6FG57+6j6Bz8tRl+CU6GvJT797Yza0KjLSnXsZTxurg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfmHgjXhaA6vkTiJh5IB8OELFxIuruanA98JFzmOgzLNVxMoN
	SFG9G3Mg/q5yK29X+5uB2aImpWh/Y8IumRYwOe612KzOQMgrdzWdFelVzDdnvSuS758dHlb53ZH
	FdyHd+CSCrWJvM6BQfeRWFYmBCSDD8OQqUFV/XA==
X-Gm-Gg: ASbGncv3Q9ySHwdOJEA1y+DRgFfZqUhzzRIwBLlXCPm6CVcch28jFM/ntbcHZn+TxOq
	CqNIONyBzN8VCpB5mFLuOMhRXIvXuQ23DASiZrzwZu5HzT2ULYVmfyW212+euqAGNbC2SGvmHsc
	qaFu3wKdx+uFkGX7zcLnQvwBgY1nQ=
X-Google-Smtp-Source: AGHT+IF+THyscD1I70Q1OyNT7wZ9pN5Y8ZMr40r0UC0Ra/TZGyedSTAVl7xxm7Ivr+fxGPflDlGfnf1oayC1W3EzhlY=
X-Received: by 2002:a05:690c:9b08:b0:6fe:bf9d:8cca with SMTP id
 00721157ae682-70224c5ae42mr93037477b3.0.1743157338910; Fri, 28 Mar 2025
 03:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-5-ulf.hansson@linaro.org> <PH7PR16MB61960D396B3E5B61571F7F82E5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
In-Reply-To: <PH7PR16MB61960D396B3E5B61571F7F82E5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 28 Mar 2025 11:21:42 +0100
X-Gm-Features: AQ5f1Job6rz184fUICiPRY1Ma-qfbAVYw2uwJkaEoJZeRzZpT85dOgBmc4R44BA
Message-ID: <CAPDyKFreJu8jZXoBJ2J1Mgj+OOAJX5rjzX0D4ZfbTj_uVrPKPw@mail.gmail.com>
Subject: Re: [PATCH 4/5] mmc: core: Add support for graceful host removal for eMMC
To: Avri Altman <Avri.Altman@sandisk.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 09:13, Avri Altman <Avri.Altman@sandisk.com> wrote:
>
> > +/*
> > + * Host is being removed. Free up the current card and do a graceful power-
> > off.
> > + */
> > +static void mmc_remove(struct mmc_host *host) {
> > +     get_device(&host->card->dev);
> > +     mmc_remove_card(host->card);
> > +
> > +     _mmc_suspend(host, MMC_POWEROFF_UNBIND);
> Couldn't find how _mmc_suspend handles this new power off flag?

Right. You need to look closer at mmc_may_poweroff_notify() as it
should return false if MMC_POWEROFF_UNBIND, unless
MMC_CAP2_FULL_PWR_CYCLE.

[...]

Kind regards
Uffe
