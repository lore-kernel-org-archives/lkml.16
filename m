Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D47227466E;
	Wed, 14 May 2025 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222854; cv=none; b=W/NxifjHOimi98QlptoPt7Fq8VoLr1JfOUU0as92yM8GaQ1X81cSe6TYetC6oJSl/FgQpCwzYlDHHUpymQF1lhdFky63WUs2gP0z/QKFvodZqy3o+5glnV0Io/AAeG5UMIi6a5yJ3q19b+rOtL61e1/oowo/Ll9tn7bRWvRuj/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222854; c=relaxed/simple;
	bh=sE0GFxZMV1Hf/jRwbssg2bdt4DiQDdnmbR6XBO6d1GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XENksiez8D3KrPlH0vpTnDDtkd7i4UQAZT8M9HRuXNGOBOsRTdC2TWLD3ysn+ks7iEHZovFZekg6T3WHoy/rsrR+VKpKuc/l62IJGYVHU4PQ8lfA3X+2VdcCBPyVD8JaN49teRvQd9nNSgR9JRMLgCGTqbD53G8qph7d+RHB9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t75Iw/6+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t75Iw/6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03842C4CEF4;
	Wed, 14 May 2025 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222854;
	bh=sE0GFxZMV1Hf/jRwbssg2bdt4DiQDdnmbR6XBO6d1GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t75Iw/6+/d6lo/hEt9zqT09b/OjRto8QBChE+6BaLTt84vYGH0aknBv8J5iZsSLFp
	 DXxnqTHEwhnfWsmX0dFwZ9747t2ClZkuymVbKLqiC//kTKM+T+p6iD3mepSo20r6Xg
	 bj9rCEIgUEUlw2KmlBCEu96/tyTOS++pAtjV6czMLwKiMUG/dCw1mvccu+0sGoM/9W
	 2mDx1eJrsSIcuTaw6Oqyxb4Ead5SqGwZcnhP8zuDjjw/iaoVHFM6OFa6jKFThm7u/t
	 F695YwZvSqnp3Wwk2AXRdXRllVb8uPzaZMOT6Ba170nUV1IB3vBxaQTpGuL6zZ9fKg
	 91/oKowHOz1bg==
Date: Wed, 14 May 2025 12:40:51 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com
Subject: Re: [PATCH] soundwire: update Intel BPT message length limitation
Message-ID: <aCSBQ3HbLsGSoela@vaman>
References: <20250429122337.142551-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429122337.142551-1-yung-chuan.liao@linux.intel.com>

On 29-04-25, 20:23, Bard Liao wrote:
> The limitation of "must be multiples of 32 bytes" does not fit the
> requirement of current Intel platforms. Update it to meet the
> requirement.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  Documentation/driver-api/soundwire/bra.rst | 2 +-
>  drivers/soundwire/intel_ace2x.c            | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/driver-api/soundwire/bra.rst b/Documentation/driver-api/soundwire/bra.rst
> index 8500253fa3e8..c08ab2591496 100644
> --- a/Documentation/driver-api/soundwire/bra.rst
> +++ b/Documentation/driver-api/soundwire/bra.rst
> @@ -333,4 +333,4 @@ FIFO sizes to avoid xruns.
>  
>  Alignment requirements are currently not enforced at the core level
>  but at the platform-level, e.g. for Intel the data sizes must be
> -multiples of 32 bytes.
> +equal to or larger than 16 bytes.
> diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
> index 5b31e1f69591..f899c966cfaf 100644
> --- a/drivers/soundwire/intel_ace2x.c
> +++ b/drivers/soundwire/intel_ace2x.c
> @@ -245,7 +245,7 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
>  	cdns->bus.bpt_stream = NULL;
>  }
>  
> -#define INTEL_BPT_MSG_BYTE_ALIGNMENT 32
> +#define INTEL_BPT_MSG_BYTE_MIN 16
>  
>  static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw, struct sdw_slave *slave,
>  				      struct sdw_bpt_msg *msg)
> @@ -253,9 +253,9 @@ static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw, struct sdw_slave *s
>  	struct sdw_cdns *cdns = &sdw->cdns;
>  	int ret;
>  
> -	if (msg->len % INTEL_BPT_MSG_BYTE_ALIGNMENT) {
> -		dev_err(cdns->dev, "BPT message length %d is not a multiple of %d bytes\n",
> -			msg->len, INTEL_BPT_MSG_BYTE_ALIGNMENT);
> +	if (msg->len < INTEL_BPT_MSG_BYTE_MIN) {

Reducing is fine, but we should still check it is aligned..?

> +		dev_err(cdns->dev, "BPT message length %d is less than the minimum bytes %d\n",
> +			msg->len, INTEL_BPT_MSG_BYTE_MIN);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.43.0

-- 
~Vinod
