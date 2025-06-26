Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D4C8EB
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750978729; cv=none; b=RsnfRq0zSqzdv9qQbWxgQi/j2UmvYPriuwigH8eu2QZ7+7jwzQ0k+0XVJ2EUhcaBu+O8DxdHYZsE5kCpGlv+7PHFuhs2kdNYWnQjuF89vGhztm7tGRuE1T6YKeTj/7It4m2RfJu38G3/2/Kps1c0uiGoWGsXHGa8fi6z/DQQeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750978729; c=relaxed/simple;
	bh=FNCnQJMtGBc1Bo5uRWoSDLrtdiU75nfOcOk5CROnpxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9RxMq9qw26NCjwhGPL/5k0Q+l82kwpO4wVbHMxIzS5bvQH2xSDXvYmDQ4AU30iyyHrtJY2DuPpErDnU5yVqRY3Yi9FOy6ewQq6ggS7qVBpGlFUuMoSivGWkNgkyFSFnmPLvSaRkUoF6JUHZss/QNS57cq4TR33K6W4L1nbmtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aI+1XuFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aI+1XuFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4871C4CEEB;
	Thu, 26 Jun 2025 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750978728;
	bh=FNCnQJMtGBc1Bo5uRWoSDLrtdiU75nfOcOk5CROnpxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aI+1XuFqNCRM9yQ+XMdbaJKlAN5ieAC0T3Ga9EF2pMznUQQOm8gguPknMffxHojF7
	 yCOZ8NnCJzL44Na/pLOiHtMLRjsisQoi8BY4BjbwYD8PuMaFw5VvVOILHpdo1e4G8L
	 5EH9b2So+wfDSmObeQhUrCjU3ed9AtSrat0vIv57BgdQOfPzTpdBq0+8s/ysq6Yjur
	 B8veBiBfApow32yPLYetKZpzY/PWfBSe/6UOn8NWMmWDnzPV8XcBp9+YKn2KY6L60W
	 BXT5N0oxXwnIO/83zrJd9koXc7x7TaqL9m7Px3RlvTrTUtl2zeDAkmFi4SaCkHe3Nz
	 8YJmR5mO0cSTg==
Date: Thu, 26 Jun 2025 15:58:47 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2 RESEND] phy: renesas: r8a779f0-ether-serdes:
 driver enhancement
Message-ID: <aF3Qp730y_Vusb-z@vaman>
References: <20250626081723.1924070-1-michael.dege@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626081723.1924070-1-michael.dege@renesas.com>


Hi,

On 26-06-25, 10:17, Michael Dege wrote:
> Hi,
> 
> This patch set adds the following to the r8a779f0-ether-serdes driver:

I have a v3 and v3 resend and both are not threaded properly, Please post
properly as a series which is threaded and not broken... 
> 
>  * USXGMII mode support for 2.5GBit/s ethernet Phys
>  * A new configuration step suggested by the latest R-Car S4-8 users
>    manual V. 1.20.
> 
> Changes in v3:
> - Fixed wrong macro (reported by kernel test bot).
> - Link to v2: https://lore.kernel.org/r/20250527-renesas-serdes-update-v2-0-ef17c71cd94c@renesas.com
> 
> Changes from v1:
>  - Modify this driver for the R-Car S4-8 only
>  - So, this patch set drops the followings:
>  -- any dt doc modification
>  -- X5H support.
>  -- 5GBASER support
>  -- Registers' macros
> 
> Thanks,
> 
> Michael
> 
> Michael Dege (2):
>   phy: renesas: r8a779f0-ether-serdes: add USXGMII mode
>   phy: renesas: r8a779f0-ether-serdes: add new step added to latest
>     datasheet
> 
>  drivers/phy/renesas/r8a779f0-ether-serdes.c | 97 ++++++++++++++++++---
>  1 file changed, 85 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.1

-- 
~Vinod
