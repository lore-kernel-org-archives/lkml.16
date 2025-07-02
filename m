Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15006307AC9;
	Wed,  2 Jul 2025 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751497437; cv=none; b=JU3R9gmSW2/LhbetitDy1S7fl+7XeWYidV6iP0P6bCoHvIe5NLiJ+q1p+oXVTnKgC+wXUq4xziw9w7VYlefgpfqukpKs7QAAoijghSiJtrscTTyDrxU29qp3CkXsOGjPe04G3d7qiTOcxgzddKY9xq5KybcNlmhY2etPoGBHFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751497437; c=relaxed/simple;
	bh=ucS+ilPG2rYTNnJTv1Bwp+mKTBAYZCfog9NWyr6zRJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hYcwyKLm2xP/baAOUtqieElJ4OciAeni859FMj+z4G53dwEKdlNBaiEwhp9X3TCDZ+sAu0wIN4JgLnab1gNGR2TI1alP4OGpjVL23t6M6qNFW/zUnSFm3YQNM1uIF/PcUY2DwFW+wDGqwcly2Hc2gx58hdXwAdKFIpT4cyHxT5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KDbILQNl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KDbILQNl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0F070406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751497435; bh=4nYCxkfW4OyMor8Fbo8TDqknIZPFGI22sOuPRVnexJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KDbILQNlKL6nTqESrMis5Plnasrq9CF0XEi1M9lyI2wk++yQDvh+YMgW7J0s4aGET
	 lGeS0kplvT7Y8y5M1bOXv+6DmSxu4mdYPkt9WxZ1Y59IOYSElq8Gbvwrz3DGMEkXiC
	 aiy0IigfSW0EbuYa8zDDlxiY8cljTFZgZ8+GMKYLwqG8d2JGggZfsZhrz928jixI7M
	 mWKS3Dj1poa0bvslA6xmhCpgnMm8HMRVynnvEYdEzXCHENPxLp7UH7FZRNAH0SCx5P
	 hv8Yh5Ae5TAFTpMDAy0EpoBT196ZQyPoaxeyLr8N1kDt1MbYSIvw9+nLgRdgO4t2aZ
	 KcaOJpWIyBHNg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0F070406FC;
	Wed,  2 Jul 2025 23:03:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Sai Vishnu M <saivishnu725@gmail.com>
Subject: Re: [PATCH 00/15] Translate sphinx-pre-install to Python
In-Reply-To: <cover.1751318230.git.mchehab+huawei@kernel.org>
References: <cover.1751318230.git.mchehab+huawei@kernel.org>
Date: Wed, 02 Jul 2025 17:03:54 -0600
Message-ID: <87zfdmmbz9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series port scripts/sphinx-pre-install to Python. It started as
> a bug-compatible version with the old logic.

In my limited testing this seems to work just fine ...  Unless somebody
comes up with a problem, I don't see a lot of reasons to not apply it.

Thanks,

jon
