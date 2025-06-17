Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE952046B3;
	Tue, 17 Jun 2025 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173276; cv=none; b=dXzSGsd9N0ozI/mml06k1jzQReH9UB8BqTROBXYcbcbNGmkTPYeXyMofPnzAsxp8leSwQllq4by/8RM3MxTnXGbUvS+bm4eehmDpl+svpcc8E4Gesbp5UGgj+GehVFTv5uHP/+hUpeVoCwN21Py9E2NMkhhMFVGzPV4K5cl04Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173276; c=relaxed/simple;
	bh=BoHYyynRbOdi/J7e6GV88AV7YC8tPjdtVyMkr1OvIms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb6FjHoS39GjNQlTlA07kTGHc5DGpFDo4y3npc/sC8fDDM0uJ5kETRAiIPksn+Zczf45HIoKloagEjESTJa5qSR8lq+umqiuu7cKVVttYYl1l9NkYLPB2o1ePmk6Ujf4FdcoJe7J3kh4NzUqK5JVU9QThUATsktLU4+M0YCSyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fognmAZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fognmAZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14DCC4CEE7;
	Tue, 17 Jun 2025 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750173275;
	bh=BoHYyynRbOdi/J7e6GV88AV7YC8tPjdtVyMkr1OvIms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fognmAZRhR8bgC8SdDmtiYNfalUFiVtKYJ8vNzE+N+0rAsrM2BQbj3XvL5zhOkxVt
	 OLpv+RwHfj3xLJw6c6ZC46iQluFhjTzOZK1At5ZCLudvGGtigH9L+ZxYAZSGFLySjp
	 WpJiA15SkQKquRVk1MTw/zVgjotvcMwOD0Pk+hFYqUeYEAVHVT5XWRFDDtGGUrVu5h
	 acNIR5NJl88mWXoFpYDTp5tg5EFEi6WvFqIA1J+7uVOJm0fuRU7YR566hhft8HTG/q
	 uBjAAQta+WfBO28I90Qgc2wO1V0JiTn3lrXsV1BFjaNBPSJCPC4Xk+dt6oJnqYGmFL
	 vKqWvtFeAA3oA==
Date: Tue, 17 Jun 2025 10:14:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev,
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <175017325268.2418026.3599473248491336605.robh@kernel.org>
References: <20250617070144.1149926-1-inochiama@gmail.com>
 <20250617070144.1149926-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617070144.1149926-2-inochiama@gmail.com>


On Tue, 17 Jun 2025 15:01:39 +0800, Inochi Amaoto wrote:
> Add bindings for the reset generator on the SOPHGO CV1800B
> RISC-V SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>



