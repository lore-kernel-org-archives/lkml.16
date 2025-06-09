Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DE1F3BB0;
	Mon,  9 Jun 2025 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499476; cv=none; b=TDkt567hlzDFu4qXXLctf2+S7snCPU+T9ZxVAw0oSUYUU8TJC2Ziu2u6RIw7GelW/Z5oXECNUQkaGXp7Wq0bLwxaiAAeqFPZ5wNTorzLBfKZ2/Rb3FHylWeRRLAItLi4gU5QwKTI4nZXsoNMfChER3azvj9PmgwDvHMtKwM2N4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499476; c=relaxed/simple;
	bh=yUuvb828aWvLH8lzzQnIsJ5D980USIpuviHfRjTllQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWo+v3uCVDs24bS9fPGX0Cyqx3YLc3OHUeaMYJuPzOrX9nEleQ3ZTwhbXKM8alve2Dacb1Om4Tu+YXs35M81vJAG+34YSmwrW1F27JJDOUDtKeL2Ve5u3Lw8n7NBUMloBUhcz3PEOreRCfSQJGoVut1x/wLCQQzIVZQ6j4fmn2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJqCxF2i; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJqCxF2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749499475; x=1781035475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yUuvb828aWvLH8lzzQnIsJ5D980USIpuviHfRjTllQ0=;
  b=XJqCxF2i4yOqJ+Sp79NNTRL+meiLk1U8Qigndz7/0WIwTNOTLjQyfPVh
   /9hz0dQ3o4Ujc4UEGOdvzfKGCA9Ew6M6GKJAoN+p0x9bV0pkERAiOY4ZX
   3vIHZUY5QXgc4z+kYBP6TM/DTM3qnRd1SIm/VlK12QeYrqOWs5Y532AFf
   h4rg+FGvRQx21mCaeKpFq1tLHJWfI8G3EZdmFcKv2eQOoN/d6V4ZCW8eJ
   v7e/OQDmiaBVegpDgMavdaLLu6hpMXUaSOfM5Owv1gzyCU73iawoQsOwQ
   njks8u7g0ldywYUuzhtAGhhU+RqVcboCjheLaqtdSrhmaGLtYQlLc8I1J
   g==;
X-CSE-ConnectionGUID: Vpr6emWZSqmCWKHQt054RA==
X-CSE-MsgGUID: XxLqTnDkT3Sj0ggxTIKWOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62626255"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62626255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:04:34 -0700
X-CSE-ConnectionGUID: MxTEgy0kRCSr/efLPe7Dlw==
X-CSE-MsgGUID: pSrDO/9FQgO05dfgzHptsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151489909"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:04:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOijI-000000059OT-2Hi4;
	Mon, 09 Jun 2025 23:04:24 +0300
Date: Mon, 9 Jun 2025 23:04:24 +0300
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
Message-ID: <aEc-SHvL187xdj-m@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
 <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 09, 2025 at 05:59:40PM +0530, Anup Patel wrote:
> On Wed, May 28, 2025 at 4:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:

...

> > > +#include <asm/sbi.h>
> >
> > asm/* usually goes after generic linux/* ones. Why here?
> 
> I am not aware of any such convention but I will update anyway.

It's just a common sense. We include most generic first and most custom at
last.

...

> > > +static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
> > > +                         u32 *attrs_buf)
> > > +{
> > > +     struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
> > > +     struct sbiret sret;
> > > +     u32 i;
> > > +
> > > +     if (!mpxy->shmem_active)
> > > +             return -ENODEV;
> > > +     if (!attr_count || !attrs_buf)
> > > +             return -EINVAL;
> > > +
> > > +     get_cpu();
> > > +
> > > +     for (i = 0; i < attr_count; i++)
> > > +             ((__le32 *)mpxy->shmem)[i] = cpu_to_le32(attrs_buf[i]);
> >
> > Don't we have helpers for this? They are suffixed with _array.
> > https://elixir.bootlin.com/linux/v6.15-rc6/source/include/linux/byteorder/generic.h#L168
> > Don't forget to have asm/byteorder.h being included.
> >
> > Ditto for the similar case(s).
> 
> The cpu_to_le32_array() and le32_to_cpu_array() helpers update data
> in-place but over here we have separate source and destination.

Fair enough. Perhaps add something like memcpy_to_le32() / memcpy_from_le32()
or alike for your case?

> > > +     sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
> > > +                      channel_id, base_attrid, attr_count, 0, 0, 0);
> > > +
> > > +     put_cpu();
> > > +     return sbi_err_map_linux_errno(sret.error);
> > > +}

...

> > > +                            sizeof(mchan->rpmi_attrs) / sizeof(u32),
> > > +                            (u32 *)&mchan->rpmi_attrs);
> >
> > Why casting? What about alignment?
> 
> The RPMI attributes (aka struct sbi_mpxy_rpmi_channel_attrs) are
> a collection of u32 attributes hence we can also treat rpmi_attrs
> as a u32 array. Further, the rpmi_attrs is XLEN aligned within the
> struct mpxy_mbox_channel so no alignment issue with the casting
> on both RV32 and RV64.
> 
> If we want to avoid the casting then we will have to use a temporary
> u32 array plus additional memcpy().

OK.

...

> > > +     if (mbox->msi_count)
> >
> > Is this check really needed?
> 
> MSIs are optional for the SBI MPXY mailbox so we should only use
> platform_device_msi_xyz() APIs only when MSIs are available.

> > > +             platform_device_msi_free_irqs_all(mbox->dev);

Hmm... I am not sure why. Do you have any Oops or warnings if the check
is not there and no MSI provided?

> > > +}

-- 
With Best Regards,
Andy Shevchenko


