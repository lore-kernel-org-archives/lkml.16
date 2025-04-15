Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1FB274FE8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755258; cv=none; b=UpZ+/wg1quW6UXk3kKyK6+8XWBa5D/bIEedWtukCjTkLPc+9lf2UKOY1lJFCHtQyCB/QwKMj9QPXZpv74smwYshRu+A2kyLOmDbkovXjXmn4FDdaLeo4pFcV0luWjv/6jQExccENXHHsW6i177lPM5HYHzIkq6t9W80DrR2zg/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755258; c=relaxed/simple;
	bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiRxbOjNph7d2I6SMFUiaLohNDoqdhvGmX9oBz3WjNz/k29w8HWO7/M9hKLxYle6f/tZjgiGE6rwZR9WoY05nP31TPc791907Y/in42AOcacMDgWKzGwKusNQLXCztr1b7K2mthKj/0CO1o3mT2SAAgBYnfymytec/kJzsof7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJ5SQiNz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJ5SQiNz"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf1d48843so52013381fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755255; x=1745360055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
        b=CJ5SQiNzBkWr7VDwLF4XmMgwi9uA/nJkucF0dbjRoZMF4KOtqHsmlzB8VguusGNL1+
         X26bp2oeqra77NcXY8c3QhJNXCkbRWNKpOedNTWTWd2SBmKNxw10NfN1Vzc3QBjuN7Np
         5jGEK9y34WY4aPivStMFaZUMFBTdvjZ1DZZjPiKI00p3AWIN4J8VSL3uN2DEvLQ2px7K
         X3R5YxCymYV01n0xQRtxL2noZ22C59n4By6MeJ/3FYmDDtJ8JtaW0sqSL0hQvUvAv00l
         6KvJks6pKQ/LLTl46xfAt0c6Iz/xg8uarK5P95NJhBrvaSdGZKC+JoPoXbBesMf4a8f3
         d90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755255; x=1745360055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
        b=IwzvJBVUS4ydl97yQXJ2mCNBTGuUqbf+ebVlvOyEyyPi9xS6+epXDMAOwSgGlvDWA7
         1rgu0a4VhIS1WbhL7Cp444lXwdtTnFKPdgPx4ZF/Qf9JCeZ7F9fWk1yKT1x+p+/hjH0+
         WMm0Pvmy6xs0HFVJl6smZdeenaMESvN9mwXhHmrOKkVACHJmXyC8gnLHE7UUeQhCdW/Z
         MPckiSa6xJOIqEJPm/5Uov8ehuwdxHuY7Cs/BrPGH0j6e6rVRrhqoBNFGcOejyI0rkZv
         rh1yT0233+k+Qy6QB4PlGpCWlLX02Mo/cAIHaUugU7LgQqEliobg+C6KppwtMiRntVLn
         BElA==
X-Forwarded-Encrypted: i=1; AJvYcCVvxJo/gW5vbR2H6IMIsROyuC/I/Z99ZjZbCkAQ9ERKj1pWJpatGluMMTWf35ffwqUnvbSrBg+YLgfosDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFxkD99a8mRwd4KKXL7FTyNASIJLaF4bz8vIcufTF8S5GAiNR
	bNCqnmY5j4DOC8SeWe6DIyYln1rXYFQv3bxG8aBhWiLfw0F24lNJ08VryowhykLG+iSB3ecRXjT
	4R9p0SIzyq7x52FECNum0GWPQq/bA3wuPwXD3bQ==
X-Gm-Gg: ASbGncsDEyP6IabFzkF9giel7OnCeNS/Ft6zWvZGent/cC81srNoNsXP+ddOplGpj4C
	w/mBz35nGS/SB/eG1/04du9Fds2zHSxH2FN/wLVFaJEb1lJv83sJ8v997iTa7pX/sg/XQm8GaPa
	NzN6PGKXA8dD3DA3ISjYw6fA==
X-Google-Smtp-Source: AGHT+IGBF5IrLeLXzWpPgufuoRl7LZtgwhRspRq/qCcnRj1V10eVXuTbFOcobeERvTB8phFE0DlLxPU9lGc7Ecpbux0=
X-Received: by 2002:a05:651c:19aa:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-3107c35b9e8mr2073651fa.28.1744755254887; Tue, 15 Apr 2025
 15:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:14:03 +0200
X-Gm-Features: ATxdqUFlFg0lGWI6NSoTSJm8tZcs-_N--2yxo9MXcXcFS8VRrICSZBjqn1olmIw
Message-ID: <CACRpkdZyqvQi8NyUGOhrN97g=jOm5FySeTnL1aZ+TZtX88o+ug@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 11:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. Convert all
> Qualcomm pinctrl drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
