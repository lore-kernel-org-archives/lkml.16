Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC1158520
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615346; cv=none; b=t93AHeptKc+2JZGgEbsMuTOU58BG9U6EbkVfmdEAB18r0wDWv24OiLc+xKAL2tY1zNFDLt0J5QQjrJsSOTvhWLUEozwoSPP57oCYrErj+yXnPl7e/E8oi9G5ePT8xWbKc897AiDFDs6FN9RVH/LaO1vrsd1IVVFb1OJgwMem6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615346; c=relaxed/simple;
	bh=/+Bgz7RXhhd61pmsncDPp/Jo+P+pNl6pY/g0qsehk2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUJ/ao76lbi//Rx5bSQ4UZeuB/ke8Hdcj3Tl8hKFbfmc4zs5OVII5dB3qA0s7I2KfXPp4ATdgmp94+BreOBeL+Qy9nbpvcaIbpQEMgy/ZJo97D+nSoUs4krVsTi3bvG215kEn46/q8Hy4BL5vpp46JZf9ZhRkP7EcKShmNmkQi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PR5uqA32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PR5uqA32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D50C4CEE2;
	Mon, 14 Apr 2025 07:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615345;
	bh=/+Bgz7RXhhd61pmsncDPp/Jo+P+pNl6pY/g0qsehk2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PR5uqA32ykuoROTA/j8MX36jtR89tkb175JrngFacYhViaMqBP0UpCaHqUNHACa+p
	 0yj56QZMwmKf2TFavtxrrZHmO9OknEZiDOR0KMuMrJSgVcuP1pS4Tkivarss1XkUL3
	 KiJtcF/65DzqOF0O83qn0S337u90nqlSZ+lKYlPmfJduDducDesigcqcsi7tVQFOYm
	 KHI02fhDA/wbf+mCUsW59YLxlLVbJXsXZFZHRPgGpHSspBHG1VUShF5juWkNCju7wV
	 k3P75wYEd/iH4jAV12Upm2Z7O0gR07w03oZIrSIHSmS3jVYGPp7q4ZHzezAXG210xm
	 AIAZweQnR75UA==
Date: Mon, 14 Apr 2025 09:22:21 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Pi Xiange <xiange.pi@intel.com>
Cc: x86@kernel.org, tony.luck@intel.com, peterz@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/cpu: Add CPU model number for Bartlett Lake
Message-ID: <Z_y3rRB9zY0HG2vP@gmail.com>
References: <20250414032839.5368-1-xiange.pi@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414032839.5368-1-xiange.pi@intel.com>


* Pi Xiange <xiange.pi@intel.com> wrote:

> Bartlett Lake has a P-core only product with Raptor Cove.
> 
> Signed-off-by: Pi Xiange <xiange.pi@intel.com>
> ---
>  arch/x86/include/asm/intel-family.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
> index 3a97a7eefb51..405bde66032a 100644
> --- a/arch/x86/include/asm/intel-family.h
> +++ b/arch/x86/include/asm/intel-family.h
> @@ -126,6 +126,8 @@
>  #define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD) /* Redwood Cove */
>  #define INTEL_GRANITERAPIDS_D		IFM(6, 0xAE)

BTW., does 0xAE have a model name too?

Thanks,

	Ingo
