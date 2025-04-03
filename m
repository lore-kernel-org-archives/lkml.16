Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542A433D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689055; cv=none; b=hADLQ/zblhaew0M5c5OiNZnhwSMz9hnuQQp1ksz46SlGZ0Egl9GEHbbAm1UteoW7ydYIT4XHV5s2CK4QhkSTOjEpih052muIHUgSx9sQvHhml4bttwJFssJOfKvjRBF7+AB/p94Bx9+lDejojLEOyx0LRXTTkfVINWbO7HiNa6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689055; c=relaxed/simple;
	bh=adbAy363Lv6EyIoN7IN7yeVkqckHZYykoPUeX1dSdKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UufoYkYMgfYMzL5wFrotSN/TAtdul3VhslvUgaZnSt+Sfbjjicb1wbBU6JwiaET+b6EgkrLZZI5OwsHV4fJk96oy6dR2Mt0zY6ts+3lI1HZXRNoTKzR+KBoytNl9Iv17zErZ5KB1P4Sk4dvZzCjw/tIY2JaeT5dmxM3pSoFDVQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rZC7I7sR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rZC7I7sR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DA5C4CEE5;
	Thu,  3 Apr 2025 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743689055;
	bh=adbAy363Lv6EyIoN7IN7yeVkqckHZYykoPUeX1dSdKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZC7I7sRVUI2/g0QfZDumLKx/oQb+hvPOIC3AvFLZR5cisJen9MFtu4MofJWDR2th
	 U0dAWFzsZZkDZHv/KPi0RdxpTznQoPqUM0vvGiF1z/ZyXlqg6NRkKOUWP7SqoW2ExU
	 X6zKOwKxIcaMiYxDh6dODnISTX3IzDiMWAufBPLI=
Date: Thu, 3 Apr 2025 15:02:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <2025040336-ethically-regulate-3594@gregkh>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403110053.1274521-1-raag.jadav@intel.com>

On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> Extend MFD subsystem to support auxiliary child device. This is useful for
> MFD usecases where parent device is on a discoverable bus and doesn't fit
> into the platform device criteria. Current support is limited to just PCI
> devices, but this can be further extended to support other types like USB
> in the future.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> 
> I've been cooking this on my spare time during merge window. I'm not
> very confident about this but thought I'd share it. It might be
> controversial since I stole quite a bit from platform infrastructure,
> so please consider this an RFC and let's discuss how to approach this.
> 
> More discussion at [*].
> [*] https://lore.kernel.org/r/2025032609-query-limit-491b@gregkh
> 
> A few things that are still open,
> 
> 1. Since we're doing it for PCI devices (Greg's recommendation), how do
>    we force the existing ones to use their original platform path?

That's up to you all, but I wouldn't recommend forcing everything to
change for existing drivers.  So make it "opt-in" somehow?  I would love
to make it change for existing drivers, but I don't know what that might
break (it _should_ not break anything, but we've already found breakages
when moving some platform devices over to other busses like faux due to
bugs in userspace scripts.)

> 2. Should we allow auxiliary drivers to manage their own resources
>    (MEM, IO, IRQ etc)?

The resources are all shared by the "parent" device, that's what makes
aux drivers work, they need to handle this as there is no unique way to
carve up the resources here.

So I don't know how you would do this, sorry.

thanks,

greg k-h
