Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB90F219A70
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826862; cv=none; b=hpcq9waziHVMRwDtk1aH68ZfaZiv3p0m07/bhMR0eE3Y1Spot/wioNxrU8XUGEtB4W+8bmCeZvFcug0slObg1/RLTP8By00XM3At5lDKgeOgwERIGXtCDOm4ns2RzVJnLEC2dy3sn34pXVDcQnHXB18aGzOMYK4oJKYSTIJXOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826862; c=relaxed/simple;
	bh=U4EMxuK/JQeHohBISmbAhjkWsiIwg5JmD7dj1begXQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7FwRgHc3k8Rx0jCwXc7j+op9ACPClEnKsdYonepTl5htEiJyEJK8C3j3GFjWnUbBCdOC+3BJLtfHws9WUCJl1iX7D1XxFxmA0iN6HYvESrk6xL6kRCNp6z7B6fJbSvVB8zbCW/wZB8qmdzGu254AZC7340/d4gpZ2sJcq8L8rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=yxAJ+8cv; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="yxAJ+8cv"
Date: Wed, 16 Apr 2025 14:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744826847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw7kA2q6zYR7yJYZmDFH2xX3JGW5ovJzPDT2W9t7uiw=;
	b=yxAJ+8cvmevoryFERuQEeI9/0J70C//Cc3pfmwRnpOR1OHTh5yuWhPGCLuWa5V0IIgtPnM
	mvS87vabxR+KGNJQx3cNmk6jtZY/BwpzAUPtoVGJs3J0VzNhJi3xtIEc6tyj8w43l1bvrV
	EJPRHac3a6NueGjFsaFcY5qVVWWp18yixrmJ+Z99ywleuE9qbm7+RHO3J4qxznkVDjB+dm
	sm9NxQ0noZJ/2gBLEmbHcktJqrWByVsZsR4YSdomV8J/VORMrfv1T+BAkk5lMRrn0GTl4O
	Yeq//7xW1lpll0dj3G/k5SIfluHcKhXyeWSQVjOPyCoq28WlmZp+Lg4jTZRQYA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sven Peter <sven@svenpeter.dev>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: touchbar: Mark ps_dispdfr_be as
 always-on
Message-ID: <Z__x2hboc3RQC6Je@blossom>
References: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks for debugging this

Le Wed , Apr 16, 2025 at 08:06:18PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> The driver depends on boot loader initialized state which resets when the
> ps_dispdfr_be power-domain is powered off. This happens on suspend or
> when the driver is missing during boot.
> Mark the domain as always on until the driver can handle this.
> 
> Fixes: 7275e795e520 ("arm64: dts: apple: Add touchbar screen nodes")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 10 ++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index 2dfe7b895b2bc0a913e73141e558fa5124a13b2e..e2d9439397f71a93c28b75a7eea589f4bcb3e374 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -77,6 +77,16 @@ touchbar0: touchbar@0 {
>  	};
>  };
>  
> +/*
> + * The driver depends on boot loader initialized state which resets when this
> + * power-domain is powered off. This happens on suspend or when the driver is
> + * missing during boot. Mark the domain as always on until the driver can
> + * handle this.
> + */
> +&ps_dispdfr_be {
> +	apple,always-on;
> +};
> +
>  &display_dfr {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
> index 3d73f9ee2f46a35a3b23da5b233ef316c7372ef7..be86d34c6696cb47d31696541266e504cee8ce10 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
> @@ -40,6 +40,16 @@ led-0 {
>  	};
>  };
>  
> +/*
> + * The driver depends on boot loader initialized state which resets when this
> + * power-domain is powered off. This happens on suspend or when the driver is
> + * missing during boot. Mark the domain as always on until the driver can
> + * handle this.
> + */
> +&ps_dispdfr_be {
> +	apple,always-on;
> +};
> +
>  &display_dfr {
>  	status = "okay";
>  };
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250416-arm64_dts_apple_touchbar-658cd974de97
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
