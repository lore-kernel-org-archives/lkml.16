Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925363CB
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746835842; cv=none; b=mqFevqAKvjnrED0rdw8zV2dg7xJ2hTbVZQpSJt2PS/qC+KIzt/BgubNyzeyEdY0suo9RCH6NF5O0gs3qF8JlpjwD+BXEOa8XfkNR4BzO3ZWnKIXpHqWXYxzvn8jQM1xOP53nK7zCYGpv1t6oIKuTclMo9rAfOYgW/bOUfPBg3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746835842; c=relaxed/simple;
	bh=r6hz6WKcM3OOcqxFzz0dF5FTPCaB/AIhD8cGGMyJHE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9Kzw5ny247G2/loLwRJO5iWHrmHtPtukKUaUe1Pbfc4xeJDT64A57pa7vJW9Jumqy9SBx7PxzUqbmeY8gRHF6HSTNLgc3hYbMsnQgp2v/nrMDbhlBGb3SSp4vvEBcwsPtY9DfWRGBg+e6KQ4xIiaM64pGzp6E7sduI8o65yfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPNaL0yW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPNaL0yW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8347DC4CEE4;
	Sat, 10 May 2025 00:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746835841;
	bh=r6hz6WKcM3OOcqxFzz0dF5FTPCaB/AIhD8cGGMyJHE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPNaL0yWxUBk/GikkeGlB6+c4j0WYSVc0jMIR0dvbvug/QPvEaI/+sMYlEtrDumUm
	 rCIfvadqjiOigVmChkTjSv133hkiTB5mHmsibK6WZv+sZfTIxp0zG6Qa5x1ygiSNED
	 vIRtzAp8/T7PscyDCIGJRtFM1ViZHUagV7siOxMoK2NLT3KaesEcebxEKl/pLKJNLF
	 JiZXA6gtaPlfVjajZu7tV74X+2eW2TvCEujtMSvKIY50X7V7NxMW2n66Y7lAxbqTyk
	 +s6OuztrZdzu4aGMo6HkKnemW7Klw0Fqt9Pcushf6m9d9LasAcuCiTAWeTetaS27Mo
	 w3NBL0BAjHiVw==
Date: Fri, 9 May 2025 18:10:38 -0600
From: Keith Busch <kbusch@kernel.org>
To: Wilfred Mallawa <wilfred.opensource@gmail.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] nvmet: nvmet_sq_init(): fix use of uninitialized variable
Message-ID: <aB6ZfhTlhxrugPJS@kbusch-mbp>
References: <20250509235904.915626-2-wilfred.opensource@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509235904.915626-2-wilfred.opensource@gmail.com>

On Sat, May 10, 2025 at 09:59:05AM +1000, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This fixes a bug where an uninitialized return value is used in
> nvmet_sq_init().
> 
> Fixes: 206372d7c565 ("nvmet: support completion queue sharing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505091619.QFU1fxsd-lkp@intel.com/
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Thanks for tagging to report! Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
