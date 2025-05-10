Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997A71DEFE8;
	Sat, 10 May 2025 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893630; cv=none; b=SDFxFftV6JxpaOhOokjOGusvcmSGYfv47HYBPRZLhbKIx0Lxi+is+bx7mNFD9Bouf7uqnTV/X71IPJ/WsL1KYZWOLQbyreY9Qv2lRDOOuYbMzbQzZ40U5+eIOC/5spvBqEO0NW0XJdjNlON0Bj2HUm68v5Ildle1scm3E7sdGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893630; c=relaxed/simple;
	bh=4BFLwHRS5sx9UfyYdVI7gDyB8adpJUUQ97O6lRHBa2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=byeOKhg5AYJpPqUy5HXOltXRvdKKBrLrQli2JokVZW3dg0RxJdTUI5T1qGh1z22ub8aoMBxXONZrtB4qrdbv4qml7Ti7KhkTvwiKflblNCgmcJURiE6yD+kHvbCFvsksPNZAj04Me84qS8jK5nnlWF35/0e4Cl4QJEHR2QcYeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=iK9LgXZv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="iK9LgXZv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gzvMMd1RbP+1PMa1EVSreCjzq6bOjb6pj1xLI8TnSdM=; b=iK9LgXZvQtCdnK5F2KPqCb/3bz
	1n3Vmo8ayXMmflM+cKP28NIWloG4eV6x1muqq6jWFZwYQVjO73QoEkJd1F2c2c4zJJHDdlH5YW04K
	DrkJRMsD/3YMG7sYMvs9wC8LUCvGWFUdqhIYlY3eWHV2UZy70AVKQy4AipTVHMf+b3jNL+ThZCunD
	0+lIUNuzPz/XFdm0+GkGOwDnDHpYEv0cqMB+cxW0Mz1AWLIB1XBOt8mA9KNVZGsIXviw8hmuxmbl/
	NOf1ln1pVoeXCkUfmvyDKviPL2penh7JhFhv3uoIO/lr3eHRc+90KbZ2Byxx0j/eY45i9ddpGuA8f
	FB2Dvexw==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmpa-0000dK-0G; Sat, 10 May 2025 18:13:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks
Date: Sat, 10 May 2025 18:13:30 +0200
Message-ID: <174689356067.2086280.9979554984882379307.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250510075248.34006-2-ziyao@disroot.org>
References: <20250510075248.34006-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 May 2025 07:52:49 +0000, Yao Zi wrote:
> This corrects the type and suppresses sparse warnings about passing
> plain integers as NULL pointer.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks
      commit: 61bf658a4d95e8f982b6e66dea763bff57996349

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
