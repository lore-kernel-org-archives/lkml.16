Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651946B5;
	Tue, 29 Apr 2025 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932284; cv=none; b=ge7gzPuPdnhXTV7uOlygB4tpB50TRjWgBG7rUV/HtGPVfxHgmjpaf7e7EI+zbUwgDcWrG7VMik3p5t/Me5qqywwy33ILpN62ShmGcvWewaVeQTQhJ0Iu1gwk/tXztGy/a5/DMfICUZ25S8AiiRgK0nTEqM6+3eptYAzloycH2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932284; c=relaxed/simple;
	bh=kI+xqmHWFmQhxfPWx0iSb39jTOlQwU0yc6GbWzn5/8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERR7U2XZTt/kX4B4MSmUzoTAf7Oq195Vx5iASeCDnHTwJoDJPglDaZ7vsoCrjeuOQo19FEPuJPdeDFGzBbTXHpAR4AgqHyH68mBsoe94gUvIosprCA/3FJoPONQIv3JjSNXMdDNyo+eaCmuMHGFF/0x8x90jnsXka1TbDkGPvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKmx5jv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKmx5jv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAEAC4CEE3;
	Tue, 29 Apr 2025 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745932283;
	bh=kI+xqmHWFmQhxfPWx0iSb39jTOlQwU0yc6GbWzn5/8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKmx5jv0xDYfTJqlVB04Dtj2rzyVkKoBrKMzQaKaXCw9xyfbnnPG5QdhfLfgzn3gs
	 ojz8YL5st/hhTteowfZQIcaFg2dawHr7q5aKR6BWoASjxYkKNMQhImiBYhCHnP/Raf
	 4msIvDiY2pxY3EA03LnlD0sTqokwGcMOFOWpX1wbGJD7Q+bV6bqLO7hjei1zxMEEDH
	 0edUdTKmWQ4cuXv2pmaHOb+J7b5bhPtTj3PyuSXQyXZc8iI5UXUg0u1mPIc1U94501
	 ROC565/mmLH7tTh0533JgYyMO7KFY9Q8XIT7wO3KkdWfaNwaulJMYROlEFPma3cBbX
	 UuczWNoUiJMaw==
Date: Tue, 29 Apr 2025 14:11:19 +0100
From: Will Deacon <will@kernel.org>
To: Xiquan Zhang <zhangxiquan@hisilicon.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH] Documentation (arm64):Advanced SIMD and floating point
 support condition
Message-ID: <20250429131116.GA25912@willie-the-truck>
References: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 08, 2025 at 11:13:09AM +0800, Xiquan Zhang wrote:
> From: zhangyu <zhangyu550@huawei.com>
> 
> Because the kernel code cannot be started from el1
> according to the booting.rst.
> It is found that CPTR_EL2.FPEN is not configured.
> After the configuration, the problem is solved.
> 
> Signed-off-by: zhangyu <zhangyu550@huawei.com>
> Signed-off-by: zhangxiquan <zhangxiquan@hisilicon.com>
> ---
>  Documentation/arch/arm64/booting.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index dee7b6de864f..ccefc42b51bc 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -309,6 +309,7 @@ Before jumping into the kernel, the following conditions must be met:
>    - If EL2 is present and the kernel is entered at EL1:
> 
>      - CPTR_EL2.TFP (bit 10) must be initialised to 0b0.
> +    - CPTR_EL2.FPEN (bit 21:20) must be initialised to 0b11.

Sorry, but I don't quite understand this. CPTR_EL2 has a different format
depending on HCR_EL2.E2H and the FPEN field only exists when that bit is
set to 1. In that case, however, why would the kernel be entered at EL1?

Will
