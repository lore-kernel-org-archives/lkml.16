Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F2189F43;
	Wed, 25 Jun 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750872436; cv=none; b=ay6v2Mp4dKx96OTvgvqg6aQS5klgHP0b9loghM71Q2781YvaQR5TbvPso92BpbPRG8MW2wEiuokgFtrJLpFLLxjBRoIM7bu7uBJ3B2qT8n8N/pRvI3aEhfD3W1lp9V7vf9MnyM/LhWZMeaa4K/jeFTUSg8U7KkR7eVx6gbUbnow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750872436; c=relaxed/simple;
	bh=2HVKHMrelwbgx+A1VGX7h4GKW2LchN3tI3NE7LNzuzk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uh2vUc8mAA53WKQSEvwrQAprc3p/YUF42rjE9pJX9OApHxarD0um58v9Bo49guYedO9hK+zbnsctwnykTIa8np00ZeBJhVG1REg7+CZm6TEHxqAzurT2JthCCHjyxyJeq9uoVXp7L3OKr/bvMfAFtLtPs0dbwk7Tk1DFfoPg3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rO2x86zB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rO2x86zB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 15BB2406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750872427; bh=rqiEDJi9Hcz9MDg7YYzWxj0fnjQ3GODVLv3dyStJbSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rO2x86zBDCurq6JF6+KT5Yrq07f7MbkpjV+Sio8qgL5gmyKopqq1leUBHzXLKE/+6
	 3T3fqtmePuWUz3C3MraRv8sRCq+W/9nPq9yu9cT5DwbMp+QWFnIpfkH1yQ0V3W0CXS
	 Z45GK1tnYSBA4Pve13e+49btdRUMWzzDqupWHL2HHPH90UnT2M2M9LrE81R9oysc/+
	 yj2E6K5wSGCookfxC/aglMXjRnkPXcDhwMEEsLrrfUMtYZoOQkZGIgem9kj2QDos0G
	 IyI4ImQgqYf7KCJbkxt+n6A6YKy9i4POqXdcUDcrTsfbrmfCPHH8IVO2ULcojzwNop
	 KA3quS28H3+YA==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 15BB2406FB;
	Wed, 25 Jun 2025 17:27:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, DOC ML <linux-doc@vger.kernel.org>, KERNEL
 ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
In-Reply-To: <20250625142017.237949-1-xose.vazquez@gmail.com>
References: <20250625142017.237949-1-xose.vazquez@gmail.com>
Date: Wed, 25 Jun 2025 11:27:06 -0600
Message-ID: <87a55vag0l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Xose Vazquez Perez <xose.vazquez@gmail.com> writes:

> replace https: with git:, delete trailing /, and identify repos as "git"
>
> Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
> Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  MAINTAINERS | 50 +++++++++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)

So ... we're changing GitHub URLs from git: to https:, and Gitlab URLs
from https: to git:?

Certainly we want to fix URLs that are broken, but is there any real
reason to churn up the MAINTAINERS file to "fix" URLs that work?

Thanks,

jon
