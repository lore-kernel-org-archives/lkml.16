Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9C148304;
	Sun,  9 Feb 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739108826; cv=none; b=p1pmIXYGzO0GlY7696BLSuNnxxvIdpjcj3LqoFSvu1rX8JPn8r7dLH1Lma2iLqibBMR4nwJkBYcTxBQ+8du2YtBJzqVXPBEyhWVCqguSvfzgusTHfQ5q5rfF63MDqC6byxZQSdoT7+IWSzzSxft/jVTLH5aeCebjsf6x4ZuY0yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739108826; c=relaxed/simple;
	bh=YAOg0EYBmWCl31FnuIYnGx7DNoEiibyFD2rcUuGt5Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7DfRSTj5tYqUtqb7X7xNzO+BNJFoZndTdxz2pGvktGE0QV9GAeqr18Xw4VBD/shOt6XYpil1roW6ppRmXc9K3Dl/bSooeuPxvwA2A/cRksef1C4uPB5XWc1CQPw+66Md8fFx0AaFLhqOVJJiJ1HIgU8tVlXYLnJ8S0j6pNjp+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BC6BA3430A3;
	Sun, 09 Feb 2025 13:47:03 +0000 (UTC)
Date: Sun, 9 Feb 2025 13:46:52 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/4] reset: simple: add support for Sophgo CV1800B
Message-ID: <20250209134652-GYA11750@gentoo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209122936.2338821-3-inochiama@gmail.com>

Hi

On 20:29 Sun 09 Feb     , Inochi Amaoto wrote:
> Reuse reset-simple driver for the Sophgo CV1800B reset generator.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/reset/reset-simple.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 276067839830..79e94ecfe4f5 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>  	{ .compatible = "snps,dw-high-reset" },
>  	{ .compatible = "snps,dw-low-reset",
>  		.data = &reset_simple_active_low },
> +	{ .compatible = "sophgo,cv1800b-reset",
> +		.data = &reset_simple_active_low },
I think this isn't really a problem, but..

quite a lot SoCs use the "simple active low" IP,
can we introduce a generic compatible? so can set as fallback..
intead of growing this compatible data each time for new SoC

>  	{ .compatible = "sophgo,sg2042-reset",
>  		.data = &reset_simple_active_low },
>  	{ /* sentinel */ },
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
