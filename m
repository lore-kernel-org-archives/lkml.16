Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8D1DDC28
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201089; cv=none; b=JfEg6eFfUBrpj0ETSRCX6zH1wl14Ho4CstJdjq6DnnYUnx59YHrv8whvzrBbUh5VgBZag+vSbygvafE05b/oSMgXgQMObNTWZqQ09sGN2p/kcGg0aHZzOsOML7sQgrGis5Niv4QT11cr4iglynLnemR86qm5xOYzHa+1u+9nC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201089; c=relaxed/simple;
	bh=697Oai1IV7G2+xvxPd6ZG9+z0T62QQG8CT/f29T9ksg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj6Wcxtdz54pPqyr/gcx+7BRU8Py5j/wRJ587QmC0qpSMmLEhzkUOvgNV+gAxdMOe8eh0E1csn8xznRYDr6b+bLXzh9jXGJWjssIWwzj9zr3ThDYe4Nxy0KFil+jKKeBQxIDBG8+KcCGaIveWPyiWPQQKuzRca53iqwNg7dxfmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DAB5F68AA6; Wed, 14 May 2025 07:38:02 +0200 (CEST)
Date: Wed, 14 May 2025 07:38:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: ilya guterman <amfernusus@gmail.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/nvme: Add quirks for device 025e:f1ac
Message-ID: <20250514053802.GA24939@lst.de>
References: <20250510102130.14710-1-amfernusus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510102130.14710-1-amfernusus@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, May 10, 2025 at 07:21:30PM +0900, ilya guterman wrote:
> From: Ilya Guterman <amfernusus@gmail.com>
> 
> This commit adds NVME_QUIRK_NO_DEEPEST_PS for
> device [126f:2262], which belongs to device SOLIDIGM P44 Pro SSDPFKKW020X7
> 
> The device frequently have trouble exiting the deepest power state (5),
> resulting in the entire disk unresponsive.

Does this happen in more than one host system?

