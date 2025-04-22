Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AE1F09AD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308266; cv=none; b=q2gAQFYf9pbWsRfI1nLxLoO6m4Hxhp0wdc9tY6UEndhw9BbJNgTOBDW3ZWcDh/ktTlLnhkDsRaU+G7SiX4aM8NenIXiPkcOSWbDLb09V2coYgCwG4XXxSI5zqBziedzqp4yZ8WcCRJyT6y6M61BOtmAbF5An0invmERrQsnEIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308266; c=relaxed/simple;
	bh=2aiSSfTARXLXB+2b6Ug2v7LTxgYSipXgqDvEptgUSWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOmisddQvmHYl2C/76MwG+2HTgSgAuHcgllRaiN+hhzut4iiblg6Br4cvFpwMHRKSiNxLEWNVNIpQSNkxoz8wO6Gp16E9c4ZjvXh3JfYN1k9BgV6Ycet/sQ+6CmTUFyEZaaWEM9EmpSIncOH/tWMrxpxCVcTmTEthEYBqq4I9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1873668AA6; Tue, 22 Apr 2025 09:50:54 +0200 (CEST)
Date: Tue, 22 Apr 2025 09:50:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	dlemoal@kernel.org, kbusch@kernel.org, kch@nvidia.com,
	sagi@grimberg.me, hch@lst.de, upstream+nvme@sigma-star.at
Subject: Re: [PATCH] nvmet: Fix out-of-bounds access in nvmet_enable_port
Message-ID: <20250422075053.GA32269@lst.de>
References: <20250418080250.2736590-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418080250.2736590-1-richard@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.15.

