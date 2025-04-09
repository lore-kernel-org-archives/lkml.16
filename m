Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF1E19D084
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184814; cv=none; b=bBFtLVOCrL4KYj0BfFK1g4eGnLxoSpqyRuYNk4n4amqr+V8gl2D/uxm2PgUKlWYB1sTUdrmyDWgERLRnd/m2GRaIRe84zHzCuSfxrGwW63h1RQ9CYz/zxQLzGZs3UzuRgv25Ua/RFdixOr77GQmc/l3qGL0Gsb6mdl6kAWqiiFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184814; c=relaxed/simple;
	bh=8pXvC8saaovmNYWD6LB2NpHiAdgmwvzHy3vNJ/rR0r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNxYlEumK7A3r4ZHW/dcX8shf+vcKCEs7Jv5uPaVujw7NkqeQq8xG7VY2F+paGF1BYcVCDfRtdT66uX/tciOxNI5al7C3NX7n/g7/sKjz0CgtCiXFo05lKfsZ/GOPKPwx/2XC/sXZ2saopuaeM0p9WtnpOkDL18OXtnHszieBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M6I3P3n6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M6I3P3n6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso397351a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744184812; x=1744789612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPe5EFIk2JAls1hezPuV2MYzcMhxRkzu+28tJeOhpVU=;
        b=M6I3P3n6maq1tXoPvrqkl5A+iLIfsf2HTf09lfMjFwcuIVHbhSsvNQ+963hauJz4pq
         TDIbgAcg1U1C0v87XFRLAJWnuqeuRvJKtPZ9NNK8KWkq6rd5mRzmUy4VVxIuOuMpsQ98
         8UDyAi/gPWuq1h/DX9YUVlxFyYcT/Dp1zqXrn64G4ZC9H3JXU4LUXNdrzhhpQPchq1ex
         KW46y776YXJyVK+1uwM8E5qewYdxUFk9MadY6Q/vkzoofsIz8eA8HQYpY6RcQZiiAl8g
         ypE8AvaS0iUCjlM9YR1VrAdt+NhAcIWAC/hMXkLPYlft7ksiaqniHtfeegvMWq7A7GBE
         ZU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744184812; x=1744789612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPe5EFIk2JAls1hezPuV2MYzcMhxRkzu+28tJeOhpVU=;
        b=ZhbtYPvShcm33Rnr/Vn6igX7o0AG76sv6KrefveA/9c9tO4Z9vuNERaOhPw83Vtt1N
         GdY1dYc92DFRfrqwuNC3uZUUEKwO9HD27pM74yChVl5t6K7r7g8fkdKdasflOZnW28hu
         ozlZle4EhB0Th0ZzxHAeeoagixjZWs9JNrSuTg+YeHy94tiRvpf+Ak4VRJLxxCYkXdpx
         qZYzr5pvPs/ERWtbS915l51i7cG9aPqGcn7ffWkPSeYYF7DUDDJtOL2mBmVNGSk7k0g1
         Jxl3l29OZG55YaXzAY9P5k7XxsJ7Yr/wSA3TVrOCx42Q2L9tFE2F9N3niCjq0mtdwT56
         diew==
X-Forwarded-Encrypted: i=1; AJvYcCUQEXmTiuwTMdOH5dbucGpwqUMeSA7FkCTIZ8zRkRT1MTUNv3h8npZ17Oc2Iz9Ebz8X7Zz6jWscNsqdydc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PTTpTDZZizhRLOGnL893aA2JtizJWE0FrzpPyqsgY3YLujtv
	IZUKGCPI25bQvSU7GJQgwaQFrssxX7acJLZPcqAWHcCDGcxAbHDIhxzubmPp+kQ=
X-Gm-Gg: ASbGnctyVOw7loZhJAA1lDLSBw+bOQ8lXRAKYgodTzGn53hJYCQT7nj8itps25eY7Gf
	KNU3U+ugcYliecbYzXs1uTmTrmBDxSN+gSEMa99SSXf2tNK8jvofJAJt8QfqyQgTypSfKIqSfJC
	q7aMALJ6SUWAQVp5GJ/mcO0nzMAFUUAo0AlJa5rJgfbeuuUPVFsBWOfcfKEjqRDqeYuvqJ61lEg
	3+iJqjYxIRhm1YwMHNa06oBjMb/094nDG05/xI5XeoKNyBLzx97SIIPwiuvonDd2D22c+c4s51A
	UkFsTKmbsQUgabHDPi7DyueRkzqSGlcyeuqHDzV/XdEOeMwOaJ41QNiC+d5cRk5MIHuDVk1UfTo
	2
X-Google-Smtp-Source: AGHT+IGeWFAmHsxFBBGDibBbsDrhNmr+0jD0MhdR2n98VfY5WnHP5Tsxjn8/Be23AVtU2AtbXgk7BA==
X-Received: by 2002:a17:90a:d64d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-306dc054d59mr2731761a91.10.1744184811953;
        Wed, 09 Apr 2025 00:46:51 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df07dc59sm728781a91.13.2025.04.09.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:46:51 -0700 (PDT)
Date: Wed, 9 Apr 2025 00:46:33 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/Yl2cvTEhM7y9Dz@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-2-sbellary@baylibre.com>
 <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>

On Fri, Apr 04, 2025 at 12:44:39PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 06:44:57PM GMT, Sukrut Bellary wrote:
> > +properties:
> > +  reg:
> > +    maxItems: 1
> 
> How reg is part of this? Every clock has reg, doesn't it? Otherwise how
> do you control it? Drop.

Thanks for the review.
I will drop.

> > +
> > +  ti,autoidle-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      bit shift of the autoidle enable bit for the clock
> > +    maximum: 31
> > +    default: 0
> > +
> > +  ti,invert-autoidle-bit:
> > +    type: boolean
> > +    description:
> > +      autoidle is enabled by setting the bit to 0
> 
> required:
>   - ti,autoidle-shift
>   - ti,invert-autoidle-bit - although this makes no sense, so probably
> old binding was not correct here

Yes, all clocks don't support autoidle. So, required is not applicable
here.

> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    bus {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      clock@1b4 {
> > +        reg = <0x01b4>;
> > +        ti,autoidle-shift = <8>;
> > +        ti,invert-autoidle-bit;
> > +      };
> 
> Drop example, pointless here - noop due to lack of compatible. Instead
> provide complete examples in schemas referencing this.

Ok, will remove from here.

> > +    };
> > -- 
> > 2.34.1
> > 
