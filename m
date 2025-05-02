Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4A14883F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 04:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746160629; cv=none; b=iezeKI2oVyAuDaxzYatSG01UirAFg1FBU6Kf8cdReckfvRuA1GUOoy3CgAqLoxDwCIEms6JGn5avyw/pzgtAnwgY6USCQDcUtfDwfcf2PP+maijNXEXp3YBpkRNQPGxZaqd6liCH5Zym3tYytFI4C0URMUR6JdO0q1D4z/h+fhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746160629; c=relaxed/simple;
	bh=LLY8xpyYLsXiObaIvpoWXNKHRJPV8o6/VdS8c+GqqEM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSF6heSATKxXUKCjw1jkuEaTRsO3uXp3FpKIIG+0VGVJGF0d6n9aTnhaNEtL9AcIZAdpTdtF25fBg5P/Y0kVRRNHdZ7utawBNF23DSKihKmgSxfwq1PkoWtTx3PRBdON+dp3XASJFu5J8e/ziUMrG03BQEKLpCXSHPF9gk7X1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id ee27fbcb-270e-11f0-9bc3-005056bdf889;
	Fri, 02 May 2025 07:35:53 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 May 2025 07:35:52 +0300
To: Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Peter Tyser <ptyser@xes-inc.com>,
	Purva Yeshi <purvayeshi550@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: lpc_ich: Fix ARRAY_SIZE usage for
 apl_gpio_resources
Message-ID: <aBRLqGDpV8Y63JaJ@surfacebook.localdomain>
References: <20250322131841.31711-1-purvayeshi550@gmail.com>
 <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
 <aAqKcn25bkrjIiLF@black.fi.intel.com>
 <20250501120725.GJ1567507@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501120725.GJ1567507@google.com>

Thu, May 01, 2025 at 01:07:25PM +0100, Lee Jones kirjoitti:
> On Thu, 24 Apr 2025, Andy Shevchenko wrote:
> > On Fri, Apr 04, 2025 at 02:13:08PM +0100, Lee Jones wrote:
> > > On Sat, 22 Mar 2025 18:48:41 +0530, Purva Yeshi wrote:
> > > > Fix warning detected by smatch tool:
> > > > drivers/mfd/lpc_ich.c:194:34: error: strange non-value function or array
> > > > drivers/mfd/lpc_ich.c:194:34: error: missing type information
> > > > drivers/mfd/lpc_ich.c:201:34: error: strange non-value function or array
> > > > drivers/mfd/lpc_ich.c:201:34: error: missing type information
> > > > drivers/mfd/lpc_ich.c:208:34: error: strange non-value function or array
> > > > drivers/mfd/lpc_ich.c:208:34: error: missing type information
> > > > drivers/mfd/lpc_ich.c:215:34: error: strange non-value function or array
> > > > drivers/mfd/lpc_ich.c:215:34: error: missing type information

[...]

> > > Applied, thanks!
> > > 
> > > [1/1] mfd: lpc_ich: Fix ARRAY_SIZE usage for apl_gpio_resources
> > >       commit: 87e172b0fdd3aa4e3d099884e608dbc70ee3e663
> > 
> > Can this be reverted ASAP, please? See below why.
> > 
> > There is no problem with the code. The original author of the change
> > haven't proved otherwise.
> > 
> > The change made it much worse to read and maintain. By the way, it actually
> > _added_ the problem as far as I can see with my small test program.
> > 
> > Let's just calculate based on the sizeof(struct foo) taken as 10 for
> > simplicity and array size as 4x2. The full size of the array is
> > 4 * 2 * 10 bytes. The size of the entry in outer array will be 2 * 10 bytes.
> > Now, what ARRAY2D_SIZE do is (4 * 2 * 10 / 10 / (2 * 10 / 10) == 4, and
> > that's WRONG! This will make a out-of-boundary accesses possible.
> > 
> > If smatch can't parse something, it's problem of smatch. No need to "fix"
> > the working and robust code. The original code even allows (in theory) to have
> > different amount of resources per entry, however it's quite unlikely to happen.
> > But at bare minimum it shows the entry taken along with _its_ ARRAY_SIZE()
> > and not something common over the outer array.
> 
> Done.

I still see it as commit
https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=c6c07f8ea2cbb0dca0e529f9ed16df71276515a4

-- 
With Best Regards,
Andy Shevchenko


