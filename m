Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83BA36D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260665; cv=none; b=GwEhg48xasBLpaWpXUztQHOOq7Wttoni+9KYaHJWXy9odfiNil0a+AMeg+PqwqICP1zU9PyXH80z+j5Lf6EVv4E26amaHN40DHLwpatfDbrIxdI/xoOHlYMb2pEXyKloCkqEkWn5it6qKyYu8+xnupKLqsBxyWn+65tZQwhpToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260665; c=relaxed/simple;
	bh=j0+utyg3WdFVd9h3Luv7yRhQ04bPtA+ySwD2/SbLX/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l26D/bXqHJDt+S11COVLQnFUn38FajxzBftVwcIUPh28DgoQSf9OWUvpknr5R4EB67wcQhuzOy+GHxrTGXsLeaqgITv1n1TW9xkBzhu8Ryt5lip4wHjkrGOJzJerImwk3zYktb+tClhrhW7W0icHCE10vYvWCEg2HM0UTGtYkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mqxqIjYr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mqxqIjYr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4222227b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751260663; x=1751865463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHPtwkORxYza8f0AQe4trY9Wlzmo7dC+e4hGrz5TZ/8=;
        b=mqxqIjYryhA+0zr9tTzyIr/Gcpvgpp/1zYKFkeUD0l7Kb8GxhEsslHPUnrHDeAdm16
         w4DtFymjm8fm1ZQBYlRRujx4qLkDKc+krNVHFywEuyfpPgZeij5EhNdpUIqIXqgkd3cB
         c7hazZBdvI5w2fRLfZUYnDKVd3D1XsvRz/rBz1fbvaLu7zfhysD5Nmuqs1bZ1oEUY8hg
         LBMc6Q6NDL6VrvwpcOgqpHKj793qgZhTRCppZb22hVI79j8peejBGCgcYJNmqrB5iUo4
         +yezLi9pCJXdX2d2aK5F9ducCt94lR1J5r2g9BQ7DPGIXZQhh2UVH+8fiklLepIjC+Lp
         d8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751260663; x=1751865463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHPtwkORxYza8f0AQe4trY9Wlzmo7dC+e4hGrz5TZ/8=;
        b=fEZRVUiWJ4SfdUAnpOpPKdnuV8w/1VPk2NTmqt1Rhxo6E2DSW/3gPFvfM9ScQb3+m4
         LHvdj4YqKtK4VKAsx+1C7JhPDAzp5x0H5idNTkC3iQ4lKeu8gDWTfvMEEF/6PQPWhlch
         pLsHnXRQ4yzLQqud+adOZ/K6AhbUBbDVLqo30Ypkd8xhnb0fJyIAlqYDPWBipOIqcTdc
         65045X9JK6ZuLkH7yiLVuJWL9nDMey+5laeAXWSMIoxMhYjNJaf7mzMOtEvms2adwZTR
         xIrz8l8pnjVc0YvZKlhDWpg29AczrpzEq126EU0D4gFpcsSWNjsGlzUTRVqGje4VGoAy
         ERhA==
X-Forwarded-Encrypted: i=1; AJvYcCXjioKMe4xrO4JYicIR5MvuX5EnNGbxpHIEb4AoSHyDtTelppyw6H4iSCyG0zLRmA+0LPFkhsaU2D/feGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrj/fIy12JgBtNouzVPfYJeqCmchNCW95KQbA8tK+hGCSGo2hF
	Et4wDIsSc09fcpVf6zjGLEycWtDjvQVo6QXJqiPGzWWP70D6OOyRJuUx/ikXdT7kiJE=
X-Gm-Gg: ASbGncunlU8IzpEST2GYzXQpnRYF+IU1QBx0/vXtGIEymcneYF0iw2qF3BrAYee5xRV
	m3N/33Xkn5lYSyf4JfzneFtdjjJ/KVTihVReYh55Fj4Dxwt21sb7CPzyjCzsEsmWEwI3cXBfTGP
	HMfwmUeFMekB4IC7pDUkPCN1vGBXyM3+TkAPGeyQ1gp3p1qc1rq7T1QVmAcGo8BOWu3jYPfF6tX
	EALDlzeG9IyHiofpzk2guuYc5tW1EgCEuGp/TZcWWYWLcr9Sc/PaJYKXUKsmeQYzWkhtuxjieuh
	YwOGYalPVzo4EYCTLFEjwo5fQAtgR17E5z8TesxnkRM0vQCsoTMJqTHp4ju5ks/EonH5mfi4IVf
	YPxPG
X-Google-Smtp-Source: AGHT+IEHPxZf5K+6rB6h+G22ROpgqRBCwgyhaeWghhTRXeAPT0VUHYSFlG21O4cgJMdUdvOxbVQ28Q==
X-Received: by 2002:a05:6a00:3e17:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74af6f2f9d7mr18261164b3a.19.1751260663025;
        Sun, 29 Jun 2025 22:17:43 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56e3ac1sm8021982b3a.145.2025.06.29.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:17:42 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:47:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/23] ACPI: property: Add support for cells property
Message-ID: <aGId6M_0D0qERUu_@sunil-laptop>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-15-apatel@ventanamicro.com>
 <aFka3y1494LIzyUA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFka3y1494LIzyUA@smile.fi.intel.com>

On Mon, Jun 23, 2025 at 12:14:07PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 05:43:49PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Currently, ACPI doesn't support cells property when
> > fwnode_property_get_reference_args() is called. ACPI always expects
> > the number of arguments to be passed. However, the above mentioned
> > call being a common interface for OF and ACPI, it is better to have
> > single calling convention which works for both. Hence, add support
> > for cells property on the reference device to get the number of
> > arguments dynamically.
> 
> ...
> 
> > +static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
> > +					       const char *nargs_prop)
> > +{
> > +	const union acpi_object *obj;
> 
> > +	if (!nargs_prop)
> > +		return 0;
> 
> This check is implied by the call. No need to duplicate.
> 
> > +	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> > +		return 0;
> > +
> > +	return obj->integer.value;
> > +}
> 
> ...
> 
> > +			if (nargs_prop)
> 
> Again, if you don't won't to reassign the existing value, it's better to have
> this data be collected in the temporary variable of the same semantics. Then
> you will choose one when it's needed, no need to have this dup check (again!).
> 
Okay. Let me update in the next version.

Thanks!
Sunil
