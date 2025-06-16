Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12D7296176;
	Mon, 16 Jun 2025 03:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750043111; cv=none; b=UmGGJzdKD4hFnPjsGEuHF1KByXaBn9Hc6Uit5se2VLAHofIpMVhpR7cODxKpx3gN1D/EB1fAHYcpVgSE2FF80gkGgbxCVcafqWSqJP/6gfjaVk9npBR3N0E1qneylk7yd0DyJ4Y3hZtGvGMOjFBtcysSHf9F4Xs7FAaYPQUTJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750043111; c=relaxed/simple;
	bh=VDYWpN/qtYIrFTNt93vXPpHqVDdhjSGG017lJvkwh7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfhINLprLk6Kz7SqLW6IjfTcBci2iw5YrkEKJFAGGFvaN3WsAIW7om4YuFetJfRziG6DldDbFQu1Oe0hXp3vPliOeN0NnJdNdEdJYv+qbSRed97Ik2ydym5olKCey4HufZxyBeaSpO7AkL0ZNrv/3DgK94miLv4RXwEeDrgSxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JGgWzD73; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JGgWzD73"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=r39SR+iYOnU6Tptcpr3GxcMEhIdvdrMkRtTp26UKitU=; b=JGgWzD73KSGpQXt23KGBF6q05e
	JTM2DsY2r5Dy65wbPP69S5cW7pDc3DnU4qzOAjp6rErRjhrMvLj/k5Uz8Xk1pY5PnbfD8uvbdD8MG
	TN0Lc1nTibAv04NAfHPM5/H/tmOASQ4c1OoNWsTFmphmp5fSLJSmHafFXXceUuohQRAwKRckWyNIp
	nc3k7T1/reqWlk+IYnMGuvNn/nfxQM8MidZwPqMVOfehR/V7oAfBQU9i6H4no02FkkG1WLShdJISJ
	RQEpM5YnyJbtxg6j9jDZQITiOfYfe9JbzgwDxoPnDnKL6QXRPKMhUs5OSj8ozS4TOve44UTgzoTIN
	ubdsa7lA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR09b-0000000FUVX-1sBg;
	Mon, 16 Jun 2025 03:04:59 +0000
Message-ID: <217e3774-8a28-4adc-b2df-a31b6ba5a382@infradead.org>
Date: Sun, 15 Jun 2025 20:04:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: nouveau: remove invalid kernel-doc reference to
 r535.c
To: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250616021742.8304-1-dev.hyeonsu.jeon@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250616021742.8304-1-dev.hyeonsu.jeon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/15/25 7:17 PM, HyeonSu Jeon wrote:
> The file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c does not exist
> in the tree, but is referenced in gsp.rst via a kernel-doc directive.
> This causes an error during the documentation build
> 
> Removing this refernce resolves the error
> 
> Signed-off-by: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>

Thanks for your patch.
A previous patch has already been applied to drm-misc-fixes:

https://lore.kernel.org/linux-doc/20250611020805.22418-2-bagasdotme@gmail.com/

> ---
>  Documentation/gpu/nouveau.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
> index b8c801e0068c..cab4a8eda850 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -25,8 +25,5 @@ providing a consistent API to upper layers of the driver stack.
>  GSP Support
>  ------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> -   :doc: GSP message queue element
> -
>  .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
>     :doc: GSP message handling policy

-- 
~Randy

