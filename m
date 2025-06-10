Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A394C96
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531645; cv=none; b=iD/h9CCCNWBfAAfnku20cR2Uj7bUXvs9S8HMxavzs+1sLLwzI8I8DHxGe+HXycqcplKRWcg0DtbS4CnGYcVOc9kaJnEFtEYdBLLPpEQLhjnMQs/Zs5hyyXz4Q9PNHc1XFAcJxz6wP7YRohcuPaUdEqQN7aBrCVSSyP5fFrx/y6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531645; c=relaxed/simple;
	bh=RkxdbjODuUBbJ5k/31S1WlX4KjeLcBHfIRe8IjRh4cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRuBSbkE6yDJXRIMJR/aa0QB0FaIPg1UaPn011H9B1+SHsyBwPbK9/3Mw7+H+H2TDOt57Nl1Cg+XyauWsCRrNtTqqKulleUCDztoBi033LTrbztMfId2g8pZCoMYdN5uQpZdKxQHtUZAqSDz+KNroFJDXHuOtRypi6nvvicRGgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dY8Ym0u4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dY8Ym0u4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5534edc6493so5422100e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 22:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749531642; x=1750136442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG+QZlPSjwTQk4wkX+p/421OYI0NEzGDtfD+xtVDmlU=;
        b=dY8Ym0u4cZWKHheiGEYP6FleB6RMmRwnsgNwr95xHPwcEwSa8AUt2wBuwkPQEbmwqA
         /+xdll3T4w3fy4Tmynsk50Aj0D7y1MTjYzt72Yt3W/Zyjp38kOXgm4AWxej+jf2efp0B
         7Nk9xgorsuhx70P0VXYT3TzRfS6/9JrXzv3vARcIaHPuz2XVi5S1j26Rs1NXDiMAhVCI
         arYlPaw+JZ7gVhzcpscPgEufWtsh3diuOYYpQYo0lAiQSAROO0B/jz3m8RRdbCid1e+V
         vGjk6h/XUN0Vfkv9RjxcCA8C7Lq+Rw9F7lRurYn/HyxPtojcYgcDCsqd/lR7E8dlzIhj
         K0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531642; x=1750136442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG+QZlPSjwTQk4wkX+p/421OYI0NEzGDtfD+xtVDmlU=;
        b=hAd72EBAea8+8mG8dNKbxPJb7LLCCcIesEVIbuvUpCT1zjW9g+36nk5HGMYrL32Y2C
         +0eDYsnhUucanegPHAb9s08CgAeVTX6Ij+OvGDkA8/pkCv33XJSMPAnJgOzz6rBPvvwH
         p1rWb+w4Z8QvPPgklgJ4ysCo7IyX4KPBwPF1l9MxOfc/WVkHg8I8iXWlQ5idz4obN1UZ
         wDVEtjAJudznflqEVLv/7HgsLy1vSt/x2DQhE1uZlxZYh8LOPOBwBv9s74/d/wycXZoG
         UM65756QIqvpY+dbOELJL1L4yAIvnlqeB13W3ZTOnzKDk1y+AgEsfnA5/XDRa2cGNEZi
         L9qg==
X-Forwarded-Encrypted: i=1; AJvYcCVRrW9j4jIuR+dity7xAQtx0ecxyZKGbi0a8StDz+q/xK56Ic8pRXd2lNJcx6WwbcAGQXMLV9enNnONq6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVf55WBttbRCaorgAMoPoGCQsHVFtE2D5m8FXYKpLYpG1vDjXe
	duQKFW5Qnobi/QHQQ6Fp+Z2IIumIqMByaUvhJmP5ZQs6VKaJmFnhOc0taDGormLjvIGY3GWQuU8
	E4ynxjg+l2ZuIihaX3PdU2e5BUwYPxPdoXYx0K6ZdJA==
X-Gm-Gg: ASbGncsoQ/sFvJuZkOp1d3S0x0ypjXfnrrYTMAUVFwE2FNAPsiHEnMAExsEiDr0akjr
	wknCUnMjJ1AD1/MtnVjcALK7veVPmtPFh5gPF84OimLsFfUVUiAL0nMVrKuE2ClTZO9vw2zhfmq
	YIYgN9ZDKOWnBSpK7uhywVl8urdtHDpItuC5Q26aa8BPxd
X-Google-Smtp-Source: AGHT+IFc4bbR66Mv3WuueixJqBxHJULaviJZZe7HO26p9olq62flNuPFgpr2ULooMQPQ7QoisA5p/os4fCv6d0mjLC8=
X-Received: by 2002:a05:6512:1193:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-55366e338e8mr4285433e87.52.1749531641605; Mon, 09 Jun 2025
 22:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-9-apatel@ventanamicro.com> <20250530-stark-maximum-2306978237db@spud>
In-Reply-To: <20250530-stark-maximum-2306978237db@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 10:30:29 +0530
X-Gm-Features: AX0GCFsG-CIRwlRAtjpdQwDbh-LfI7tbNGcMGwY5mVPx4e4ZARAwAgOKgyJVzwQ
Message-ID: <CAK9=C2Vs+q2t+iB7zdrXdieCcT7yYvQM4Z0vdVW3iGKG01UF9A@mail.gmail.com>
Subject: Re: [PATCH v4 08/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
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
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 9:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, May 25, 2025 at 02:16:55PM +0530, Anup Patel wrote:
> > +  riscv,sbi-mpxy-channel-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The SBI MPXY channel id to be used for providing RPMI access to
> > +      the supervisor software.
>
> Sorry for the delay in reviewing this series, wanted to talk to some
> folks at work before doing so. Overall these bindings all look pretty
> good to me. I don't think the description on this property here is
> particularly great, I didn't follow what it was meant to be used for
> immediately. But I don't have anything meaningfully better to
> suggest nor do I think that anyone actually writing the dts for a
> platform using this binding will struggle to understand it.

Okay, I will keep this as-is until we have a better suggestion.

Regards,
Anup
