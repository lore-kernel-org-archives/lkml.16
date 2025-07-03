Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16429C33E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540074; cv=none; b=Az/I+DtmoawauIQLmPT0Os1yuAQIpnm12vghAUwwgNxRoq8DHqe96eJlZfrKqv8j3V66NQzN+EpugUIsjxxY1Hj+iWKXholCaLe60CIlQMejlwbOEEVWP+CZGL7Xj2WUrzAvPnE0np+ZEi9dhnL0LFvNbjh4qAslYPBj5auhNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540074; c=relaxed/simple;
	bh=9Um7uqVayv1y9jJFqULzHKt3MEGzxLbLkz23BHaitvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndm3iV0MGIWR6PcFMxHqD8BZiB5uC601amTbwM+ZO7VW4IQIo7t83IhYp7s4+u9P8XjeGnB2T6bPC+Lguh6LLNEG+fiFSpvAeDjbYBtquV5/wWmzhUhkhcQzQPxCo/ZYQKkT4QCwAYZLcnP9m1tetBSdYzVez8TmM5LZsRmkSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XsywZlyF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XsywZlyF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234f17910d8so76559425ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751540073; x=1752144873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s+0RaBS3vJpNgepBHSmk/I/U4Dvicv46WDE7RU8TKg=;
        b=XsywZlyFZKDwUjRTunWPaMQwmKfQIjlzjqhqMs2eLfuv79cc9CIu/BAOs4yJmruXaD
         5ztuQUrvRkFL7ZAawFO90LoW+h8TavRg5CzQG1pfOqo0IusW2IMivbJRH5Zvu+smQLg6
         KxUq+pTXMQFXXGU72hipZUFB9eMR3yoAbYSKoR//9rKWG/0NB94qmMSmfhYFbiyb/xKG
         xd1T1h0RgelmR+PAR4b2WKuU2efv3cQAXqMavOKaqhO6AVfHYi+0R/vIidaj3BoUGhxO
         xhu628Bny1QzZ481DpjTr5kUXw5axzJinK3MRsJ1w0fwG/hMJjFN6p3eNZ1yn78SEmwz
         aN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540073; x=1752144873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s+0RaBS3vJpNgepBHSmk/I/U4Dvicv46WDE7RU8TKg=;
        b=R4jdJDsDh0iQenwNdq7KzL6avegb6Y08AwYWHBfVFarrSBhF2hrlhkSb92tEyyxuah
         IW3QCLvcwTFPrALWY7vAnLQwUD+1h6u0NjwHDX3rnr6gnrIrV44aR+T7yCCuQar0f/bd
         ixwM1xMkRgjivzGq8jWLn0PTYmLR5F9wQxDiQnkPhPYtNIGMaRPjYIzjc4VY1hjJ5Fkh
         qO53ZUE5BNL1DiWUIXWdulolnssw85jHhy9YrqiVzNg7V2D9Q4gGQC3en6snxBj3/Fw2
         9SX/pDNWBIJdqqSKpvebg+j68Izf8kDowE2dcQ7fCUtpAMs9eIdNl7Mp+NZvYLNN7jGL
         PxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA6uJMMX9aK+PJr8fkvkqSenCUQOYOfoMDR/0Xb/RxQnzKQaDdOjSDDYPA75OgPVBcaYUu7JQFu8YgMHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMqCkr6UgwqmfzTLJkC69ujo8HKOcdessAtrYI5qUypJhWSeQE
	R7+vjggMc/Pxpn++AwIb24/8ht5NITLeqqSA0XidCDrKZog9BQh4XVuTLkdVwYAQCn8=
X-Gm-Gg: ASbGncsjddi/HgJk56PSnDt+X273cwJ9CSO+yLw/TZgk9qBttj/AB5/SwFWe9FAuxD6
	TflWSE3VmYjISwHeoVS8p7L4UgB8WmTU1cnwGZ4oHjCcXjlE4kXPiFJ5+pIxis1fqFY7eEgHkxw
	gsJA4fg2YQRTBT+5hycxYSIMhESKQbAHaeumf9zz40mFEa9LF8iC6neUH+tr2WdQMUwFxJyAN6r
	V6qSgldVmXw2kLROCuZOFaFTxXTpp3q+US9LiyWZJ6bYUs7oZFmLa2laL9PM52reSIviplfeHiG
	5IBATETkZsq/7c7+bm4Drgc41hF/z905PjsBS4eFLNKLo4iyCQwdmrpKUPxel/tG/beylw==
X-Google-Smtp-Source: AGHT+IFq25HTQ9QEIhNCp27zmZLx97EGsAxug71BXz+j7RxWXx0ck3JUwKi8dLTS3DtAE17Jq1LekQ==
X-Received: by 2002:a17:903:2307:b0:234:8a4a:adad with SMTP id d9443c01a7336-23c797fd795mr34397665ad.26.1751540072871;
        Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b9344sm158881255ad.192.2025.07.03.03.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:24:18 +0530
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
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aGZhWlxxQG0Z8awP@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com>
 <aGUl_S9irfhlHmy2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUl_S9irfhlHmy2@smile.fi.intel.com>

On Wed, Jul 02, 2025 at 03:28:45PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 10:43:42AM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> > mailbox driver.
> 
> ...
> 
> > -		if (dev_of_node(dev))
> > +		if (is_of_node(fwnode)) {
> >  			of_msi_configure(dev, dev_of_node(dev));
> > +		} else if (is_acpi_device_node(fwnode)) {
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> Actually you don't need to have the if-else-if if I am not mistaken.
> The OF does almost the same as it's done in the second branch for ACPI case.
> How many MSI parents this may have?
> 
OF already has a well defined interface to configure the MSI domain. The
mechanisms existing today are different for DT vs ACPI to find out the
fwnode of the MSI controller. So, it is done differently.

In RISC-V case at least, there will be only one MSI parent.

Thanks,
Sunil
