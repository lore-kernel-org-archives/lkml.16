Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA120C009
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115176; cv=none; b=F5oyfmbHI2rGi/MOcYDNvX3V/er2Y/efhjyaBWVAwQzFbpAGnnGT5OhCtF1jw8/U9dxQif0d99p02kWv8NGB7EQiYEi28lT7m85u7JPUhrhVbzqI0EQg8cGRWgsClE3eygdS9E8BQ7UI3M6TXWSdcmI/Xj3k1EXq5iA64Z3ereI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115176; c=relaxed/simple;
	bh=HZSRVVBvflRgEm7LLPG39xeX0J21l9UgDp4LOyxD5xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdUU4jtCOGQdMVyEf6B7IharXQTrCs6ptYfqq1cb+mt5o2JJ/QG/WNWhhf+jVZURBtAuT3UqgbzaN7R+YftQY6iCn/ZuEco5WMzAJsB2cv3D/1Y/YcIluIIOMUc8M8svuBQCd6YjvmOmBLaUzssflCbvpnwDy4dOXMVOW8i6u98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QqZ+oOBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QqZ+oOBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9392DC4CEED;
	Thu,  1 May 2025 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746115175;
	bh=HZSRVVBvflRgEm7LLPG39xeX0J21l9UgDp4LOyxD5xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqZ+oOBuoOUzFY1FYJlpCm1Zg97GlAeb+vWz26JVO1SvCq9Scnu5HgsY1dGbUL6Nk
	 S1oF4rC6OKzfTFOfgEDXg+Ib6mqAnpIKRfZA5AWth2pi0hef2CuvUm24DRvyLMTbmp
	 /2+tL26GAsyJqKD5/t7VFKkwH8eYHIXWi6+dlbok=
Date: Thu, 1 May 2025 17:59:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] cdx: MAINTAINERS: Explicitly mention Greg who
 handles patches
Message-ID: <2025050158-tingly-doubling-9795@gregkh>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
 <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-cdx-clean-v2-6-7dbfda9364a9@linaro.org>

On Wed, Apr 30, 2025 at 08:41:34PM +0200, Krzysztof Kozlowski wrote:
> Patches for CDX bus drivers are applied by Greg Kroah-Hartman, so list
> him in the maintainers entry because otherwise contributors would be
> surprised their patches got lost.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..505d7d45ad7d1c007e89a555264ff8cbeaf6e1f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1008,6 +1008,7 @@ F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
>  F:	drivers/w1/masters/amd_axi_w1.c
>  
>  AMD CDX BUS DRIVER
> +M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sorry, but no, I'm not the maintainer of this driver.  It's up to the
maintainer(s) of it to send me the patches on to be merged, it is not up
to me to maintain the code at all.

thanks,

greg k-h
