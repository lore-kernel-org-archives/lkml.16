Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFB118E050;
	Wed, 21 May 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836678; cv=none; b=jIVDUVz/KWuq9vZFjNobpHfpL4p4tgRiDCzZOfBXlCcfUWx3p//MrXMiZC4XmCAWkQBSKhkHyESFvdS3d9EN0IGAEmI6MUqP0VGChOFh3wFnp56ANzmYbeHwGnhGah5fYz89xDzc7cgVU0pIu0pLdAVIxtJiXIRXti7gaoPihlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836678; c=relaxed/simple;
	bh=apjPYqlsNolUKpGTQKj62mtZjwY4zQpEjSEbJumiJuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1vnJ03GOfDj+PFudUEjUcNYC+GYNvrhaov8BuirLrVE/wpxcRAdgg0gnL7JOqhvXDn95TZaqVKYHRd+ejNj5HPbogQ4HjSQzjK6azg1ZGQbtNndHzrA4uyOHp7isv0Jy2lmBygM+p6I5EmWz/ScqVG4C5dLXny0W3gnVs0/mTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPrNBiNA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPrNBiNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747836677; x=1779372677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=apjPYqlsNolUKpGTQKj62mtZjwY4zQpEjSEbJumiJuY=;
  b=hPrNBiNAMwphEH5M0mwk3i8TA2RNCnsTmNFI7GEdCCTKt+TDu0Ig4n7C
   Bxjs+5yBYrHSSHv1Vl9ziAMJcv87xwXmF7f9HkWbDnqBK80KpIo/bCQTh
   4o052uehjhGGLnkJJHpMTEhA37r0NSeCigDCTWsfUn2O8j+LD7dOzCqfH
   /mi9r0muM9JaHYygE96CwANFZmrleWZqIirNXwPK4Gs37TPAQ290cdM0a
   9wpJNKQPt+4zx1a5wMnxkcF/gOpukdMcl1Hs+YPbo1VB7QGdFBz0pzALW
   GUlkrvvWJxbwQWwFX1iL+xZhaHQm5PLzSjH+GWQPn6Bdk+Z0YflgYX1XX
   A==;
X-CSE-ConnectionGUID: R0deUqU1SM6jKWpnRCtBRg==
X-CSE-MsgGUID: 8sSvTEOQSL67+g5//2tepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60862273"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60862273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:11:14 -0700
X-CSE-ConnectionGUID: 6U0vakLaRt+lIMk/VQo9uA==
X-CSE-MsgGUID: VAbYWIpDQzWHSTf1mcFaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144067842"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:11:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHk9w-00000003dxH-3Ck6;
	Wed, 21 May 2025 17:11:04 +0300
Date: Wed, 21 May 2025 17:11:04 +0300
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
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aC3e-IXYb68RoIyu@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com>
 <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
 <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 05:07:05PM +0530, Anup Patel wrote:
> On Mon, May 12, 2025 at 12:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 11, 2025 at 07:09:29PM +0530, Anup Patel wrote:

...

> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cpu.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irqchip.h>
> > > +#include <linux/mailbox_client.h>
> > > +#include <linux/mailbox/riscv-rpmi-message.h>
> > > +#include <linux/module.h>
> > > +#include <linux/msi.h>
> > > +#include <linux/of_irq.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/printk.h>
> > > +#include <linux/smp.h>
> >
> > + types.h
> >
> > Actually this one is most clean, the rest of the patches where the new code
> > is introduced has semi-random list of the inclusions, please, follow the IWYU
> > principle.
> 
> Sure, I will simplify the #includes

Oh, IWYU (Include What You Use) is not about simplification. It's about
comprehension. It usually means that *more* headers need to be included
and *only some* of the existing will be dropped.

-- 
With Best Regards,
Andy Shevchenko


