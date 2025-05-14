Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1D82A1C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231664; cv=none; b=hDOiNZ3QOvT0sszlJq7c4KX11sDsVWJuBJ5EBwivmqSOOtG5B+dOUqP7IyQr1a0igd4siux6pAkIhuldE9mUJ3TFpaVdxFqHys4EPKgMLwpi1FFpA1Xal2ZGrcHC3tHZb9FnBH3kMXOV8He+nSz3mysySF5SOFvvyGzDnYsANf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231664; c=relaxed/simple;
	bh=2/xOCBB9K38RfmY2nt7zjiGNQ728J4qiPlXjILoepuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDJnWdYP/2CZS2kyiJuJClWasPWx3bxqTTyMP8WR9SDIJZ8Br4kEgG/PQ8bZ6J+Zcp2VXA56I0Fm7J+LRjCGT+7CeWxBOHF7pvU3BiI4GlqW7/xDT5sxLzucZnAEZQU+f5r9Ynw7FiUsln5Sxkl2ipYIf7PcbbWJTbDzG17X5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3E02168AFE; Wed, 14 May 2025 16:07:38 +0200 (CEST)
Date: Wed, 14 May 2025 16:07:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ilya Guterman <iliyagutermann@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, kbusch@kernel.org, axboe@kernel.dk,
	sagi@grimberg.me, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/nvme: Add quirks for device 025e:f1ac
Message-ID: <20250514140738.GA26520@lst.de>
References: <20250510102130.14710-1-amfernusus@gmail.com> <20250514053802.GA24939@lst.de> <CAMraO6-rQsf8T_ocOKbe3yMP+91W=AF6WtRUYVPtNuq43H8qXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMraO6-rQsf8T_ocOKbe3yMP+91W=AF6WtRUYVPtNuq43H8qXA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 14, 2025 at 04:14:11PM +0900, Ilya Guterman wrote:
> I've only been able to test on my own host system, but I found similar
> reports from others online.
> 
> Let me quote from the reddit conversation
> https://www.reddit.com/r/buildapcsales/comments/1e4tgge/comment/ldha0ye/

Thanks!  I'll also need your Signed-off-by: tag to apply this.

Sorry for only noticing now.

