Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CA21DE4FF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753917; cv=none; b=HoFhZ4LiFngijFMBEh71CRHPtNlUr8A9mTWars1KTbH62uGFiRyx4ez0hmL0G/4Sd4nCR762KHui5GCFb4ObtE1I5gLjE24V25Mk0n1kmFZuV3oMyuW2kvz28uOm5/rohH3rqdPc9U3rbsLn5eWTZZvLePj82RYpAy7TcpLAEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753917; c=relaxed/simple;
	bh=AM/CMJfK0GYiU4RCv8jWMyfn/lCdgsfSJwTNeIpKM2k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWIKwS6bmaLUZ1UoqRtnk/o/aAnlKSmGaisxC88TUZ32CgKwJT4kSno+R4WtFNaSqsWVK+n7z/LabjfdErqK4axyiDd+x9mUeBbzmmSHKYdnE4gNv7U29t2wAA/Lzve4+blKo0VFxLug5v5FVoW3x2MuMDMVubZ14kcnkjjo3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 320ce3ed-47bd-11f0-a97c-005056bdfda7;
	Thu, 12 Jun 2025 21:43:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Jun 2025 21:43:56 +0300
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andriy.shevchenko@linux.intel.com, andi.shyti@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, digetx@gmail.com,
	jonathanh@nvidia.com, krzk+dt@kernel.org, ldewangan@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	robh@kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <aEsf7Ml__JE1ixQX@surfacebook.localdomain>
References: <aErOOSxt0ovCIeSA@smile.fi.intel.com>
 <20250612153338.68829-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612153338.68829-1-akhilrajeev@nvidia.com>

Thu, Jun 12, 2025 at 09:03:38PM +0530, Akhil R kirjoitti:
> On Thu, 12 Jun 2025 15:55:21 +0300, Andy Shevchenko wrote:

...

> >> >     if (handle)
> >> >             err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> >> > -   else
> >> > +   else if (i2c_dev->rst)
> >> >             err = reset_control_reset(i2c_dev->rst);
> >> > +   else
> >> > +           err = tegra_i2c_master_reset(i2c_dev);
> >>
> >> Can you please take a look here? Should the reset happen in ACPI?
> >
> > This is a good question. Without seeing all the implementations of _RST method
> > for the platforms based on this SoC it's hard to say. Ideally the _RST (which
> > is called above) must handle it properly, but firmwares have bugs...
> >
> > TL;DR: I think the approach is correct, and if any bug in ACPI will be found,
> > the workaround (quirk) needs to be added here later on.
> 
> As in Thierry's comment, I was in thought of updating the code as below.
> Does it make sense or would it be better keep what it is there now?
> 
> if (handle && acpi_has_method(handle, "_RST"))
> 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> else if (i2c_dev->rst)
> 	err = reset_control_reset(i2c_dev->rst);
> else
> 	err = tegra_i2c_master_reset(i2c_dev);

This will change current behaviour for the ACPI based platforms that do not
have an _RST method. At bare minumum this has to be elaborated in the commit
message with an explanation why it's not a probnlem.

-- 
With Best Regards,
Andy Shevchenko


