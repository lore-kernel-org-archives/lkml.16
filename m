Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9E14900B;
	Wed, 11 Jun 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630088; cv=none; b=LjsYiSjEUluKdG4miftjPLgIzcYaWeMOYIdk87qfjpNssWRenlClKBR/iaK6mz3rKVVNAJHg5I0Ws3S6Z0FfhvdJEut7hz6QnSkGKAD59lKUueNVNW0D5Bk6VOSe3tRF1GyoCo3pdeEvGfMr155c/YaazjLMeJL5M1W5Ii4r9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630088; c=relaxed/simple;
	bh=f0DOFaEYP8MagS1qPDHfS05rAbYBRe1MWToUpeNj/fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW0ODjkvoKuBnstKAT84MXniM/lVNaHqp55uqik8XEJQZF7eufKTNU/K/ApdymEt7O0bMkvUlQ8hhK9tIQl5Eq++BRTqd5pTkqAVHqbgX4IPAKAhBITROKBpHN5B0Q5qt9K6gveIX0prUL5DLS1BxyT0rHlGcGflPjYOlCkmUdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnPeFUnV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnPeFUnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749630087; x=1781166087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0DOFaEYP8MagS1qPDHfS05rAbYBRe1MWToUpeNj/fE=;
  b=QnPeFUnVMmqEJpFaWOfC/YRwyeP4OQWtaqgE+W7k5h98gicgU/Of8Bcy
   bRg7uCf7F/mqsyA3GZkJcu+Luxo/n5ek1aKV3/ldmOErG7Z53UYpwpN/f
   cKhNCf2AgWAQvR/z36aJCPs4OacYgwov8z2sbMIEhaAiXrWB0Nd6I1BSK
   1CdGlcEr1n6iIyUP0coQDGLi3Mo+45LiLQPyBRp7pdDNbcOYmbtNrFLUN
   qbJ4aH6R17aVcrhOzcTMY9fgi2QYkYwF8qyEZsDmCtWn3oR6cHhLjMaBT
   /rcRlDV6fFTKWgOcQNZMWmKXrFjCxwCY3fH3LsQbLUfeWKanwkblDoxhh
   A==;
X-CSE-ConnectionGUID: q2lFyQsjRrK/2bMgU7NQAA==
X-CSE-MsgGUID: zFAThp2yRNWamK7epzkc9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51909763"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51909763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:21:26 -0700
X-CSE-ConnectionGUID: We/pXEkUSQaqbugsgC45UA==
X-CSE-MsgGUID: cibwTyIiQ4qpfhSF5CLNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="152089121"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:21:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGhv-00000005aDU-2vxY;
	Wed, 11 Jun 2025 11:21:15 +0300
Date: Wed, 11 Jun 2025 11:21:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
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
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aEk8e6CQa2gE893v@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
 <aDbuABrlO30TIrx1@smile.fi.intel.com>
 <aEe3m23wIDM1I-AH@sunil-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEe3m23wIDM1I-AH@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 10:12:03AM +0530, Sunil V L wrote:
> On Wed, May 28, 2025 at 02:05:36PM +0300, Andy Shevchenko wrote:
> > On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:

...

> > > +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
> > 
> > Is this reimplementation of list_add_tail()? And why list debug is excluded here?
> > 
> Sure. Let me use list_add_tail() itself in the next revision.

Thanks,

> However, I didn't understand the list debug question. IIUC, list_add_tail()
> is a wrapper around __list_add() and doesn't exclude the list debug, right?

You are right, it's not about debug, it's about using internal function as per
__list_add() documentation:

  * This is only for internal list manipulation where we know
  * the prev/next entries already!


-- 
With Best Regards,
Andy Shevchenko


