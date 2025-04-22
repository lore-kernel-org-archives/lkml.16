Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C6C28FFE2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336692; cv=none; b=tSDFjQNTTr5nOd/Z/g3OAEmp4igTzaj4Cq4WyVyyfUWj2jEIkfdo3x7zcJ5Jbe+/1Wz3GMILfagr/Jfj0L9yLIc/4AAZtrd3KilGx8rec1c+x5wgaoG0PyZU812E77/KoKpjp5SsIjEZ9whSYixz4MqygFuuRWnOdn+rVkBQStM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336692; c=relaxed/simple;
	bh=+wQ3V/SBCGFw935WChI1t2sSplf3aKsIu1jNFc4fRo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKQpfGULb8UMtn7H5+UmDoLhtjJGuFhE+mO7j5K56c19W9Z1k3Tyf5r34YIOpptu3haq/dDp7bTg5nxvcMgMy0kp/y351+lzZkIph3sIq83KFon+AW3uZS031KWyII5+2SUBGz335Obulf/XK5M75/uMcJ0WYyoU6zTBcRwYUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDh1dwil; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDh1dwil"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e6dea30465aso4242704276.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336690; x=1745941490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=;
        b=fDh1dwilMJz6e4VapA9Qb9vWeR34aN+w3C8r/bn7r7F5+hGkdJrLPq1qOSB6U6e/UW
         zvxH1mIpaluAoo9+2HbK/b9Qx6owm3Re99r4/28ahWsEiwH309+CMbQT3i+yt9JDa80R
         DO3mKvqhdGC+wHfMQwQeImktyKSN4KBdOC+yfs9v/1ITrI3eTMy2t2Q2HWAmE9pMKJAh
         dNQk70USQ4x1rEn2Za8KUbu+YszrRhOi9PLHrHv03/ebdgt4t4Q4BfHVAplD6PGMO/Wp
         ZAzgBtJlWnhW5H8PJnsSQr8F5HSwaYoH7Fb8F2MiLaPLpkQ8SeKjBc9WJEwpeU1GuapR
         MD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336690; x=1745941490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=;
        b=c9DRv58pMGx1JM7DE1cC19Q8+G7YXB14KMe5Joop7Beqe9kPMD3Z1DHP0e53ilRGXY
         K4GO5BeIEfEeUPInFtMo+ziOydH1MeTQ14A4DtRKmTXyEShi4uEY8L5NrxBwtvYnWXEa
         Yz5mUeqUPMqnUbCLpgDsCkCWzd18gMxe+gp5insyyK0w8gTPBudevEfk2oR5fsm19D9x
         6bZjsjCMjFlcBa08v0OfkLN2wfYjLw/sC/xz/dTwvuu/w7rg/HT1Lk8JtpfHLuLMtRMd
         cWWPwsp84pBcjoMMSwQTEmRBkUXcf3270EJO4E+O1oEn2TvQKu8AyBNDYcq0NrGl8YK1
         9QVw==
X-Forwarded-Encrypted: i=1; AJvYcCWjOzeIAYms5iJ8f+WGJoxXqAr5eRBEu5Rhb1lEuGA1YNPsb39L6/XiAcSRbjAnSdThG3LsdL+Xaw8tV24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ui5xP14xvGBsxPsT5zBNYgldshaur46OrEYgqyE4HIxLpFz+
	f9vK1S82e6eeMxWye+d1FXEN0bxBtRumy7pXcl78eyw30W8Coe2ksZj7w8bVz4IK275PQEEsbhe
	AxqCIHZw9aZsE9HxMX2TvRY3coEksELOtTH3IHA==
X-Gm-Gg: ASbGnct0ohiIftP7v97ck4r/lUNRag8DbVdy/1jmUcEcdky3j1U9gcDv4vvL2kX/703
	YUfCre/IXG6c522FeGWCWjbDt1g8/9QcMzeLLA2cIFPJQyvvfYS7eY0pUHVmzouo2wSBOwLpccX
	M2AWd1oQGc0gzUQ54VG5EbTc0=
X-Google-Smtp-Source: AGHT+IEHc2hJ4Cqc2TLQJORRZ7HSilNpRQ02MgV9r96MtzM1W0JpjGC9ejSda0flvQWdusSoW6gwajxpxPi/3e7ThWA=
X-Received: by 2002:a05:690c:6c0c:b0:6fe:b88e:4d9b with SMTP id
 00721157ae682-706ccdf5d40mr253126207b3.27.1745336689950; Tue, 22 Apr 2025
 08:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409075550.3413032-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250409075550.3413032-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:14 +0200
X-Gm-Features: ATxdqUFqgpqORv1AG7qmoEJZ9cXTo2y6ysVsgng0e-udR6FloO2w-1bXRpDq70A
Message-ID: <CAPDyKFrNUp93Ouw8MEUNMqgTuYCszT5t6jbJZdRsM2_Ed_peDA@mail.gmail.com>
Subject: Re: [PATCH 0/6] enhance the tuning process reliability for i.MX uSDHC controller
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 09:54, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This patch series enhances the tuning process reliability for the i.MX
> uSDHC controller by addressing several hardware-specific requirements and
> improving alignment with the i.MX Reference Manual recommendations.
>
> Haibo Chen (4):
>   mmc: sdhci-esdhc-imx: explicitly reset tuning circuit via RSTT bit
>   mmc: sdhci-esdhc-imx: reset async FIFO before sending manual tuning
>     command
>   mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning
>   mmc: sdhci-esdhc-imx: widen auto-tuning window for manual tuning
>
> Luke Wang (2):
>   mmc: sdhci-esdhc-imx: verify tuning control status after configuration
>   mmc: sdhci-esdhc-imx: switch standard tuning to manual tuning
> ---
> This series depends on:
> [PATCH v2] mmc: host: sdhci-esdhc-imx: save tuning value for the card which keep power in suspend
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 86 +++++++++++++++++++++++++-----
>  1 file changed, 74 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>

Applied for next, thanks!

Kind regards
Uffe
