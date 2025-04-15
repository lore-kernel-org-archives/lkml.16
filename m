Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13E2853EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709582; cv=none; b=IobuM75hCswzHwk6gzN4rchTwGh39qOMHdcb0pg535S/2QPKh22zJhwqcVWj86tx3KFeb+/w3H5c+SI+D7qoDUX7RGf8hwULFYp3dDOYy0+fVRuTEJ3NgX0FokbAb98MigWhwqmthOOSVqi7M0kUh/lcxgnCGb5oYCCWj1nt/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709582; c=relaxed/simple;
	bh=TYo0D+KDl11xFC39h9/SnQkS4gevK+SUbiiPgxcbnQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skO27QaZO2v8xYbY1Su8dOLtBDZ3d3Ww3Ec0nU+QPG7ZHbtydxuitz5+znQJdGqW4Mwubfgt/FRooKHh/LpHbNCvmwEtZ0R6iF1bPkvxfKUHOHQKkRh4D+eE82TmmGFuO07niYaZ8y7ZLC1bIauNdf2Eh6R33sBLBvbPAZTdIZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6rvqVDp; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6rvqVDp"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so46227421fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744709578; x=1745314378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYo0D+KDl11xFC39h9/SnQkS4gevK+SUbiiPgxcbnQo=;
        b=B6rvqVDpegf7DGD4yfK0AKuAE1776nur2Is+Hx7iadg0V2TwzBDFoDFHlKzeLiQedQ
         yw9RGJyr3HMMZDR4ak4DHhGM3lxKRPR/1XHJNpNihQnQ1W6+ErfhBdLepRM1aor0wOJl
         Wv1Gj2a2zmObgjudCHJsZGRDCCERfxKFuJclAVLQipGGGF90wUoDLhs2itWUEdhcxMSZ
         UWAtzzUjKQ0+fwCJpp2g8n4oWWBSnEeYVk0K2LX8LCrJFcn6LxcCIB1oHvrIMaBHjqiy
         TblYr1pRAh640bbCESmeLGq+HtXS2G5DN6Hdt9dNrO0SjDfT506e8s3koM1Wf673YbPQ
         7mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709578; x=1745314378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYo0D+KDl11xFC39h9/SnQkS4gevK+SUbiiPgxcbnQo=;
        b=jdhHDrQ6Kv/6IOn6PlWN1TcZ2R9XRwAxnaIRhPc6Vjzz70Bx78Yx8Ylo3eC0BJvzF5
         cXEgLUoB1I1L8Y4MFSUX0pNBHqPCFEvmBKJ6NAtREg+ML54JvuYRqqdngEjHwo6wwSxl
         d3EfMfLKKd3FE/Qo2B+MGKNcScnBsGdgLa2/vgB/HVklSTCmKLyHvw6wVw42S7XA6ndJ
         R0AyKhq3NBiEcXUoDvbJKrxq8jDLKrG2UC7jsFrVdsYkLAtbBigGgfzQzuZqtpTIJhlH
         a1yaLwFtCf6/0kr1CHiaWFioxk5DmwrTDYyEUPp0ugbgaxf69Dga+82IoDXde7v1voIN
         0SNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9zFhq+zbYTkgzsy5ERVClvXz3AdUiVb6Tb5HZNSAoh4dCoEPGWHkCcSWel1rumRnGpSVXq21psaOYMPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZ27Xw7uKifzVwo8lj39mhDndavDUbqLU3u3DtHr/blcFv2a6
	lWINwtn/lEiKqUY4puKwBxFdCQJWiNxt8wagI0i0VdpYkRmWZXZ06pdHCua6ax8yDIgkGfkHSqj
	zuCqvnX/8obgG6qjUtyR4TdXD0T62BlBL7Eu3M6kpb5tMquBR
X-Gm-Gg: ASbGncsIC3ZUU0CAw3SuIDarfbXApUx9tL4bXF1bVzrwRtspYHMmFju+u68gy4AZVGS
	QOGFVKch89H6H5PqJ9M9kuGPzsrUY2vQ+2M8DJxYzRvVUEcSVikgM5X5+9h1UjvmSa5VaT5o7ue
	VWFqpf6sJc600u/IBs0MNH8w==
X-Google-Smtp-Source: AGHT+IGU2b9uF/Mr57XthdvMPG13t7lA8NxInFQyj+fRoSHR4tQinYzmzSuhecKB5pvA2tk7Cr+fEwEs5eWUwydjpYU=
X-Received: by 2002:a2e:b8c1:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-31049a80d31mr57193171fa.34.1744709578159; Tue, 15 Apr 2025
 02:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com> <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
 <Z-5uJxij4jmhint3@smile.fi.intel.com> <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
 <Z-6Lm_Aqe3-LS4lj@smile.fi.intel.com> <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
In-Reply-To: <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 11:32:46 +0200
X-Gm-Features: ATxdqUHT3f-K_QRzZoZnTfm9C29GKiIq3DgoOZEp9KXQm5MQ6Pw3GxYPP1ol6S8
Message-ID: <CACRpkdadk7a9QQUjEuS5w-aWpxBW1mrqZPe+qTbNZuL6t-YMPw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 2:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> I explained why I believe this change is wrong and I will allow myself
> to not accept it unless Linus is very positively in favor.

I am neutral on this unfortunately so my opinion doesn't help...
I'm simply fine either way :/

Yours,
Linus Walleij
