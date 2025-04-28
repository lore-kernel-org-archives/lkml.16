Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038021516D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826534; cv=none; b=IMpkTJ6dle/tZ8JadrraWQ1mc49ggTRtqaOLfTmwjY6KAl4lp2rC4nOXE99TDzc30Pf8EhUqPG9skPmnTuVlQi4T1vHwM8u9YhASdzryjYm2+9Cvj2I7n8uaFvg8d+DO85KjRjnxYiIiJjIJjf0hllrbhHs62ji5Ae4RgcphTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826534; c=relaxed/simple;
	bh=0aPbq7QjWZD6WH/+NpInspV5AqubEwAIG6v/0OXrdB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nv8LVf5k9gGHhMxhQgl5bBlWPYBihI171wWQeEsxzoBeoXMsuJvwYec/ss2Q6aRZyWqYs7ML50vzqz760mqhPSGcURf1DwpIyvP/DmSbVxVPCzcpFHRyF/pAl2mJ2WmvMcaZSk8AQmxZreVhBqlT0Rk8C3aoGXkSelVV9S0JnVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IjNveLpm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IjNveLpm"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549967c72bcso5020614e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745826529; x=1746431329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PCCupPubZed2dSKQMnkWeJ2fjhjsL4Shb7ISSeWciY=;
        b=IjNveLpm13oF5r2UvpgJceynHNCNU8TNihB6eRTsivQQ+/KLBnRoWi9JF/FnpH/Meq
         juVVH0q72HorDvRjQD4atseEsQZYH7Gq1DDsw5VFfWLI/fo6CWmibascIH1Q/7gGO1QL
         AbwVDvoi2M7TDjILYMk+c9s3qI9BrXvmUmQ/Xpx/BE7ATdIle6asMFx7Kr/L5NP75+4a
         +kGWRhtau2Js6PM5jZtR7s0w5x78HD8U5BjiZHFCJbL8JLUmP78DMKV22g1xUqjDRNxz
         hopxodbjKUQ3E82qD5pGWEOIIFZuKpDsyGx7ncF3eb9DmjV+3fPIUEhQWFOKkaQcxGVE
         t3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826529; x=1746431329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PCCupPubZed2dSKQMnkWeJ2fjhjsL4Shb7ISSeWciY=;
        b=aIgINxu65MpS99dT1Gq4Yr4CzHpF4q/Ks51JgbkwrdLHIOtIQaohzZiJOvbn2dWTA8
         5/MlgifWlRwnxygQfEDILZBSAaSEJkCkRoihaqGgAWmc5YeKi5WgxBxf2JBNO5yew1+7
         D/+jBKz/5f8fFvymNCmoixOzuNerr+bRKPeqwK37m1O915QZMnm4ptiFW7Y9TryT0wIC
         51XWP3btqYFgBB/SI5/s1LcjlBJlUr8vJe4mc2inQblcjlDyexcnx6sqA/yE3U8fO/RE
         cU1+vBAnCq8qoIU8KpF3hS/o3vm2nGdSk3xSqKDZErF9vqGcJ2WjOoJXDpF7YBB+qkMg
         N/qA==
X-Forwarded-Encrypted: i=1; AJvYcCV0eT+a/IASd3HUQe6FAfTAqzqb06tve6yJx/0ucQhFQFb8CENWYp4DGbInNuFsxIzSIgElofT3upK58DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbInnncm3SLckIUkTUKR/AfRsTAdCLJehstbklpA9EDNMiW5Qe
	TmP+4syRFyewFe7qH5jmZarKLNVC9wiRlNlhd9kaVxgI3vdIArXoSrM2LhUz8bmT40hmNLy1K7r
	66wzmuu6UazGPisSLPkqAS+XQVwr2Wex6K+ODOA==
X-Gm-Gg: ASbGncsdOCErNXuRZ5vaRVYd627qpMZID89qzJ0rK4Z6+12BupiCuaVVwbFKhL/AZbO
	hk43NkceQlOoIz9IQK4R8SVW3f+g91k48Xctfwf+lyw/na8su6IhXy3ra7REaLrbHPBor63daeO
	y2OdO+Fbv7uRVnNuVFSsZF2NBiBgalEceFKTLxKNEBft4P++Ajg8uGJcx5m1YlImPM
X-Google-Smtp-Source: AGHT+IF0HgPn8OeKW5WS+KDxofSmzOi/8NCd/YBlI5lK1Rs8gPsRVwuBuxWF7hz9jPutkk72Ap10CvMM1TUnDBKdFrA=
X-Received: by 2002:a05:6512:3f1f:b0:54e:8183:eaa3 with SMTP id
 2adb3069b0e04-54e8cc134b1mr3025602e87.57.1745826529270; Mon, 28 Apr 2025
 00:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <174582608319.15717.12211907178640999391.b4-ty@linaro.org> <aA8ym3GYoAK4lI2y@smile.fi.intel.com>
In-Reply-To: <aA8ym3GYoAK4lI2y@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 28 Apr 2025 09:48:37 +0200
X-Gm-Features: ATxdqUFRtjOrKeJMUsvJ7WCe4eV9I3R70d8kFAEM_J2BwLrUZ6JPObHuV-g07WA
Message-ID: <CAMRc=MdeVrgzVKSjbNzBz+Kf2SqqFY7KO=yprU7GF0Nbbcq4ow@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: finish conversion to
 devm_*_action*() APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, 
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 9:47=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 28, 2025 at 09:41:52AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > On Thu, 20 Feb 2025 18:20:25 +0200, Andy Shevchenko wrote:
> > > GPIOLIB has some open coded stuff that can be folded to the devm_*_ac=
tion*()
> > > calls. This mini-series is for that. The necessary prerequisites are =
here
> > > as well, namely:
> > > 1) moving the respective APIs to the devres.h;
> > > 2) adding a simple helper that GPIOLIB will rely on;
> > > 3) finishing the GPIOLIB conversion to the device managed action APIs=
.
>
> [...]
>
> > Applied, thanks!
>
> Thanks!
>
> > [3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
> >       https://git.kernel.org/brgl/linux/c/d1d52c6622a61a0ae8dd2bd2097b2=
5c0f553d2f3
>
> Only one? What about the first two?

b4 borked with the patches applied to gpio/for-next through an
immutable tag but all is there, please check the tree.

Bart
