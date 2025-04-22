Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C6A2918F0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339307; cv=none; b=YlmSfHKhUYiLFhypUJKgw5qWFNpq7u0m0z1WezP46hMe2YsOyoO5ZbAXqJrmG1NJuY96BwY9CNzfoT0d8jJ3XBSYsgpkz5Gmr2ipPO2gMARsarpbRQ3jPBKO+5v2mDwcaCFQJMKGPjdzIYfCdmy5cvTZEaKtMfZkE2uuUPPNWRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339307; c=relaxed/simple;
	bh=MUHXLbw4PSncF+UV30q8W9gxIbZSJpFygIOkkTyPMzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+2Pvij9SJW18xn6/BQSS7Lr45rC2XlmV577mdqf1C0M7UQ7XFTvn6gKhG0oN6iaueskFEFnMZyv5tpIRoPNZpX5mLMtJjTR0j+nwfgtZSKEoG79O6W1EbT3jBbdPoLhWsD5iX+cJk70zmsmHU1y3aOKQk4RcFBMQ1ckE+5BMBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSz5iqRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSz5iqRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6787C4CEED;
	Tue, 22 Apr 2025 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745339307;
	bh=MUHXLbw4PSncF+UV30q8W9gxIbZSJpFygIOkkTyPMzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSz5iqRvgzAMb83kkkytfCNeIhtAYxm3/9bS85K1gDX3S8KCYhR8i4ZhYw/UwNOeH
	 EF9TjYIiC3LDuZHcnMeNp7oMnUmk5T8siYSONDxBL6Wm42jO4v1qXH0F64fsYHYuX9
	 /qyL82i999PgbBbwiJF3deb5Xw41HG2ai64GgZShhRyAagnI1D11uPOmNi/vlPzNIT
	 Q4v9X5OwXXXpFJUKiZu2MmcbDIjNRfgnAkZxjG9n7jLqIebKWOeiYj6a/HAUrsiFXH
	 bPoVFvXr6gzIDt5bA7a0j7ewhFJWBF+MSUjWTTnPge8c8pP1MGNaNo1KriSbt6VswJ
	 0CVdIrt8E3SkQ==
Date: Tue, 22 Apr 2025 10:28:24 -0600
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] nvme/pci: factor out nvme_init_hctx() helper
Message-ID: <aAfDqHtCwNWclrgz@kbusch-mbp.dhcp.thefacebook.com>
References: <20250422161959.1958205-1-csander@purestorage.com>
 <20250422161959.1958205-2-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422161959.1958205-2-csander@purestorage.com>

On Tue, Apr 22, 2025 at 10:19:58AM -0600, Caleb Sander Mateos wrote:
> nvme_init_hctx() and nvme_admin_init_hctx() are very similar. In
> preparation for adding more logic, factor out a nvme_init_hctx() helper.
> Rename the old nvme_init_hctx() to nvme_io_init_hctx().

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
