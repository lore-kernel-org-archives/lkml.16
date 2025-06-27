Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE5184540;
	Fri, 27 Jun 2025 02:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992564; cv=none; b=TlmA2bKhvx0ewjfNLi6+Xf/oNVh55llz0vaRKag6M5vIBI3kmqSwLtahnYs1i669Ng60LExyz/QgI4dwaL8I+zi+5gzREo9WpbFZXCu7+6L7MBigTQeunmpAUGMbao8XEWn+Hp/3YUtY1Gm5RN3yiXEdxsYPfKzPjb9/fq/GdKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992564; c=relaxed/simple;
	bh=+UCtVlBLAXOI2ORddkR4UDa9jYX18LCIvBb6RX6rVeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ude+jCWyPBZoDLQAcqdIru59tP87/mWC+Gv+RMO7+GS/dDtxhcJRKrdlf4WNKqKCnGeKSe6fEKg0W8isvyIUyNhyTPjzDFH/HC9I4nTnAVySyug02Ngm5epu3a6LzkSxBcoN8d2JjVPxWfx4K2tgkN4SyfTTUSLF4cywY8YS9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLBpD1Qn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLBpD1Qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E7AC4CEEB;
	Fri, 27 Jun 2025 02:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992564;
	bh=+UCtVlBLAXOI2ORddkR4UDa9jYX18LCIvBb6RX6rVeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLBpD1QnBw1ALAIJfkczn08T6ijgUZ4PAER9Rnxhny0mwatX1hYBZEC2q9rJngAc6
	 F/0uRtJofaxCo7wQDkicnRfdJ46qJLR4SHePsJH7lCamf7gL4MwilpJjtPmW4rx5hr
	 O07PvjaZn/beK/9x8eWNVD7po47qgZaIwJsEeKpfZCUYDnPtATdflri06RxrkBNkTV
	 Onc0pH/28dNuGwzy+AqrinvtAJIPmI63f+MCH7dStgiVOd2pfRCDVu1mXFM0X2MclA
	 nWUTWzkZxweqxx/P3VbmjBjkh3onYNO4rT1SZom2Vu+3d/pDIK5eIUjNJ7bQMaD4SG
	 naHzoPqxiZt/A==
Date: Fri, 27 Jun 2025 02:49:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aF4GsTGNSHQKn7Ms@google.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
 <aFvq49ODR3XfcwZJ@cyber-t14sg4>
 <aF0x-d-uBbMQxrxO@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0x-d-uBbMQxrxO@cyber-t14sg4>

On Thu, Jun 26, 2025 at 01:41:45PM +0200, Michal Gorlas wrote:
> On Wed, Jun 25, 2025 at 02:26:11PM +0200, Michal Gorlas wrote:
> > > > +
> > > > +	/*
> > > > +	 * Gives SMI some time in case it takes longer than expected.
> > > > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > > > +	 */
> > > > +	mdelay(100);
> > > 
> > > This looks weird. Are there some ways for Linux to be aware of the SMI has
> > > completed?
> > 
> > Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
> > [1] before and after sending an SMI, and wait till it increments. I am
> > not aware about any unified way that works for AMD SoCs. However, so far
> > none of the AMD boards supported by coreboot was tested with MM payload,
> > so to make it Intel-only in v3 is not a bad idea.
> > 
> > [1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880
> 
> As a follow-up here, making COREBOOT_PAYLOAD_MM dependent on !SMP
> resolves the need of acknowledging SMI completion. If SMI takes longer,
> Linux is just stalled until SMI handler gives the CPU back to the caller.
> I think for this case it could be the way, LinuxBoot is by default
> compiled without SMP support anyways when used as coreboot's payload [1],
> [2].
> 
> [1]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/x86_64/defconfig
> [2]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/i386/defconfig

To make sure I understand: do you mean the trigger_smi() becomes a blocking
call without a timeout?

I may misunderstand: depends on !SMP which also means it can't use on most
modern architectures.
