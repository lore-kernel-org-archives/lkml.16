Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86824A042
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681456; cv=none; b=k1EGU0oCSPCcJ//KzZiGKtSMqfVq4Waew7vmG+sJ+EFZzIYsVR9gqGGPSbtPFdJzxtME/Lnv2Ft14r23/ptXONhX8hPKfggWRyuE0s8/B0D/Y2HyPi1rNp+JgpLribXiAsqtm3KCPfhlBfB86EKK7jYyGno1yCOdZ/EwWLhoBTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681456; c=relaxed/simple;
	bh=7RumA3X5eB7LdNlJXXDsoSjZ7aj/drzqeBxe1DW71xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8/q3msKW5JhX9l1Al16rWjfOORdrrYC7KIeN4k4ha70MlW4rbh+VcWue6FaeWepyyBCdHjgtfiJp9/1wA7/UaiMYOWXrzznPhc1iAEnY7W4aAbuCIjf+A83B56lW3iIn/tfP6ACT5K+J53O2SQyOHgpIKW3SDiBXzFDiBgwzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nXN35pJV; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nXN35pJV"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54998f865b8so802114e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743681453; x=1744286253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkOktHGlzjAkXagwjlA6YI1+PYwTvY9/fqcii/7p6HI=;
        b=nXN35pJV0C89hgcKghGD6dr09VFh51dAELeuUjSxYij76Sff1JpDDRgAuVzwzQM0E4
         GbU4EsrCIycxe5pS+j+ZRCfTjecOqTKfpZKENBNYg3N7HlDD4CH0ky9RDcBVaA7YFwm6
         oMgE0leusXNQl00mdUOXJxzhWK0WBot0jRjC4HBUFZSK2hb/Hp3oL3AqXzOMLYVfpL0b
         nbJTRyPNlqgFNO4R6OWkQDSh/N5PPkvjh9lRL8yY71b6+EN0VWgaCKbKDkfXpAJ4m6ch
         1EvO1+ne329l9bhy9+Ku9pbRyKUdjE+MoRK2IXvYDEuE9zWfY3Hv9p0G6g6jGBd7AZbt
         ctKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681453; x=1744286253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkOktHGlzjAkXagwjlA6YI1+PYwTvY9/fqcii/7p6HI=;
        b=PzJu14KQ/qaIjL5mmi0xYatqUKVgTrMbZYmrqFtCTezEcmX1mvIBs7GoZr4b36WrOF
         PfQnzvbIMv0rvQxdfR6Y7lIoenp28xpn2rPb4b3v2Y08+36Bfa6k2fs91Ga2zPUVzsTf
         ym6XTqQi5Nmk5X7lUc9UgYWP7O90HQn2uES1fB5PXV3kbInuCEgx7gxST7vfwg3+kra5
         oKq0GbJex3JTjQ6gkwoJ0RNeewTtwff432mnbMP2Z8creP8Evs1iR7G+oqV1q8Ah+hhB
         Ezn8wtklh8NDdz550BPl90Veek592eH8Zxj1rvAQfOCpd1/1PsYYPcku94xahgIx8sWG
         6Feg==
X-Forwarded-Encrypted: i=1; AJvYcCVSROEPCWIxZk2GY9HTI58tHS8G/8n6MMw4yv36DBVo+4EgQkcDsahp3Lr8lmZdNnT3lNk2nv8le2cQVtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF4TdHeXkkq0qaW4LWEtEJlYYkxPzWJ6N4MkFJI8Hoj+yPF1gc
	4cD9tSCmnaHVEzZV7srWQYYxoKpbYJprbqBo0LeAjiaNDbt+wfsMKY5xqDFeDWkq1yLG6DnhGLQ
	71PSE1BQ32venBuoscivZ8yoxya0rf8XBcZf3eA==
X-Gm-Gg: ASbGncs63Vk6r8prE0kdzOAuSI9KVATGBqmqX7/kbK9xyU1fv3a9lHMThM/FwkM3V45
	AepyGyYS62WdjyYWd2ZzQrt2huiL00R0FLT+DAzhLz/OO8JjFe9ucB4rE9QI6BYJvUedTpSaNhQ
	leM8UNdZfauBTkoNJhVM/ek/X1/473oiiyebgjNFTGQz1i91hjS3DC7U3z
X-Google-Smtp-Source: AGHT+IEJOnKqMX5+dgmSPUxCOsMR6NccyLGkvgLJRbiRfJodYmSW6tCZcu76/+/XfCMur6jjpB+I1EXvHvccn5hkhG0=
X-Received: by 2002:a05:6512:3b25:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-54c19c5c517mr1842371e87.18.1743681453030; Thu, 03 Apr 2025
 04:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402122301.1517463-1-andriy.shevchenko@linux.intel.com>
 <20250402122301.1517463-5-andriy.shevchenko@linux.intel.com>
 <20250403103506.GJ3152277@black.fi.intel.com> <Z-5rJDWaSJd58lTa@smile.fi.intel.com>
In-Reply-To: <Z-5rJDWaSJd58lTa@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 13:57:22 +0200
X-Gm-Features: AQ5f1JqR55KMuRFut8zPE2h0a1E_W5eZhlgdejLJXansH_I-MmaaezYhi6oZpYs
Message-ID: <CAMRc=Mc3YUsLm5dX0b3rFsuCErf0WmyyYtXZgDYBt0w+xwqkCQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpiolib: acpi: Reuse struct acpi_gpio_params in
 struct acpi_gpio_lookup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 1:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 03, 2025 at 01:35:06PM +0300, Mika Westerberg wrote:
> > On Wed, Apr 02, 2025 at 03:21:19PM +0300, Andy Shevchenko wrote:
> > > Some of the contents of struct acpi_gpio_lookup repeats what we have
> > > in the struct acpi_gpio_params. Reuse the latter in the former.
>
> > > +   struct acpi_gpio_params par;
> >
> > params is better name
>
> It's been already used elsewhere in the code. Do you want renaming there =
as
> well for consistency's sake?
>

+1 for using param or params here and elsewhere. It's much better than par.

Bart
