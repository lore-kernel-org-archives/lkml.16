Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14405170826
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792301; cv=none; b=FKYo6uZ26FL5JLI+EYW5Og3E6KQl6sY8YBFQC/7A6RS9WlYQOzk+qSRNEbrt1Vz5qudVP8Ym+FCkycRVhQlPpHDAxd091YOvVg2QM9fqo5d23eskk90+sHKXGDBXABlmucYao+AgKPcf6I14n0HWcWzh0JsKhlJW29yL2+65QJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792301; c=relaxed/simple;
	bh=jU7ham2ZpaXnAos1mikQBqGdMASmlPh7XObjrBZWKb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VU2J6CaWXAycra0TgVaie0OqiecUbnfzDRA7T+kb+W9Jrb8Do1OL6dfsAcd41NJ8DHTcLF+zaQslWX2rCNQXAWyMokfP6crTlur5kpIeX2UtYcWn7IEvUsgcBnK0fhCvi+qLaI+Qa4YpYM6uJYAx1to4hROS8+tyExr1b3RE1UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VASYgr/m; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VASYgr/m"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a071so68594221fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792296; x=1751397096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU7ham2ZpaXnAos1mikQBqGdMASmlPh7XObjrBZWKb0=;
        b=VASYgr/m1Yw2WFdku9uZxMKoy2p5N97xe4QSKPh1yjLJtFNjwJAIXaICqYJRGlo3QM
         ESxjsbxKDl8J70G3dZLu0VuB+L5iaLCzhZnEOajt0HklUI3ZIubXtJNdLE7Ay9aULzBD
         UuqC5ZmoONs5VzObQF/Hl+YvIaS+iXjwMAV0SozfdylXkpbcjn1To0ZkoUhAwOqwPMmA
         av4aSy1eS952MCP9PQhqdafPitfCEEUktJ6rclPGlJzPZvtDAaC8r4RnARcsCP9+CPu7
         MLnBy4az9y5od8D00BCGPDlUoQzSxCfZPi5MKMTcfnjMMWfgQVazLZyXDewYv/7n94u8
         xUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792296; x=1751397096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU7ham2ZpaXnAos1mikQBqGdMASmlPh7XObjrBZWKb0=;
        b=J0wGwxg3zAxmqMEOMamsZ401HjBy3ZOu91O0i8XkBjn9EDQo2BurJBJVCtZbOd3+T7
         UTWywT3ST6AvWmLF94u7seRk1XOOZn8m79cUh6Zi9j7/yjD5q1RgegbYWNPP2ubt/0Zz
         UO96gLG7bdPfFZsbnigH9eNUNmY4moEhdy7ygyLwdL9/4v2O64pQgZmkQNxn4CFATYoo
         VHOK/CB46Si+BAUCrMlfqkWa1xP6NqpRsuPaTlvMrtb0Rk7XIdOmVJCFbI43UY13Nsh4
         xSB/fPfzUECLu9vvi02Dhib8NqBIeLyh5DIJtlptjeE9NGLLCGVFj58kaxK8Dmys8lJA
         W04Q==
X-Forwarded-Encrypted: i=1; AJvYcCXopMS8SDRmhIT1X+IfV9sWlI7/+2ev/BEJJbMHVQIqcuvKL2upCBBk9CbgER1XCsP0GKpdWKHwCQHnQyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/AhrsqFkFIsKH9od9Z47+eWrEy4U7kUMV98wlziMTLtTKHpD
	WyLn4xpUik9xxFUbrYZrRr9KFKMOIZvVNQfMz25lI0J1CcxjF//3QewN4jr+w/eZgBx71Z/UgAz
	5Kn8Ymjsv7Gsf6kT82yODh15h00VlfIGBeLpdTLBgMQ==
X-Gm-Gg: ASbGncv6djSsAG5c5xOB/fpaWLL7ctB9cCx1AQlmfvHPZmo7/zVaB5//pUgTn/XJq4u
	kjHz5e2Fp0FJxo9C9b+xMb8Z17ge2Yi4uwi2Ad77S78/dmSIj7WBZqLggDsmchFdL1B2/AtMjAj
	Wz+B4KqiUw/Mhy5a5sClTEAvvKwKxzAU3EG0jM57+2NNk=
X-Google-Smtp-Source: AGHT+IEXDpnYChKc3UImdSr+zJ8YwEKjpbFFrt5NAlDdblQlouaa/RGw1DjssZH/qYmdil/9nF6I3aEfuSDSDliuODQ=
X-Received: by 2002:a05:651c:50d:b0:32b:35e6:bbe8 with SMTP id
 38308e7fff4ca-32b98f16b81mr55858771fa.21.1750792296056; Tue, 24 Jun 2025
 12:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619173537.64298-1-brgl@bgdev.pl>
In-Reply-To: <20250619173537.64298-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:11:25 +0200
X-Gm-Features: AX0GCFsc_c4phLtpzdxGlCxh0REYBtAY2fuDOH_rU0XESF2pp_pRuIm0OUyOk0U
Message-ID: <CACRpkdYY0-W3+XLKt_h=8nBqrdOD3vA8D9coTNY5sL96A5UjEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: fix mutex unlock in error path
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 7:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We must unlock the mutex *after* the `out` label or we'd trigger a
> deadlock in error path.
>
> Fixes: dffe286e2428 ("pinctrl: aw9523: use new GPIO line value setter cal=
lbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij
