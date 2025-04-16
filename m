Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAF17A313
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793243; cv=none; b=HJOPr0u3u1yZEUFqxokc+bNUfZCaHsk/+7jztbdGqTRdH6r4rDhMNAeSVL0Y3dKAzmSV80o3yUTrjEu9rSDg7mcXwNLhsR1beW05QCsbvGds48xj2MjeK97i9c1y5lcQXzMVpgJEg6HPn8ery2yVgLzmzR6OxKzWHweIK2WYmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793243; c=relaxed/simple;
	bh=DVijI2dxiTZi9DSjzLlQHoIR5BS/mftcsULF5DCiaCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjWWIlxH9XpOZJmxN2E+Z7n3i3njxxt6uSloDfiXB23Iugg+TtcBXgoSx8k+HZ1CFY49R+CMc3dcylfcQRR3AkeAApsB56gfCJUgKPCPAmlKQzAt7d8BAeKZd+FMEW2QapdTb8j9XsUP8JxfjKcrtENPiJ0PAcdidmJMoJ3RPRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaGjG/WL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaGjG/WL"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54954fa61c9so7900552e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793240; x=1745398040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVijI2dxiTZi9DSjzLlQHoIR5BS/mftcsULF5DCiaCk=;
        b=QaGjG/WLT7reWecVBbGUvzQ41xDqv3UYENLHtF3rv30voMVweU0jBOGJbMjXknWPjR
         Gd4Gc9NtElIbtj0hDLG/dtchFKpQ1dfS3P5I7h48+Ck4pn5YCHjsPM96kSFaEydU/DrB
         i9W7MlH7MxtfJBxy/2+FlIVZL3Ie2UWO7XPOpT3WdE2UzT4eigpzW3PplSIICf99RLe4
         aFU8lBCwuLJKUcQnGVLMl4jWkZINgNUz5NoxwcW5mTP5022PVeTH8liYNrx5ezI6KE+G
         1Vd9+fxyD7iAzc5gbnnX245kZBzqjBDmTSg/uS7RT2IQp6/l/FC9XFRvqHPvHzChI5lE
         MhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793240; x=1745398040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVijI2dxiTZi9DSjzLlQHoIR5BS/mftcsULF5DCiaCk=;
        b=kGMUfqZAl+AKS3GRBnoIX3QmwDA9vhowe1KviePKTyFwOw5GwTtIe9BwFjYFZmyHlZ
         n/HTkYVPmbJE/0bXrjDGDDJv+59vtDnyqX6HPICUvHdKQJfWG5HhzobOghr625ZaMSI7
         VT/2y2m41aBApV65Eedwe/U7WXQ8hLcAnYUHysPaQDvk81rEqJ7d+1T395Pjeq1cOrt/
         KTiy8/UMI3fF2+hi1aeeoDngfEAUUKxuxbF99BdHnblNqBA+d9PF8w9NSf33mXo6tY1f
         bNAMKdO+Q/rRve2kJlM1law1la/+xj8rCISVR96j0XuSNFjhxEqgsznbQur4C5aGM/Dq
         nmeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIbHYzCnJ1U6LjV+BCJXa5KEgzdPLj8vkahpj2okKX2dUWpo8x3W0YQR3Kw6WRpwd1DEhrHbfYKT6sJBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbUSC9wt04iu8izfG8VtxSEsxKYzV2Dk6Ze0brSCCt5hVf0Kme
	Ftm3L8crogUBWjN55FbxqI17azD9Tjt4IkWiMXlPi77C2e76ol+Yh3QVAxzKdImU6xR8fJOb62Q
	kipB+H6GzHY7b8kFwZuw6DC02nUNPpnJ+nECDSA==
X-Gm-Gg: ASbGncuEC2g4QGqDjRAqpHq3zV9NLmmElG/PfoX5H74Ps5hhs2z0A7Z2HbIGDN7ePfS
	VzH0e+rB6SPbtQXIrQlDuOFP8uc7NgezK1+DJ4dm1RDbFFTfl3ACyauK028dTUIzrpCu7LvdaT1
	yT1FtRzFfgysS9hPo4VUO2SQ==
X-Google-Smtp-Source: AGHT+IGndggoz2F6Itcsl8+fV3DcF5DQivHsEWse1FrEpMgliIiN/YyIss9v6nK+v8EDcLYxaKNk0ELkHKV4PVUZgsI=
X-Received: by 2002:a2e:bc29:0:b0:30b:f42b:72f6 with SMTP id
 38308e7fff4ca-3107f719e11mr3603631fa.32.1744793239503; Wed, 16 Apr 2025
 01:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-8-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-8-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:47:08 +0200
X-Gm-Features: ATxdqUFc1UKbPNYO7BKvMq1Wj623kn4RUC1cwQ4D_X6YnwRJCLcLeq9fPH1GBYc
Message-ID: <CACRpkdarwJy9KtuUDJP8TqmKXjrgCC3RxZxRHPQzra37Jo4b_w@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] gpiolib: Remove redundant assignment of return variable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In some functions the returned variable is assigned to 0 and then
> reassigned to the actual value. Remove redundant assignments.
>
> In one case make it more clear that the assignment is not needed.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is actually really good, because if someone goofs up the code
so that assignment is actually needed then the compiler will
complain. (Arnd told me this.)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
