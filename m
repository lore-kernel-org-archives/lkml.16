Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5A2820D7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705738; cv=none; b=JWU2LnVRMqFWx956vMVCpLWWqnU00lEnawIO1cosYsaWOMesMYo+r6ynZs6ad2OWE7Qx49GcAwTlPqxKgHy9zMPLW0QKx0x8bp4/WPV/sWcXH3VWKQT4l+qUncChsfKRAPyacI/Dk+5nHuZw+wwNXGMxI0Z+VNcJVnVmKt4/cHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705738; c=relaxed/simple;
	bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0veRfuo9SsFbCLx2kIFzHYeFrsUZQQZLnkUae4JRD4NkoepnvM86I7cAFWYBTB7eSdO1b0Us3Gw665RZ5ip8KeGZAfIi0obd2Nqc3tkZIS+uMJO/XdOCZQxgYdBE1tRV4DWgI3QMg5wORbdAuGgvzZigNjqzgjl5GYv7F3aIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2Nxzd/d; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2Nxzd/d"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc04516fso5029341e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705735; x=1745310535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=l2Nxzd/doT8Rqhxa6oEYVZxmArAkE1Ihc/bsrDpV1OlOPMbDCkYxTj/Q82bHjMu+M2
         1ZRD/sOcbxOlDVFP+q2//Ez51ZI9VBtkCCM49gbherZHwCEGP6QjmGWgaaBmoCkC+bQH
         eXnAAHthvnZJYS+3i9SaJnqbbyO2YZwCFoR7mFxZW8DzUS3RxRF9SK0PzuAou68XV9A2
         IJeFW4K4vPOyXcbunAQA5u+fQKthtXS6A90JieFkSP2c+44DMc2r1LnSd06Of4pY8PuI
         Ag2pAQ895bDyfXn/41dstcjPKtBbkGAM7cN47kXYnnc1BA8FTmaW+dM5YmiYHo4BZYm9
         SIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705735; x=1745310535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=xI5VY62o7s1Oyj9wJQ/MDlXErCLmFPI73n9WDPA3Oj8c3IzrpFYkVlZb+0p9lprHFR
         Oh/lNQbFMPz1f0cU+4Qdjb4krrjNZpnFNl+ZY4Ma85pwz8D8T0ooHLuzxEH4cQW7qspo
         0dLyZqxICTrq5HfE3chzfGuxr8nsWuXw9nVSZcsDBOexk+q5Z5E+h12erh6nHhBY7MnX
         DBgpjAV3dBQrV1/Jjtnl9vr9iOK1gwdGcg8cDqsqK8JJAwRZ3KLFnlM+WrYHoA0uh0R6
         WPQ8Dfx0Tef5PiLot8sQLaM+w5vRfzxn3YfV7yE9nFT85DX+3wx6Su5QCHfbNyqtG776
         vv9w==
X-Forwarded-Encrypted: i=1; AJvYcCVMPdiMlr0E7BlwRO65dH1+SYT4uKaK7acsKRGCkuA/9zBw/d+I2UoVgyfWlHm+4NrMHzmkNDswee+gPfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3rn0cf9BOtZswjkRRvTF7XhGPs+UlJmxP2QjG6H1XDsaOfO+h
	Ooy9RkrNOjhTI7lLelc3g9/RHm59OK8ZIkA21AQIfaGZkAyyqqFBUZtEVligX+Yr2puAuq9x5Dc
	1kW8lNTGKWJuMa9QoZXMod0KZYtafGf7SvBRC3A==
X-Gm-Gg: ASbGncuSRqWU/lwQvCuxGcD5bfy1q7EFrceqFO9uP3fXz0gdQuTzedUYymcK3H7hhXD
	1iLwUTSgBmAGD3Hzlpn4pyV++D7ZS7aRWo6LB/uCRLlf/lbHB3eleE/OyNFqheojc6kiqxdiKUV
	q2rES2pfWrkPNO9Eyyj+Cthw==
X-Google-Smtp-Source: AGHT+IEBR/Eqg1kLWWGKh12iJhnCpJzO1zCgcGoecoiMf/umaHeT6TJC5jiC6GTZwtMV/nPtynCgaCpBpVXSKQksMUI=
X-Received: by 2002:a05:6512:3f12:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d4528b940mr5354403e87.3.1744705735088; Tue, 15 Apr 2025
 01:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org> <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:28:43 +0200
X-Gm-Features: ATxdqUF6Upkgm7Rf-JBAXjYSrKlpy1hvmNwsxlcKu33EviWPUC1nvmMY22JHIys
Message-ID: <CACRpkdYbcbcbLz5K4H=dKdGfao68LgacASLnVF-bSYAsmhL6iw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: scoop/gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
