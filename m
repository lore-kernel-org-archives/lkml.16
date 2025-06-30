Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639A12CDAE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265939; cv=none; b=EtGQihbo4dutXiZz60IiE/bi6QSRwE8DUBDLeGmArdtKAEri2MugTxp4BND5rUqR5/jCC9/tJwPHkGo0wOGMO3hl+i9ZuZL6JFH0CQWJ5JCd32ah/yltVhdyHuzR3Ld+acLp6rgCVz8dhRrLa5OrqCnnFZF8tOyg199rOC2pSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265939; c=relaxed/simple;
	bh=4APg6yVz6kgCDi8Roxi56DKotyt2hsl1mO8Xu/bEAlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f11AAq2uxAsFFXOdpaFlIYhlwHl3gleO1n2DWHIKRvdGxeF/0Oken/uVdyvvyHtdqplEN7dHS6iy3RN8mr2CsZRgQ72HIPYAzEnlTvA4TXgs7BZghyTe2AH4RTN+xX7ks7bvzY3flFvLCvF4s5S7Rpi1iugkIjSMOu2P8LRwHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1DBE468AFE; Mon, 30 Jun 2025 08:45:33 +0200 (CEST)
Date: Mon, 30 Jun 2025 08:45:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: Re: [PATCH RESEND] nvme-pci: refresh visible attrs after being
 checked
Message-ID: <20250630064532.GA29859@lst.de>
References: <20250613192102.1873918-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613192102.1873918-1-andrealmeid@igalia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.16.

