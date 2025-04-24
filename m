Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88BE225A40
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484682; cv=none; b=Hnttu7BLfV0YTQfUf22pj2jsShOFDLLeX82rpY/91Pf0pRTK81ct1z0Abpx5SpG/BETM2ppWQw2XMgXl8HZ3g6xQ/iujLXj/lJzKfzXTh7B2es9JoYOKokdJDT9kg4CAOAmc09EYchJmIo+5iFTCCxc7qfl18Ktbfx6RzV4/eds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484682; c=relaxed/simple;
	bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DftalY2amx5t3qsYSmsJ4wHhf4WwgwDokgkkwIHlGQX4lQOOdoIVj5qCJi62rALUHNUOaTSxABkRIMQqDAjPDjt1qiBXYTO4SPqCRGRAQkXWLNvX5LBW2Ae6Y8xlDsB/za6u3RKdgWdfPLL1XenqmcmZZYW/ghCTsLPOSlrCxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVV6F8V1; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVV6F8V1"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so8425621fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484679; x=1746089479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
        b=EVV6F8V16wA/YF7LAuKZs4BxHwPIt6sB1mPWC/guD5RcoZOuMtxW/jo/+WFavvXhAu
         SaXtLeRvpYnQAqiiF0GIojHPwXOpFnXscIpEG+Brn6cqwR46c5yRw2LgphPSkwKiiHKI
         uuANMD+BmeEmX1cStdaboKJO6hh+hRWBH3LxZsvWPVAxAF1HGjZ2o+sh1lXb51C6UDxz
         DPKDzojpxr9p+VJcHXnDbXygVHn4b9qcbeDFAMrL7Qj/CzRqjuDEfw1ubpBYQJLMRkDn
         TgcVwFBpxqKFscO5zmM7+TS36EPxcNTt2ZVMTtXd31fExPnwagUGTYyTE7yp76zvFvmY
         fUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484679; x=1746089479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
        b=E4vz4m4Gvw+xHaLJIhlrvRAN3mRh9WUWflFJaSish0FdcNvmV11Lty4Vps+7Vwlur6
         2iURKaJ3zSaydUpfxwpM5c+WpARcpWg9kEuSSCjFqcbLrqlsGZrgN7OfTOslmSNab0OG
         pQsA0U8urDEAey2w4iv8D1brt5cbOoq8yheiU2diYm6AfEiN7Mrg6GRIW9IUpkwzVXhm
         osM6wyctUHZv1ZIFreaNlfC/f4V4EgspLHrcJsBV3amrYpVNWUeoDcXqL1F3HRc7rxEV
         9/Ec0/3e3JM0lVcILFccpqlor6qPaPfNcY1bRiyWEn1pO+IOUR7iHN10cSnozjgLCR6s
         t5xA==
X-Forwarded-Encrypted: i=1; AJvYcCWMSC9e9xdZUnuZQmDCCunfj1SPPKa3CEuprCAJfvaYYb0GRNSUjAn0RfyWPa0Q7WyKW/OLqXTs6b658oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXcm5gYWAw9dnGtGxKm+tKKU5DfJmfJFvZDTz5aTyQ/stbfIA
	Piw19PGtMMAK1VVzV5BmCoWuYMQc0ekeMMS9AjiknD3xARvoX8zGQl8UklvO7K5ISNDDIxMcf9n
	C/cyckUpr1PbIm+DqO3H6E3qNVVQmSty+mbFKCw==
X-Gm-Gg: ASbGncswz2GOLOPaheK7Z0O4ljHZLjB8PWDnOir/tW+Fjv/Z/zgOqV6zDxEgh62munA
	ymj2fmt0vxiGzwlBuE3zhir4xdCaiL0MZjxaW4joNjYiBk/Wtk34M0HCr19lbzxNlDaKK3ZHSVG
	Wb4Xn517t3Kz1zD2d58W9sSQ==
X-Google-Smtp-Source: AGHT+IHVUjEPXYrY3sHIef5LKhQER52yuzf898RP4j9oF4QvMsHg66AhVu0yfj0NhwOcjO4n0yujHvjloTqfizgTfb4=
X-Received: by 2002:a05:651c:b28:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3179bd52581mr6677701fa.0.1745484678572; Thu, 24 Apr 2025
 01:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:51:05 +0200
X-Gm-Features: ATxdqUHVq_nL22G9xrtOjqSrYO8fC8-z8I_XXvLVBIP2wzvRpiBlPgb7WiVSR5s
Message-ID: <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:20=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:

> The JH7110 SoC could support internal GPI signals to be routed to not
> external GPIO but internal low/high levels.
>
> Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
> "pads" to represent internal GPI sources with fixed low/high levels.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

As per my other reply in the previous post, I think this should be
handled internal in the kernel instead using a tighter integration between
the GPIO and pin control parts of the driver and utilizing the
gpio-specific struct pinmux_ops callbacks.

This solution looks like software configuration disguised as hardware
configuration.

Yours,
Linus Walleij
