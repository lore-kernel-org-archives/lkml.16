Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC31A4E9D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248420; cv=none; b=SlTNTaV94gd5MqjZY9U4vYhYe1aXR6fsekDMrepNyL5dkvq7KAmrS8X75AkurIRk+UUfxyZ5znhDE3RekoqjcRUfu/cWLTD1z0foIdds86+HlwYy2UUc4ndBaRs3/NyeHMk8WY/Su78PWiFWERuoTjM/KY4rEc0N5U/1jgHmcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248420; c=relaxed/simple;
	bh=KFHZaeoSODTEpU7abDsNkopP6dfWOtne8XjI9QfcTGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WinXF9e2BsWDJHuvciLqMXkjlDRhS+hp01px/oIyqFoOg5fI8Oq9oI/m4etRkhnNIlhB5BJyMM74B/HbYvZ5nLjVZWS1dKmHI9KmPsoObiEGBd8DLx86xGtjmTB/8l/HRVyDUrNggjls4W/Nzm8x4O+P899r+52rF6EVMlRYDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOn8JfW6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOn8JfW6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b60de463so5258339e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248417; x=1750853217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFHZaeoSODTEpU7abDsNkopP6dfWOtne8XjI9QfcTGk=;
        b=dOn8JfW6rPU5o1OtrvPEfcCsS0f7A21HlTip0OVLHiYQnnfMT+SAdzNA1CDvUvdn1v
         RdMQSFVHjlaATusdFJ3/yMtxpAVtNPnDPCX9HV6j++1YP6UzjhkTghIme1I8RcnVJv5e
         JDQrQTCO2drc6ODHYfMeDlKsGE1z6a0uj+O3wSa05AJrGe8seX3ef3UNPplp9Ao7g0RQ
         qjso4SCxBOzRPNLv65egwY1HDZkU0E9KNMR0EFHrHiD9TmS28GgRM2+rB2m2okxL444g
         U1Rf5RhETgtxXuXW34h7Z9VzuPzhcs6xWZXcxAwZ3VfGpyaWqmfd1VCNajWEZDuNParb
         rF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248417; x=1750853217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFHZaeoSODTEpU7abDsNkopP6dfWOtne8XjI9QfcTGk=;
        b=dRk37eeSA94+CBynKy0XWIw8KKkiHmzRxgMOzgjggrjQbgYaunfzSzWdLhX1Hp0CUR
         LVeFC6spJdO/L6DQbUuekkx+aJKoJKQE9hfs+8WOZBdSfT5xy++CSlHJ+M1bNNNcZwOZ
         j/Y3SMBJrvK03E2L9XcIzHj4N4SpLMjysN/rl76mtGB8L9QFVrQlEzkZvCXYF1j8KkK4
         DnL42lKlwXykN5lkSkl2lrd4PgTpzhQ+CdpSFVOse0iSWSyidSMWXWv5aKNLgzXl9D9r
         BMMUSuKfIrpDcjoRuILUVjnl00ZpREuBZP+9v5Y07fniCNrHP2OuKqxQc8YcxrQBN6kS
         uJGg==
X-Forwarded-Encrypted: i=1; AJvYcCVCZYrA5McNC1SPMXqUd0GC6uGD2nYGGOwQeAWIR6XbAOR7M5aBuzc87eHc/DAGzmFugp/6lU1NKY+s4/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK7mPgfP15RuwPOzBZYEpVoqJQTdQMKlQ09950zUn+4nr7zdiq
	qJxqqHfagEdQEkRHRKgnzZ/bsEsU+fA8V6u9GS2GrC5PpvzAc0+IwxoA/23QdKp1R8mzvzkJ8C5
	ThMeQBGGwf//fv+7w21185CvAF6srS7jjqTmB/23b9Q==
X-Gm-Gg: ASbGncvkzqC/IxiFkckF5+DKUs1YgCOcwzL1Zfudn4xJrgeVja6So+lmN9RSzSz/Wtz
	q/lVbMfL61stHYcsdCNjIqBWuhzbclaf67oe19pEXRhTI8ZWxBQKPUnj216ta+jrb3g3q8bGwpa
	PwBBkqrjBWqyMsKstzBe1McOikw6twY/mOcSfYh0JVfto=
X-Google-Smtp-Source: AGHT+IH0hkYwujstsVak53Kxlho+OGvd4fBBK2SWPVddaXjsmXuFYkeHqZ0gexkWXto83mQYdFPMw4Ypaa4doACgPm4=
X-Received: by 2002:a05:6512:33cc:b0:553:246f:d5bf with SMTP id
 2adb3069b0e04-553b6f25286mr4854168e87.33.1750248416981; Wed, 18 Jun 2025
 05:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:06:45 +0200
X-Gm-Features: AX0GCFuEEij903K8x578B-AsyVrv_BWswNCIUS18yLj9Vvd0FxlSIuai999Rgxw
Message-ID: <CACRpkdYoYFGNeATvJGh2bATGwrp0miLgYuMgUQcPJARk4M_QnA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: starfive: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in starfive pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
