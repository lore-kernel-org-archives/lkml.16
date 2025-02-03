Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312E0200BB9;
	Mon,  3 Feb 2025 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580331; cv=none; b=e0QoHzFyZEEo0VSsNyhRh88zccDtt21CbFTwXX0EGE3nemh/eLXM0K/+ZWX5F10vQuUuJ720cVl3P0T7/R5bblzBuVJhpY3v94gqwyBQtor/NcW2CMujdmO6FetR/i4cxDUCFAHgluxd5/P/N4coeO5xeA9f6mQDZKTGT/srb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580331; c=relaxed/simple;
	bh=SR6S50EegGgplWqOre9ZfXPRLkLlRwOigQB40MvBL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnyAI/8Z5prGXRVX+kQ+eCmVI4Z9wSYZUJT6rQy5RaGq38NecUF3w+7f3HTOZcQA+gu+hF1EphG2PW5rvKV5VA33+NqitcWddpJoorgSFiHka/CRfeTMp3nJVd40pUhIOeVwrGV1tgmBsu++EOFnb7KR004DcBNxu2n4fC6N2qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XljpRbmc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XljpRbmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738580329; x=1770116329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SR6S50EegGgplWqOre9ZfXPRLkLlRwOigQB40MvBL4o=;
  b=XljpRbmcjBl+a0/iISDxodXgEue9ds8C2QnJaqgPaf+ewOKzA3Y54gvL
   6o8v1ju88NQIKMblONBfPJsLhpW74R93Sor4QTl54SnZtnBIJKkytlgvt
   fGssYAnErte9Sp13WMueK4XYteBaypxsLF8BuBH4p4MgA8ojKy152RDjv
   IK4twSBUMe9jagE5vESGSsSuVUIg3w8c7BnFM2q5vulg6nP3yNDrUpCoG
   H1kFPkKaTePqPAnJOYTSYj2Ej7izEaXDYCs/Gx6zn2id764CaqycQVpIn
   8/qasASssK8pkb/OofUPjg8hFjLhPZ8/r5ckkgsNtguwwnfavkleIqZb9
   g==;
X-CSE-ConnectionGUID: SQrlttj4SaO5KeGCzq0f7w==
X-CSE-MsgGUID: VAV859OPTsWWJbCn7XG8VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38274025"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38274025"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 02:58:47 -0800
X-CSE-ConnectionGUID: yUZ9ybxJQxKd1zvikw0xzQ==
X-CSE-MsgGUID: gK/kZ4cyR8uM+cJCjynQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110413582"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 02:58:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D91A7214; Mon, 03 Feb 2025 12:58:40 +0200 (EET)
Date: Mon, 3 Feb 2025 12:58:40 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
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
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <20250203105840.GH3713119@black.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6CPvteWv89Xo70j@smile.fi.intel.com>

On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > a property name like #mbox-cells which needs to be fetched from the
> > reference node to determine the number of arguments needed for the
> > property. However, the ACPI version of this function doesn't support
> > this and simply ignores the parameter passed from the wrapper function.
> > Add support for dynamically finding number of arguments by reading the
> > nargs property value. Update the callers to pass extra parameter.
> 
> I don't like this (implementation).

Agree.

> It seems that we basically have two parameters which values are duplicating
> each other. This is error prone API and confusing in the cases when both are
> defined. If you want property, add a new API that takes const char *nargs
> and relies on the property be present.

Also this is not really needed for ACPI case because it has types so it can
distinguish references from integer. Having separate property for this just
makes things more complex than they need to be IMHO.
