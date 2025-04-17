Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A60221F38
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876465; cv=none; b=MwYZF0GRmtYzkgh0+62eL5ZZ8K53qmWBtcDPUaplaHaOHLopqmxzQVW1dq7yRXsmIHORI0lD597rWD9oa2oHqHhQ4wp8QXW1IG2ZHXsiOyKrOE2DS+zknrdEvB01NOeExnxKgzORiPsZr69QYMUjc1pkkmtCF5dRW1kTe2iz83U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876465; c=relaxed/simple;
	bh=E+cWvRpOzM9EstZTO323diFURQBH0IhB5f0XPl7AxQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdYQPA2rso64DYnflJ7q+k5TFoQwAQvUkGSs+r2/W/oqekIt3vQCdip4es7jRR9MSHkOXn+BL+2UCicc852soFUf/VoRxZ4m/mTPRR8EL4E7zfyDMEUu8ODI5y+JgydNDG8dxATte+LtaiPmzjGPVefY23w5C/m27RSLAkVePY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ok8lp1SY; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ok8lp1SY"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso4566731fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876462; x=1745481262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+cWvRpOzM9EstZTO323diFURQBH0IhB5f0XPl7AxQ0=;
        b=ok8lp1SYtv3BvqSo5OZDAEvky+VRxYhDD8/IgRMUI8ocqnto+ScMpPsDbUTLK7ae+I
         tgGu0K92qsXmm0iWNQg0zpCiz5Zrlw7yZiA2fFLhXqhPxpjBO0fiT/gaKXzVqMZQ+EyS
         4NN63AvS/M8jaFtLF0Lwejt3yXQ7FHkQwxejhlKUYr914gar0SczVgx9o5LdmK2hJDQL
         D4ZfihM2NnWqsOU3LoLixs4SVfxSQiq84oDopmPDpX6XLoZRwYpew+GiNZ2VxuVp83BM
         DVpfqYTRB7YRYwCN8qY8MWo2uQQK+J2BpNOlcZDn/4Ltdye3aJUivhlCmM+I69y5l5vR
         rwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876462; x=1745481262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+cWvRpOzM9EstZTO323diFURQBH0IhB5f0XPl7AxQ0=;
        b=ErnRgEJ2qQaE2zHI343P9HNMyqtx3O6lxyDzi/AKkcShqvlnoj8OLtbhuwS7AwwM+8
         Jz592RwHPiZk2rZyZrZFGBLgHxlTTw1KjecPQgh+c9IvVVSG5xxVqkKvl97isYNZ7cfQ
         N4/Mpu4XlE3i1xOj1jLHQd7PSKa4uR2soZCYABVLIu8fwDyCYomxcEHG0ZcmhsoviI3C
         3g/5KqdBTtOajCVkHnMCPfob7fTK8qUXXPDs2L5wEeI0ON1ZrLv9vaanXgTjo0CAXdr5
         ZQuSnoE1cxUR/LUO9U56lrMopjEHrcowhA2LDolk1lhgWjmJ9FclEoOuFtQqE1VXGRC8
         Jr2w==
X-Forwarded-Encrypted: i=1; AJvYcCWz2fSkjuuJYqvhl/CbHIU5v9tpXyWxBBskzYUzvXxbSKQF/fxZ/bLq/819QGW2uzG6eKc1DcleMTVhrF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHSvvfcm3Ru/76u/KqPoGyudJ58zFLjFwTHY95Sup8XPePnR+9
	C8qz8j5Qe86iHiivnRekiEiy8zxTYtn/F9rUhBf/K4uoaHyXAepmcU1XcWdL2/Y6xM5lIvshLM3
	UEebbeYSKbes2r6bTAHbJ0c8n80faUv8azVej2LFDM0xoFzmQs7LGBA==
X-Gm-Gg: ASbGnctpDp9GnpGajxKdJ23lacXNrQvuWJgjMNjBeU3wXhjR5o//k83t1N1U8KdYtNK
	UqSubRQsW5B6iV0fhVbb6QZRCWEpblHgxJJFUeazrhI+UGTJJRm8WrPqaFc802569Qp+oD0KPhb
	XJlOY4OBn4oDx/D90d4NLQ0A==
X-Google-Smtp-Source: AGHT+IHeqJeA7DLUupABa8Ud9e8YNgq5BDzGIh8Gl+Y3crjuAsmKNnt9rdUKa6hE3OKThNH3SD7pCBac4LH40fduHYA=
X-Received: by 2002:a05:651c:1027:b0:310:85ba:113a with SMTP id
 38308e7fff4ca-31085ba14b3mr8694171fa.34.1744876461879; Thu, 17 Apr 2025
 00:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:54:10 +0200
X-Gm-Features: ATxdqUE0mas_9VNdyLCcassuReHP3an8fD_wRL7nwRWQ3qMb0NZy8AdQNgx1WVQ
Message-ID: <CACRpkdZfvxo8Xt7nkRd=e_a+q3Rg8G4BQ57JKOWqjpXQ7pRoqg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Using devm_pinctrl_register_mappings(), the core can automatically
> unregister pinctrl mappings.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
