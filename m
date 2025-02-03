Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3361FF613;
	Mon,  3 Feb 2025 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575954; cv=none; b=lEM+jWl0k/z9puVWVNIyO972EZsdTosnAt1eqjTdUpm4qS7rDAZBxuRvDJTwoVNXVoKpm9pFbAuEbb/pOeY0oFrVadKW2JoV2m/jMLE96eRMiIM/Oal7jShchQV+m8wuAEYKeDjvskDDHc5yscVPkkr2PRLz+6C+byqyz6sJ0eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575954; c=relaxed/simple;
	bh=rstTH4HxPCJrnbCU4UITudFVvJpWca+YiZPY4gaILw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8eUNYky0ok6zrA9LegIVQxFEC4phtr/DafUTSL9gPtn3v3oPfkvP0GiDaVNOPWE5jege9cePa/Yn08owMiM2Xt8cpfK9fAj+5gh0eNAQKtWtzCiH1dLM2xdofWW10zu+PFOSeP0jTd6Ng5AQH4BQy+hGl0uSPMSW75vkHU0I/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9O9iHMd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9O9iHMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738575953; x=1770111953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rstTH4HxPCJrnbCU4UITudFVvJpWca+YiZPY4gaILw8=;
  b=C9O9iHMdtJRKGg8Zyk4A3mJ9Bo+zE/7AqAWvcfjNzfcjPyTmX0HF8I/1
   1DasM/XkF6o+dRQtaXf9HBBKoazWvpWuIp/+E7tNdEgbycnctMz9SNlbm
   uIE4VWDXQUhfPZVyiEHYnGZFEMhxPimtGKH9yU9PdF9cbfOdTIww4Y92c
   LpxZoI3O1DooGmW59MFsaSeuZwiqbOx4PbbxpVMzlkIMZXOzgyiNJ7Z6t
   e7YcQTpQ+k1ytw6GcTPORAgJlgEQ/3XU1dHLKXjIaC9g3zsgalPvum5Pp
   hUkQ8CjR6V+UnXRXAWDvwR6SbSNXpGtonsR/rruOYpZxXkxM0RPeAP3Sa
   A==;
X-CSE-ConnectionGUID: c86LGA8ZRMOeZtslT5wSsA==
X-CSE-MsgGUID: YsHdFvQqQZq7ymd2aOu0Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="41894391"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="41894391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:45:52 -0800
X-CSE-ConnectionGUID: QlEalOV5SXWFrYoa7tlydw==
X-CSE-MsgGUID: +zqACfbiSdGiFD7VLplOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109997448"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:45:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tet1R-00000007mwP-3nns;
	Mon, 03 Feb 2025 11:45:41 +0200
Date: Mon, 3 Feb 2025 11:45:41 +0200
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 15/17] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <Z6CQRU4uCNBwVStY@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-16-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-16-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 02:19:04PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> mailbox driver.

Ah, here are the same comments are applicable as per patch 16.
Haven't noticed there are two similarly looking changes.

-- 
With Best Regards,
Andy Shevchenko


