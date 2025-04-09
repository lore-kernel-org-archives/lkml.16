Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F32270EBF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218249; cv=none; b=OjTt/mDVmRa0a0lkSTka3giDOESTS2n/lhDoHGRnFhPDL4RJXDq/SHhulq7IRwdBR7xW+Yr7YjmmlPNkQ6kzywoJBb5lTJEi1MZC3o9VIt2aIPuORSd3DteIVnZDUhycy19iu7GVY/ThK3Qt3hrXzWAvcVRqfGc30wZH9Ez6L3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218249; c=relaxed/simple;
	bh=kN9JnMbt7VVDHzh+ztLsT/qKogWwPPdRuxWtpEOFJ8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE8CBpQaHk+CPOWeFP5ZF3705z5Nq/sW056mlhdpYwi9RAyJuPzy1hWcy537Jn5MI9SIRQQ4OEnhpjCs/biCoYFqyBU/iLcfCLfUiufGDmGf+oouy3g1WafUIDLhcI1tz/xxHancKZc4G/JTHMzcfG2cvWSFr7HV4rb/kwgqkaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0RdhAPNR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0RdhAPNR"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso8375914e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744218245; x=1744823045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqlYSrcDfr+Bx9X1PTIHEgRTGk5ECdZWTlRh/r4BB3A=;
        b=0RdhAPNRPCyuj3QK09n009+tJ/zUw5f4SNULbYFC6i1aLF9zLwSB9NwrPB/mWML4TL
         yKMyv/wgPWGvTOIQBzZEB8RemLtinYZgnz3+QvgIEtHmVyb0wC288nC/uXafxBxa8jYN
         1W5qx0YFVeBo0BVpYMAYE5BQ8Xv081xpwjMEXZNyHlp1SCmakk5sWTv4UWf6sS/N6Wy3
         VcYwXmrFyyBFYtdFv6H3KOGY0YFqK2SycbVztd3AAt0UtPo6id42jIw/2WPcfRVPsWua
         Szg4DHzilxkqjwasZ9sMDPh6SmEIjKhQXMP6X/YkAny4T3SJIrQ+XfLjJHIwWmfuoVU7
         ExDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218245; x=1744823045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqlYSrcDfr+Bx9X1PTIHEgRTGk5ECdZWTlRh/r4BB3A=;
        b=M4r6gUJC3YMLztPAaxJH4UyvwZeVkF8/zDexlc7AMnXULW7fcGV68ckpzRCQrM7cd8
         xytYRTqVqXR/yPXBxA8whf0N4iQ9OiXJ9nI9eD3ZXWlz1sn9du8PmN7RnEwmPqfNfaJd
         o5MietjL1bptAmwqcVGuwcLlS3Bj5tu8HlElKectt1Wcu+AUmvz2GrB50QOCsv4qPBep
         sR/0TdZ3WNU8kciiAr7V9Qkx6ZCUs5Tu3/twK0FQmBOl6PXUFuKMNm5yDxHZcDfJWLnC
         3SKTHYJk7lTqYGiZ/5nhOrHNfXNOma1NaFUyfo7stf2fnS1TYYwxfVEJQzJmptfNwtVn
         BCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZaqHqULWFxY1t8Z1JbLngP21mlJQzghVQpNFN53UB9MtQ+7O7KotwKz1dyqxhvY0ETgbmROiNJZk+rUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQX3Z2Ozf46cgfl+tsmqLb0gU6sMWet4uNpdvppsg0mMoqv0M
	4b7OGbtjmaUIACR/pjVs9N2zrWDQZ4a9k3MZXdFvfsaKci1k/8mjIYYxq9zSdTL63sRQ8new2mK
	/dJqv3f0vbXG04ETl6VpuCb0T4cz3ZEszkxPVlIiF7zgux9n1
X-Gm-Gg: ASbGncuCMppTNUZpOptleUCTW5HIyCWwuFo+RlnjcmqL6gJaOOYAqNnPVP3qo16ci3+
	6+he8KIdm1R7eZA/UGVgS9CAuawLTkTLQSkszi3J+cKCXJMCGT2DX6VXJnmWKzVc/wVwd6ggEAD
	8HJuoBQziIKzaluv85gfep+vOAeTwFQMksSvVFyXyKzH3sHFwlT/dp/A==
X-Google-Smtp-Source: AGHT+IG0sdf40rd8ltxoAmZ7Hkro96U10DsVSvaXZNOHgXQ0QuK1RAiemvn92IF5EB5HFu9m8RLiVFJQ922J9YjgaUU=
X-Received: by 2002:a05:6512:2397:b0:549:6f5a:27b1 with SMTP id
 2adb3069b0e04-54c43723172mr981927e87.30.1744218245324; Wed, 09 Apr 2025
 10:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
 <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org> <Z_aFBfjb17JxOwyk@black.fi.intel.com>
In-Reply-To: <Z_aFBfjb17JxOwyk@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 19:03:53 +0200
X-Gm-Features: ATxdqUEFfYRnPGi35HjFj1Fnc_q7q55qd7QfatcmT7NN48s4l6l_VroqVjqKAtU
Message-ID: <CAMRc=MdUxWa05uWpf2r7h-_csBciZD6pp4tHvaxsXoWFQ4Bi0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: provide gpiod_is_equal()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 07, 2025 at 09:08:14AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There are users in the kernel that directly compare raw GPIO descriptor
> > pointers in order to determine whether they refer to the same physical
> > GPIO pin. This accidentally works like this but is not guaranteed by an=
y
> > API contract. Let's provide a comparator function that hides the actual
> > logic.
>
> ...
>
> > +bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
> > +{
> > +     return desc =3D=3D other;
>
> I think it's better to have the one checked against NULL. That's how
> comparators make more sense, see, for example, 1b1bb7b29b10 ("drivers:
> base: Don't match devices with NULL of_node/fwnode/etc").
>

Yeah I guess it can be improved in a follow-up.

> Ideally it should be IS_ERR_OR_NULL(), but we have here a principal disag=
reement,
> so this might be yet another (buggy) function in GPIOLIB.
>

Our disagreement has nothing to do with this. In fact validating
against IS_ERR() (and returning false) makes more sense than just
accepting IS_ERR() in acting like it's a valid descriptor.

I will send a follow-up tomorrow.

Bartosz
