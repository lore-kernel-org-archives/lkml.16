Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287F25D20F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753577; cv=none; b=gVkBQK41k5+zHaTZWCapxJyxChprrQd5jFvRei3B3eX8fK8+xOtwSZQiSHzTGobZ9elHPuiLC34UQyw7VjiVZFy8D62jUx3rdlc70OEze5h7kiEmrhxzx7kyqAm6MP+futCRUxowPseoNu6EnhCm2UHgPHFHQ8iCgCMhwK8ue3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753577; c=relaxed/simple;
	bh=DLzlBcqABqsPZB+zUP2AamaMZtdvqxrfoQXTUdcnZBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrRjOvYLpTp6z4ZPddEemswneEXGGRVRFRAit3RZCxblzvbg9tgdSF6cWvStlXAy8kN+5HFyJh7fDVZMXXvVMe2+9yoCPEl+1v0jCkAjM0TU9Hq+HMVWQRyVT7aDtc6JjuLxkyHyjdsB7gXvHtX9Ayav2rRV6Gc730HjylFAAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZFWd991; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZFWd991"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so1053941fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753573; x=1745358373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YQuMjX6RqY5591f94awvowShjmHkqhT1A52M9H1948=;
        b=uZFWd991r3pMZSezTdEjk8iavsdLW+lLdSUbSSpng7EZfOGo0vmZXDA0bsgeY+uBdg
         tWvI+9ma2hiN+CFukhsd4QEkCTI633ypKFrjOFTN74hUY5DRhgaPowxoNm/T1+fvYLDy
         adZ840lhI6jmRrRFxsA23VDnJnrHf4o9T7ffVoF04jYfXDsZY5eJNQivshuJPo2/us1y
         Yg4Eoj88VFu4L2JETgbSTmlj4VUqgJptmQ4bcn3FLdTS2ppuVA8+iLrhM1nqES6KMgPa
         mnYOtyyGkca+a59Azfevo+t9p/3Ctuw2Se7eHy3caSAOaabtloRyt7bRu/27qHwrf0MN
         eLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753573; x=1745358373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YQuMjX6RqY5591f94awvowShjmHkqhT1A52M9H1948=;
        b=thxts6KD715OGZVH6SSKKQOnEpmfUq0M7D62WDQxTEp0ZoJu0ATAwo/a3DpjGjPd9T
         YoasMNBHA5Zmk09JKgJhJJIUjldRTf/aCQL8dT7HV2AItqYMLPaZ7/Iz/ifYJMu/ne+q
         pri1h9l9Lr7/sitFTjMRsPtuiPw11oE7wB1cCVyq8OokNFO+IQMpvq6wZTMGjCML/sv7
         Oo5SrNtf60hnLplkGEbR2w3lZcJBYpSkfgdOjOwOicQPr9WLr51ncgQ7Ew8NxLKlbmaX
         YazBdSZuPXLrt3F8e8oBIm59duDMcN1dn/q7C8fhAZiAMXK87rViGEXyVJVo/LBcvZQV
         kgKw==
X-Forwarded-Encrypted: i=1; AJvYcCVyQUygLNKXiku4UfAbvLS0v8N0qlJ1Yvxocutl9BBVMbel80iwqOe7o2kK7rifIKexJkMV1r6fKATHr4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxI1MifhGSW5HYcbtog5XPhWGONvP1Gi9vpyT5ydLCvnPLhQ5N
	0LNOBJZuKqo8B1crCO/HqYi/3KKz6IHBIeahsKPZDF1lk1qrIVXSi4Q98MTxGp0sOatEWpuxNKj
	XEmeFPr4bMl7rqey6q7rJI0vHtbIWIK6ulbWRYw==
X-Gm-Gg: ASbGnct1sMFVPw2rbTRy5KWweDw28ntRVPzfxwcMfdBWNMxV93G/oGn437F134+3loQ
	ZqxBM9tkQ64sP8HU5aX6po0WWIWliKhKycPrz5/sOpeLQWv+KYs88iY3rPHTeWJ3XWC5cxefRkn
	fEwwE8k7W8EqTI0NDGJXFMWQ==
X-Google-Smtp-Source: AGHT+IFNMqXpj7Skwd2DnAC2CngVyisYolOpN1Zfv/fBoXfoE3OuGLadY8gJ576iwJlbr0gRiavf8/GMEeRzJsYqgX4=
X-Received: by 2002:a05:651c:88c:b0:30c:12b8:fb97 with SMTP id
 38308e7fff4ca-3107b5a7bc5mr3161681fa.11.1744753573365; Tue, 15 Apr 2025
 14:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408151521.552749-1-jindong.yue@nxp.com>
In-Reply-To: <20250408151521.552749-1-jindong.yue@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:46:00 +0200
X-Gm-Features: ATxdqUF0UARrwrF48AvkX9oUyEjV3CvjGrjRi8eYX0jsGcj8uRBqZxY9bkXxOgY
Message-ID: <CACRpkda23XbwhWTXzEF54D6yupc8+xAQpSPPb2vAy9aQsXxe+A@mail.gmail.com>
Subject: Re: [RESEND PATCH] gpio: vf610: Allow building as a module
To: Jindong Yue <jindong.yue@nxp.com>
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 5:15=E2=80=AFPM Jindong Yue <jindong.yue@nxp.com> wr=
ote:

> Support for building it as a module for use on the Android
> platform, because the Android kernel(GKI) doesn't contain
> board-specific drivers, it requires that these drivers
> be built as a module and loaded into the system.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
(...)

>  builtin_platform_driver(vf610_gpio_driver);
> +MODULE_DESCRIPTION("VF610 GPIO driver");
> +MODULE_LICENSE("GPL");

You compile a builtin_platform_driver() and then claim this is
a module?

Switch the builtin_platform_driver() to module_platform_driver().

(Also make sure that removing the module actually works, please.)

Yours,
Linus Walleij
