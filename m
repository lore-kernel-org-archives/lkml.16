Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE782C60
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745046281; cv=none; b=iGHlpoeIxe3axG2JyIGQfjwWInwElmULg97OTXXohgnLjYpiMmo6RTXzkVPtUC5N562mbq/A7VmmVaQKjsZy5F0Kik9q+kyQGp/AZusXe8L9s9dVpE0kcHUC7QdqefW1cSr4Me1tWqi/kEjMbdpQMjhBQnxtUFxw3Q+8rzjkUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745046281; c=relaxed/simple;
	bh=6nJRP5dGfMS/bA/MMLA00BdyVnpxROp+uQSPSKS5EPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTTkKnm3UGiv9XPiLxkr1hiMu/K71FgHo/ngGxXXDj9cpVczR1kORy0GXNE5+GpVDngPVwVrrcH8aHBCFWWe9yJaAghr6cIJFcIuXmBCMccYffT9PfRJxQkBGAc6pNvz1r4Ix2D0gpwoANViRyfqHdYaF82mIQ3l8UZhu23pbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDWsZxoB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDWsZxoB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E642EC4CEE7;
	Sat, 19 Apr 2025 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745046280;
	bh=6nJRP5dGfMS/bA/MMLA00BdyVnpxROp+uQSPSKS5EPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDWsZxoBS7ca6U3nIhX18IAbq2/5Hh9njLLAseXAOWRi0Oa+VdpjIzPek/nvV34IQ
	 aTtcDUJ7JdszDFCCczHQy3ANFaYSsi6+zkoxCoWg9kG8WnOh0E252jNjpQw7jxkKaW
	 M6YrWSo7bxWV1gMpkHdRHFPsi3Shl6nf3Jysrvrm2Qmqpjud6Jj/yMgXwqxpAk/ehS
	 RhonrsXe+D8vylx35w+0bDOpBNAPwFW1R8vqLk9moL3iMRBX1BdJWb67DXaMjXsz+a
	 vEuf4umWbpa6HcMe0/SqCneGusokl7XlUiv81xP8z3hNx6W+AzvYPPwoemkikvwj/L
	 T080eoZjTWN5w==
Date: Sat, 19 Apr 2025 10:04:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ross Stutterheim <ross.sweng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ross Stutterheim <ross.stutterheim@garmin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <aANLAonc_0X0PnK9@kernel.org>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
 <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
 <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>

On Wed, Apr 16, 2025 at 04:48:06PM +0100, Russell King (Oracle) wrote:
> On Wed, Apr 16, 2025 at 08:57:09AM -0500, Ross Stutterheim wrote:
> > On 4/16/25 05:09, Catalin Marinas wrote:
> > > > Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> > > > Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> > > 
> > > I think you could also add:
> > > 
> > > Cc: <stable@vger.kernel.org>
> > Done. I also added some other Cc: entries on V3 along with Reviewed-by:
> > lines . I'm new here, so I'm not sure I've used those 100% properly.
> > 
> > > Not sure how Russell picks patches up these days (I used to send them to
> > > the patch system -
> > > https://www.arm.linux.org.uk/developer/patches/info.php).
> > > 
> > > It might be simpler with git send-email (that's the alias I had):
> > > 
> > >    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> > > 
> > Thanks. I created an account there and submitted V3 through the web
> > interface (to avoid my SMTP server appending more stuff on the end).
> 
> Thanks, seems all good, applied and pushed out. I'll send it to Linus
> tomorrow as it's certainly a serious regression.
> 
> I'm surprised Mike hasn't responded...

Passover vacation :)
 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

-- 
Sincerely yours,
Mike.
