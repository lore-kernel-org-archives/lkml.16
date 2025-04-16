Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6277E17A313
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793149; cv=none; b=UtyIegtbGfsY6+NQzQtZ5XKLb/8OOslLPLu4ucZQeEBce/sIbyE+wtlEUb+5TomBEbjhwn77mS7oJp1W3/lKHQO6Ibw1rFb5zb+IZSVMusEPMxbeU3487nFC5N+ccRQjx9pTNCBtoDO31LP941ni96s8FmOMrX+TRODegexdUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793149; c=relaxed/simple;
	bh=RE98C+gHqUp+2/XX8bTBngu2H+KXKruUzo51s1pekZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ht+DEj2ztet74e0MsQveLaOc6sle+VBUZkXVIPufae3NffKqKNJZgmTGJxez/1bbIjpfDrLJ8jd6Kj7EC+eLFGhVks6GSrD52u1USSXerh6+TSUVkK3VGbDkDH11Jk6wnNbUND1LdZ7V2i6DoK8mcYSlovuSc29ka05n/eQFdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+xaIO1o; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+xaIO1o"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ddad694c1so65375861fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793145; x=1745397945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE98C+gHqUp+2/XX8bTBngu2H+KXKruUzo51s1pekZg=;
        b=W+xaIO1oiPuwbY7E1W3UhAIGLbErFO5qIdBXyplE1PfRlfYU1bCE3bgq8gB97Y0Oot
         BugGl5e3e4AWU6gjT8AfxzPr9W20x0hc7AVWKFOxz4Y0AgPJge60wCFI1NQVIEdisePe
         dql+BKdsLEl1sFiluwZb2GnO1FiE0+XM+0IudWIxCkakzl/Nk0EaF4mE5uat+MZ7xn1T
         8vz9s+/sUcvDlRp39H5WoZeZH2bRaJEvYOZm4SrgHThNJsrt3C8fU3TjTLvNUlDKGmJb
         GDN66QeliDt2mnz/whBg3ypzOCs+X0qhxJPGquonIHPOwk5AYV3rATXnx8fxOYC5Njfj
         uy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793145; x=1745397945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE98C+gHqUp+2/XX8bTBngu2H+KXKruUzo51s1pekZg=;
        b=PXYklL081tScPQ7VM838fJjgKuPcultlRO0tcEtJtTyIqxEbELMd2he4tFbvZ5PXld
         kmUHsZAWqXLw4YePS9ZEBeqs9q1cgnbZ0zhqHGWT/gLM+aUqA4A5uasphGMlzlKVx06z
         cb+fbRZG1Am1+qz0gLgvGNnViO5JpDIRolT9wGqexP7hDKEO8VHT62rvSkd2RppD2KR1
         yzPllurhE84t/c6BXLQvTUnAG3BG1yzZ2XKm6ZJxfMqZe/YDMxtkDTrFTuSYBvh5rBIa
         ZDj7qZVDLP6PRpUxXzuQK0g5XurZnGICmDcW4KhpU3dzaHSqFcRazqKtOC+wIB9nZdJt
         XDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6JFD3Yqsrg720bioKVqlSCNDQeKeK0YHwjtikaXpKPqzjeIgvx5clGdewo+Ia04+5cKCn3fUFBCcBUeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydRtCQT7mvbVewZED90J99PJfZmi1Vp9TtBTjOHEBmkrZL0OIw
	oo/NX+KqrtgysAR6pCKJzoq0tR6kDy1qkOkNkP81HSI5fInbV+ZlgGgQswmEfT2RTrR1vwE8Srl
	/lC+NRmYOaE7XPi256feRiGmAuuelQTHbuB8tWA==
X-Gm-Gg: ASbGncvqbSAKdJuIT0XlXG1t+hckGwHhI7e75djYDzuFlcHfdwEWyQ0uqZY14pmf4VX
	Xxr+k7q9Yb41zzpoeHeKYd80mXiGE3IWBwlwKGQM/jyamY6sGVCCWFua1PsUwCrUFh4GQBkw4WY
	uFacXAy/20o2qEQCTZPwcyYg==
X-Google-Smtp-Source: AGHT+IFmYxdzrZGUbGtKMa+u9hnYq1xmfRbmwLNj5G838Fi5mSqfD8BB7+HJ6tHui63K85iCuSDBoWduZ9oyUn/Qp4s=
X-Received: by 2002:a05:651c:50b:b0:30b:9813:b004 with SMTP id
 38308e7fff4ca-3107f73175bmr3853981fa.34.1744793145362; Wed, 16 Apr 2025
 01:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:45:34 +0200
X-Gm-Features: ATxdqUFF4O5obPmrMzaby6-Pz9kGjUdZrISDS5QYruNwCIm12lV8IvCKMpBO_AA
Message-ID: <CACRpkdYvbbfKoCAJF8R=74tH3avEPa3K-xe0Y8aNJg_aZLDfvw@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] gpiolib: Make taking gpio_lookup_lock consistent
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are two ways to take a lock: plain call to the mutex_lock()
> or using guard()() / scoped_guard(). The driver inconsistently uses
> both. Make taking gpio_lookup_lock consistent.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
