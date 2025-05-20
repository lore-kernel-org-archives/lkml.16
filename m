Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18121CFFA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777233; cv=none; b=ZNJwfdxygngMrOUdLxlKjfkSF1gq8Hn3uOhYMoxx7zExx7w3kEmjM1UOOFdkg40SEWSUQ0y2jxfvUWJpxpkJZbt5da8NfJV82q5GITrK8tf0cBhB+i4nHavoFXCgKFGDuH5DAQ+ZHyt1tAOAyezdx+Lhzh2X/n5ZUKZBBngCgPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777233; c=relaxed/simple;
	bh=oCgewP2Dk7ae9CV7K8C4fa2fNf4DN1qFq9tYjptuES0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFNARNTcKI+3qzbykXlcSLxAaLNxyE1M3X5CXmWSqlGBjaSYu8KB3jvZjYeGeuo+fkfYTyGZ8HOq9YhYp36iANV5oEV3KKzvDFYOcXy4lMz0arwYAHTbOQ1hZtTBd2vyBfZN4RuvZNPl1Im/M3zyFV1MVPxaAUKxr+O7C9rT/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phq8wHBt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phq8wHBt"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549b116321aso7132506e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777230; x=1748382030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgewP2Dk7ae9CV7K8C4fa2fNf4DN1qFq9tYjptuES0=;
        b=phq8wHBtbVbFPvBY1LhFPxhhKVA6oWWC5DSQxDRj2BggOobkM1tjMRw9zG7Y5c6atp
         i49GjT9q1bCdgYaykzCrr7j/FT5a/visRdWoneRbkWHwlLERxyPenna/aD6gqpH9Z3J1
         3BSQy7Bh2KoPvU0GXEajgxeMoZoWB2bA1oztrogWgN96Ob8dtXieM8B61TWzqqYqGyWS
         Dpoc1A2Cd3UXIHyEhlCrXbpZ5fGsRc2OveqhwMdEVR+3rltaI0ZDX43QJJmoh9mXShgo
         ax7tdkvksH3EBjom0njHL1lQbho2oO3njY0+WkDtRmRWAed+K3qS2t2Vz4yykOpFoH0n
         IxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777230; x=1748382030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgewP2Dk7ae9CV7K8C4fa2fNf4DN1qFq9tYjptuES0=;
        b=QA4AfN38V2l6EAs5AFe7YQRNYHh23iLF26JcIJLxbNschXToIBSawp7rcpkSiMEnY0
         faZmoZothuzP4wihHdBWYUonOSDVtY5LICvPhhwkyLfFbMXBGxHqS1ptMG8l+oHKAtJj
         nSXdCDWIhSebcjJQy9mlCf8t8LDSajEzLqAK6mtBeh5okytsY3SIqQcrFIo9VJFHOjOf
         3ayqfSyHoVc7UHBH/MVqz4EXk6LImBn91itfuhpo9hDG6Bh25s4nbMuLSlCfBK7uZPaW
         NS9Ab86pbx7n57xfngRSbYO5qRJ9xgIPtcaKKXqrMZY7F+Me4o1yHtuEv2albrBMSSbz
         vCRw==
X-Forwarded-Encrypted: i=1; AJvYcCX5c4UafN7l5VimIcx8gDC4i9sQnmwixpg5YpG5sIQEKuDOUrFZMrsg1EKBCqJ1DTwP2RII6fRDv+PDlxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsD6bCX3azr6Jl0JWzvFEI6lehkI1aOLllvkoO4UV/WfMf9tRT
	WTQwgPM54bXWjuy0wEVpKxeIhCWJz2gSjnnv42LV1G4hokOJQORfoVC1Y+Bfwut2XBSqYxGjNt1
	uMohvJ8GTbvK1TfKSd+YwLLFf+mmWpl2zLGr8bqJqmQ==
X-Gm-Gg: ASbGncvRDwwbsPC9ykYfxfFatLDK+U1EUOmvkRfUxJIXR0hUGnI2TzVwvxTc3h8FwGU
	Hele9hMZWeFAcNOULLfKL3HKuocDJGzAEFwzH4DITBl1P+/7FCSANiotnk9qyxyXQBKfR+o6l56
	qL40rIGSpm5syy0SuHV3/RQoRBmgLVwGmlM4V5n+8h+aE=
X-Google-Smtp-Source: AGHT+IHzVYJxuTgrgs6K8x7YKkYpNRse35+6uNr28ZJ3LfuVJa1uRT/W2mPAkpXkEEI+sX0vS8ApdkMNSAaanvKv3vA=
X-Received: by 2002:a05:6512:6805:b0:54f:bf00:6f38 with SMTP id
 2adb3069b0e04-550e99045efmr4388422e87.45.1747777230153; Tue, 20 May 2025
 14:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:40:19 +0200
X-Gm-Features: AX0GCFuUSwW_4O9obfFKQvmdKYpuQp-SLx-d_4JegFT_41aqCgC4BS-UTD5YyXo
Message-ID: <CACRpkdbmHjan9ifg_hs_2qbjBS=LCKenMbvnbCDX7zOsM0TvQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: freescale: Depend imx-scu driver on OF
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Esben Haabendal <esben@geanix.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:13=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> Although the driver itself does not depend on OF itself, it selects
> PINCTRL_IMX which depends on OF. So only select PINCTRL_IMX if OF is
> already selected to ensure dependencies are met.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Both patches applied.

Yours,
Linus Walleij
