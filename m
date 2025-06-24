Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169D24169B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793908; cv=none; b=AEhuVpamz0xtCa+2O902CZnI2hL5BkmF+rud9VoIwdKjBirNQ49HM/nFSxuyfXR77+9wZdPfKd28GlTrRkJUW2waG2NiaM2HAg0FvAUfrNLTJKyELgKf5JAdD591RiqDZM7dy3afBj1lw8gjWeMbZMXiXym547WgwhMcVefX5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793908; c=relaxed/simple;
	bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZHLrZDE3d6mXVNj7Vrsp4Fsbree8SSYo+BjWp1X6o6rz6Xy/rKVGMDwCty1BUkUpk1bsiCh/6hxQj9ddNhNude3Ev84cmNHjjSbMwVq/K+vULGK4QluLFm0WQSRE7LMPX9pEN+udzSoiW8gMknT/A1BtJNM8CgGLg0sUc4pmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aki1tteR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aki1tteR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551efd86048so845993e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793905; x=1751398705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
        b=aki1tteRXCS+F5x8LBFn8t48QV6TeIWhTzl8CGRqkDZ9AaX+uqHJGOaGAEHgb5EGQU
         K3SVB+IOVEX8gCmQTuNp2U9O5/HE0SvltTb5PP6xUYkkfjCrdFAe3ATvVrZ3BI27sWJc
         yJx+tzSVHz8qpKs3PyPQALkxf4pQvLALyuGQL4ubf4EXsVFjFeewg+bPcnXwUUO7LWH8
         IyhhGdJsNpFJ2/I5x1cw7tar42Qj+dDCqV1YH6XOn+h7OhIsXhraxYoZe/SivoxxPjfI
         eIfaVqxpOO4HVRIJtG4DUN4+1Dd+xte04tPs1Kv68xTtM1LWA5gCgKIplEnoAdefp2Pp
         Pi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793905; x=1751398705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
        b=ZZ4jjvQCA778jKRDPt5hpXoWai6DuuJMlOp6Hia+N2QLXkmUVrW9vbd3Ll1YW7e4Ak
         TXeU+psp3I2Agkh1vWvtjTkKNE0BUZY3EfUIf94RVRdYvAfMNJFC42kXSdHU6ihsU09V
         WRuKlWnhG6YXVxh8q5HVYa8NXdigdkFdiLvpk4L/65reYSD3aefsV5p1hASsEc5QIbOr
         yWpwyrQSHQD+m6nkToYymoVtPe2p/XlulRkokL9iPSCiCaJWFtYP8e8Rla7dd/uZlsiL
         vPvWfAwTaXtWsP2arkMBK+EHe1Cm6/JLGGhk0uh+QkAPKFNPXiXOjkXtfRTz/uTtQJ49
         RDPg==
X-Forwarded-Encrypted: i=1; AJvYcCVEGT6mfm6oFDxFiRNVUzTF6HiiX6t/Uu8QY4KQMyXRHAZLFmnT0Cl0hehT4BOW9Oc7fPUC3CkhP017IL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEwBS40fE39GOVAmTRCEQqTKS4f5DiZNEfJNZlOrPvMKnU1oI
	aNELydlkW0G/uVXkwJTMa9yddlOGA4V567Fz9NWv8w/eN6tfXHUwmf5Ts+pxbqKY6JPv/nRQwGC
	za8VflyZ6PdzhB74/KM8ywlAa7BSSjtNgo37Bke/FHA==
X-Gm-Gg: ASbGncsXIV1JoXg8a0nOnQXh8Uk0TT+4MReGCV4XU36Yyxef1oybQMZ9uN1E1sienQF
	CSy5BtjVVvaaucuazIc7rXcWxgd9AZ+EM6PfwQK6nOgZe9UufTNwJkE5053XKpPsYiuxfshd/6d
	vXvuTHCmQJuCpnEeSm93glbTXQDA2rN17ocdfTsDGinqU=
X-Google-Smtp-Source: AGHT+IF8PpIrRaMkAe8YKe+Ia199YgjdboowW+LWa9jRIpq65y+WGtSchVD5OIWSHr98VSpp70vsXSL+42eeml7U0lk=
X-Received: by 2002:a05:6512:124a:b0:553:a456:a0d4 with SMTP id
 2adb3069b0e04-554fdcfba1fmr47355e87.15.1750793905089; Tue, 24 Jun 2025
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623222004.280928-1-colin.i.king@gmail.com>
In-Reply-To: <20250623222004.280928-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:38:13 +0200
X-Gm-Features: AX0GCFtcDtI8whG-VjAJ07P3Ge7S8tTBWu6b5QMCPPumR2NvUwbFL-CwyFKH6Iw
Message-ID: <CACRpkdb1voqurnhj7TX8h1GPDO9ER_3JyZkDusJ8hz45YzYzHQ@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: eswin: Fix unsigned comparison to less
 than zero issue
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:20=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:

> The u32 variable voltage is being compared to less than zero and
> this can never be true. Fix this by making voltage an int type which
> is the same type as the return from the call to regulator_get_voltage.
>
> Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij
