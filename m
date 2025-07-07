Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D3286897
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873130; cv=none; b=Z5NKxg2USzked5IknXWEIcnm1hbQNjXpEkeDEbJWxQpTMVqIe1Dl08LvPsgAmYccKQalLiIDy0aWwTeP9JdY+ePm65KJJlBLkwitG14j85cWzrMQn9/gFNqEO+0p0BJ5I7vKvS9szYylsIL7k//3fovzRmyO0xspMChCV9U7LwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873130; c=relaxed/simple;
	bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keEyv5QIx/JXsZaoHvhWmb1jD5Cd/2zKbU0qkXE1Ey+2vXAlAnM8kasDT8am1b9fys5ugS0Fv6om6JrTq82hJbI0Jy7Hhi8xV1iX292iHhB7lLks7U3ypMQgMODFSq/Dy7Ae3QyKPgcgLaxsJ06CbrEFgZqxZgKNe06DlmLdzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xk/26VLz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xk/26VLz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-555024588b1so2774285e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751873127; x=1752477927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
        b=Xk/26VLzKDepa7V5slyh0vM9NikcSij8aUq3BscvsdGSQfTL1lX82OYH+ULDFWV/kM
         +Wui+Z6RcPZa9Du9/U2PG7qSfxUy4Tq4DnY8VwlQn0TpKL1d3fGeyzFAQGDJSzVA2MtY
         CyEfUobQzeQyLnRz2WX6JtUkYSpB3v3yNdbB/QTJTiiqtNmypuWuHRFVgajLeJqd09el
         YMN1V8lr4K/ggGEw8bUfRM8MMIhn+iuCr7TnZWivg6EAH32cIkm+GrxSfinlVoZd3e6i
         gP19nfMjJMLxbdT0SnpW+HN7w/t1y1zkgUMrPpTbTdkR7oDpOIgSkCVsQZISD62Xj6HJ
         lPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873127; x=1752477927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
        b=Uc76j+iDkjqv+hsxgT2p0mIt9VdwIxk/YiTK1PDkvDuiXomDUHjABDDT+utJpWX9Ck
         mmgu+Bk2ZN0GKYZ63c34Wd3rrEu+4RPC6hTQhYKy9iGAJQ3SL2IG0n/920ewYEJW7MDs
         9C0HoSKJSWpP8N4IHWlp6CVDa7VC8DhObKAKV6yZhCkbkelm0RpNGhfun1MgFWQb/P1V
         i04diympR7i1iNQY3f+0tR2qWjPgWGo+Cx869AmCintyj5rRhxn+CSJp4r+sS8QWk5Qi
         qP351vnsDV4erL2rreTmIZqouo6vvADLscrHAkhMW3xJqicL48AkBzssiaJiHqDw1dmh
         9N4w==
X-Forwarded-Encrypted: i=1; AJvYcCUra13nrD3jspQLscz1DEP70s4CEe7ePKvF2halVkt1UyI66AZQ4r+ScQ/xPjkUiIj5lMhGx6B0mk5Xmzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4ZUIME+Engg2hBzM7SR7w7xrcamHQo1tD8z3wH9iK++/Clpn
	LlPLI35KnYBO9upZss0YWF3TdJlBgq+q6dC2oNiYvizoPKtdYKC0jdLva2arpW8cUh2tOanNyTc
	ZrK1s1r4yHDlOoUn/Ii0JX85etfnIjKsc0RWpbckAeA==
X-Gm-Gg: ASbGncupsCD40pUrpd4PDGph7cujP8XTTh67XSpjUbCschrw4c/XTsrUwSAD57mts4w
	TXTaSXRGgA91dchnzsaWlTKLAOnpVw0UGUfXIBDawlpssh1nX/U1zASxG8T7bsE8x89dzdUePeM
	+2+rVwRzAYMsDx21h4cGrFC1NsKpu15Xz+ncMmiWQGcfN2WFE8RL23jFJUzH+VqQwRQcL4WgTo1
	S8=
X-Google-Smtp-Source: AGHT+IG328qUNrN5U/Zp0A0VnQQsBfGC8lPGfFuSftcauCLQweyDW09LAJcmHXaDhqB6NtCosFbIHR2f30xy+SxqK5o=
X-Received: by 2002:a05:6512:138a:b0:553:35ad:2f2d with SMTP id
 2adb3069b0e04-557a19df4a3mr2772272e87.18.1751873126739; Mon, 07 Jul 2025
 00:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630130358.40352-1-brgl@bgdev.pl>
In-Reply-To: <20250630130358.40352-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 09:25:15 +0200
X-Gm-Features: Ac12FXxg7IsQMRpqGn1bjOp8mqIE5ekA-5MUmfkQKNbozl-9XBliHzx4lWvRABA
Message-ID: <CAMRc=MeDAAC-vLfriDtbMn9tnikyXjAm9rZGOTAc2j9mauD4jQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: allow to mark simulated lines as invalid
To: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a new line-level, boolean property to the gpio-sim configfs
> interface called 'valid'. It's set by default and the user can unset it
> to make the line be included in the standard `gpio-reserved-ranges`
> property when the chip is registered with GPIO core. This allows users
> to specify which lines should not be available for requesting as GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

If there are no objections, I'll pick it up by the end of this week,
I'd like to add some tests to libgpiod that verify the valid_mask
functionality but need this first in the kernel.

Bart
