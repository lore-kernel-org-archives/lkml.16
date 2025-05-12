Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86B1E990B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059304; cv=none; b=LHNDp/fzwK1zsaUFToMsXNvGjr6jtIRZSPbF7pG+xVOCeTCpU9tkB67mMjUDVyn4Tg6RtvzinWDrudJ9bZwOMYbjERs04cwYRGMGM/SmO3lCTEuq518O+25Y96VPpvBcVnOO9R4NH2IQvXkqXjO/SeXwbFcQvItP/UCBtO3NHDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059304; c=relaxed/simple;
	bh=OM+2aRTWR2RNNpnL5NXW1LjmQ2U15AYGCw6yWIfQH1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcM9zdE5C1d2Q/ni6yeMSmx3lGIHkPorKBfw4yIM53jlhn/cB0a2tYQiE/n0O4ZU08sD0SVSb1WywT2nfyN3XjHj4xgixY+iARVyw84TOupJmsh/NYZPz3HsznHYfFLYuK0W4DktpQpMSdxCFcYwkrK60iaKwGirGVBv/O+K81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EC92268B05; Mon, 12 May 2025 16:14:56 +0200 (CEST)
Date: Mon, 12 May 2025 16:14:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] nvme/pci: PRP list DMA pool partitioning
Message-ID: <20250512141456.GA3822@lst.de>
References: <20250426020636.34355-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426020636.34355-1-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

As it's been impossible to get any MM feedback even with multiple pings,
so I've tentatively queued it up in nvme-6.16.  If anyone in MM land
doesn't like this please scream now and I'll drop it ASAP.

