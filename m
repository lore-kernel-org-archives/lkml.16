Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761E1EEA40
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308531; cv=none; b=RxOml6AW7Rv9Y7kNCyuw5iQ8w9PXsSe2qW7WeYk9qTDbmfwGXAecAyjHGGhgzJ+3U21Fk9JEfyVIwgh3dkoeEsF+wSTzbejTy2AElzkBxDH8Wp5ejUY6vcqLm3SGDf75T1xsTJCwuGRwVWsD6NzrwiiuLA1cI+sr4BJtlqa+7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308531; c=relaxed/simple;
	bh=4APg6yVz6kgCDi8Roxi56DKotyt2hsl1mO8Xu/bEAlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAVvAdVWYiVReL03y5xVNkRHIQ8kZKu4JsvjCleSuzW8my5KBGoKy1SFUlbAvogI5ESLf4TiNSqmxCxaVvfzfQdFO0c5bkRRUW8jF11nNP/s+i4HLhabmmSKyy3X+RiVZNVRyDHKyc6x0KihA51zaKZQ6WIhNM7FVJYCOTI+zNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4A2CD68AA6; Tue, 22 Apr 2025 09:55:25 +0200 (CEST)
Date: Tue, 22 Apr 2025 09:55:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-tcp: switch to using the crc32c library
Message-ID: <20250422075525.GA32418@lst.de>
References: <20250226062841.60688-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226062841.60688-1-ebiggers@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.16.
