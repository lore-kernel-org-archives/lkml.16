Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749CB17A313
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793170; cv=none; b=jXr4M1IQliE5DrzJpuS4vzZClgbuhHvjSiou29Dxw/dhsS4bPaQbLfbRqM3CG8qZufKT4Un18vKwS8Rjhvru9S8DSCI5Vci6X3pJ9Jmp8bSYzNMNyLTlK7dmQnAvUsM+/t9xHLAMKbJ2RwKQS9iGC7HJS0EV1M/6bNfFnhLZA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793170; c=relaxed/simple;
	bh=dJWpmPmeZz2KNsdUSgiti8HMS2NRCkbFkDayLtPJquM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yc8l7HsAORVGw+CDB6LGgQ+d5Pd2hGTPWXWiUr9C3Piqun5yJAwppTZfAZiErNOhys7KSCK90NPlY78n2Ho1viDIFewVoRhzHyO2lzLcwOeER0NJ1g8l3xGXbSkTAYpyhgQ/OK0GY+v0aVTzz3sTY2KVhYeGZ1yXFXNJH1gMopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQIxtCD7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQIxtCD7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6953639e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793165; x=1745397965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJWpmPmeZz2KNsdUSgiti8HMS2NRCkbFkDayLtPJquM=;
        b=pQIxtCD7c28GJQND7ElsXZSYxd8K7U0k641enIdJwSHbYCVuyXcSKAoUVlQf1jhPjM
         I9rgHSHgsE3O7aaHkPSMax6H3q87D2NV8BjclLu8b9s+g0bF0rMemv0tRbvtjWq+qbeY
         vURAppp9nZFSIxbKzsxLAWM4T4iSFG2t4nRKNZru61OAHW3buEaJhg0DOx5B9LAyhC30
         a3k+AEdKWy91facoYasDSw4hkaZ4iosGtatyf7aLWOVkGibNg8w4ZiTxW9GwesfjrRIB
         0it5vs58XbA5+kB6XoJ9vMlgahC2k+hUppQ5OTRan8BiBCEEiIvJ2Dko9EVht81aNjo0
         C2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793165; x=1745397965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJWpmPmeZz2KNsdUSgiti8HMS2NRCkbFkDayLtPJquM=;
        b=b1dQKLGKCor9VU8FdSTG23ON7SbrhJD1pBgSvrwtbziK4cGF4rhInaK0/tmb4Xy0Uf
         WVr/uZgDD5vvDV+m46kO3UdxEpTJR60WNkz/Jltu7HsVNrq3cCCAz45vcoG3KPeAb/1f
         +NrCzqC1S3n6x0Ga4BbMqSfKXX2IibDPp+3mhX10BjsmLjfC1Y0ZGTpl/XjuQytqlEX4
         6XUTX9SWBl4R+sOypYsHKJL8YGLsYNawSBpORqNjJwZGsYFQEQ+cOeUndL7MKWtIhTKd
         4dsb13irgTg4Omou+AXy8zGBXQPOJwP/aRwV/sE5/jDNvnjWOkArJQYHcj9s1ZIQ0RiD
         EbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW5Nl802AlUt0TVJ7lSTH6NgSJiJkMsyWdb3ZlkKbDPw8eo3WkSyxWlxlXL8r0YwRetp5hrQE3rIHBhek=@vger.kernel.org
X-Gm-Message-State: AOJu0YytvN8HjuxGsCyiU1cFRpWfbTeO9gAWi0KSO4u9K3v0vf7RwPoQ
	gpJIoN6SPdLFw1KbYQMX5EXCiO0H2r9Ym5W1lDffFMXh3amwRjXzrsVANAKgdWSIfZJ29n5tB5y
	DKrxJZCgUZkGgxWPgq1EFqlXJft8cMIP4YHWV2w==
X-Gm-Gg: ASbGncuCfitWobG5hCl6K16W6JhfMjfgJdWPD+xJ/DXpUqmdVkrKiAZMy/YO77W/z+S
	5w49F8enJzEVQ3MM53Q5/CWpXdmUG8TQqL/rz1RXV8T6/nuS/V65kcOW7fOOWWyJQOJpQgBPvRX
	Bx//Vx/1AzEXzP/MzeTvZfl0kezMa5HFD/
X-Google-Smtp-Source: AGHT+IHER4G1YW/HfugLB0RhEmlqCUXgsHRN71mbKyITUVzly9VKf5bLZAouG/qB8jIC3heoEwHvRcEVYlxmXDpX/Zk=
X-Received: by 2002:a05:6512:ba6:b0:54b:102b:af56 with SMTP id
 2adb3069b0e04-54d64a7b607mr299899e87.4.1744793165426; Wed, 16 Apr 2025
 01:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:45:54 +0200
X-Gm-Features: ATxdqUEeHb7bVJDEFYNrc_akyxNXE7o78pfUAhkyDtfdhV5o7_0R7syCdQ83ur0
Message-ID: <CACRpkda=5pj63VQ3Ga+JR9Hp29Hkt7reBx=NzM6mXMNFUT_OrA@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The driver uses guard()()/scoped_guard() for the rest of the synchronisat=
ion
> calls. Convert to use the same for gpio_machine_hogs_mutex.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
