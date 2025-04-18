Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6E19EED3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963482; cv=none; b=dVoviYb8j4BqT49/ete6hKyGEteTw48UVrlCEkhEJX6gxq+bAqeSsJbvB4gG+PB/nPXCJ7CCCwV4esHEezuJr7vbzNS/VBXVnDti4seNaCENWqtsxIPQr7tk0USNJzCIoxayYoMMRJwWFmUzZ3hmM2jcYNO4jZqN8UwhHhCjhew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963482; c=relaxed/simple;
	bh=I87Hg6UBf9scIC+j+W1vdesHt/K1tAfOVb8LtxNUDrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhucC7PGgUBXWI7XVtD0WoDp1E8eVg7roUdkY5QwIYeh4CKmNTwPGE7eAsOX5C4gVvCn6+waV1HhZPSIAMoqEgqIFLjeD1wlahZJ54DqDBuUVAFyEcfHePYv4J9e/0whEidh2guffBFeX7BlINXZ1TZcG2g/46eCQkhDp20FPjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSCElAHN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSCElAHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F17C4CEE2;
	Fri, 18 Apr 2025 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744963481;
	bh=I87Hg6UBf9scIC+j+W1vdesHt/K1tAfOVb8LtxNUDrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qSCElAHNAAzgVOM704vcMUyZ18N4qEvZLGzC0Nkoub4O7KEoJ2nIXcf0ONraeM+yk
	 KMNCrZ3B7yni8HxCrI88AZqOyExX4T2YxIwxUMZDut7FiryTgevfJ3iWTV2bMCrj4u
	 iduR7tK8xSCO6iQBCBVcL1/3zTpRWkyR0OKcvV6Sf7ExtkiDWkHs0Lls6U1SK34OIf
	 R+EFoCjsno9mdsspcZunz1O1mh6mfzoHjvGe209OKkgFIrPok6PhHcfWbjBnlAZ+Yb
	 K80rCBo9HvbIGE0tHbAm0Wx6gevHxSAD8DoQEmjCMzQX6ywFKujtfYOxX2OCodw8/V
	 ThfTE77CxjWyQ==
Message-ID: <169955ba-63b3-4d25-b8f2-afcea36d3f95@kernel.org>
Date: Fri, 18 Apr 2025 17:04:39 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: Fix out-of-bounds access in nvmet_enable_port
To: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
Cc: linux-nvme@lists.infradead.org, kbusch@kernel.org, kch@nvidia.com,
 sagi@grimberg.me, hch@lst.de, upstream+nvme@sigma-star.at
References: <20250418080250.2736590-1-richard@nod.at>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250418080250.2736590-1-richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/25 17:02, Richard Weinberger wrote:
> When trying to enable a port that has no transport configured yet,
> nvmet_enable_port() uses NVMF_TRTYPE_MAX (255) to query the transports
> array, causing an out-of-bounds access:
> 
> [  106.058694] BUG: KASAN: global-out-of-bounds in nvmet_enable_port+0x42/0x1da
> [  106.058719] Read of size 8 at addr ffffffff89dafa58 by task ln/632
> [...]
> [  106.076026] nvmet: transport type 255 not supported
> 
> Since commit 200adac75888, NVMF_TRTYPE_MAX is the default state as configured by
> nvmet_ports_make().
> Avoid this by checking for NVMF_TRTYPE_MAX before proceeding.
> 
> Fixes: 200adac75888 ("nvme: Add PCI transport type")
> Signed-off-by: Richard Weinberger <richard@nod.at>

My bad :) Thanks for the fix !

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
