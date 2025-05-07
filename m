Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF185212D9D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602119; cv=none; b=VuvmWbIvEABDQ9RULFjAHjH4yuPCFSp9HM/E4oCGS/+nxDWKr7xVaw2/H2q0cp6+PAq8RWFQkqDOj9uE7n7nGQRfKbF3cTsv+8G9L0EoQZUHQa7Qi2K1ipd6nZcwc7IvupJk19pBSf4tyLWW+DRK/4JLzKlmS3UmiZ0QWuchjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602119; c=relaxed/simple;
	bh=8JkAk2ub/c7L3Hi8Tt/EpoykKDQVI5AN10U8mSHSIrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/3Wwxqg0mHI1cW60rA1fqY9U7jnQdXnUaivb681xJCM5YF1JWWKSajZntvMVS+2wUNiR/GF6sm5L2oKWb7plbl0W7NjjfiglWaZc1NV3eWgvnHFr2Ql8nw+2Go7tjXwTKEPH0hbmxZNLWSfs2r8FBQl1xunoGNkblKtjmt6zNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 95D4668BFE; Wed,  7 May 2025 09:15:09 +0200 (CEST)
Date: Wed, 7 May 2025 09:15:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: mm review needed, was: Re: [PATCH v6 1/3] dmapool: add NUMA
 affinity support
Message-ID: <20250507071509.GA1413@lst.de>
References: <20250426020636.34355-1-csander@purestorage.com> <20250426020636.34355-2-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426020636.34355-2-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Can I get a mm review for this and an ACK to pick it up through the
nvme tree?  I'll also fix up the minor coding style issues.

