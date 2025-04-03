Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9121AC891
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662107; cv=none; b=kECCU+eyhRD+sgemAeW1SlH2bxHBvq0RIBb9JBiV/dVnj1ZzSEaq3X9L9zsYBQbCU55DyyH9U2EMencjvD6ASNz7+F8QnCcSKCzMSH+xImdIoLqOJ7djPgojO0dYRYeHDUToyNhov8tr4UPeXELoUu8XSTU3P5XYvngbf0sC/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662107; c=relaxed/simple;
	bh=1JsCMyMtHNZEI+5vuESB4ZV9tP0Yf/T5eFYH1f3W3iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrzAvXZZ2lhDUhBZ+Lz7qfbuMAKE5vixX6+OB6t1CdUWR3454C1YrpIHqN0S1IP80zqvZ6TnI8sLBYZxEXonYQ73KKlkOIXO57jaj4ocy0jF0ihPGLEZbJlPhPEQzmo1EPaWUjX+7mc+8Fi4aiWyJluz/X5a6aTvIS7X6dNeM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n2xxLicc; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n2xxLicc"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bc464dso4892121fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 23:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743662103; x=1744266903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=;
        b=n2xxLiccuG8vsJ5RIDzmY5zehOua4Gobkrpe/P4f6ij0V7hQglsX1Eucwu+2udMBtK
         ewVERc5J1qlJOevE6gGfmdEcvFNR5KThK1dVZJcV/yR6vu9FVrvlnDWWKjcnTqmWxot0
         B/nMo56A5UiOeY00bjKachIgRw0UZuhqzhOV6TbqVLEygbcZrSsrziGPfw46tNdtSLZ1
         J9a965UZS7mpTARf3+9zCuc/XsAF1xyYsgpcxE5dRG4lOl/EFA0/98ODiaUQGDFIG3dJ
         9cjAdTnb+xaG3O9P3aHLZLt88JXO8sbW7yUTuyBaAgeisL3nOtDmb0dUpPbbX2tb7HBP
         VNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743662103; x=1744266903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=;
        b=jfcQvwB0bhLmwY+GSjDoeyKcZQ1CumvgrRgVzLv3tYQ9kdUHF/WqYdc2sJOhpBIwZl
         Wf/emcQnuaw+CnNRn4Fjz8i6xRMrAzUGrWnkqbn/TUE9f/3QwILFNsK1PnFW4nVwi7B+
         nmwKTawO4j6iiPkZ5S2XUGZsoiVITEVSNJmEN7WGIxkZmhg+iIPhxTE7DToDO/LeB9dN
         ptdrzezP9LWy6TQYE7EUy357HijVLEQNKHcvJe5LC9WdxBNcI2yJ93uZxD8tUADlB/vF
         l6bvHch+t4lLIvwAIW1CmRyd+yRdIOb3Z+bvczzRZfgxpDggCCpD7ADsmRdpU+j8EOOq
         vDkA==
X-Forwarded-Encrypted: i=1; AJvYcCVO81BX7fYKrJ4IZ1KlMt4DajIipU0Tv1+2qgFvW8miysI8fC03QBj8WHduVibmsCsg41GgClQ+p8kWKUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwImuGKyDUngOSOCeBETgDfrxAIm5zs8q4hueECB6RNgLrQM6mU
	589bePNhwhLRhprDgdEBU3vsghjosthCZCsN4kaK8XtK527AByl9bzrVPJeDgiVJeKxnc603h78
	jjwuqbbmoYELW+aF+wnP3f96UGQJWC8LbllELEw==
X-Gm-Gg: ASbGnctgNpfdyFclFi1xPAdZfriDP+gqwcS2ZPNCNW7rUSnvE5wN78tNZQ5gAh7mAi7
	rMpMXBuj1I3jhJIhVvMuhctnUd+hdAaQTsnjvhNOOsQWAbWPBIGpv6hzDBzKA8UVlGdOghKb9b1
	0wfcjIklxC9DbOt2nM/qYBDCdwEyW45H/3rlIik4RjBAxqHCY6q901SOyVfqXgtISgCug=
X-Google-Smtp-Source: AGHT+IEPn2huBHKsqDAGWpve5sAjpBNBnpMsrd2sYo/j2hYHK0dJ1WibZs+8/GvHbHlhvGsJDnxEjzhVpbqKnYaGX7E=
X-Received: by 2002:a05:651c:144b:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30ef90cd023mr19356701fa.2.1743662103234; Wed, 02 Apr 2025
 23:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 08:34:52 +0200
X-Gm-Features: AQ5f1Jo8XE_rqZUxS52BXanujb5HYu0Iq_OMLm_FELFmKt0f3v36UDRWRst9x2c
Message-ID: <CAMRc=Mc2DKnc1AM2WSApZtwOKCFGNZ9WF6LzzkECaV91R5w-iQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
To: Mubin Sayyed <mubin.sayyed@amd.com>
Cc: dlemoal@kernel.org, cassel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linus.walleij@linaro.org, michal.simek@amd.com, 
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org, 
	radhey.shyam.pandey@amd.com, linux-ide@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 8:09=E2=80=AFAM Mubin Sayyed <mubin.sayyed@amd.com> =
wrote:
>
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
>
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
>
