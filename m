Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED728EA70
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530678; cv=none; b=qR9/LFy3tT/sxa9qrZv/NoBT9to9M2Au1W519Dgi0+Uj5rLQqKmgekGg3mLsBdLwWyNIqKZdi9UqVTyQZ5hEFlWv3IJ6CJhtBZidZp0dfHDwguYnt84/WA5VYVJ/Zy7RxgJ4r0OaBgtU0forIn/eNshTHKBzyFr9sanvmaUjvTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530678; c=relaxed/simple;
	bh=Fr4tryANRMAKvC10Gw6Bqr691NWLmKYtyncdqdalZnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cs76zuYADxrCV+1xt9uGbNt9ytGSuthSq1w4Y7gV+Q50DQ3asr3QH69QQL5dQcSEG5FsELNoGzyuOybKNwb/vHjVAjjr1UHz2Ho1b55hGeYgZO8B+BPTSJIyF3EzUQZ8L2e4fPBKS1ytQhPBX+ZstPkdKx4m1JLC0IpWgp51gP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gBSjjCtL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gBSjjCtL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b82f3767so6059083e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751530675; x=1752135475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr4tryANRMAKvC10Gw6Bqr691NWLmKYtyncdqdalZnk=;
        b=gBSjjCtLZ0AfY+4WmtgAHnMn3xujCUz4LEzDs0ZKKHvCJKsTpY1KRfopnyRSluJGVT
         qRbLfDMhDNJ1O5hIDNUqnQlEpBIiK4EIiA6mBmrB28aNo9bK1OTl77FipAWsVhS8J76Y
         xHUFdCrjw8Dp4gZdrl4wMjAe/jnlNSKxMRz99ap/bPe8vqhkkCr/EKIq4F8CZcL3bNVi
         1oD1/W0jsQNNW23C7YltUVLH9/4L//WQMrQ0C/S2T+Jkqu2jufUzbrWD9YH8d48pIPNz
         g4PCBnW9M0z6YAK6Ufeow8d9zT81oxrPktHfAwxxVSbr01D3AN5boOE+dN35H49ZRk8K
         Np1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530675; x=1752135475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr4tryANRMAKvC10Gw6Bqr691NWLmKYtyncdqdalZnk=;
        b=xKt4ybWi45GWx7bJFpXEDd+HMRQHWgDIEr21XjZsu7yYCwGhCSyVon7Dmk4H7Uev/v
         3ycz2Bru85l1Hpr5mdCVS9NG4hzu8IsPR3eLDazMgA4qzloCFS98Gij/Y1rlyHWwaOUX
         ecqrZ8NOo5EdStG5lVwvSX/bCSlpbHga+JzEzzI4sk9OQn7dRtKt5rQroTbJ5ePfk7qa
         AhS1SYsxpBgUcvc15UT7oPRyGAohzKzliZ8P1DaePgl1ksoBUfRWfc9KR8/nSYY0IX9r
         4iT7uSTSMMZaW41zcfBkeCkW1xh1pTxJlzkIlXlzL9XtJE5WljefFLlhJDRka0qOtZlL
         eQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrvN48HY77vqDbeYPFcCVDa3t4UTCSZD6zIZdXqHMYAc9950sh8lzUJTVwcc35nF+D2yE841yx7KNs34U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxat5T2ncD3CpDap+MOxwPpjZbrXq1TZ7Mow7CAo6q8IY1Rf+Z0
	myQ3rkhzRx/dNu6RB8ClzMcjWI+eLKNjV1dvw5SpkmoOKkqwH9ya/DlLsnYju3qkxEhXz3iMXjG
	cmKdXMcFfar6HtqSv83L23t85YRcPNGpwtbGmZzHxNA==
X-Gm-Gg: ASbGncvlr9aQp0ke/tyd+P+hOfWMHfaoluasang/1ubw8JLTWLfy43X5x6BGjauPpM1
	C3GSIqFhe8Lyt7ZY91/64gPmBWPdHPIVyR87+4slhhuwTevyi8X2Eoj2y0rF5AxjJloiNjjpR5O
	WnQqjgKuVmXgYOMqhxbka2BvzO2SLjEur5DA4noSkOChcVBSTiatWGkzPtP3SqyesCXoOe8fru5
	w==
X-Google-Smtp-Source: AGHT+IHE2Sj+rBPZdn50coXiNzm6TTMkLQjJMv8vYGqovDiSzp/PXFleV4dA1cphbYTssEL1h42v0mUc/icqE5r4NKc=
X-Received: by 2002:ac2:51d1:0:b0:553:d910:9340 with SMTP id
 2adb3069b0e04-5562837a5edmr2394201e87.46.1751530674493; Thu, 03 Jul 2025
 01:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org> <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
In-Reply-To: <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 10:17:43 +0200
X-Gm-Features: Ac12FXxG3UqzMErB72B4Ppo-EF4j9trbecSa-j04jTmTWEzOnHV6-j5zLK5onj4
Message-ID: <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 12:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Jul 02, 2025 at 10:45:33AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Allow pins muxed to the "gpio" function to be requested as GPIOs even i=
f
> > pinmux_ops say the controller should be strict.
>
> This is a strange commit message, shouldn't "gpio" function behave
> exactly like that - mark the pin as a GPIO?
>

They should but they don't. I should maybe rework the commit message
to say: "muxed to the function called `gpio`...". The "gpio" here is
just a name, it could as well be saying "dmitry" or "123456", the
pinctrl core doesn't interpret it in any special way. What I'm doing
here, is marking the associated struct pinfunction object as one that
should allow pinmux core to export this pin as a GPIOLIB GPIO.

Bart
