Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC91C27
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893081; cv=none; b=YDrjUfrgaNlin5w/abn5txnqyB8E7sMAPlE2dQ0hzKyncPTukBbh2aUY/dRA4ehFbDBp18uULnwS0nbtuIEfdS5EEpuUEVs1qe5H88WbJV3OLWWgSA2AepZj4tZC6/eLPa8pQVY3+nQQaQLylDlHg6796Z3yZvjQUBT8RqCGZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893081; c=relaxed/simple;
	bh=/028alYvfCoTc2vQjwYWmnSIHtFEfMTsk65Rr1ndCoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsWpoMRAIWCESXhG0XRIBl9SaYjdGhHCZ9Q6mQZ+XDZmLuOTXlXynrekcCPiTA8aqqqsTGvjsDMCkw1K5p2OgLAbQiLpAQ5JtVR8OtovD6QW0PumVv83zLvGMhpBIxT7n/qN94ugNlApCjnFmq7hk2LyjjZwJY2nlQXCqizV+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zo1h+Odg; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zo1h+Odg"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30beedb99c9so6048591fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744893077; x=1745497877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/028alYvfCoTc2vQjwYWmnSIHtFEfMTsk65Rr1ndCoY=;
        b=zo1h+Odgj2BjI1UvpP/fyO4DOMPHo3KHDOQkg/ojISC9lpbAssRL/c9WW/uS4hCKNz
         0L5clCFLqdQNKaxUeRXSiS/zRUBOSzcjF83jJ0ZNQQM7YTTo/GmSRo71TUPKhW7Rz+Gc
         rPR1OoASftp1gQ7QOoPVwbIAsrkgfoEbdq+g6do6bALIt+s65q/PYlEHdjcpSjnm+r7d
         7Jr/mB1tRJehjhpDrhfcvofgYviJYvdjpELb6J18hmDf3+4rzH2a5P9DZiqJpjeF9qn0
         w0N9JvcXeH8G1W/+XFa5OYAr0JFCLCb6IkTplok8bS7a4SYktS1xGl4PxwTf2/1mSJOM
         X6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893077; x=1745497877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/028alYvfCoTc2vQjwYWmnSIHtFEfMTsk65Rr1ndCoY=;
        b=EuOOcXiO3Y6zsX8T7jhE973x8Goa1VQ9hxaQa5JunJTT7vQdPnbp1lNNHnZ+kbOBQo
         7ldFf1nd8vseNsGizYlWF6zfiWuNzcA+DttAxaygXW8hsP+c3rfpqXbNYwKYbtq9jXFG
         8MDx9C12xBUYVtX720qdSKQzJs/q244vk7j13N68YDLbGKLkr8aDmZ0ylMitYWm4wok5
         Fok4fIlwUCOT7+xhfWRRLu6Otvc82KunweEWypJX+aoA88XRqum1MKxw4F18ndStxuhF
         QFqD1SwTsTIo39QBzyXV2G48yF1mxeTr9Pob8CGw+Kpj/SyXN681GweqMPaqIJ9s6xBG
         V+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWoXiOR6caOC+2VWpx0BVvYXBf3DFEH6hKeKncGYYpBeYdO6/4MVDqyAKcfxjAn23TMyr6TBHBL8NUEcug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+fhkmWFRf84PipV5eqtdL4f3XlEg5w3WAbEu/cQ/YN/1XV33
	v4739K1ceOAm9pxm9HjgYP8Mxdhd7P9M6npgg+1ngMK+VTvYPxoh2XggokJqa+JdM2LkInOyqff
	o/K+HDV8ghL2YaYxORZxUiWhnKGyN+M0rbdoJnQ==
X-Gm-Gg: ASbGncs7oailQGaoUrTUj3hPs+nNme3eHKDsmp62YKLUK5XYibjgDWQwJcu/rCO5KRr
	Xgh/tteDK5RizWrDhTYjY0NRpjyFD731ZNdrhJU7TT+mYjY/H2/+h0CmCstMAG6B5HmiVRQx3Xj
	rp0863aE3EmlMN0MNtmm8K1Yi0cV0yxt72q6u5qRbGfuHQPxPxNsTUrHk=
X-Google-Smtp-Source: AGHT+IGP1dApfllXXDsCObAfwGkahvUpSVf52HT62aS2XIJAu1bZsKQsEyFG35E5DVrCOKXX4YAtzdOvl6nhDbntla8=
X-Received: by 2002:a05:651c:2209:b0:30a:448a:467 with SMTP id
 38308e7fff4ca-3107f6cd11fmr22495631fa.21.1744893077166; Thu, 17 Apr 2025
 05:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
 <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org> <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com>
In-Reply-To: <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 14:31:05 +0200
X-Gm-Features: ATxdqUEAzNwY5e_RshB2yNn08iuk9w64m9O78zyE1xLCj5YCYSrYuzRw9BJIhYw
Message-ID: <CAMRc=Mcd=6tgk-NwqrSxes96tkV1PmxKFNwDV==XAUkLtDKj-Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter callbacks
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>
> On Mon, 2025-04-07 at 09:19 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> Let's maybe drop this one? I'll send a new version of this [1] that will =
drop
> this driver...
>
> BTW, I can already change my v2 and use .set_rv()...
>
> [1]: https://lore.kernel.org/linux-input/20250313-dev-adp5589-fw-v1-13-20=
e80d4bd4ea@analog.com/
>

Sure, as long as the new variant is used, I don't care.

Bart
