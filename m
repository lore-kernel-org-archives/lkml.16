Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20CC27C178
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355796; cv=none; b=AWs/4domLeoI362XEYm0PRHzgkF3e+he5nchoGz0iwTyjyRCFNZPMaJFv8B5O054HrzLC+pdHBL7qEoYwp1HWy2gyQJDWkZk4VRNYdZL3HXc9gvUlbSz9Ki1xAJxTGFMUCne1JhFl/bE8z3i7PIAjgbdzR5gaAO5lbDMi4X8p5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355796; c=relaxed/simple;
	bh=T9N7HsEod40hczRSGHHXWyVVmwWi7nWUSQgVyyI1B+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRXX04IC18/Aa/psDMp9q9RnNkwj1E7bFtM9X9hv9HkyeLG70u13q1HlwQaI5CmTrb4wFkImuqzT203842uw+ljbhjFKKfaGtx4Jy9qm9pKrpwxVAj8xy7uim6aWPqLhP5Ra8nj+n9n2jon5h8mA/4HXDueNx8ZJdxECD76cApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=iuBs48Ez; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="iuBs48Ez"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8134A47D5A;
	Fri, 11 Apr 2025 09:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744355792;
	bh=T9N7HsEod40hczRSGHHXWyVVmwWi7nWUSQgVyyI1B+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuBs48Ezo2/n/fXFujKGAyTTV7eh/GfVGNSqT/d34Z/nTswcQoemPgKoqh/T0fEqs
	 SDgY3SRGeRiWfiVoTzwx3w10Lvc/HjvdVpjCnChdiQLxlaqMkkXJbLVmb46QRcH1Qa
	 xienq7fTbwVqsUg7HKvz/AvOO0ah83hxwiQG5L/r8mVHwwuFvX0wq6s/wpIyOOGw06
	 edRkPzjGGxI+sCEsH6stxPqCpLm4rVLv3DlLk64wBXRHWplghZnXycA1+eyPj6raOW
	 6HZ8yfyfUtkPRxXiP+y3JPnnQnfauTrVOM9dOyXgat+QzpkTrE+LM2OmBBt7uHWng6
	 8bj01SPlJ40aA==
Date: Fri, 11 Apr 2025 09:16:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] iommu: Clear iommu-dma ops on cleanup
Message-ID: <Z_jBz2p0cYqIFfFn@8bytes.org>
References: <e788aa927f6d827dd4ea1ed608fada79f2bab030.1744284228.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e788aa927f6d827dd4ea1ed608fada79f2bab030.1744284228.git.robin.murphy@arm.com>

On Thu, Apr 10, 2025 at 12:23:48PM +0100, Robin Murphy wrote:
> Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/iommu.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.
