Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0945256C60
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753234; cv=none; b=ggED2uxiF1K+wBjuBcQG+JESAkNuD3VGZixrQEeY2+TrFUgU+yTytIHwKmpEzbyjO6Gh4gp/KnNYdUCRtY+slNpR5CfM8v7Zwr4v2doC+6VhcYe3uc49KBUI6X3kSRwohBXn2j1pHbMZsPpl5yyuOvozyjaOoSM4K8zoMGy3YNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753234; c=relaxed/simple;
	bh=54FlDJnOJb1JJqdwaNPZ3tcJ31o656EoQ4mYBYZWrWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cez0tp8OZVJDBoGryaz3/FbGrqIYNmZVvD+JhsXSzQpptbLPTpTmfSPYdjdGOWtuH7irbEFtCcIDlNz2nW0FZfVEP5uAdswtoBEAXhdnjbWXR5pS/RIxQtFUSElpl72JHinondICBJYjO1gQMwNCIwTt8+bCd3mP070kFtYg9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWT8dXj5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWT8dXj5"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7622012e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753231; x=1745358031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54FlDJnOJb1JJqdwaNPZ3tcJ31o656EoQ4mYBYZWrWU=;
        b=QWT8dXj5b57DvkBXH6MZYJGXW4PuGgdqQhtW7bzeRXkB/OFOuX1nNaGmh1Thxbo19c
         2M0z4/fx0pwgsYU33yDmEDnyJbEv7zS3eNDnQ2LYIiPpSpaztVW8yhn+e3qIGF/n6igL
         jiwfEnfVpyIqbg09lMu5VGdHyoBqPkv8SEUx7B1wK8Zv7KNCc0GlUuMzAviCPL7kczg3
         uJXCeXVDLr0UwmKoVqzXimrsO04AUTP5USZvUjWeGeDe16NxHLVpbWGuszswXgSYjTFg
         Up7Ydy2asRO14fVvcIJ9UkVziCbd3uaTMNiaxAsFsosIZ1vQTSm32SMHduGaNvPWnST0
         7UZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753231; x=1745358031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54FlDJnOJb1JJqdwaNPZ3tcJ31o656EoQ4mYBYZWrWU=;
        b=LBjJdulmWdOGg/IsFpqnlpRIN87ACNeSofXOlYUeoj4BeB/cs676W4jnHGKP9NSpL3
         7eGDVCISseKPUE/sghwzwJGrgJBZoRZvsvGeB90ccXqgtJVRYnLxW7es05An33ZvPDEH
         m2i4rVV4Ui9S3fUvkefGMIok6vDhYvRY4hOqJaHUqiVHUwRZDV1gGFZPXzS1mCC0KHTM
         Yqq3/w+qkOPy/kaRKAtC+Wv7rAyCyfrcFlMabcc8XeGXbtljNveJbvw+YvebBuOxZ7eI
         L3yQgeW7vVvB5yClLgSJSeEbwtYyrTZ7xtQS3VS2C00IzP6gZt4y7GS1DhPSSMU9wTl2
         djcA==
X-Forwarded-Encrypted: i=1; AJvYcCXz7ahku640VbxGe7IvG2e/Jj2pHZqHB3bH4dN2W1TFMHhZ09KVFRmAASUL649uTGYuJeg/DR5X+x0+RcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFuECenFNrVbRNrDtgyhXoB+TekpjZK6oVZE30SIGyqrr7wFM
	LtyOnE0EmUdqlMuvLXHB++EIQpWXu+lsKhqmRFv9KyE8ARbBKivb4IoNhRyiANSJCCQ9puEvxL7
	QPLg2iDmn6IOmkH3gkapplO630xZqaLlCUF8uqAha4RMh1h3q
X-Gm-Gg: ASbGnctFEUYQcfETOqSIU4iMnh75z6eNt5n9oApxuII9ZZ9YQQZ+QiR8YfhuRLMYCq3
	RFJBiL56v810ZIRc8T+KJHlUIMr5HIUZ3Dct+YDTQbvG0Q2H8zR+ddJvr8fONOEEZV7Q9hj6clY
	3NTSL8sP61IN0SLw3v8iuPVuW5UswaqWbF
X-Google-Smtp-Source: AGHT+IFO2L8W0ybEifIeQVLc8kNA1FEyPDssmRhBeFf/k+lAMRy7k5ifx2eCoSwPZM/jDIE33fWUWID/DeBhanitmvI=
X-Received: by 2002:a05:6512:31c5:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-54d6053a05amr147368e87.42.1744753230792; Tue, 15 Apr 2025
 14:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:40:19 +0200
X-Gm-Features: ATxdqUEVSGM8r-c3Poh961wOBwNSoBIrlb3kf4YpNrhpsuSGeWGlr-u-Otg_x6A
Message-ID: <CACRpkdbtKqVyAaYFKhnd5B2hBfpc8UxeAGv5dYTmRjdXNxgabQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] gpio: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> There are some drivers that aren't build with allmodconfig that don't
> have any requirements on arch/ headers so make them depend on
> COMPILE_TEST and extend the build coverage.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All good stuff:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
