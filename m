Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1322F765
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130313; cv=none; b=TGH0f32r1Y/hE828VUBWY1z0Q/+yWEEzcVWp696PRYqFQ+Dmoy528EmHlcaDy4NzV6mWIhrZWhcyGHpN9/w9CSfBk9Uy88hc1JeQWKPyU59kFNcvyCKqa47XOl9xI9JJUcLn0daNJxPHnDs6BpDh7ygsopRYsG0s+sttU+if56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130313; c=relaxed/simple;
	bh=3Xp16Ul5W2xdqpl8OIkvkRsLmilUb5eDdkpE06xCKR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBhpIY7qfLV9xhiSoLnAqow3bFzoV0ETgi6uaWBFGiZN2vnvIIegPW5EcA59opDIlPuod/8cQv4tHa6T5OYLVHoebdrluXI4epE9tgX1rqmkczFAxnmHsU9IrqX1t6mCVaFxb3e7p8WrWGQxKIgJro5xL7VrFbwhJ7P9UlBtaDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZTgtrG+p; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTgtrG+p"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32918fe5334so10050221fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130309; x=1749735109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Xp16Ul5W2xdqpl8OIkvkRsLmilUb5eDdkpE06xCKR4=;
        b=ZTgtrG+pCz+16QVRtN3gJYSXhZaVSvIuOEx9hh4+3y7ImKdbCNdu3jdznAuDhBm90y
         TSBGxiQP0Jd1xwSeZwlwrr5r+NZXG5EworM7T+9NAhkaIHI67GtG+q6lwN7wKdVf4v1g
         ljSNnA4AU6pYtWavPYG7H4RhDQwEQrYz3z2ye57FgDwEhMBBqo/oF6KTO5mKEvl0Dpja
         fM+gJu/x53Wj0f+GC1zLxBP+KhkBpQrNw7bC9Herh4sHf5rHNQ+ETT51gTHzDz48h1qK
         qgbvmOpP8kK7G3csEC8bqA0+KeNXHOnoxw28UKW+RQCsd9VZYk2fVhC97CjBHlHGvTQn
         vxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130309; x=1749735109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Xp16Ul5W2xdqpl8OIkvkRsLmilUb5eDdkpE06xCKR4=;
        b=NfgZQJQfEzkxb5ShV3dYE9cM+ksV3vUuUKzOizWTOKIma0Cwyxbz2MZN8JgArFBsqZ
         rAwISFFxBEpX5tNAzks7T8EP5zkgiVnLhh28mYxJ7VxvDS5SR6dQstNcKSp1sy9Z3kPV
         rWQaMVNkJDPzOOmQZ5aV96jbGIhJmppysz2siF7SA4hpwI9sDLM3bu7B0KiF6cFPpp4F
         NWQBs12SWrwx33NB8Mvq6f3AHzBrZiNamF412/SMFiYiIWYOFXH3Pk+gayHNS74gYqPf
         KpoUQnRj8acNB2+g3OYV3o9yTwCZ4lKQFIQCBvRvep0lvHo4Cx3GmL2QKb7KkxSUXp++
         86jA==
X-Forwarded-Encrypted: i=1; AJvYcCUDAeLmRSJHIPTgzsh2IPuHiASfe+lotsaDoBGBrrWPBk4mfSwzkn988zlmDN0v5AUGGe2UK5cyF2Ka+C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVThcwEdKz3BbbEerehMG7zUwRy9U/5FibH81TpUocBlti1wR4
	Xgnzk5iJzHkyD8ZTgryn0Vd5W1Bm/s9k05JqdJdEavMBrPM7KtKi3WVj3rfQoQB4ulVSaEs8hO4
	0yCKkgbECBCuXlvNwdxOMl0bIgW4aEDy7/Ty6zhIUyg==
X-Gm-Gg: ASbGncsSTjPqMLa5guuA7X8ZvqJ6/s9Ll8s/Eb46f/xpF9picFCZc35qtyvd+vOgmfB
	7muoMKhntjdr78dQqZPWy8rLwnZE5v4nPKCHe8Lc7fvzwEcXZSVJQ4JzOBAp9xQzudy05KIWD05
	xwEQJA6n31aAOcxwSvExcDXO0p4jiuD6ar
X-Google-Smtp-Source: AGHT+IHSnKSDNQUJOOGzj78O2oKNC6lGuJm7j4wb7PTPZDyANZnfX0CVuXsuVoOMf6kUNk+ATNKuvBm/XvtBIQhaxeY=
X-Received: by 2002:a2e:ae13:0:b0:31c:31a7:4679 with SMTP id
 38308e7fff4ca-32ac7258010mr17887721fa.37.1749130309416; Thu, 05 Jun 2025
 06:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com> <20250531195801.3632110-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531195801.3632110-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:31:37 +0200
X-Gm-Features: AX0GCFsbnofQ22BvZl1sODGZD9DlgA1gYR1ngBlv5uhGKV5q5X97cgJTuxkbKFE
Message-ID: <CACRpkdZhBDCZi=-wdK=tNhgt+K=jjgScF+7FMN_Q=ge6eRrJxw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: Remove unused 'struct gpio' definition
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 9:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no user for the legacy 'struct gpio', remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good riddance.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
