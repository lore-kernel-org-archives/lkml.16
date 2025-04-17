Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9AF3594B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901156; cv=none; b=t+CQl8YM4kbG/OQ5rxK5fWxa5FeZ+EcSz2dtf3tZNo13Jj63z0jmBL/E9bLaLTkxaMr6umXml9Qh2cP8oVIs4p84hsBLC7cUWxq5dOI9bGEZOpwnJlITbRbjiDfgATc58/cAZrlCAj3qQ37BNNCe7ypFigyW0bZHlWKWVBBnhW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901156; c=relaxed/simple;
	bh=YaH/LyqCwysYz4Kz69ylUWgHb/lHm6J0FZUcgH1QP6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1yjIPboDI4he4zmlkgv7H8PaCuVl5+rTPLR0rfw1Jo5BAgwNpZMOSNRO/UNGSdTpvsQQhSnBa9r1zr8Hk1i9e5faqj0yCbfZn9NVvZRnd9qk+QJ2nik7i6LKJgKgbwoyQyBVhQiHIp5IIsUWb1urRRlWYulIeoVdCQUfgcAWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sdG/rHKi; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sdG/rHKi"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5E69A4844C;
	Thu, 17 Apr 2025 16:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744901154;
	bh=YaH/LyqCwysYz4Kz69ylUWgHb/lHm6J0FZUcgH1QP6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdG/rHKiKcjq9SH+Gha5d9it5hNR1asHCUtAsozMgd7NqQi/QZW0Bk5YGLMHL85wU
	 iPG/TTRlaVq3MruWEhh/vr/YUHrtCT7KbrxjWLw6+II1jhyZtTpkL2iF1TLwHgNY4L
	 1FgtIBVO5ul7kJ411gZEh7d5cW/yraN00S7YR78DPHkRldDQw6A+jZg2n4BVwNfm5D
	 xsIgzRmYC60usidDD0lpw5duS2qnGS9jRydqDPd0SKrpTYfu/8SquSEXvuQsP1miqT
	 z/LnNeXz0bDnGTH8BBzXQvn2jWLXuHHFYw6AyMcWuxDGn4/ub2pTtj+S0yIBR0k3Iw
	 TXtHCP/TORnOQ==
Date: Thu, 17 Apr 2025 16:45:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] iommu/vt-d: Revert ATS timing change to fix boot
 failure
Message-ID: <aAEUIWTohmveAvMk@8bytes.org>
References: <20250416073608.1799578-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416073608.1799578-1-baolu.lu@linux.intel.com>

On Wed, Apr 16, 2025 at 03:36:08PM +0800, Lu Baolu wrote:
> Fixes: 5518f239aff1 ("iommu/vt-d: Move scalable mode ATS enablement to probe path")
> Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Closes: https://lore.kernel.org/linux-iommu/01b9c72f-460d-4f77-b696-54c6825babc9@linux.intel.com/
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)

Applied for -rc, thanks.
