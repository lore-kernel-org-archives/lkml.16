Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE41B87F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196315; cv=none; b=asb8Hv/Yk26RZq0MKG1QvCeoKQLUqR+SABSKWOUkIuyU3ZuP7ElHg4+IKLFYD8YR2XOy1+ueFyjpWnWnZInw0pd7RAnOjxU8jGcipHre0nhgMkjaJkARS8IRFL9QIVcn3Gzs+g3yOTtNpST+alHyk0f7KnQ04q9lzd4yZ030Stw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196315; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fcqn4zZZoU6IHtNaZZSX366fle23C2FhRQ5vXWSW/mLNaH6BcDsLbpO9WvP1V+5tiSa3/0LisQTwKxtQB7PeWjiyYeAn8gSrVQ1PzTeExeThsr/Enomq2y4QOxgsAEcKmH0SobhC+TmkyQ1X02iOCsSBbwR9LA9wPdLXxR1ki30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4BE7968C4E; Wed,  9 Apr 2025 12:58:29 +0200 (CEST)
Date: Wed, 9 Apr 2025 12:58:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <wagi@kernel.org>
Cc: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>, James Smart <jsmart2021@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] nvmet-fcloop: swap list_add_tail arguments
Message-ID: <20250409105828.GA5785@lst.de>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org> <20250408-nvmet-fcloop-part-one-v1-1-382ec97ab7eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-1-382ec97ab7eb@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

