Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDA17A302
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818502; cv=none; b=rQUx+eNym6U3PvDnMy/eXKUsdnto6fKYnAbtu7FP74NhwrrF+zMiIHZwMAtJko4ehJugsNVKrb/Gd2jeYbmGYA3tUVUTPVvAsatHkCH/9615m29ziubZEjaCyJnxt81fTZv5FFOgBWQRxeO2RPhJLckRcUdngxK/1fhojGcThqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818502; c=relaxed/simple;
	bh=VlivBJYEHYBNKbSny+fI916ztx/nhy77IUZ9Ci090Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mifs483ZQIWkKIsEQW/BesNyypqIyUxsYz44FY8RkrTywXb4bK4x/KDuQDpZ95si4rcHk5FFdcqzBHnTuRWyPP9swF+K1PLY2u4dqMmDftt+B4VN6tzW5dqj86Mnv74TJf1wtBMGvYblVewild2uYrlJGMAAlZiznRi4AaUyrgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=pE38ll4t; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="pE38ll4t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yLdcYW62KrvvJerOGCHyeuwlEDQ19UgL06buz3bTrWs=; b=pE38ll4tzVmjMwjrgTgJ89l7bv
	8qR11Xf6aAap56g90UXQWw37wr7veCn625eaTTHWNOrQyheqVFfW35Z4nB3aBUyhGrFd+m24KG86L
	uL+x1tVbM8q9F2YzIe2yR4WbbHpBTIYKs5QzSbCNS5F73granIgM9wtJljRSE/TuYh6g1HBGK4TAl
	lht199JlgTZDuirsK6rdO7rNeKgVOmpUdStapsd4NjgS8q6lZMXSjLCpqSz217Y5fOTfS6we7BxWb
	ecncP6w7tYiCRp6MTrabqkXcg9m478O0uTNwCOgIkZjkUTDVG3dpmq6lniKcevAVQTBEVRcNpT0DT
	4Fvavaag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34616)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u54zj-0001aC-0e;
	Wed, 16 Apr 2025 16:48:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u54ze-0001WI-34;
	Wed, 16 Apr 2025 16:48:06 +0100
Date: Wed, 16 Apr 2025 16:48:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ross Stutterheim <ross.sweng@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ross Stutterheim <ross.stutterheim@garmin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
 <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Apr 16, 2025 at 08:57:09AM -0500, Ross Stutterheim wrote:
> On 4/16/25 05:09, Catalin Marinas wrote:
> > > Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> > > Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> > 
> > I think you could also add:
> > 
> > Cc: <stable@vger.kernel.org>
> Done. I also added some other Cc: entries on V3 along with Reviewed-by:
> lines . I'm new here, so I'm not sure I've used those 100% properly.
> 
> > Not sure how Russell picks patches up these days (I used to send them to
> > the patch system -
> > https://www.arm.linux.org.uk/developer/patches/info.php).
> > 
> > It might be simpler with git send-email (that's the alias I had):
> > 
> >    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> > 
> Thanks. I created an account there and submitted V3 through the web
> interface (to avoid my SMTP server appending more stuff on the end).

Thanks, seems all good, applied and pushed out. I'll send it to Linus
tomorrow as it's certainly a serious regression.

I'm surprised Mike hasn't responded...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
