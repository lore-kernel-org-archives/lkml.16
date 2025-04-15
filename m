Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65A1624CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706100; cv=none; b=pGVBRhzcgQNX3aI96cRfM8v+igYCoz+6KiPHITclXXU3OAZsfm+rsUTRagh77NWtY4iFY6bSeIIPSndsBfrmaHcPB0FtQZAM3KhSJKBCkrAWlblYIjIhqo6kdvLYQw+h5bv0B6PD7IDYgCpWEAtOfmv0QA0Q/lAWa6ZkLvp3HBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706100; c=relaxed/simple;
	bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlVTHdV/S1g2Q//n9mlUWrDGzVa3cYW3FsNV6Q0zgjQa8hCcE3rlkpWvy8XIK97nj0bQRn7dCKpTJzo7KaXx7L+9haIhXTNkJkGZvTl2TryyZIq6J/FcX5XO0L6mNuXPr2n9s0Iwq2nst5EVxrjvP1QhsutglJxxT/b51TV3YZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ua5uIq85; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ua5uIq85"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso54050591fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706097; x=1745310897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
        b=ua5uIq85C2AdK/AUBujwKDHq4bvs+sAeel5zshKpU0AjAKP622wi93GMDMsnTBRgHG
         OIj6CojC8Ld1FftCkGC+ZBQ3o0Ff8Xe5tQ/6rLwkXR9ZXw3K+677KWpqD07SHm2rMsv3
         z87pcItbzyDvnVl+pbWusY1cmhOW/OmRsgKtXran0qApi4jymcO8crPjyan6fn0JPsWf
         0tL0XFqtZduFkdNsBSxLsXh+G3anb6X1LViv9gpvLT61JLvzeWTeJeiDTcREBWMKyvv1
         CRkW9VS3gWVHviRe0DOeTLD+NMxuYzdWw6ooid3RZehoJjbZAPcGJCQPEOXQ5xpcuVT+
         k2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706097; x=1745310897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
        b=B6GE8BdRvB0jaiUgs8msbnSOrmtxerpefqwfIT9PenCVwumJ46VTGHXmkJA64MNYD1
         g/pOtMyR2kc3LMAuPieMY2M2YLI3zJRWnII+MgTES2g8OReSbW8mV0lSKQDYRRbcQLF1
         QiPIZFs6mi1XQNjqiM+yyUwjOrvy1YCpfKRFHJN9HBYPmDgkMdOrUptQvOxO7/Zfk09u
         0vrLvoE4fu+mQnkXo+uD7o1Gp/eUGAxgOxc66saGHX4YV2MQ6NO2eDkNlz/dJGXDrFEq
         6gVq1zhjR5MYtA7XcTcIehqXOcGNFy4qJEIg6ETwpUicokernM/yTBbDzyVmXRcOM9uH
         1TxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JpQsIVLAl2veizHHmBjhxjJ/9ysqpyZe1fop6wPMd+surJ8vPv/VX/HWb9c7RscSKyNgpPs4SxaFKg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5gKYhPHKXCMPx/ot0PoymgjZW9brPeOMnQ+Pm3s/X6DL6Y0Y
	8jUrq8LQFchIp5sjelL+Qm4y0GdsEbyf1uALRgMR3OKwmYbcldAp3MtzlzfbML4PICywHAp1i4k
	BfUfr+dZYVTzgeESaSZRe0viY7cAqMrJb7A4tKg==
X-Gm-Gg: ASbGncvkObRpxz/PML53jh1BQfrakoVgyVnm6isWrOcVm953K5q/NEbxv5l/+DCPA7I
	oyC4OYo9zY5slfZ5RrXqId+FR3vpndYDO2MomMPPgsjBPlUTiHWEygvJG5gaAk+tGBUinTnk3t+
	mfu1m/dlAsUWj36Y+3lPzC9w==
X-Google-Smtp-Source: AGHT+IF4gUiycvwx5xihfrwfi5caUZrBVPZ9i4AgpgkHBlnlRrfQCIE5fGWeGhYLe8jkRfewjlLY4sZ2tgruT1T8EY8=
X-Received: by 2002:a2e:bc22:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-31049a20e75mr43738081fa.23.1744706096919; Tue, 15 Apr 2025
 01:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:34:45 +0200
X-Gm-Features: ATxdqUGEx-uTaMP16LDfzXWDKy3BdmMOqJmGzQUi1FnyT_MvycLeo1V79XiWUh8
Message-ID: <CACRpkda+JJKjwE_zqbyCNt_Ndn8y079mF6PW1AEGwtJ4WnCQ0w@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Peter Rosin <peda@axentia.se>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
