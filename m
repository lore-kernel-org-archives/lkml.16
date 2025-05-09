Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F1290DAD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794727; cv=none; b=U33yO+B5VzJiWYOng+6Q9PIVTht80XrV5f4VWurxUIl+UYHsYx3G8yo0cM7L1JpUZJNw+IDYfrwlspVJZB5GEoJcfOPTtM7UPVybnqrUvkuBhntMpTneJhHqkAqc+xg6BU6c0hNCDzQg9TmgPSiQozH4Jq3iU62QPaxOpQ9FsMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794727; c=relaxed/simple;
	bh=8NSBwkR/zU9DvjRNqknsrKz0iNJhVJvXcYxWAeswOCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWIP6KpnLrxj23eGfcqwytSjdervVycCMSrfPdIXwvQ/w5uAOPsYm4V1x1pFWH2lFfgUbjU7O7EbcM66vY5pnvqdrwtPuyPichnRNfNgN1p7xdfLA/9lV15XI4PXvoy7uNzJcfD1NzSfXoaX5xLIlqPhfknUA1G++Ku0nG1CCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hsrITmlC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hsrITmlC"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70a2a42eb3eso23206927b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746794725; x=1747399525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=hsrITmlCJMITj5ZIaEQpj5r0jUDmVlA8TzFbrwYnQWgTe3obJCta8s730myIjkNMg9
         0kBeJ3byULVQUZfaj27cgcd0A0L0PmaDUqIeBLEPNGgkTusPzHfuayrzVHYHot37n3QS
         9akdjGEWqho7sby3hmKk3nUPRptY2TuMhPFS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794725; x=1747399525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=I+btYJVrbGsJnjrA7TYMibZn7iZKPS0GTg5y7E3GklfnC0jk0xy1uEfI/Rll1349pk
         XgcB512y6SRp2OsDqGdq1gL0EU5HUJvNu5giGwdAtdEoMTbGYSj6M1hPhFuSZxHtwtm2
         GqkbAiVTYxmYDnv56aAn2qJMXiURq3r7Cfnyxwj+ok6714DIDeIrCjDLeqxxj/v2PFOI
         WMEIWdABRNGyb6ykQkOCPNQIlsszSv/CZnEE4cevWPnKW/bw0IwkrvIjaekTVhZyO9rf
         K5oMJtETT6W+VKKTvDTI4Twvr4mzOJZXVfgAzgB+XaO2XwStIMPk3wHv1SVjRFn2zpn4
         dSMQ==
X-Gm-Message-State: AOJu0YyZCbmQE/m3CVSa9uTMzgbX6pbLqMZVGBSVj7ketLyQ1AbPMLen
	XdDFMO9NCP2gsh8aSlDCIu5v7M0V8BbhS2r7k6sHrvlceP/y7BtQmQL7W+Ca6FAZsdSeuXXoLKy
	mLxu2RtHj2xELfLP8GSU4M6zbG3CyfXSRUXOp/g==
X-Gm-Gg: ASbGnctWop02dXkJUZIejTBks0wo6L0sK5trHB36RBdIuoOek/gJSP90TBdh3a9OPDu
	q/CWR1SXztuawiHBr5SzYqwy40FHNQozYHZoYm1VlCsf5mJiBE8V184N6+KC3uwFLQ6bfR1BJW8
	nE8zJ7gqCHv+l0TWIsCw==
X-Google-Smtp-Source: AGHT+IE+ZAuLmkz1arQbVX0YZvJVLhQ7nxcEKZcFN7pYHPM6BXlBBzNkNPkqSg4yVC9lFIj68cGkI7vjB1r4wxAuYWQ=
X-Received: by 2002:a05:690c:2506:b0:708:11c7:d200 with SMTP id
 00721157ae682-70a3f9e3f61mr40837627b3.4.1746794724940; Fri, 09 May 2025
 05:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk> <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
 <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
In-Reply-To: <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 14:45:14 +0200
X-Gm-Features: AX0GCFsMhC-bZIQbroR-iMbqMxImzouNrdaQ9uRaQFjqPmIkXBI_CX0YvsjmbY0
Message-ID: <CABGWkvq+FQZ2A9vpv2XfDmbHgpNOSnZhCMdkKaeqhCcvdjzdAg@mail.gmail.com>
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock driver
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:00=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, May 09, 2025 at 10:34:38AM +0200, Dario Binacchi wrote:
>
> > From the log I see that you are testing a board with i.MX8MP, but it's
> > probing the anatop for i.MX8MM.
> > Is it possible that you have the CONFIG_CLK_IMX8MM option enabled?
>
> This is an arm64 defconfig so whatever that has set, including the
> above.  Note that arm64 is supposed to be single kernel build for all
> platforms so we shouldn't explode due to config options for other
> platforms.

Ok. I'll fix it asap.

Thanks and regards,
Dario

>
> Current -next defconfig:
>
>    https://builds.sirena.org.uk/f48887a98b78880b7711aca311fbbbcaad6c4e3b/=
arm64/defconfig/config
>
> > I have personally tested the patches on i.MX8MN and i.MX8MP
> > architectures, with only
> > CONFIG_CLK_IMX8MN and CONFIG_CLK_IMX8MP enabled respectively, and I
> > didn't encounter any issues.
>
> Given it's wide use for CI the defconfig really needs covering, any
> random combination of options that can be set ought to work though.



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
