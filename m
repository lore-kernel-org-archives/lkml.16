Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8A2B2CF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700827; cv=none; b=aeKNyVo29DxRJ5UaskU59UKuTPzedk2VM3EQuBLl/C8QQE1W9Qdw26G/yuA9IUiBQ4QhggxlwZpi9eCOW8aQFNB7KioTdNxmttNElOuRHtFuhRxnZ6Ur3Y8+TDU23nf8bfwbagSx7zCmcDgrMc5fCmrFlc/8E6ClNEA9OrtJL70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700827; c=relaxed/simple;
	bh=LrZf9tw7ue1AjUWwaIRpX02bUAB62dzm3WhOTiLfKg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLD1tjEgg/9/mZYA2K30SbZVt3rWLOcS2cAY91Ys/riJSNnUZMKk2CC47Krqi1MllrCSbDuqnMF3NbaBqxk1CVqLzVsCSMTD0PofTbSYZLI0VMohev6CvqRp8jGRvZrqob8EWiG9o/pvP5CVFhO8THQ4t+HuTOmxFdj59a96gqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=l1JaIQQ4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="l1JaIQQ4"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e98f73850so454522e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749700823; x=1750305623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrZf9tw7ue1AjUWwaIRpX02bUAB62dzm3WhOTiLfKg8=;
        b=l1JaIQQ4IipbLDrlJAd5wq48I3EnHNxUCz/XyNSq1qRxudJf+ysLG8dWTJpDBGviGz
         ZXkCIneRl2HInlh67JUlcp76zlqbfbhn331R8iSR+OuS/eETVR54WHHumWEkNePvDJkm
         aC1xhJHja7o6opJkIZXxO7pKZiyscJuMTlscILmb9p03V9VJk2+4TrmYek29iDo9P5Iq
         2geeaYqme1nWR17W1H6hUbE5kOE75oesphuVSO/oeo3ueoBAlzoZG3wrfbTt8Tc+e1iH
         Ik6myCgWnhkriWMoXckun5kwCvvbywBDfcE8aCLHLo2P4J4TQhLxgl99ox37bJCt3rpi
         5A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749700823; x=1750305623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrZf9tw7ue1AjUWwaIRpX02bUAB62dzm3WhOTiLfKg8=;
        b=YQSOtib83+DxLJtwp5Sb7Fg2+qDQzrzvMy/bA+pCQgf1D60AXzPQ5A1jHh2B8Ehs2W
         zmI+MwmkFhWzUJp4ZGxm/6Hm8IFzuofw3Dcrk/llujKdrlC48w/0Tj+nu5NscLFhJD6U
         KU6yGKEDgXroE8XZqbMs+jXC5vR5RriucPQb7JIH7Ii1DbZz0FZuxM1ms7/Vwk6cycEk
         6dXXik4lL8ZtuQd2McFro0hhh/ZSWU7MTGvtYwgT03qe177fHhUd/blZxqcW6rB683/t
         +4xE+CviHm/ZORUhTSPLQtEDrSmjBr9AcxbC25hkhvJGdWRQglQfYYbJIEQ6gdivnhvD
         sWTA==
X-Forwarded-Encrypted: i=1; AJvYcCX/Q43aqtOLc4O0TRZmsD4gxgcumGVEx97ZKmBoqhb6KdVGnyngHNx1I5/FenP8KW6OJ3+E5RyUMFkztlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXw7QnPpvdhESyMSbqnMTvRwh/BwtSjnEB7fkBKEm621KK9+K7
	OBRJesiNBunpjTcY44A5lqWQO6PuUcLsOuZBDyeBNuq4d8Mo2WiKCFIHKME6iWW+cqB2tzJxSrv
	58UCfYIwYLfcTlv6fHWQcDIyrElqdL82Y4MRR2qck1A==
X-Gm-Gg: ASbGncu6IUiEegNRzssx0b8JsONTIvOmd/L0C8Rnma0dPwx82FTjvgpJ3nCXC9ySgcq
	71MZT2EA5grJDRx0YMlwV6e/bZAG1V1XrZyY60jW+BQw8T3XXpmRj2v4q+Sr/eFXoMhT08CkNvy
	Oxa7dHys2qO1u2BaDLpBV8SZHcsbJGMMoT5sQzLeok9LuU
X-Google-Smtp-Source: AGHT+IHFiT/1CKTclaeo4nECAjAsNA6jBOPa/LZL3M+Ccdnks+IHwcRkfiDgkJcope9mTG1+XxA4A5iEPu8+KuKIZnw=
X-Received: by 2002:a05:6512:3b0c:b0:553:2450:5895 with SMTP id
 2adb3069b0e04-553a6446c73mr435357e87.4.1749700823052; Wed, 11 Jun 2025
 21:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-9-apatel@ventanamicro.com> <20250611-sprint-playable-07774a23f027@spud>
In-Reply-To: <20250611-sprint-playable-07774a23f027@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Jun 2025 09:30:11 +0530
X-Gm-Features: AX0GCFsKCy8m7CU7KuBd7obZnUUEUh3VEd4feuIdW-8ohTJTYbZ_MYkJD8lCino
Message-ID: <CAK9=C2UwtBhefp_FxwTtDPRyXb2McVdypgh-A9PaQO9288uzMA@mail.gmail.com>
Subject: Re: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Jun 11, 2025 at 11:52:23AM +0530, Anup Patel wrote:
> > Add device tree bindings for the RPMI clock service group based
> > controller for the supervisor software.
> >
> > The RPMI clock service group is defined by the RISC-V platform
> > management interface (RPMI) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> On v4 I said the tag I provided was for all binding patches.
> Is there a reason, other than using b4 to grab tags, or not noticing,
> for why you only added it here?

Yes, I use b4 to grab tags before addressing comments. I will
manually add your Reviewed-by in all binding patches in the
next revision.

Thanks,
Anup
