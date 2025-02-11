Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E81D63F7;
	Tue, 11 Feb 2025 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258218; cv=none; b=TotSjVgJQS3wK7in7ouTEDlzWrBIbDZGXoRYQoxs2liNo+e/psS4umO0AfVgq+526sDGZybOvbO/kij9SxR5xUiF+SmsFabsCuUoXe5pWMojsgu3gtxC9mWsm3HMMNJSAOlFGuzeO54wOBux87NxJ6pIbC1/YZqamn83Epsp7NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258218; c=relaxed/simple;
	bh=IFpGeEAigtCzbpG6npskBYBPARY5X3pUB2Xudv1CS9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrfUAJwkRIa5KF7+7Awhsj6DaT3kd/kEZYMA4kUBw8jZgTsQtc8wvzx/cUORgAI86etiC3GsSo1Oyz7vZNAOW+LCbPhLMjVLSnGk5XSAEyhFldWIYr1HfZIAfhskkQ3F2m/BbtJNUeRlJhOlUGj0yfl/mg6ITAqTmosxvEekCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=DMziTgXL; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="DMziTgXL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ACF014801C8;
	Tue, 11 Feb 2025 08:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739258213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yeqbZ8gL7IKSa34fSG0N17oAXiPh2xQ8hnnmu14TEIc=;
	b=DMziTgXLFFkMPBIUw0l+qb1cicwXk6RP1JRgVBdieHePTf6A9XxfYQAbHK1mRnWtit1/+c
	lOPY0j0hROIzye3E9Hy0fmr0YIZyqAJO2MTYOjGNH1NDjZhhG48RIDaYrn5f8rrmxT996m
	aCevm5dfQvc94CDLX+BADaqRy/78YpzSKzKyvu6YJL7mPRrFzlldHE+y+Ar59I0FHMylr5
	M7qbxS+Bo3CxTHcghua9xPX/xyc8Qy0xqnd02z119zba+HWR2s9ew+cKqbkLZMQYMbABUP
	7wAyy37HonNmzNaxcYKG143AceSx8qXJtS9cKAGI7vaP92wNUL+3ytlel4rEtA==
Date: Tue, 11 Feb 2025 08:16:51 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20250211-cuddly-system-33432b3ced5f@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
 <a199849a-ca36-439d-8246-7addd9a78833@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a199849a-ca36-439d-8246-7addd9a78833@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello everyone,

Am Mon, Feb 10, 2025 at 06:05:31PM +0100 schrieb Krzysztof Kozlowski:
> On 10/02/2025 17:44, Alexander Dahl wrote:
> > Before adding even more new indexes creating more holes in the
> > clk at91 drivers pmc_data->chws arrays, split this up.
> > 
> > This is a partial split up only for SoCs affected by upcoming changes
> > and by that PMC_MAIN + x hack, others could follow by the same scheme.
> > 
> > Binding splitup was proposed for several reasons:
> > 
> > 1) keep the driver code simple, readable, and efficient
> > 2) avoid accidental array index duplication
> > 3) avoid memory waste by creating more and more unused array members.
> > 
> > Old values are kept to not break dts, and to maintain dt ABI.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >     v2:
> >     - new patch, not present in v1
> > 
> >  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
> >  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
> >  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
> >  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
> >  4 files changed, 100 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
> >  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
> >  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
> >  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > 
> > diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > new file mode 100644
> > index 0000000000000..e01e867e8c4da
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sam9x60 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> > +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> > +
> > +#include <dt-bindings/clock/at91.h>
> > +
> > +/* old from before bindings splitup */
> > +#define SAM9X60_PMC_MCK		PMC_MCK		/* 1 */
> > +#define SAM9X60_PMC_UTMI	PMC_UTMI	/* 2 */
> > +#define SAM9X60_PMC_MAIN	PMC_MAIN	/* 3 */
> > +
> > +#define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
> 
> IIUC, you want to have bindings per SoC, so why not adding proper
> constants here instead of including entire old binding header? The
> binding header should be entirely abandoned later.

Which binding header should be abandoned entirely?

The bindings per SoC idea was proposed in series v1 feedback.  I'm
neither a binding nor a clock expeert.  As far as I understood it's
important to keep the exact same values as before to not change any
ABI.  The non SoC specific values are still used on older SoCs of the
at91 family, so this is why I used the old constants for now.

These PMC indexes are not the only definitions in
dt-bindings/clock/at91.h however, there are more which are not SoC
specific.

I'd like some thoughts from the Microchip maintainers here,
what's their idea on how to proceed with the at91 clock stuff?

This works for me, but the current state is more or less still an idea
as base for discussion.  Please don't make it overly complicated, this
is not the primary focus of my work.

Thanks and greets
Alex

> 
> 
> Best regards,
> Krzysztof
