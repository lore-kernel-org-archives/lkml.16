Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C21DB12E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127875; cv=none; b=EJZzKn/bHohijOENAxIw4x3fcrRyVDfhZqyKZ/JVZKVjdVMF63uqjAlq05CG6NVrwvV/zQAbll6Pfc5yL2UIxqRQC6bEZrzrWFrUQ5hwUChTsw07b/5SAHObBgyUXYUzMj0FcaiJITADf/i7nMcABPCEqI2l3qa9i+Zf2inLmk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127875; c=relaxed/simple;
	bh=fYj5KQcmLHEMEZBytxHFM2PZV8baZG30rM4LCErfAUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdXYS5fX1pwJuguJtuMfuLLXzyVxdZTnQZtD3BR5XXTSu5q+RXusMuuIdJlTfm7YmPtm+nwe4gukgKLZcz3UZ/e2/0kdbVUsAJxfkBYFZ1zcyNRSbVqjQHVgBcrc4NxqcSAeAFJdIsAQHEldxMwquzzMctbbzGxCB9oI8BRnRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpZhtYvG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpZhtYvG"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-326c1f3655eso41347801fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747127871; x=1747732671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYj5KQcmLHEMEZBytxHFM2PZV8baZG30rM4LCErfAUA=;
        b=rpZhtYvGCX1OdO9DcHoF55s92TPmzmY6DdTVtCEqd334WBobDLW3RPPl2JdKKR8kDy
         m7u1SrMSaPk0qSf5R9gSpL3lvIuDZm3Tfw+X08M9S8i2gvwSYoXljbSPk1JyJS2+B3RE
         Gvg1jLkF/tqcIheNbEVn4ZzH3AHNOVU+UwIccJ3kdz4Mpr2DtlQmd80M2uHfiXgmjDQo
         wt0HKMmFtQThRVfh0dGFUAZ9Rq5nzPTI/vZqL58ucAx5bVqB8GC2bprcdvFn8ApkMUQS
         TAOY+tXSfA/Byvx+CqitUk0tG7PzcMLIU05ogojXI3FLXaYYkqV8IZwDJDbElRJRnMp1
         3i5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127871; x=1747732671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYj5KQcmLHEMEZBytxHFM2PZV8baZG30rM4LCErfAUA=;
        b=F9Yd3quSVfV10geO3hobNhoZNF2VCCQil0IUjHH8IJrt7zQzSZ9bidrslqHDaDdxSt
         aSlYXK7Jj/JhU4vLB2CeSCpMiTQGGlHCGQcCnFGDHxMFNvxUPVHLCTMn8VKLaylOrI5q
         TkMjQz6Ttxy0CjCcG7kmjDllfyK2l/qpuWaQRCAxa2D2gYAmoZAKU5OKXY3jPH+nNAW2
         XwEMj0r9UclN+2GmT3Y7xWtOBJprG3UKMuh3rCewPdE1LAf0Ce4Ygyk0NIr+Lx9M3piZ
         jXRIHZYK76WvDlayBE785Q/u4nDwVeggRxxnrFK1ZrYnC2WImtOMPDdGRCmk1YYGGrEl
         nYDg==
X-Forwarded-Encrypted: i=1; AJvYcCXQggbfdsjZMw17Ml22tjN9YIaDvXnQWVDSE8ydGJ5AVwuTwXPFl0kRxPcZZk+HMmAl4tTY2gHG/aDQRoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi7TZOSbUxs3VoETzpxotq7OTJ6ckioDP35XaDkwBAszts6UbS
	q22IRndvyIhTujpt78woBRS3AtYVnDRDF3LP+7031tEOOmMue3KBVagg8qjZxSS1NBJgdKVO+K6
	AJ1D3UwJ/sXEgyGvR3wC+mWtFJ9jPGdv1Xs0FKQ==
X-Gm-Gg: ASbGncsoyzwh1/5yHNkYtDI5OUxQ9iu8qZBOLtb33rtNGLoDtIkeNBD4eC9vbwBNqEa
	1ZTIJzMSFcvf9FifAc3jByhLx/+nIRmo6tzjCnTa2AiHJWJYhnI2vXGmFWweaYWRRaQBOyd1QYH
	wWRY73+kedDdvhPcif4fOhgOFjOSpgIMTRmBnXyuQgVbg=
X-Google-Smtp-Source: AGHT+IGF5AAEtxjDLnWwB2KhlBfA9BpWe7QwP/k4X0BBbK9pCsdG9d1Hz5QqjrJe/oAyVtJZCXkbt+hJdfoDbRz+p5M=
X-Received: by 2002:a2e:a542:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-326c4686abamr73346771fa.34.1747127871028; Tue, 13 May 2025
 02:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org> <20250429-max77759-mfd-v8-5-72d72dc79a1f@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-5-72d72dc79a1f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:17:40 +0200
X-Gm-Features: AX0GCFvKQMhZ-KOCmIthKIc7OzU6GLwrFz4eRraag3cmXbQnfR3YMu1flp3ZUNg
Message-ID: <CACRpkdZUTJX4ht3CTN6AuEVRgbM38Bs_kLj2yx_NwrRCryE-uw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:22=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
