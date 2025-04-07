Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9311F09B9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036487; cv=none; b=lpoPM8m7vPV+QGs2tWpewqK/OH7PSaWSdXkALHHHT3SH9m0UGs7eIM+BCGlgVezpSPj2rN2k+AciGWpPsl8yDgkGjNQfqj9qr0lVSyYXLuApwBoltGd67LumpBOXEA/orPLfx4INneUsYUBvnguMTZnYroUnv2yAIILnvO18BUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036487; c=relaxed/simple;
	bh=1yzGqghUsc3KJEDpIZgvoBBWc86FU2VMXXL95/WHWJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvGu5sfx6y8vLRqPIv1iXkexb7Hpm31YKO8/u8q3zMzFd1fllFrdCrouiR1cv6di+ZOrpmHaKasm1ZD113LI393/KrGBs++EA3lT96BHwSYwCOcjLhg73caWetzJNMxAi0ytq5vGOelrkp78uk0B/ogjRXUhuhAScbumS85I/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 40F1F68AFE; Mon,  7 Apr 2025 16:34:40 +0200 (CEST)
Date: Mon, 7 Apr 2025 16:34:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH] nvme: multipath: fix return value of
 nvme_available_path
Message-ID: <20250407143440.GA12127@lst.de>
References: <20250404-nvme_type-v1-1-920053372832@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-nvme_type-v1-1-920053372832@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 04, 2025 at 02:06:43PM -0600, Uday Shankar wrote:
> The function returns bool so we should return false, not NULL. No
> functional changes are expected.

Thanks,

applied to nvme-6.15.

I'm a bit surprised this didn't generate a sparse warning similar to
when 0 is used in pointer context, but I guess that is because of the
implicit conversion of boolean expressions to the bool type.

