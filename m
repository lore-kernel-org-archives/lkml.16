Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1E28FA8F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142735; cv=none; b=Q64maVG7M0F/YIv/ds8EMwehgPKJUGJtBthoReKi91tbXYRflzl+Z2THJu/8SI5Kx4XI2Fwrm0+4XAG+QLT2dbS1badfN4DuIoUW0G6hOihZOp/IW5AHDh5ppx8h458BivBFC8p3q1g1VUR0w7XLaPPwx4TfXhT4jNIVN0yv2KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142735; c=relaxed/simple;
	bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTCari7OfFkicWci8BOB86JxmrTFbp1+EeYHY5X4RHZcp7Fa0alUjQ/IWpTLBO7xsQQmdlmEHQb2z24m0BCp4Js6+pU6X0lHNDOsZt1YD++b8UDebtWYe21iCBiGgHT1WB0GvvvlsJM4uAwZaQJRQVs6fLagugIAALBSnFPiCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i/2LWdbn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/2LWdbn"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso5872024e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142732; x=1747747532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
        b=i/2LWdbnAflcM5SZ41RLSj7y1Jw7DUynh9ewjfOfjYRPaRzQWgcJvKHN5Cft4SL2rM
         zgGqZTiZkoEvBQURAWM3ZRTSa8hWb3EaCUcZGXm79YVpJ/Vt8d+mkTdtZDywVu5Dhxxb
         dTrbjFccTfPvtRuWQ0nozj0ulwV2vS8T8cV3y2W5IWH7NiiVHHDnLYNKWTsI/tIuWI6r
         eI3/7CP0EHm6xCNt2e4PAj2c50WpQOzptxqDavL84fVNlDXn+gSJIFWX/hHf5sORnv3z
         DFIAot4XvhnAL0D8N4mfLEVdW880gkr2bhaPwDJWD/KwjC0CgIM7me7D5d9cd/gudOtc
         QlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142732; x=1747747532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr6jWP48yxMylfuZaQtdjlPFLP+Sk0yvaEXfr4dRZmY=;
        b=Y4cde15lc7NhZJMV2SHSGzIxuneZox3bnYVekahRt2A+X/GBtYCzcuE88IQnKZl6kd
         5d3g1YpvUKswM+titbU4KYfYArq6frbuMnpA2jqThedMp1Dkzq397Ab+Ytr036K2daYF
         XswfjAssNpCtYAUf5+G/InOtTfzVP7JQvt7Vg1nZ3SdBDPstfB0wlTs/D6tn1Z4wj1gm
         TGluwmXR0nP3djvzz2joqdwIzkz2TY4eh5v6Ax//6jkxS6A+gjGY5ZrOao0PdHa1K4GZ
         XUl7YF0uxRIGhaMHweVPEq19Jr/Pmal/k6ca+qDMtFoBFH/UA5axvDeQnw9kvh8ljTjZ
         VJcw==
X-Forwarded-Encrypted: i=1; AJvYcCVdxQsQIhOoBqwq57/lUm8VAGn4kdbpfE2Z/aV3LBPMG84KTpQQr/oKu5YNS5czT9OtQ540OAWV9T9UkX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KYdd+Jyhjkv0fqLHFMi8l10ZMc5M/FoogoBi7Xub/oN8LvbJ
	zsrglqjo4zp5k7ehx/xK1CL5LNgD6NLPAjmSn8PB6oo87g/X+R48erMdRn6jRjiu7ERfZJ+jTJz
	eJN6aNAyVzqJNN6tA6clxQsDdxJ02aib/1yTJwg==
X-Gm-Gg: ASbGnctRbO9T3/1Gcs31SRSc5ETSzTuKCXvrObnAzwtXf0z/ZVOo8KXnOI82mQ+odLa
	b61oKIxeZZOoE6tkSd0HuXdBhrsfFkZOVxIcfnx41TZKuRl/Azt4I5O9hki0jpjry5tr76Su1w7
	eNDRJORsfFcLSBlqX/MvXUhZvvklBXFnnK
X-Google-Smtp-Source: AGHT+IE0uPHvi59GKQReP0FS4yIDYcDcoiE56BNfoi9s0ZtA39+qwHxI+HlYyMOtM6ESsG8BIrjV3tSi2Mg5STR1bXk=
X-Received: by 2002:a05:6512:4201:b0:54b:f33:cc16 with SMTP id
 2adb3069b0e04-54fc67bf61dmr5906057e87.16.1747142731593; Tue, 13 May 2025
 06:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com> <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:25:20 +0200
X-Gm-Features: AX0GCFsgSRMFDJQegzrwRWIt-rIi0vhgKArb-MEwIUl7eEY9iod1pr2LmbxZAks
Message-ID: <CACRpkdYyaTaXcz2zdM-13vXvc2JKXKk75=XS9VELDRaDA6=R=Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:33=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:

> From: Aaron Kling <webgeek1234@gmail.com>
>
> Add optional gpio-ranges property.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
