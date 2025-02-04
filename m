Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB435947
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738642721; cv=none; b=R+5d1gKcho3eHQQt2rIOX7lrzZWV+KhEvbj6jejhG7/ydGHXhyEOfCCf2927emwjBm6BFuqVqziq3YvOnCkgrCfBUJnlIS9h5cs6+omvoOaJyhvVpNxPh5qaKUUhHugoKqRc3ZAxEsWDqv6M2RBFojY2FXRUohrMhkDZy3Slo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738642721; c=relaxed/simple;
	bh=8RYsFsyt9XKOqCwg6qJ9SOV8hycqHVsUml8P7H6kN0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wll6C+R/CZmpp+xNit5UIJvcJLMk0gDTTXwzVRQm0mJg3fwruJ2KAGj5DZGfZ3ciKAT+4pNfbm3UMibFJb/u2q9SK9FdFGABZBY71hjhv3b8MNVFPnXRLxO/Q7dWFbtvDwtuEvbhf6b1w+IVA4GBDZVkaAtXdvOoDILranR9J0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ckHZ8DZ1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ckHZ8DZ1"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6ed0de64aso446072685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738642719; x=1739247519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1DvyAG/gibJ4Np4As+DdlCtpsc8Q7r5eOByPQszzk7g=;
        b=ckHZ8DZ1q3jbYj6f/WhJveGGHgffBtMr7vry6JKPQQSVTFfGB6ivffFF378nYcSrN0
         0C/FVyMUplPBbGNj9kr4JwBGUe8CJe1Mm7p4FOz7PVH7QThfawbcq13PfzFYqlqRVXyD
         f51ZJNQdouOem6vYs2v58TjnJR04m2iPER2ygZD4mL+My+FJLgT2Y3P1/GoJ9ojo98Xr
         IWhwyvgehCOSb1Hvynhe2TKMKlaUKdW1zgNu6heDjgfeO6HdOONFLSN7MT05WJrGmQGy
         sdIPIrJEbJWhnJ0jiD6ZIvvrH3VwyzR1gscfFGsvS9+DMOoNpKS2ZiFpFghpgu6CreKE
         yb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738642719; x=1739247519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DvyAG/gibJ4Np4As+DdlCtpsc8Q7r5eOByPQszzk7g=;
        b=MXCPNarVmgs3rgHfZpCg9gJpba787mJjN5KaxsAaMTzyH1V3N1+NlQ6c0iSxoaLenl
         sX0JQCGJxzt3m7+o9zQp4bFPHyO7Vo4Z9tdjoILjsUW0tSvqz/2C+bqjernlTukHlCEr
         qByNPOJRPNsC8YrePYuPgzd+ohLSk8HWYZjvkMxg+CT+jMxP/ZSuYzeCsgnji+ZU1k/W
         AndNLoxhVDe1ouX/uY+8KYzgpoLJE+v8/ssgtSwOSPrBiZsJyH4Qf+6ebcoBLcJZe2ID
         L5eD9LGL24W6zc5DWFRmr5xiB9+RDHeFYUapXlYJng2Uhrp/IaVCvVfs6vsVKrsR35vY
         b/dA==
X-Forwarded-Encrypted: i=1; AJvYcCVnGiGk0CSTRGjpWbCWnmDtbGXimhGS2LIMqb1QXr9Ya+Ry+J6nZ9s/P69R767gVHjG4rNjLSs8GrKnBVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7M+Ydzi545eVjWhaBbWTXF1zqkTtvWc3iss40XvR2ekynkHV
	dqI7p4Y7wT+Qd1eB6aYRUOUhy38oqSKw06c+EfslrR+sBipNQiksZ3sn0Sgtr6Y=
X-Gm-Gg: ASbGncvxSbc5C4Lxezvqy00mfa/dJ+Mc/42IxhtsR5nKQKApd5gjnzS9aDXQqVtYpCA
	sgKOkZv9DDBeDjOs0HHj/F2H009Qn0cbiqcIq2BZ1pc+kEYk16eopTvBsDyCbpiqvbDRgwOeghB
	kM9zCnMY+qrUsCZx0bs5fV3IEsI28xd8GQU2pAtufr7L1Jx2exWX0E2rCIMV73b0eSKqV5PmZZN
	CNUTyzPxRyv6AeNJhZEqM1qLjChdPRy366NrKRsBLUEBJ2FgCM+IxA+/oHHjuxuYzvM+cibFMyW
	s6MAICsB3zWOpyroMkbDK84=
X-Google-Smtp-Source: AGHT+IE0f4QugKabfRRSBRleOS2KB1pvcyWkZ6UoqvN4crpYoZxJOEqx3b/6o3pkY3LuZEm1BmbQlA==
X-Received: by 2002:a05:620a:3d84:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7c02eb7da0bmr280078885a.0.1738642719178;
        Mon, 03 Feb 2025 20:18:39 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90571csm597775385a.83.2025.02.03.20.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:18:37 -0800 (PST)
Date: Tue, 4 Feb 2025 09:48:22 +0530
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <Z6GVDuhNyjFQ4OKT@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-17-apatel@ventanamicro.com>
 <Z6COlL_5n2AfRADL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6COlL_5n2AfRADL@smile.fi.intel.com>

On Mon, Feb 03, 2025 at 11:38:28AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 02:19:05PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.
> 
> ...
> 
> > +	if (!is_of_node(dev->fwnode)) {
> 
> Please, use dev_fwnode(),
> 
> But why do you need this? Can't the below simply become a no-op without
> this check?
> 
> > +		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &id,
> 
> Ditto.
> 
> > +					     &priv->nr_irqs, NULL);
> > +		if (rc) {
> > +			dev_err(dev, "failed to find GSI mapping\n");
> > +			return rc;
> > +		}
> > +	}
> 
> ...
> 
> >  		 * then we need to set it explicitly before using any platform
> >  		 * MSI functions.
> >  		 */
> > -		if (is_of_node(dev->fwnode))
> > +		if (is_of_node(dev->fwnode)) {
> >  			of_msi_configure(dev, to_of_node(dev->fwnode));
> > +		} else {
> > +			struct irq_domain *msi_domain;
> > +
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> 
> > +			if (msi_domain)
> 
> Hmm... The OF case above assumes this check is not needed. Why is it special
> otherwise?
> 
> > +				dev_set_msi_domain(dev, msi_domain);
> > +		}
> >  
> >  		if (!dev_get_msi_domain(dev))
> 
> Even here you have a check for NULL, so I believe the conditional is simply
> redundant.
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> 
> > +	if (!acpi_disabled)
> 
> Why?
> 
> > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > +#endif
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> 
> Drop this ugly ifdeffery along with ACPI_PTR(). They are more harmful than
> useful.
> 
> ...
> 
> > +static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
> > +	{ "RSCV0006", 0 },
> 
> Drop ', 0' part as it may be converted to a pointer in the future.
> 
Thanks!. Let me address your comments in next revision.

Thanks,
Sunil
