Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F61C84A8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459372; cv=none; b=lZXegCTmSGktu+gRkPsowmlSz8edH9V64hx2Suu4NFnITs9t/v41DzO2QCuyLb/APiFQn3AkonnuRUr6+sDa/uu0a+9kEF8Bxs2oCEpYl72Mv99tmeu6fIz36tk3GtRzovjZ2xcWnhmSR+THXfVDjYsQwRSuIdAgoLEe7zk2QYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459372; c=relaxed/simple;
	bh=IXOviXBMgfCnz/aye9nkC1ZBLrrMa+zzGim+4gLGiMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqYQzgda2yVe4hBPts6hfLLuuYWjTnKyqfZGWJjPxwrDo0LQxDjMplkPDhV6H7sFD5XNaGtsNV3YLBl0BPsgjgT9nEdX3ODsgze4Sqw8ZaiTJ+A4W5bbCzKYMPDiVHiTYqMyThlJmln4kNepMx8el1paUb5bFpHD/xMGpxEfyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quh5fnUY; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quh5fnUY"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c2d427194so50239441fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743459369; x=1744064169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXOviXBMgfCnz/aye9nkC1ZBLrrMa+zzGim+4gLGiMk=;
        b=quh5fnUY7K58VvrQEGZ+1fJuOcXISccnvbOHk/mSeeCHvtTX28SFQjkKh8WLbNkB0Q
         KsrKuQrmXuDGJXozq7Lms8XeUKK1Wl13ys3Jdl0sgChoApdHzKS7WJpnNUK1IJrjJqBi
         XnDVvO7HhE7npfWs3GrL/dgDwyzG6gh75HSYeo/mPyxh9FGtnYqttxlvGmDtziR5+I2F
         mOvt5IJi9lc/DwlBUX9J8veI1esGU/duhrS+gNNrxqDuJf4dBuoorN4t/g9+IbBWeWd3
         9XNQjQyrn1bdEsGld2bJiLup9sTG2sAD58H7yT8aZ/0NCAzmxLHBUbdbpijnHfPeEwnc
         u8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743459369; x=1744064169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXOviXBMgfCnz/aye9nkC1ZBLrrMa+zzGim+4gLGiMk=;
        b=wYNXH4xaeMaguVicL5SRGvfwslylRJLE+u8l9ParwTztLzNb65YSzJqRKPYXYAsh97
         IIKdtENJnlL87GV0jBD24kIZIGWUi8Ia5Cbt097gdoudI7e29jAHfhhoZ/PBpdkIALK6
         RV4q+/tZFsYno283f3kOnVsSyRmIeNzDjSFCVtUx8612qcfeVrsujlOz7lAYluBSHRDg
         Uk3ramZA8srOcN2zN6Cj4J9asVgf+vX1NN4hDgyJtWUSxZgkPLDZWD6pQmN3QCAwAlcC
         Mwgzr4NSUDJoxn0WVYZFqDCr61AnyK9XkvdtYdRuhthC+ndeR7P9uBshDvC1C1YCU4li
         O4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVF6XXFVPdnCtB6Lzh3vm4kSxRmdl9dsknyrFBKROGHVdGpDqy/60FO0SA9wHH3mOgbr9UdDtAzux9cSRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJlQdTXoz823as92x5Sjk2HZ69ldK3ddZz98/Y9CTJkGAyMCk
	mVvaU1r+vkmpVrMIlgSpiL1MWX6BxrgQ66kh1mh793reVcFLm87b00y4h/tMiYyP7puMQxMG24w
	1f1wrPWQuc2Yp7vt+yCnkyXYxeGW1IXxkr6jh/MnCYf3AmYmUSPI=
X-Gm-Gg: ASbGncul4n0KFjYrPBXathWRCpBrEXnBNq+OqfDCiUA8o36RZDfR4tZgoHaH7FPEhQC
	Ooivjrzd0tUVAhPSuy23ngceBSNdR0ipXnWy45/G1mfElunZvdrzh1QfRrOP7so0hwdtZ1UuMJB
	3amhRHyI6r1QtEAlL5D3JCQmPXd8E13ajktA==
X-Google-Smtp-Source: AGHT+IHyXth5e+Qfkt/5ZqIw5FJ0bWF1qR6LbG7RnZGpx3CV0a1HbyPHTkxsZdwzBXEwPPKnms9hPHWQLIJqZfjg1/A=
X-Received: by 2002:a05:651c:322a:b0:30b:8f60:cdb7 with SMTP id
 38308e7fff4ca-30eecd3b729mr2004601fa.24.1743459368672; Mon, 31 Mar 2025
 15:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Apr 2025 00:15:56 +0200
X-Gm-Features: AQ5f1JqTfOSTF0vASqrPoxMPNXGLOOq74lUIcy8hrQrkhq7k7K6WPyQALUf3upY
Message-ID: <CACRpkdbgCf_1Bj95-GhC_GF54fq_UbJ5m0xcGC0gv3849kfwPg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: deprecate and track the removal of the
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> This feature is another pet-peeve of mine. It's a hack that people
> started using and now it's in all kinds of drivers. It doesn't really
> explain what it actually does, and it implements it badly.
>
> Let's deprecate it officially, add it to MAINTAINERS keywords so that it
> pops up on our radars when used again, add a task to track it and I plan
> to use the power sequencing subsystem to handle the cases where
> non-exclusive access to GPIOs is required.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some like drivers/fsi/fsi-master-aspeed.c seem to be just a bug,
are all non-regulator users bugs?

In general though:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
