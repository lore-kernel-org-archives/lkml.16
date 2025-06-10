Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE728A708;
	Tue, 10 Jun 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549352; cv=none; b=EYv4wGjUsdq9s7w6DVFkB9UkI0ySsnIVmvt1wVed32Vr0l7ZY31+kIhcvFKNxfOCP0GkooEfqb+VqOKsbFQa9zu60bEOziaEJYb0LTzgOT9XvHYY4CsJPAuqU0GaV9ipFHn6wy+VGFHfF5wCYMhGUT+O4eSzPp27RPSuCPcbl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549352; c=relaxed/simple;
	bh=4qI7m/FiLSi8MTV953n9ML6PMwZQ9rp4zePGb84alio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h852g6tW3q3ehQmEr3FQ58pgGbyof1aQQiXhMbaTjmaNE1FWhQW/vfodTBJCyt9z3dbkwYimeacF4FoNQNDntbSHNzlg83RO8w+Uw+L3q+MfU6dGsY0WngMcslp5zMfQ4QmoSMcNfU2dNqgHbspBAQ3weZtkgZPWox23ORCs7Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlflpKhY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlflpKhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549350; x=1781085350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4qI7m/FiLSi8MTV953n9ML6PMwZQ9rp4zePGb84alio=;
  b=HlflpKhYiZtNbDHbd0fAzbCi6vJrIM/MUGJc94UPlHzn07lWf314LEAv
   z9ni0BO8gQ7Xpg2KsD3jQhmD5UNFnitpsU8aEoWVlymtojZeDu05lljfE
   HPJaiEpuKXhVMGQZzcFuBpIcuSn4uncjSoOm5mBvsl+TozG1EYlhwzPgT
   CMmLBf5O+Ag3Tjrfce3Kfen/sQUHfnxXPC1GGnLwjdKvqXWQXEuZdgvxP
   RHOAhle3z81u+IS1xk6xbn7DAJXQADTYawhihyK+Vu5DFDvFexXAnH9R8
   5nn4hytrYpkXz76EETOP8RVExinyQmuM834IsjBKHVdh87zCG19WKMHZr
   w==;
X-CSE-ConnectionGUID: 0dzbAzF0QD6ULMvmOFiWYg==
X-CSE-MsgGUID: hZGp5IssTJKfYNukdHxalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51639948"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51639948"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:55:49 -0700
X-CSE-ConnectionGUID: W+qxXQ1qRAqkZlXrBUzizg==
X-CSE-MsgGUID: bQSff4A1RU6QeO3HCG2aoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146698329"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:55:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOvhj-00000005JXP-0mpg;
	Tue, 10 Jun 2025 12:55:39 +0300
Date: Tue, 10 Jun 2025 12:55:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aEgBGup553Pki98e@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
 <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
 <aEc-SHvL187xdj-m@smile.fi.intel.com>
 <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 10:05:27AM +0530, Anup Patel wrote:
> On Tue, Jun 10, 2025 at 1:34 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Jun 09, 2025 at 05:59:40PM +0530, Anup Patel wrote:
> > > On Wed, May 28, 2025 at 4:23 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:

...

> > > > > +     if (mbox->msi_count)
> > > >
> > > > Is this check really needed?
> > >
> > > MSIs are optional for the SBI MPXY mailbox so we should only use
> > > platform_device_msi_xyz() APIs only when MSIs are available.
> >
> > > > > +             platform_device_msi_free_irqs_all(mbox->dev);
> >
> > Hmm... I am not sure why. Do you have any Oops or warnings if the check
> > is not there and no MSI provided?
> 
> We don't see any oops or warnings. This check is to avoid unnecessary
> work (such as acquiring lock, checking default domain, etc) in the
> msi_domain_free_irqs_all() called by platform_device_msi_free_irqs_all().
> 
> I don't mind dropping the check so I will update in the next revision.

Perhaps you can rather add this check into the callee? Seems to me that
you have a justification for it. Usual pattern in the kernel that freeing
resources should be aware of the NULL pointers or optional resources
so we may call it unconditionally from the user(s).

-- 
With Best Regards,
Andy Shevchenko


