Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFF28382
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039013; cv=none; b=b35KFrLvhgOXzv3TwydL5CIabe5+yPPgN4q1kdj3VVOBvZogj92/HgWDCLLIAAtL2DpyBosHNmM+IBZJSpx8R3ZSsgZK3eqr1egDfMeFRdgrNyUfOwvqCKRxMZebZqGeh3qAKKd0oKUkHGljvXFRVZaDa4HaLUXGeh1eZ3NDPjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039013; c=relaxed/simple;
	bh=TRB7eQyt2VOil6Xd2YCPJj+sLe3Q8um9y22xx0V3P2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nN1EivTpKzfW53lG73r69kKHZhZFrvzMF5uOvHPfVFv7IBHhUP7wnJlpwFzR5ZS42utzh4PD5UBLZrgR6n4CmTmxKLmGfIYlf+/9KIQ7++udnrzvUt/AYTXtD1Yco3gJUNpS0KE1qLM0zMPTWnxDc7SeQFxGaPWzdCZ0JmSWwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JbbxPg21; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JbbxPg21"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30c1c4a8224so3030910a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039011; x=1747643811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejc+fT9oBiZc6vlLfCLO2KcJoR0VUYj8MUaNRpcLSKk=;
        b=JbbxPg21aN72Mm5UnW3XeSQWJcsGn+Sx2dGUY88ooALtbgIjFedL4tsQyXIKdj+lTL
         w+d1c2skjR7ZGtRAxsdpT2rycGOQSNl9PThEE5nzu+QVJZ5zMHqXMGWEirowPVUm9zg1
         BfXc+bOSVijZPVqqdVOF6tfaJf+JCB6nQmLRuE46B41Vj6uqXAiAjdHVxsRUOt9dyLyR
         oW3zaLFa25713dYD4SdUrN7rwBgsNadJi7AcYCONBfpbaVEJF4YLRmTopD8cPcK5ZRBh
         vPfG5SlJHEfbS+xOH5bIS89dUfM8ZX0tS8593BLr4mqi+3lMu9cBNYshqT5B96sU8FH/
         nrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039011; x=1747643811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejc+fT9oBiZc6vlLfCLO2KcJoR0VUYj8MUaNRpcLSKk=;
        b=Vyb4dZKK7gunnT7gjXygA5jhBX5l0sFU2UPb8AdDJJ3ULVoiab3vzgtMSwYIzmczoX
         iTusX8RGvcx0twhVCZdyAAQe00lXhdca4Dpa5kCFY3qXnkSG/H05nMK1RwkAZIeBPina
         NUHCf+bzFhiY40jhuzvJEiMWiovZ6bEahe0NqcXhhnCTdVP6MG63temTnHsqEJrREyxR
         rauUtTxC1HwSaNDw+aMY6/D7tOsXpK3TqdTRPqAbbQAO+qehhzFX4r1M8l5bAe6/Mhrn
         iQHwjUs0Dftk2OE6PBH4dRCnkrfvK5vopcNjR2+zzKRdrv0buBusIkUPvdPWxxIRk2Zh
         x1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU61goXNDoozgk6aTOk4TgeJR10DmrWoVNn1DpWCth4P+icezhfqUPQmQSUntzhc7rpQWmY9gPmxUfIWXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwKp6WmweS2huUuvarxuxjb/9yI7hMjrjT2REVUlw90U9hpF9
	z30a8AN2KcHYv2oJnt+8Vm8y2iPbnn5ZWaHGe/UjagQQZwQqnwL18rpIjYw+0p8=
X-Gm-Gg: ASbGncstVnuOjmQUt0FbPv4qlJT3k7bH1sHfjCG02qJTzoIPcCzOZNtX51YnoORYIxB
	gnaNFmGwNkDWmWJi5KvnW37HAupn4NvhXRD1zq5z7aDSYlx9g3gjyrEW6gR+DHwDlctZWEyaJ5+
	b18SRLj7dyZf5YJpxAQgVcwijyxCOvwq1Osj3Ax7Zr0ImL9bgrW6drEKw0k2AnTtGuwA8Ks950o
	rd5Z4pR2UMMjInUju2zRlQR55XNdD30pVYmhV0zP+s0/cJBTAYglu5hdMU0vncLomhzUwZTMnSz
	2hL2JXZJUqvhD/yD4xmyeuqq36KPeKWc9tH/PCdwQvkV9nV6PRH6YBPFrig=
X-Google-Smtp-Source: AGHT+IETI+63sqf5lJSJNfnuKUbP5ALGJFrOUXpQSYU1rR9FXckU+YWdjPI/7RMywkT9jw7jl9sPHg==
X-Received: by 2002:a17:90b:4c8d:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30c3d65e2a5mr21634709a91.33.1747039010926;
        Mon, 12 May 2025 01:36:50 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e760acsm6089961a91.47.2025.05.12.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:36:50 -0700 (PDT)
Date: Mon, 12 May 2025 14:06:37 +0530
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
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCGzFVXFBVRbMUKz@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
 <aCGjEdNVH3ughITd@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGjEdNVH3ughITd@smile.fi.intel.com>

On Mon, May 12, 2025 at 10:28:17AM +0300, Andy Shevchenko wrote:
> On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> > mailbox driver.
> 
> ...
> 
> > -		if (is_of_node(dev_fwnode(dev)))
> > +		if (is_of_node(dev_fwnode(dev))) {
> >  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> > +		} else {
> 
> You probably want to have this as
> 
> 		} else if (is_acpi_..._node()) { // you should decide if it is data, device or any type of ACPI node you match with
> 
Sure.

> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> >  	}
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> > +	if (!acpi_disabled)
> 
> Hmm... Why do you need this check? What for?
> 
When we boot with DT, ACPI_COMPANION(dev) will return NULL which will
cause a crash in acpi_dev_clear_dependencies(). Let me know if I am
missing something.

> > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > +#endif
> 
Thanks,
Sunil
