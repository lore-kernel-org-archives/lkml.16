Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B209C23CF12
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012799; cv=none; b=fCOi6aLoR7zfH/hxj+CpltJ+6ktPV2/MAe0yloBJaSNIdgmA8yukNH76yBTnfRcdHuJcNXgeXJEN2VBvc+jLt34PHoXthLzlvGX6BsY5sLQNcpsF4CL2CqBTajG+FfWleRCLvKVoDDWhB1wox/Jlc/3tuo/m/NR1JH5cPwSo884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012799; c=relaxed/simple;
	bh=mNZVUL0+Qk4pmLVzqUbamr+TVSmeq0+RLhYXo5vccoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKRH/E5V9baiYzXMIkolP83CFOswJHQ6kVx1Cm+RS2IyfaEALoJ32/uyr+myuMBRm8DzW+vZbJlexiDQHAJnzYAOira4zrbFJFE6U6RH3VZalqW8/7prMzx977EBoltQX1VAFEkt+OhrY1UQh3+VQnjj9W0rJZi6P3yrcyV+T1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=swHPteLw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="swHPteLw"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so2076073e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751012795; x=1751617595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/O27HFYbygAw71wXEu0U6ffZHl9IKBoXpsYtHIV6kU=;
        b=swHPteLwWIMp5RCgsBfu4fBC0q6+v78luvyLiF75JTQ52FFCjNV4dzOcY7UIWp70Jd
         a26rHKr4kHqGNSr9zL7MIP6KY2yBHVvrGZzQFXx+orpqZUxhVvTjWMxGOna9T1WqBD+p
         wxfjSAOSNgo64rlzCIvWqW7B40ZDK2VHrAYoWuWRouAFu8dVd6EcmyKbw18lhtQAtjp8
         6oXqu2K5WDWSZmjLDSPxaySMsO/Oz5dE/GmlRp/vsyddXHG9B+IWt+EcFPo6XpCymeZF
         bccC5xCKQncbjET5AjoaiAzEiWq1oFDhiU8x3yp7phd6ZZ+pYHvpaEsoA5OklYD0Of6O
         pYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751012795; x=1751617595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/O27HFYbygAw71wXEu0U6ffZHl9IKBoXpsYtHIV6kU=;
        b=omM6E+unJnJDi3YjrSzNwK/BSBfLM4E6amlOTXlwc82z1GnE+BTDYzmds59cQq3OQH
         ubAIhX0l7zhghzk7RiKJMh2fkyaJcXkjwffD5KZ8Tm/2u6pgDQdqstJTbk10LW/yknHx
         ORqL+Z0nqJFvJ34HnNLU7ndI2htnC8jVAdcpD0xXsdnNw0ImGoElv6/SW1QZ9PP9MCZH
         468s9KS1wtfT4NCGnJVoiZIq7NwwnH4GNV7cwFv6EYzbLUDIRe2oySNPa8iPoLy36r3W
         v/jb1o7cJnaMksdOGgnVTMgIffYZOwH8FxkHkQwZBe3zC+cHfrKbuojfj96GsvcmQbEe
         UC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUorI4foKVFyOew23l6c8q62OwyKw8JtJfXkxiH67uS1b/32vhVObcmn5AONRST5gGtwXOJK+Nua9sXDcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzriy9b5BmUYM4Q6hEFX95X1WAX/F9zGMJqOTVXLy58cQm4OVVv
	lRdboStnr0UERLWVNxD4xRmISkclTnlQlAePtl8UyqHPPJn1Sm++r4Xr4ley4Dyx5UYOASvVkd5
	Y3s1eWKyscfOldL0Nqu3GanbBcDwFJyaSjV9IYlID7A==
X-Gm-Gg: ASbGncszCLWP6nGeINDeGrbsdai4mS7zdPWynPwQrUBy/wGGNusdqrZbqCYxcEzC4Fo
	C+2d07i9e2eBK96wcS3t1NvzKBnzvM9TIy8SEfs45/RLrZnAGb87MlYNsKAgnEezXsrNh109fL6
	c8SJzjU8t2O/EUws6Bx72q3gNo0T8x3RaBD1YLlD5N+w==
X-Google-Smtp-Source: AGHT+IGoNcpOgTzoXQXRqN1dWezxROCYZaaZoYdUKJELkDe49R/KL6HEbzofE3vpxkPoc1pMmOWuKvZe//ezYoT5bCM=
X-Received: by 2002:a05:6512:31c9:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-5550b74b8fdmr895259e87.0.1751012794659; Fri, 27 Jun 2025
 01:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153711.194208-1-brgl@bgdev.pl> <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
In-Reply-To: <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Jun 2025 10:26:22 +0200
X-Gm-Features: Ac12FXwRJ_3IsB2FK0M9TnHA6sQZpfEblvGOYSw0-hqNyGA7aDnUVy3lFui3z2M
Message-ID: <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:06=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/25 5:37 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The strict flag in struct pinmux_ops disallows the usage of the same pi=
n
> > as a GPIO and for another function. Without it, a rouge user-space
> > process with enough privileges (or even a buggy driver) can request a
> > used pin as GPIO and drive it, potentially confusing devices or even
> > crashing the system. Set it globally for all pinctrl-msm users.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> SC8280XP CRD breaks with this.. looks like there's a conflict between
> regulator-fixed accessing the pin with gpiod APIs and setting a pinmux:
>
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already request=
ed by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100=
000.pinctrl:570)
>
>
> Konrad

Yeah, I would be surprised if nothing broke.It's probably worth
looking into the implementation of the strict flag as it makes every
muxed pin unavailable as GPIO even if - like in this case - the
function *is* "gpio". Of course the "gpio" string has no real meaning
to the pinctrl core, it's just a name but it would be awesome if we
could say for a given function that this means GPIO and as such should
be available to the GPIOLIB API.

Bart
