Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789454279
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601345; cv=none; b=ejVqU0ZorWyzE2Ivmj2mu3IFrjSG9rXaoAvAGP9L2afbuQWXJ/JPYLDuwvTPGr4Pws6OmegxCe5XiFikUZLXd1HWYh9/TXyCx01YmdDXgUF5LxCOs8e/vqmkCa6RjfBfV+uXxqR0uKkUxqjXhlxc7XdRwGczYmjdjOMyLSY62vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601345; c=relaxed/simple;
	bh=2aiSSfTARXLXB+2b6Ug2v7LTxgYSipXgqDvEptgUSWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCP8VZybyQbqqU10HpWa2PLm9nalmiJQVVRRtwz5cFvVJsGeVOS/WafenIEN0YM+lUorCCWyCeW+cJDqysBmGwBlz22Z73ZfH/YvXzIVjy906iQT2uyWtYPjdhs1+6DkbrFbDqDjhVvpAkvIm7/TUkLtdSPartbe7n8+ij0y+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EF20E68BFE; Wed,  7 May 2025 09:02:18 +0200 (CEST)
Date: Wed, 7 May 2025 09:02:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <wagi@kernel.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme: unblock ctrl state transition for firmware update
Message-ID: <20250507070218.GA314@lst.de>
References: <20250502-nvme-fix-fw-update-v1-1-cd7a9f3031f7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-nvme-fix-fw-update-v1-1-cd7a9f3031f7@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.15.

