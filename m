Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D0224890
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830913; cv=none; b=JP6wg3FMNZF4w5uD+E9OgHLMEoMfcl9/e2oGeXjYxEgdb1VzZl20wTq5byMQpALckQ+icNxijW8iM5oLyvbHwrQHWAszkQ6CAvCpUdGVsmdM9xc8C4tRJ3dscfiqYEeWVUAKj9PDAbbcuDyTwQL1Z/5OTDcX1fXKgflQxXaY13w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830913; c=relaxed/simple;
	bh=aqSVekwags+CA0/oC4ZRKtB6fBvm3awNyJi+swkyxYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+WzYoPZklsPjUIulPYKInNIucYMVZXIii6DuAmojzAUq2tYq+DKcu4CUV+vzMUAeP2uG4gJqNKF414xXoN1bfXh8q/pV4GeBdPtMZypPdIrUKRTVfalLpjvAm8GP7uY13p61srULsuP4NQnlJQiIl9dHA+6orTXDsOC0NxrtIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uW1eqCox; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uW1eqCox"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5440efe97baso662207e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830910; x=1739435710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqSVekwags+CA0/oC4ZRKtB6fBvm3awNyJi+swkyxYA=;
        b=uW1eqCoxUAWYsqBv3S+IRJNpv6MRUbC75+5sBnTuyRiRhyQ6tA8xn/WEPYwAQqyV7J
         WkmSGjT6BWrDU3cpMCioTi/iiZOvfVL0Uu5qHsAC9DKgfJqmTtNxS+UDLjNyJ8j1yVr7
         s6ml7UDCfgyWl+aK1pwLYH6uPc4rMO5LQd0Mkhp92MvLcZGOIBZnlmlyiDTePgLUum0i
         8WD+yvzU6XNq4vnWf8gjFWFetzJaS5zpvEmx5Efa8LD9NHe9d3TlwPHkNnWwQ8hQlP8F
         lI4mA5zuZ56UmGcLpDgo7m+FqCIyGVhAr17ODYOxDqE9+7iEQNAX9EDIc1EMWZpu+CEi
         7OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830910; x=1739435710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqSVekwags+CA0/oC4ZRKtB6fBvm3awNyJi+swkyxYA=;
        b=BK6cILlA5iZgLld5YKnG9KsFoW6YaV6xchJKzUUqFa5G3yrPLT7jwN94JNA/zWL12g
         j60eYfZpsVRZcaW1CEOSkmcPFNVY+5Akj5rQI1ogcZ4K1PhyFwmgMPRyvN6wbxTCtKA5
         hpd/qlopEHZ+rdIAjODz0vimOnSJtU0tWbbiQz3GJXlEG2pbCBP5ia6uPVauu4C7WwLY
         vo/UEihV7LldpFo3/0GNgS5pU1feUldzGTlC/fNYyvmNiOeh6r+d3FoKW2cFYPA1Xn+C
         Ks0UeISJs6Kz9K5oj7VqOazZJiw78rHiC2qYFCCbtVu5dh7Vn7dJSvsdED9y1imgiGpY
         /1LA==
X-Forwarded-Encrypted: i=1; AJvYcCXnsS4ZyBmYzgEk9za/F+EJ70igra/tvOVjgiQF3YZgdmKBEF9Jc9nr9bwcXTkA3bu5aNCAXU6zyTxIyCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WY4UljB8TMBxlKR2KTDHe9wxamJT9DmBcV3FhG9TU9a3wVtr
	GHAFv4j4fcL3vBM5WHEuWsglZSfWWQwKAQjditTX+/B6MCOnbJv8jbKasSYt0GRZ2/0kXr6TnQA
	ZEG0h1+rVh/d+3sTtONqLhCC8NMzJCe9oMjw0kwuzzIKKqmSl
X-Gm-Gg: ASbGnctNbJMpmtcORAb9lfB37WhGxeQebf8Z/1K0J2dvYVCuvLXmjN07A5Tj5CJUnmi
	E5/NAsuWdQnHKyiqoPmpCAf8O6Fm1+McAj1WHbJHBBLE6eBQmOx23ToEGToepS+658td01iE=
X-Google-Smtp-Source: AGHT+IE4jL1biJ6V9cZ4/VPk7KnL1/9etk1mBhO7a/OlzJhKKy82lzPY62t9BmXNvglrokw+AmlgJ3IQWmBjB57cLLI=
X-Received: by 2002:a05:6512:3ed:b0:544:f8e:ff98 with SMTP id
 2adb3069b0e04-5440f8f0034mr374420e87.42.1738830910149; Thu, 06 Feb 2025
 00:35:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118031145.243104-1-yuehaibing@huawei.com>
In-Reply-To: <20250118031145.243104-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:34:59 +0100
X-Gm-Features: AWEUYZlTbmZNXFLuAIG7clgvEuMK_8C5v6IB51lMqv4nWoj4Y6P6R_UYsPx-1dU
Message-ID: <CACRpkdYxpy3QbjRD5drxD7E7pO18amSvKHYukfOPmU_fp4bRPg@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: pistachio: Remove dead code in pistachio_gpio_register()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 3:58=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:

> fwnode_irq_get() was changed to not return 0, so this check is dead code =
now.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Patch applied!

Yours,
Linus Walleij
