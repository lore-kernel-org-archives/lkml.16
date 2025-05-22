Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CAB28B4E7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918149; cv=none; b=k26KhOO8Estl5g89MGyXSlrJekinDb3NCcP1BcjnrirXFg+JH+lLEK8LgH52piuU3l1xjlxBmRcW1RKMbrPo1p0iOfhQqQPpcY/y6N5hPTZhEhOUknIOR8z9CoMFPG104/AmD4mn4dk0VDQwBPj3meofsOX4E7PthpesaSTcP7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918149; c=relaxed/simple;
	bh=Z0gHB0HaajNHKCYvI4wM/4KBuF4dU3pH/6e4JlH8Fug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqbU+kBfE4Z3QEtmv53KhjlkXtoGOVMDoVxFZwkxb6K0cxHu9PQDutGXvHcHGiikjOlp6DZSbCjWeZ78zgsaIQQoxpiIAphLcv9gxCA95o93+hxiIxkSfUc6+LCp+1CtUQz+o5pg7VvQUNDIJW04PzKlW1ccbswSRQZKXdnCoKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o9a92RWa; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o9a92RWa"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3292aad800aso35664831fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747918146; x=1748522946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0gHB0HaajNHKCYvI4wM/4KBuF4dU3pH/6e4JlH8Fug=;
        b=o9a92RWaZbEQYf355kFx4er209zmHK9J6PloQmPpe9wSN6GxUYpJvgIOfxUdBeqkMz
         lqbgHsvs5xGzCM3BjywJMcEzMQG9NmIumS4sdbI2wWZW5/5Z9LURGhCeXkv5Jk0579an
         ojugdZyQ1noe/dv/3k/7VPlPYMyXZHxGVNjmQYJNY6Ry2IxHzHr8gMj69rj8f5hBAknI
         mTMpnlGlqiYzQF9GmvjN7CUPvbVlA+99c94pwGeDMrQViIkZvUq9hBusLRjYNj2v6Tg7
         Tdh2ZEIkritbVRbOU3gDuVt1jCmzt+erqGWmVgRePPLh/m3WQOvfd7KCdcxrOvUMUgzj
         LnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918146; x=1748522946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0gHB0HaajNHKCYvI4wM/4KBuF4dU3pH/6e4JlH8Fug=;
        b=k1+5tTnJ8gHv7vyzhonHYfUQErfKfOMDFA7PWkiEdD1HrUrvLlWm1ujJz4XSN3EdcA
         yXkJ5WcnF9K7LNaPG/0+qW0tsXvOwt9zR0UxK+pRaVbBqRlbI9kPeOTZXY9UnCUbxHmB
         X0+cf1f5Hd+3cMk571cju9YI+u++A9/TPBgm53W6ncbKiFHebB99gRibLOtDYY9HrqVD
         /Yh5Jmi2+tvADlAT0JcqR4vK2A3Zuk63JMgWah7Yw80b3luvXRW5jI8FI/8uGn05MYGa
         BMzn+pkmSz/+nC5mTBM3AQc5RzPYSmsspENw3J0l2bdOmKGS1wOGfB2UACsP6Yvzv6dn
         YcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuqpDrJH6/JeaP6JFJ6McB6gCmRgPY6h7ZPDBNrMHjKIi00tm9S1gQDxAgKAwqxYuKicOBN0ColQH7coM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyviYabHIWQ/R2tbJjayFvXUFaZqNex+Iq6RGg2/FL6fntCOoca
	YJV78+604gvnq3lU4NW1yGl0ClPAMGj84pH7LlZpSSWnRONu6gezAC1Rb7b2ba9ILHjw1JyBAQ7
	nKsOIU/nCB2gG+LMtFG+VX3951QouCF1MqJpvJntR2ugagskF80pQ
X-Gm-Gg: ASbGncvajgy0Y+rwVLiXKc6z88wM41OsAaML+mlWJET5N4B5hoU2WiS2BJQjwvJnNQa
	udf7oAz4MFC8pLbBfCkMTJ1lGBowLGJ8UBt6IuESjDnHNRZHfYOsjwxxw8uJ+hnxum/K3M1oq9R
	MJ7nlBTHl+UIfXI8hGZui5pNu+ICLSUV5SrJLjiNqMbkSxIWnPNXBj9JbdRtxgA8Hj
X-Google-Smtp-Source: AGHT+IEFpkVZ1pANxMRMncXMFAgbz8vtOXm9cMnMDXn+P/zwa3GMV6fwieHhRebAmrvNsxI2CFwNRESS/Z3OsyMMYI8=
X-Received: by 2002:a2e:ad0a:0:b0:328:c9c4:8ca5 with SMTP id
 38308e7fff4ca-328c9c48e0bmr79614541fa.9.1747918145922; Thu, 22 May 2025
 05:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-mdb-max7360-support-v9-0-74fc03517e41@bootlin.com> <20250522-mdb-max7360-support-v9-7-74fc03517e41@bootlin.com>
In-Reply-To: <20250522-mdb-max7360-support-v9-7-74fc03517e41@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 May 2025 14:48:55 +0200
X-Gm-Features: AX0GCFv8lXaIP98_tb3AUEaw6F5hqrO5BzvfYNqwXrM92x6w85A4_uKntjzv-9Q
Message-ID: <CAMRc=Md4Pf-fazcioaE0vjojWzBXu=MiypE2e=hYHBi8zQO06g@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] gpio: regmap: Allow to provide init_valid_mask callback
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 2:06=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> Allows to populate the gpio_regmap_config structure with
> init_valid_mask() callback to set on the final gpio_chip structure.
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
