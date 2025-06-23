Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73850239E6F;
	Mon, 23 Jun 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668678; cv=none; b=tPJOECwuGIRUSOYjROzkfH9LLQ2JvHZA9IPpCWmT42QQg309Y8HSVaGk0BC/DCMUGBUdo7a61pnITLxfgjXTx0+mJeZ2aLI4KfQpsTADi5ru8ZmGdwVTRAXgN80Tx+MXuEOaKFP4Bh1InNp5ybxZcsI5OLES6x7uY6cF3yIWgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668678; c=relaxed/simple;
	bh=pUTt++AaA3xZ/EEgqLRC2Xe4dn+oIgpfZgMfM0kN/E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKZ8yX3P719LbIok3cVDcteSbOivrj3y7cyfi+nDNf2D9/CYkS6FVlWkaRmtlZHOZSJ2e2RstwzJW4/yb/qEm+uJtRSQ8aNTw1+U57LebvPDwjMX4nUEpnc0/Y+kvnNjCG37YM4mCLCQkGx84rYyD3OQoGvvT/fDGktS4BlGHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIiQhLsi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIiQhLsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668676; x=1782204676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pUTt++AaA3xZ/EEgqLRC2Xe4dn+oIgpfZgMfM0kN/E8=;
  b=BIiQhLsiYLuxF6QuwZssbMClSGBXAU7peMcjJS4hZmY3CFogGfPlb+tA
   GMEXHPIeKhrIcq+B46CD5d2tLZbzbQsl4UTYUNLAo1sGHtrmt0wUxuy3H
   okPl5ugECqM3faBpOVjU5ldnCsGyBfgeBslbpecNCIymsAYXTnoq0uvLO
   p17qzi+ULd7m1aiDXYdXKwnsZFPwhAbOLj4YsROK1QVfnIPvk847LxxlE
   0teRv/1bwBrlPhPOoXYjYgxznydxvzZcy350nR6ufg8eGSbgATouTxlM5
   gKprfSme8M6y09ww7u2SMsa/NgouB0XV+l6N0vh12a//xlgWJshgd4x/x
   w==;
X-CSE-ConnectionGUID: YqwTBZYhQUSNcDv22eOGkg==
X-CSE-MsgGUID: p/xq9Lk7QxCm80nuP3RjrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52941050"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52941050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:51:14 -0700
X-CSE-ConnectionGUID: STb68b2sR9CARqb+WPZ4jQ==
X-CSE-MsgGUID: 4MpMhRkRQBOcrFkdNlGbmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="182578435"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:51:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTctL-00000009788-3ffU;
	Mon, 23 Jun 2025 11:51:03 +0300
Date: Mon, 23 Jun 2025 11:51:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCH v6 00/23] Linux SBI MPXY and RPMI drivers
Message-ID: <aFkVdzxl5GhV_etE@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABb+yY1UAwQiLCFY0Om1wsG+Hf_MobLfrEMx8JVdvoehVZ-g0A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jun 22, 2025 at 11:26:21AM -0500, Jassi Brar wrote:
> On Wed, Jun 18, 2025 at 7:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
> > are frozen and in public review at the RISC-V International.
> >
> > Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
> > Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
> > and RPMI system MSI driver This series also includes ACPI support
> > for SBI MPXY mailbox controller and RPMI system MSI drivers.
> >
> > These patches can be found in the riscv_sbi_mpxy_mailbox_v6 branch
> > at: https://github.com/avpatel/linux.git
> >
> > To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
> > machine with OpenSBI and QEMU from the dev-upstream branch at:
> > https://github.com/ventanamicro/opensbi.git
> > https://github.com/ventanamicro/qemu.git

> I am ok with the mailbox patches. How are these to be picked into
> mailbox and other subsystems? Maybe sculpt out a separate patchset for
> the mailbox?

I have questions / comments to the series, it's just too long to do it
in one go.

-- 
With Best Regards,
Andy Shevchenko


