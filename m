Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15810236A70;
	Wed,  2 Jul 2025 23:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751498004; cv=none; b=oTzkYxsC4GJ4IJ2fZOQV0IBDUATaB9v0YetoHROVBLlzv/KNwuLeQ5HnLmyyVXMjx8AUg31GMbevLfsCcnG7klflk3lBH+I5G2aTDAkaqwt3e0SU2PR1RqdhEX3sSy9Uthc9ByqJhmBTdH6yQtTgzip2ReSRwGh9FQ3a1J/oah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751498004; c=relaxed/simple;
	bh=FWUFKVcaoIRgTIXnQmrgILEQlRTSPK1GpdKMOBwSC84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apTEMt0bPhgYexTuWV37tJWZEAR36ljXhufNWE41QCO4Y4Xh4HyLlAXu6i7Dymojs1I+FC4YqiZVlKD5RNIk3mWzJtXPrI3e7aR72L/3AQRlQbPUlhe7BHmhgtvELm3TuH4gUYOnPRMa+9oRfwntw90ekO1XRrhVHSCoW9QwuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFjQyvJj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFjQyvJj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so7988729b3a.0;
        Wed, 02 Jul 2025 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751498002; x=1752102802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5q1f6Ouy7hbjx9qckWIFtBppIrqabDs5gJ+JKIQOaiQ=;
        b=MFjQyvJjZT/l3+caby657MrN2IsXKR61ML62yNa4coh0lCTVeUEvLhtlmAKVcwcK2K
         HgyZHtFWKr/oAZpcmutRofscE3TEil8TasAiT3X8IRpdytZ0rINKbMM/RSwpa3+W72AD
         pr95IIWivQX2cHGUxg+tfQOT5wiUXDM+uQzKlavMVvF611UWjemUM5rd8mOgZ9yJNnLe
         1kE93ftJii9EjKf9RP9zLdVl9nj79r4Uf4lsxUaE7vSaYlYME30cqP2Sj2WPxNeQzp+y
         3RR5MH3joOMOEG/0WDhai+SlitvNPG7TvYxFbLRKok1512AVGsCwvcmd61ddgFNcpnjG
         UKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751498002; x=1752102802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q1f6Ouy7hbjx9qckWIFtBppIrqabDs5gJ+JKIQOaiQ=;
        b=Z52tNZA+Pn8z51ANFVpH+RfXZEqnC4JncfW1+mfCHBntATix9kmnEVaNXJCi/i8J2q
         IMSQLWr0hBLzCDhWTa3Y5De3Yo/MkkdKh2d2A4TQSoPLBDNUhwM7jR340ebo3185h6De
         BKgUtbPjc9vBCnhVwz/pZNQ5Y3s99JqVyqq2i1IOce7KwUjNluD/kF8zMK5uDgLMtGGy
         80hgQ8UoahQZu4m6iiWuh8qzAoth5yYAVaa45V/usoQokXo0PYozQNhl+VZkreSCWu5G
         LnvH1C8tiDKEANYuC4F0kwPiS+o9COfXNp7QZ+ml3th6+xE+y13DK/obZORiDQxjqFi9
         xiww==
X-Forwarded-Encrypted: i=1; AJvYcCWaEgZNDVnxH+JfEBzd34Dpbj6mgR3kCrTV4x2RAsznQQLyohyle8TONqhxECQrtQsh/e+TVnkxQCnV@vger.kernel.org, AJvYcCXWD9CWivYJOX8VnowiI6TgnkIGo/jD3PREfzE7RRp20Pao9mcja7fYsYRdWee/GhG+kei5qWsYoHh1H28U@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01Rls7BdnVrKveNasMELV2YAXEed1skfktm/RHtZyj3Xdpmlf
	KBQxg9+MHrpPpqtNfhH8FeU1Mar+3NRSP5jTsy1S1zypLbTxjM07cMv0aMQQahuG
X-Gm-Gg: ASbGnctYcWqPo8PTeWxFBdKIMRUQChnHXYICojBJ+JHFiMzd3t1platGVPyi6CZP0KC
	sv0aKgs5yt2q/E76SWJieyKDyNITVeTJDbQVAOr5XTR7DwEBbB3yjXp4yrlihaJe/OJ1pRHjwwR
	4iAlYn7XHcBbOpNsJ7LyE6FKh3OkB9+uFjK9tgONpHuFo1PwyIL77w5Ok0d3n5P4KiZCiEPoqiW
	ngWNnL+DA8knRyQ3cFnvwJ0Z6wzfp4BxjWsibICGgCY+pyOa4QKjSENoCxFhVr7iZERYuAn6kpK
	hxHvB74NhGOC/KplQE05OzYyH5+2A8yhszInQYAAWFCsgcWYGtVo/R8vJ5tnibluiMZAzZ8Z7N3
	H7S5apQ7U90KBr/t0BrCpBEL8WNjmfEUU5jjxxZ8=
X-Google-Smtp-Source: AGHT+IHle8eoISP2qCXEJoMWIftmhm95QoQXG95iollb4SH97ajP9LpfNKXbVUJ+LNamKOS8iN7+RA==
X-Received: by 2002:a05:6a21:32a4:b0:21f:50d9:dde with SMTP id adf61e73a8af0-222d7dcf414mr6544906637.5.1751498002261;
        Wed, 02 Jul 2025 16:13:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300994asm13788791a12.3.2025.07.02.16.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 16:13:21 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:13:19 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGW9D+xO1NaDodJX@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <34b0f5e2-0341-41cb-8915-8f1606e14827@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b0f5e2-0341-41cb-8915-8f1606e14827@kernel.org>

On Wed, Jul 02, 2025 at 09:50:56AM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2025 07:04, rentao.bupt@gmail.com wrote:
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > new file mode 100644
> > index 000000000000..f902230dada3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2021 Facebook Inc.
> > +
> > +/dts-v1/;
> > +
> > +#include "ast2600-facebook-netbmc-common.dtsi"
> > +
> > +/ {
> > +	model = "Facebook Darwin BMC";
> > +	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for the detailed instructions, and I can see the warnings from
my side now. I'm working on the fix, and will try to send out v2 by this
week.


Thanks,

Tao
