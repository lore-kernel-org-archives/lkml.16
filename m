Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58413C8EA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071792; cv=none; b=Uf6gTh3wiRlPNdT1FZ02ckdtyc3hIkRS9I8Tq62PwjZkz8yGdtJCkvrygAoqrAVfXxUox7a4Rbzf8wjOSAEg2t25fHeOgoGxrfyzB0NjvS5EyZM0dEfFbD/KTp4rNXpySeDzRCr63MZ45nofPZ0JoXR+fobuUukNejkf0FqsRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071792; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4wnMzfpcCNu/txw+4eXAIrGNjvyhsXLw4fbM3aTsrMQTbKXEEY/fz7bymI9DcX/CFBJ3l1FiIbziKoxgOeSw8a1FVFDWXIksayBlfPdovFqYV5nTrrn0cVWhoUVmSyvuCjAVnztS8jdw+7EFfOsjG0g64V4PPyL1my7x6ygXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8FC2568CFE; Thu, 27 Mar 2025 11:36:18 +0100 (CET)
Date: Thu, 27 Mar 2025 11:36:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] nvme/ioctl: don't warn on vectorized uring_cmd
 with fixed buffer
Message-ID: <20250327103617.GA10068@lst.de>
References: <20250321205722.3947901-1-csander@purestorage.com> <20250321205722.3947901-2-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321205722.3947901-2-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

