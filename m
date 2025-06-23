Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240B1DE4E6;
	Mon, 23 Jun 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669727; cv=none; b=VCLir0FGKDEmRaFx+WIwxEKOrLX5oq7PcCc7TLeZS50iPlPy95c8Ojgo95fAb0TvAzLdth87R8uN6V1714pxtl3V4bygfmUZ2aYgeR6zp1tg2p1Sr4M8ovK+ZreFg6pHfwcdVogvM23YwVQmR40G7f3UHqrakY2+NVrfX5ha8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669727; c=relaxed/simple;
	bh=W7hiJd78r+59Ny4okc/0aID6HplmUdQ4ZRFh1yeSVfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUX59voch042MjConPL7i5p85ThALvpRZ/5iScSQPFNhs695k2cpu5fw2w34D3/IYqHfAslE9zIzR7YYBHIwWNP1avUgpboRoj260HeAw2yRBdYOfg7j8yrK9BIUuBMgR7n7oAnATBkD4eiiLlUdN7TaroTLGc26cw+0XjAc8Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGQbN2C2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGQbN2C2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750669726; x=1782205726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W7hiJd78r+59Ny4okc/0aID6HplmUdQ4ZRFh1yeSVfc=;
  b=cGQbN2C2+EloY1PliYfaVHSgvrC1C4hpz43xLMoAoEJl0oZy3rjkyPEI
   JJ7s3vU9UJtoBLu29pNtmHAkt1GvVz+z3D/CYe/SiQ+9QEp3d8U/jqfW1
   Cw9KMbRr/hckbg9dV+Bicr+OSq3TAAEs6/gVYuB3qvUuhli4SICGmFBzX
   ehh9fHguvvcbgZxkLXCEpXq+8rwl2rLNiRP0uj7wIDVW0bjQzKXmgaaHS
   /6OgdO3S3qc1heqrFieorg8hY2U9Yi87hk3iNKizN7uu2IM/FaKl6aXBw
   iqDs4WeZjfpqNGaeUnCiayIBu1Wey6/kwuRgsrR1fZIBJay7k2B35ZOqK
   w==;
X-CSE-ConnectionGUID: 8Uzez2O/SASjB0A/dpnRdg==
X-CSE-MsgGUID: dZVOpqgQTUGlQmkzto2JHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53007167"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="53007167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:08:42 -0700
X-CSE-ConnectionGUID: NFYrKPxFSoSykF6AvZkAyQ==
X-CSE-MsgGUID: OhoYh5ZHRFKw4wgUN/vAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151115142"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:08:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdAF-000000097MM-339k;
	Mon, 23 Jun 2025 12:08:31 +0300
Date: Mon, 23 Jun 2025 12:08:31 +0300
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
Subject: Re: [PATCH v6 13/23] ACPI: property: Refactor
 acpi_fwnode_get_reference_args()
Message-ID: <aFkZj2QCU2LfTI30@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-14-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-14-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 05:43:48PM +0530, Anup Patel wrote:
> 
> Currently acpi_fwnode_get_reference_args() calls the public function
> __acpi_node_get_property_reference() which ignores the nargs_prop
> parameter. To fix this, make __acpi_node_get_property_reference() to
> call the static acpi_fwnode_get_reference() so that callers of
> fwnode_get_reference_args() can still pass a valid property name to
> fetch the number of arguments.

Looks okay to me, but I think it's better to have more eyes here (Mika,
Rafael?).

-- 
With Best Regards,
Andy Shevchenko


