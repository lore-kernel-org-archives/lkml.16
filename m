Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528E29826D;
	Wed, 18 Jun 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245582; cv=none; b=EQ2JPmnTLYWhPfeKCS5UG/2iCmEDJLlyOaacG8gsUHl/zBiLRLFiT7noJ261XBZutauDI1HWsvfRBX9cVuK0BON7r5442odNAEoR26iFMOy4KN1SmJzDpu+uuV6wKxqa+tMnt9D1w62EXDUN8PT+0iaHLsiLiTtUNBFoPHJd0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245582; c=relaxed/simple;
	bh=FOUMGdHHOgcLeytTyG2OuhWCGLuIINlkO6OEBRsNBsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQwRUkPJ++hC/Oncdg9dfy4KEZg5cVoj3i9PVk+geri/c3Ala907c91vqFFGnpfIQ5RdZ2GGwL5SOmNJRHecC+QmZU9O4bZG+wDs1iFE8qb9TwdKiED1YjSzM8DtN1LekG8OdK3J6Bs+SAHQptVsIk/Kt95lT+BuoBEnHM09tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 624F1341E61;
	Wed, 18 Jun 2025 11:19:40 +0000 (UTC)
Date: Wed, 18 Jun 2025 11:19:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <20250618111935-GYA156140@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
 <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>

Hi Alex,

On 21:44 Sat 14 Jun     , Alex Elder wrote:
> On 6/12/25 8:11 PM, Alex Elder wrote:
> > Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> > device is an auxiliary device associated with a clock controller (CCU).
> > 
> > This patch defines the reset controllers for the MPMU, APBC, and MPMU
> > CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
> > and ACPB2 CCUs, which only define resets.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > v11: Redefined combined reset definitions into individual ones
> 
> After I sent this, I realized the clocks use a different
> naming convention for two of the PCIe symbols.  I think
> reset should follow the same convention.
> 
> Yixun if you accept this series, would you mind updating
> these?
> 
>    RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
>    RESET_PCIE0_MSTR -> RESET_PCIE_MASTER
> 
> (And similar changes for PCIE1 and PCIE2.)
> 
sure, done, check here (let me know if I did wrong)
 https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17

> Thank you.
> 
> 					-Alex
-- 
Yixun Lan (dlan)
