Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45470A92E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747590495; cv=none; b=NACE7ZEe2vguN1hKotpDmxL2OnSrfXDchJUAtn5qdgpi+iJ0a0spB+05rNRNVCOEcS30Sm9ZRFNfGMawg1fQ1RXn18kufd7glLokAjvU5clGXAWRsaYBVy6kGeZqpEm6eVWNRnHD4ZSyjeNi36nou2saUAyIS6c5SeLXgxVo7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747590495; c=relaxed/simple;
	bh=ZGvikh3n3ydO/KdgnGf+TNAOz6UOSNshU1I1pch31/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAEJFV2W5dcw42KF/EnAaASCGIOMiVnez/HDdaUvbdtPsoH3zzXHltza0bHCIi+/b4CZNrZOaOItFZJZygmThj8bvaV+23IWd5yYE5Kq9ghvPqYd34wktnJKcv4wWZHDxBjm9V2aqwbWjqkdrDWCB4VP1UNqeeU9eloxHu1EKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hPsmIGSP; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hPsmIGSP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=amGf2Z1GlQqMwS13yoleAlaWUexdFZt9JM605VX2E30=; b=hPsmIGSP9Ijv9K/UHy6TN+brXM
	Uuu4tGn1M9UtUlg+j/J/oRRJtoqKXZPyBqSvlWKDm3UO3q1w7ZQ9gllhpGp9urEr6MK+k3WkZTDdu
	4LlnRDzEumH60GgQa3ROgM/8LAQl/0UeNUSq0M+5FGCq74IQGuEhcPHZUXxJXCA3ZSLTuubMpV07W
	tpiYWiuL0dvxkVSh7LUpmLW3BimwVSkMt4NpoWvT1Aeonzq2GQXRNnXskt87WJ34S7ikP9PoDFEGC
	ZrdMJdLKVZHyLaPQsZpfZ5p0OAvQOsRIWHRCZ/5MPtF6IXXEusjruj5ZeExjGeVZV3q7qRGpzaJLP
	St5AjwUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52004)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uGi73-0004aD-20;
	Sun, 18 May 2025 18:47:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uGi6z-00013l-1v;
	Sun, 18 May 2025 18:47:45 +0100
Date: Sun, 18 May 2025 18:47:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
Message-ID: <aCodQZoA5KI9WyLB@shell.armlinux.org.uk>
References: <20250518164118.3859567-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518164118.3859567-1-linux@roeck-us.net>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, May 18, 2025 at 09:41:18AM -0700, Guenter Roeck wrote:
> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
> which in turn calls of_syscon_register. This function allocates memory.
> Since the memory management code has not been initialized at that time,
> the call always fails. It either returns -ENOMEM or crashes as follows.

Yet I see no thought whether having the scheduler see sched_clock()
suddenly change is a good idea or not. The point of the initialisation
being early is to avoid a jump in the scheduler clock.

So, was the commit you're trying to fix a good idea after all?

That question at least needs to be considered, rather than just moving
stuff like this later.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
