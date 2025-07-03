Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3228DB59
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 04:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751518413; cv=none; b=npFBzIWZGd0lj5wWZwbkBZ4xDbxsiGmGEZQIudEs4NQG93IfUwIorTWHdKVsxivbCBn0sblFim1sFqAVq7M+VMbp9v1vvPQFttUuJsF/bP7ep/4Z9qDhnBFUtRwbYStniEioYF3NX9zduplg86cZzDw1FDOWm/2OXv0yVhQYWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751518413; c=relaxed/simple;
	bh=JzM7wANfHKn6i4YrpP4oOrQnJtQsh6/nB+S6KiV0SVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6Sb4OkfHbTGb1VIHD4GWD8kcfFXuFTF8Fj3dPDk5FnjHeagdfN+unYmb8QznjnMlwjKlvtg4IW1m3cVGPDAmA+MHTfU8G+zSCf8N4Iibw3PjxRbjss1JtMOTPqKs8nKMcaQZlKPPINIbxS3l8g3jFkf9OvqStLiaYiGI+pYNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=H8d2hAfW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="H8d2hAfW"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55516abe02cso624663e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 21:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751518410; x=1752123210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmF/L2p456HUIg3Za546hwp7qXIBOPPq9FbhG7GL4TQ=;
        b=H8d2hAfWnkKs18AtMsHCqBVo/gpLEuDwnR+IOHjXeni1aPmvbV8KPKFaMC4GQnRJCD
         p4uYKxXicNt78jjtaktMc1+jQtpa+pyFmicWjhFa6x81R3bkyHIT4tsfYDsBCKpNJXfQ
         c3+xOybzE8fOqtftcrkJ0RZEiZuqT0BxZq9AjCd1yAoW8XPOHBzcgEszQy5A+P3/ezg8
         wSf6mu5VdkKQNGWDjP/uub9GlPFI9Z0MB+lx7IEdBuyt5oGeC3ILkz6ginFQME/Tc56I
         yFnExGyTp3cFzE8OW6zL5UrmFjiZG9qmhrmxCbjWWBwSz/pKYI/t/L36MH6AwiYUk2i6
         y1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751518410; x=1752123210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmF/L2p456HUIg3Za546hwp7qXIBOPPq9FbhG7GL4TQ=;
        b=u12/934G6y5LqPO+pBdHSbbP925KbHNw8BQoNbmYjat36pAvlxY+K/QmALxHDzPLy2
         CgnDMlcQLJ8gfQBa91aHM4jAoijk/8+KdOTxt2Y8XH88cekhmYiaAQXNmaX88gOy3zlc
         +wEaSeEdtb/bLft/iFQgV76iqkdnHwZ4NgvxcbZUNs68RUAcovKorlAGKX5kUkOLGYNQ
         3i3Z3LsupELYI+fVR1crp8ePBtFWLIJi1jWVBMdM5VPmQ5opaDv6Sv1M4C9aIYkZ4ouY
         OWATPS5c8aJ/Xp4U1XIsxCfIn6LzqP4fsD/mQYdP0HcppMARkTvMx8ZWInhg3hzJT3qB
         drpw==
X-Forwarded-Encrypted: i=1; AJvYcCWmr0Yojbl2uB3c//jVvv2Gf+FMMoY9RF7zNgDe0TnH8HgBjlWJ/8XgvkYrRmLzkyeUKkq8A7Cc1DBpB8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIzN5e5VNf8EqDkxM8YiPgb3RADEVUOTv0lW6r+lubta25t//p
	CcGFuGBiA0jov6WS6t/TgWZh6MGr3pGGs+Gjjo/u8wVg8ua+yS/Ch4B7kEVUOy+DB3eLok1ujl4
	cgcsWnFy2K52kqfDkOs4vSQ/V5fAZpbSY3140kU5M1Q==
X-Gm-Gg: ASbGncuwKFnae8F5hk6LXg6ZFet2aPxNrxHb5yaqxCUA1oWri5Dtt4r5b4RWiOiQjHd
	0JSoNlmOwv9XMH5s6iIFzLFWATLqlX+aExQp6bFwbZ66Q0L6t9sDVgzDJ04DG2licFwurQ8m4Jg
	nRYzqI7VpJ65eZx+4hX3hyEQFyGmPGn8lAKVTGgLWNxw==
X-Google-Smtp-Source: AGHT+IH/FAKIrHEJXlazC1GS3IsFDF3FjC0xwLD+IqePmVprhBzw8tGnbUmbJUSRqi3/nuuao8O1tFo5dI9mh6VSnHw=
X-Received: by 2002:a05:6512:6d3:b0:553:a294:3f8 with SMTP id
 2adb3069b0e04-55630a338dbmr347344e87.14.1751518409988; Wed, 02 Jul 2025
 21:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702122434.1514328-1-apatel@ventanamicro.com> <871pqyl6fy.ffs@tglx>
In-Reply-To: <871pqyl6fy.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 10:23:18 +0530
X-Gm-Features: Ac12FXyimyMGUONnu70iMw5omrnfnHHY2WEGOczm3HdWl9rgEIRzg39H08J6TOA
Message-ID: <CAK9=C2VvbwDuJh-Xi865d7ipjBO781hF+yQL7pPEef4wbkijBA@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 1:18=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Wed, Jul 02 2025 at 17:54, Anup Patel wrote:
> >  #include <linux/cpu.h>
> >  #include <linux/export.h>
>
>             ^^^ Neither in tip/irq/drivers nor in Linus tree ...
>
> patching file drivers/irqchip/irq-riscv-imsic-early.c
> Hunk #1 FAILED at 9.

I accidentally based this patch upon my MPXY RPMI patches.
Let me re-base this on Linux-6.16-rc4 in the next revision.

>
> >  #include <linux/interrupt.h>
> > +#include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/irq.h>
> >  #include <linux/irqchip.h>
> > @@ -22,6 +23,14 @@
> >  #include "irq-riscv-imsic-state.h"
> >
> >  static int imsic_parent_irq;
> > +bool imsic_noipi;
>
> __ro_after_init? No?

Yes, this should be __ro_after_init.
I will update in the next revision.

Regards,
Anup
