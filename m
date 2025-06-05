Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19422686F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130363; cv=none; b=N/ouavryPwTna3CaX4mEobYvOpF/B46/+ufFUaHV4Q2lZeLQM8j6tR1NOMFgteHM29NOd64Zlf9NVQa9RGuhuWpcGWNBhQWDGnAVuGYQ5IC9crwu14dyowDunmF4LphljXzhrgcjTFpSX+CTv436LsajS3YHRhEV+PfElRAuDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130363; c=relaxed/simple;
	bh=pW1iugis4xtG9s+eETnQ7bIIF6wv/OD2/0HPPVI9f/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHtUF+96+rgjQqCFFzkHey2Ud1INaZVlDRxJ+jwffxQj3M5ZSUJ4ge+/fprxKYr9iQ6vN5UoIKYgCezkaqz28GhdGslfKV3+n8k+UWVvphyTGVqPsalrMhzXBfMtTHnENx+GETEq0/RNo90gtR5ZSIq1Z8Sz+dB9wSTJZ34Uoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIS1TQBZ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIS1TQBZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30f30200b51so8879631fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130359; x=1749735159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW1iugis4xtG9s+eETnQ7bIIF6wv/OD2/0HPPVI9f/g=;
        b=OIS1TQBZ0ipBOOKp/z9Jt1KYUhmFwZo7Ffj7hpRRd7nw7Hpb94SJmCWr8qwTi/LRZa
         6lu2WYwxzZRCuriri//E5nyRF+Mkln3QzXuMHkcnKcoOy0X51Mo/pWn5txWD4wxr1Wco
         ukeZTzf4DavZfHfDSFT+MVIvJHgXNudEf7ztKV3TuDwWxtnt1FfyqQV8GtebXLY46OfW
         MDbaSPFgzj1TYboMccVFYYFcLomG+y68oUOPowKVJ3uWqoFR1gnTRiDsen20ZoKfgenU
         PUyBLE4e2W1nlTN0SmbJt6UtjOElBmROO2+VGfESiR9kf5Wgjy47S0sZ5MJ4EzpDdolc
         WbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130359; x=1749735159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW1iugis4xtG9s+eETnQ7bIIF6wv/OD2/0HPPVI9f/g=;
        b=Vos8GMz78zVmDjHPSBzK1o72rSWwApAsAVYG9zPmhhEu6YuwaKVyDCMhx4eiTsSwPe
         QNjS8AcnrDNssXZbZNGQBHZAupZkrR67TDPK9lzWCssutPqDhHF0aUMNPwnvcz5JECak
         6BhH/Ul2OW68dHBYWMXN2P6EkIYvtW6KsIjQGF+pIegnFykV0Co1/gC+RC6qU9dusCgC
         X7pOyAMx1Ns/SxZAJ/48pVkXaulzubY8isnT64vaMDWhpaplg9MdiMinZz+YluNX2juE
         UJueoA6pNzi+PB9tAkZCxR16y5SEjoXmSEyg6U/ttqaTFNQsICLY018hT1cKn7gpu3fP
         tIyw==
X-Forwarded-Encrypted: i=1; AJvYcCUasmumr0+QQftpr7hnRwNV82XEzrg6o8Q0uNXYN3Cr8SbgWRehub3lKccWhRXngPvRXvHuAn3hsYn7xk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynlfw1VMPt2+JPbkOkeRCSbRco7mmZqkRQcbTqv8bzLsZzB1bw
	JZJe7hr+AbTQY++PUnacVdCXaf7cU+o6GtsmZ8RzEEYK+PjoW+k5stHkbdFx4Xdqb+6bEKUkIXl
	Rn/xiQoqmg7dlG2pKXduTjeKcvROMMtz66cY/hVPZug==
X-Gm-Gg: ASbGncvdfdwwapLPMr/tCVQWazE0jQZr7iaKaq7n+EibnviJ1Ox/3DP4Frchj3efstc
	zmAbRt4QQzKGoB9XSJU+9uF/ZpQjPbs0BPt+zUeOU0cdDDav2hGczWwETqbvFcfCwEY2iw8I9Tj
	tZI1aWSfgY9lifVLuQl5bPubnW9Um3D+0p
X-Google-Smtp-Source: AGHT+IE6+QQHxCcMPWQQTqK9V5d4sWGLTrbxqyQTR9ZbF5NR1Ou/BeZZfqyxjXMAwgIBmogu6upkqYbLcvT4mZAdS3Y=
X-Received: by 2002:a05:651c:2106:b0:32a:7315:fff3 with SMTP id
 38308e7fff4ca-32ac7275b96mr20992861fa.35.1749130359252; Thu, 05 Jun 2025
 06:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com> <20250531195801.3632110-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531195801.3632110-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:32:28 +0200
X-Gm-Features: AX0GCFsxCPT2i86_1t4bwbeQABv1RKSRClew8rCWJzzT5hSg_V0_R-wqdU9burc
Message-ID: <CACRpkdZo8K1Dffr+TNkM46B44oT=vtHc7Ty=H9teAqzLzwaVrg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Move GPIO_DYNAMIC_* constants to its only user
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 9:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no need to export GPIO_DYNAMIC_* constants, especially via
> legacy header which is subject to remove. Move the mentioned constants
> to its only user, i.e. gpiolib.c.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
