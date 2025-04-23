Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE89AC8EB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421382; cv=none; b=IP3GAUF+sc/Rs3KCTwFFJdS3IYCKT6ix8cxQsuwRsHES+2Hd2ghQ3LIP2DVNACm7+fvnLUyzhUeYwv3JfKuNLrKfIlmUX/4LEyfR1uxqORAV+FK0AyrfPZP2IuVUL779QKjrON9AOX8KoiIdjT8jzoc6FLK3dKjNbwYvPY8eGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421382; c=relaxed/simple;
	bh=qlpNju/NMeRKY1xUkgP16/sPqOPjSqfdYSpiJoQx0FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7siutzuV7MjPjIW+2uooyUZ6Aoj2eNgiL6ndOUkiEEnvOwz4lwyaLmcRq+Ox2VFSNZtnM5rSNHoub2Rr8EQQX1oQGDW19CRFYppxR9qOAGTXkLSBTFxQKPE+06YEDMhBZ6kX6UZUfscy6cCBMOQw7G+j55TY9BB+x9BmKSR7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KtkrAzVb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KtkrAzVb"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-310447fe59aso293661fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421379; x=1746026179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlpNju/NMeRKY1xUkgP16/sPqOPjSqfdYSpiJoQx0FQ=;
        b=KtkrAzVbWnC0LPvAgOLoPN2A+61TYNZpdpMS8HMqiDPDU5u3rPwaINq3AkTeJqRuhO
         hq/7XSFcSSJ8RBQkjwlRg/0tfGFAyxTbf7yrMMkC3+J1zyxTTsf4oTeBaSG3D7oPYd3U
         jsRbOv8HNp5PtThDLiqEklscXZHuMMzg7nHZvv6h1xzh6B+KEtFCQokO5Npqwr33vG91
         LCsPvHcyiSq6ATiJvBIdLZ9AnIbVhZgWa+G+rduSj+TLtpJh99T+BdsHCuv6Vp5goNug
         /H1wT/HUr4LA2fVMTsuXyjvi729MuoVz6U5Qvhmp0iYkLGTaYjuTRQOMY1zqMzjK2s/0
         nXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421379; x=1746026179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlpNju/NMeRKY1xUkgP16/sPqOPjSqfdYSpiJoQx0FQ=;
        b=sk8lCgBW+Etr3GgeCJGDgaikKyDhz96e1w4r6YM6QlcKpmvhI1ohiPkAhOS+yBpdEn
         M91BxvDxOFiz/2WvPbpxF+SL9DaS3b3gq+o+0AubaW9ewyXXWxNK6G7OhC+s4pGJVjRj
         DiISoaxqok+nqGPQythHcieXA9jz4cd+gURo742j72URUws/Ej6uYOxLnxx4h5LyYBRm
         ko6+B2G81Unhbv0dliLuku4hM6gXldNjNOr5pgAjenUyCQXqB8bhIbNGqjX8Ks95tBB3
         af/jeO0wrykMjNySSGgfNd+a7+4dLCE9Wv49uNDWfagcnCOqr37Ap7W61V5oSdiXIUtj
         7HoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXna76QPV5W3AK8Jcy+nn2mSAt8++zWbS6+mB1eX4KhiwJcKQ7Hrz2qI12IOglCHpGq7ZWciWC2qEPvJq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCcyte/yC6OU432VHkRD6reODdK5kqKA+AngU3a/Yu62/lC3Sk
	LaUAmKFlukTyCKjfiT7YGcMEuRJjpLKAdNI/PusyTuHCfMDzlGdsUVQPa6WUOSlZvEFCHnDq46n
	ArmD+4FULtJ6qKtiEmWWwBFqdS0uDYnQelWVS1Q==
X-Gm-Gg: ASbGncu51Gm6/qoYeWhgDPvCMH3KEPOTXrRBQcdc2eogG/1gynZAdRFE9VqljU/s38Y
	YMCBUQckz0Es3fviz3BhB55geiqjizen+TPJFEYVp/wg9pQ1xtO/zBeU2X/9zLzJDUQBgnCFQAM
	9aigUp1t7T5164WW4qzOBgqTz+30FhpWR/kIyLAyonV/eho1doVnLOyg==
X-Google-Smtp-Source: AGHT+IHI6FEFDrMfYDdXhYkYNDpHXaIiAxn1bvrzybfafv+pPojsem41Q9McPU1leKadb1ETRCZkCLPRYGg+JPXxqGI=
X-Received: by 2002:a05:651c:210b:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-31090556ab0mr67855181fa.30.1745421378812; Wed, 23 Apr 2025
 08:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409211243.20105-1-kabel@kernel.org>
In-Reply-To: <20250409211243.20105-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:16:07 +0200
X-Gm-Features: ATxdqUEu30-v4vZ_QcfqEo1SABrb4VJLmGibSpys6kuYcnJ0aykhfiWBeGUNa70
Message-ID: <CAMRc=MdAdfohV1Xa-2WAyKVr1sqQeE-=G7V8LkzFhMZZ-5-L+g@mail.gmail.com>
Subject: Re: [PATCH v2] platform: cznic: use new GPIO line value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:12=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---

Can this be picked up into linux-next?

Bartosz
