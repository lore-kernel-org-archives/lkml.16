Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4C524C095
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753886; cv=none; b=DWKK8/iNG8hUf7Y6WEuOrbzYptQOxv6LAwppXpEFZ1FKCEzgTBfVFjg9WFcgQomqF3RS6KU1ZcByV6YQyrFvegSuaEOzm79SV8C6rYokf/vW8ga0L0cPJ3f3oAsU7BUlQ9o8ZgWJ3srxIIrEr+MActHxf3FggChhpGx9VJ7diO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753886; c=relaxed/simple;
	bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7SYLj7PJE29VxGBSIx/ovFD7otnpLNLDK4x+7LiowlrtiRdoxqeWlhwnOWY5krWqa/zXPZmF5gxxsMTJkGFtYw3OaPUE9XWw4pfaU7JtC6a6UYkrfgsHyMuMX+kImYjJdZFGheE8tQ1+X7FmmyfVr0PkwudPDwM253K/uZXvMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUhbFJ0E; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUhbFJ0E"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c091b54aaso54433951fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753883; x=1745358683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=HUhbFJ0EVgzw1JsV9pm9Cc1a7Qy1xFsoE8Gnuh/wFUrKa2+UXZ9YQzps6EZOlUOx4R
         s/g51R5dpSXXqKBtTOcKzKux2bOUJWU2LQxR/89OPQ/ZHcbuVR3Oa0NmdrtFF35EzyVm
         +XUrITtmXkRhgcP6+SL9x8Yb3n2BPOLqB0treIDbWPla/1z5VIhS3g29/LE+tpRDXLL3
         zBNNO+IbDfqRPb/W1f4fXqg4wuBIwg3ED9z/Cji5hnCx/ZZog22jqIQu7plazGZZwHiR
         NxQDxCAMfIFZ45jxGAob1NIF6zy5d19sAi4en9KQFXtU7afVFZpum4IkJm33OHzURx3t
         HWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753883; x=1745358683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=dntosmYaWGkIARid/ay517SIlFCtHogRNVxvLZnjoSdewSET6oklqy2beiE+Vis5hK
         AV/EQHp4YjW2e3hIj/LmG88fQ08wOcmAQIQICBZbAikl9NIbAvav0FqJVN1i5nC/ybqt
         AxS98cqzO5mnNZPPSzeZQ6Z2J5+VjB2IThK5FoiGtSMmexFJu6viEflkaXr+4IatJkdL
         Ed4rr2o8c/g7j1h3j/tBOTSnKGJXjms5V94jod5PV4VQDA+5mf3mIuPTZ3G6aNaXVkjN
         CZA0LLDnflfTZyEKCsfouk7Lxn9sCzkdmMsYZhSri6jhCstZJfzuj3dimLRL2QRPv/kD
         sdqw==
X-Forwarded-Encrypted: i=1; AJvYcCVRZB+2XwXnpJA44mp07gT6Kg9oINCIr1s/GgmoQmgDr3oF7S4jaJns8MbM1+XgMpqQ5ZvlTx3d3F0J0D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxntZ7hT8AhNOqwRg56aJvfmjIJkdtn7Jlj6fYIo+e3nhUKvXC+
	bAeg+LvO8RnOfL+1fCmNh75LuJ2QUtIp/Qez1/lrex6186LFHIW41Z2Oq/sMnjfvgmTKIdGPMgw
	SwaXBJHOTFs4pzRIuPqA9N17EH2RrNli+RJks7A==
X-Gm-Gg: ASbGnctZjkDNg8sPIkKXblkD8BIO4EUeE06CPH3vvzDYmwVRoQajDXErf/NqY1mdBQI
	JTIRqsg9sIIahpQTuRBJJEjNcqLh46IW/ml2ELs9xPIsKdR+W2KKwQQBExlgp5OqhYDyNXBnLZE
	6ugaQg89AlgYJJ3SdgCDXN8A==
X-Google-Smtp-Source: AGHT+IE+SjMha/CZz83kfgX1i08yjyxNG7eptNKiSQYYkbVSYeq+ymUtDU3Y1AnfUH+BRzKuxxYHdlUfXnhngPqHcSw=
X-Received: by 2002:a05:651c:312c:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3107c317096mr2201201fa.32.1744753882880; Tue, 15 Apr 2025
 14:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:51:11 +0200
X-Gm-Features: ATxdqUEmiDJHa2dZ5KaNyPxwhMUIOlqcAcBjWah7Z2DVmgltPvawf3gtS-j978M
Message-ID: <CACRpkdZ9Qiw0f=BVpCjOj_28=eHcMEO+UXcXaqb_o_2-YSYMrQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
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

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
