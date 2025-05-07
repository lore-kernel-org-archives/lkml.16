Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA1215160
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602178; cv=none; b=DsKaGUnZOSlW5AeA1hRxby2k4iP9OQ7G+uHAXg4tEEMNLpI2hE2FTYOD4qiyPtpIk0DDcBYxfAosJCNqsAu/xMH7cNLbN6hiDlAGl8Icslng7JF9Vkikg3/f3CGJUhCHRkx3oCAIYVsoMPjR+lu0+Kb9Y103+rtyYfHzp5/wyEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602178; c=relaxed/simple;
	bh=KXN7n6U+25G9QFub9OJ0/tFwseYLcN8UveMOOyz0ScM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv7HMuItDsUJzKJ/T48mErHj7dorvpUb/bxQhiELSrDbqPmDQicqiYmlsdZ/qLZfTq3y99ZRwYTUGjv+sElIQiLuP0ye1ENKPJ8i99ta/nH7wnr6u4X/zl3fU+S4ndRv1xIDdf5m6Ls8vkgzOMpA8TtjT3VsJV2Z+ITLS/lx0eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id BFD9768B05; Wed,  7 May 2025 09:16:10 +0200 (CEST)
Date: Wed, 7 May 2025 09:16:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] nvme/pci: factor out nvme_init_hctx() helper
Message-ID: <20250507071610.GB1413@lst.de>
References: <20250426020636.34355-1-csander@purestorage.com> <20250426020636.34355-3-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426020636.34355-3-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

> -	.init_hctx	= nvme_init_hctx,
> +	.init_hctx	= nvme_io_init_hctx,

Without an overall rename of the methods I'd rather avoid the _io
here and pick a _common name for the common helper.

I can fix that up when applying, no need to resend.

