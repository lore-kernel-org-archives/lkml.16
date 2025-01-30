Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB91AB507
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237051; cv=none; b=ufNCxpPJXrBXrd/8jDu549ltqHakQCxCT+lOcvxbxLErBdYIFzzNQ11fsJrW7K73Gl5xPNbktBGiZKvgQmg6JdJH2nGP2QjlVVE5Iznof0baruVxgHlctNhpWS87A2tfqRT574sg+U/sxRMEarFrd+/xRfP0lDL5hKdigmudlO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237051; c=relaxed/simple;
	bh=26Ztbv2pdx8xLNzORmqGLDV+suVn42flwKXBNqdIcSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTMbul5/LBYMK/+A1smx/KcQhKSRlg+g9fr2+tGRj2ULS07Rs5dwQDw+8D2miPY8BANgqb88vH7eqtAVdQeGsAqUxE4VZvnEjjBfTWkB9bhb7KpjG0JqnpTx911KjDWiGjvWLfnOBUsXANRcXLcaiX+6zJqYqgkPkhtoGKf4rkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3641C4CED2;
	Thu, 30 Jan 2025 11:37:29 +0000 (UTC)
Date: Thu, 30 Jan 2025 11:37:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, krzk@kernel.org, vigneshr@ti.com,
	p-mantena@ti.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
Message-ID: <Z5tkd4e-4n80gs5F@arm.com>
References: <20250116035145.370734-1-s-k6@ti.com>
 <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>

On Thu, Jan 30, 2025 at 11:53:58AM +0530, Santhosh Kumar K wrote:
> On 16/01/25 09:21, Santhosh Kumar K wrote:
> > Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
> > 
> > 1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
> >     J722S EVM, J742S2 EVM
> > 2. W25N01JW on AM62Lx EVM
> > 
> > by enabling the MTD_SPI_NAND config as a module.
> > 
> > Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> > ---
> 
> Gentle ping.

It's usually Arnd or specific SoC maintainers picking up defconfig
changes (the arm64 maintainers just go for the Kconfig directly ;)).

-- 
Catalin
