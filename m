Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87579238144;
	Wed, 11 Jun 2025 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630231; cv=none; b=K4Tr1yUJi7EpPgwBo2GyXhhMdtN4E23JKQ/ENssGEfPiLqvPLwhJ0WL3kqQvUo1YSnU74c3PBcY7lXBOiHihrJxkjASZ/Jw5ywgsDWUK6q0PrtxVSwLMVp6ZVfv4hmAz+nHhjTR42BiAN89hgVc7QLgGgMUjGUag0qJ82IdUEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630231; c=relaxed/simple;
	bh=h7WpXxo70UJLYX5/Z3xfT7hyHwyHuDuPmHeLXuHqpV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxHWoAwyr13HmetLOAJpI+7Q5WHppHGa6W6vy/uJZir1LmnDGux0mXu1xW9q+c3BcZ96XpOXJV0ORe5A0GmGKacbQRDstyOtXOFnJcz3jEnx/GdJH1084Hb9B6dv1szpmXWo8R56nG59o1qEqOV7pCkaAZrHOXPo0Xo1HJ6wPtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CX66FWCb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CX66FWCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749630229; x=1781166229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h7WpXxo70UJLYX5/Z3xfT7hyHwyHuDuPmHeLXuHqpV8=;
  b=CX66FWCbXZLbqz+O/Rt2t02CsFIwWFA+8nzMD79fFGTgnkdoW2NbkNsp
   ZZkf+8zlJnVOiDSNQEMMn/JGkcux/4L+WdkMrgvIDBm09I4SdJhlaJW4U
   Z+/ap6jNgC5fmK/aofjgR2PAVEiYJKZOmk0Jm+uFpje9XEFUeLYCUZE/U
   s7U/L6pI4dlXRqYNtmd9ZWSyt0b8Bkz/uyf72/oh9yAqoTzrCk+k27Usv
   4a2CEVfLdYbB7//OpuLLs9bNUgwmvkP6TvJtv2Mu+nnjRT6WOpjsvjaWm
   6LIgc5htIc0F2JLTzY7w4Rpxj4Ib4Xtfd7hHHVwa3hhsvKR58CPrAiQO0
   g==;
X-CSE-ConnectionGUID: nnZmx6KlRCiTcwL6MfWRmQ==
X-CSE-MsgGUID: j8qFfX2bSsCGbUDF1wTa/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63111652"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="63111652"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:23:49 -0700
X-CSE-ConnectionGUID: rmDENUhWStuVjFMmiFaTDg==
X-CSE-MsgGUID: YgxAeiPaQnyPDxy83xmGaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178040297"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:23:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPGkE-00000005aFn-0c0H;
	Wed, 11 Jun 2025 11:23:38 +0300
Date: Wed, 11 Jun 2025 11:23:37 +0300
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
Message-ID: <aEk9CetUHxK9OqQV@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
 <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com>
 <aEc-SHvL187xdj-m@smile.fi.intel.com>
 <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
 <aEgBGup553Pki98e@smile.fi.intel.com>
 <CAK9=C2Ww0Mt91x_r0VTffse-AiWcOyBYvWpxxK7p5=+EDUEoMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2Ww0Mt91x_r0VTffse-AiWcOyBYvWpxxK7p5=+EDUEoMw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 11, 2025 at 10:51:15AM +0530, Anup Patel wrote:
> On Tue, Jun 10, 2025 at 3:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jun 10, 2025 at 10:05:27AM +0530, Anup Patel wrote:
> > > On Tue, Jun 10, 2025 at 1:34 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Jun 09, 2025 at 05:59:40PM +0530, Anup Patel wrote:
> > > > > On Wed, May 28, 2025 at 4:23 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:

...

> > > > > > > +     if (mbox->msi_count)
> > > > > >
> > > > > > Is this check really needed?
> > > > >
> > > > > MSIs are optional for the SBI MPXY mailbox so we should only use
> > > > > platform_device_msi_xyz() APIs only when MSIs are available.
> > > >
> > > > > > > +             platform_device_msi_free_irqs_all(mbox->dev);
> > > >
> > > > Hmm... I am not sure why. Do you have any Oops or warnings if the check
> > > > is not there and no MSI provided?
> > >
> > > We don't see any oops or warnings. This check is to avoid unnecessary
> > > work (such as acquiring lock, checking default domain, etc) in the
> > > msi_domain_free_irqs_all() called by platform_device_msi_free_irqs_all().
> > >
> > > I don't mind dropping the check so I will update in the next revision.
> >
> > Perhaps you can rather add this check into the callee? Seems to me that
> > you have a justification for it. Usual pattern in the kernel that freeing
> > resources should be aware of the NULL pointers or optional resources
> > so we may call it unconditionally from the user(s).
> >
> 
> Unconditionally calling platform_device_msi_free_irqs_all() when there
> were no MSIs allocated causes the below crash because "dev->msi.data"
> is non-NULL only when:
> 
> [    1.355735] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000008
> [    1.358212] Current swapper/0 pgtable: 4K pagesize, 57-bit VAs,
> pgdp=0x0000000081a2b000
> [    1.360632] [0000000000000008] pgd=0000000000000000
> [    1.363132] Oops [#1]
> [    1.363748] Modules linked in:
> [    1.364768] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.16.0-rc1-00037-gab55e1c1d97a-dirty #7 NONE
> [    1.368325] epc : mutex_lock+0x0/0x28
> [    1.369796]  ra : __msi_lock_descs+0x32/0x3c
> [    1.370234] epc : ffffffff80af96e8 ra : ffffffff800038e6 sp :
> ff2000000004ba90
> [    1.372412]  gp : ffffffff81819c00 tp : ff60000001dc0000 t0 :
> 6900000000000000
> [    1.373527]  t1 : 0000000000000072 t2 : 6962732d76637369 s0 :
> ff2000000004bab0
> [    1.376628]  s1 : ff6000000241c410 a0 : 0000000000000008 a1 :
> ffffffff8168ca58
> [    1.379110]  a2 : 0000000000000010 a3 : 00000000000000a3 a4 :
> 0000000000000000
> [    1.380410]  a5 : 0000000000000000 a6 : 0000000000000000 a7 :
> 000000004442434e
> [    1.381019]  s2 : 0000000000000000 s3 : ff6000003fff30a0 s4 :
> ff6000000241c410
> [    1.381579]  s5 : ff600000039f9320 s6 : ff6000000241c400 s7 :
> 0000000000000002
> [    1.382242]  s8 : ffffffff81821fa0 s9 : 0000000000000000 s10:
> 0000000000000000
> [    1.384018]  s11: 0000000000000000 t3 : ffffffff81830a37 t4 :
> ffffffff81830a37
> [    1.385958]  t5 : ffffffff81830a38 t6 : ff2000000004b7c8
> [    1.387306] status: 0000000200000120 badaddr: 0000000000000008
> cause: 000000000000000d
> [    1.388407] [<ffffffff80af96e8>] mutex_lock+0x0/0x28
> [    1.389333] [<ffffffff80003dba>] msi_domain_free_irqs_all+0x2a/0x48
> [    1.390275] [<ffffffff80714e86>] platform_device_msi_free_irqs_all+0x16/0x2c
> [    1.391715] [<ffffffff808d8114>] mpxy_mbox_probe+0x6dc/0x750
> [    1.392522] [<ffffffff806f1706>] platform_probe+0x4e/0xb4
> [    1.393169] [<ffffffff806eef58>] really_probe+0x84/0x230
> [    1.393789] [<ffffffff806ef160>] __driver_probe_device+0x5c/0xdc
> [    1.394282] [<ffffffff806ef2a4>] driver_probe_device+0x2c/0xf8
> [    1.396577] [<ffffffff806ef4ac>] __driver_attach+0x6c/0x15c
> [    1.397634] [<ffffffff806ed146>] bus_for_each_dev+0x62/0xb0
> [    1.399060] [<ffffffff806eea9a>] driver_attach+0x1a/0x24
> [    1.399792] [<ffffffff806ee31e>] bus_add_driver+0xce/0x1d8
> [    1.400363] [<ffffffff806f020c>] driver_register+0x40/0xdc
> [    1.400832] [<ffffffff806f1414>] __platform_driver_register+0x1c/0x24
> [    1.401551] [<ffffffff80c3df7e>] mpxy_mbox_driver_init+0x1a/0x24
> [    1.402328] [<ffffffff800108b2>] do_one_initcall+0x56/0x1d8
> [    1.403674] [<ffffffff80c01236>] kernel_init_freeable+0x266/0x2d0
> [    1.404956] [<ffffffff80af549a>] kernel_init+0x1e/0x13c
> [    1.405422] [<ffffffff80012266>] ret_from_fork_kernel+0xe/0xcc
> [    1.405870] [<ffffffff80aff042>] ret_from_fork_kernel_asm+0x16/0x18
> 
> It is better to have the check on "mbox->msi_count" before calling
> platform_device_msi_free_irqs_all().

Right, thanks for confirming. But my point that this check should be made
inside the callee and not the caller. Can it be done once for all?

-- 
With Best Regards,
Andy Shevchenko


