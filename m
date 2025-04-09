Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3813A25A352;
	Wed,  9 Apr 2025 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185385; cv=none; b=TBdEOTfnXAuMiTDfDqd9nJRQGVzOsJ/AbVSQMFOMwj/kPgjHWsprFsLT59qKEYj1AAcvymJhymZJIx9RPzpF412DVSspQUE0jNKVAEuf5ojXrOf1kLogsHJ0U7jyEybMdrhTf0qvzpj5MgqKNn3UwdNpM1Ru6AC0VDuM7N73S0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185385; c=relaxed/simple;
	bh=fRl/2fJxhLh5pxmQTXfimVdKHqwMdfvWC15mYy1K/zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkQKJUprnKjgfppOSspi78HwhTtrM/eGut5mOsLTtjfRHK2ssI8qa/X26b9v/STDBhh1vmmfVW8A4eeYYNVuUwYs4utKJSlXAxEX4vRrfSdw0MDLXFwWzoMF3FR1PV2oZMM90JvRYa3G3f0GOesyMZI9+Y66a+INzFkRPjcAslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TM438mU+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TM438mU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E59C4CEE3;
	Wed,  9 Apr 2025 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744185384;
	bh=fRl/2fJxhLh5pxmQTXfimVdKHqwMdfvWC15mYy1K/zA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TM438mU+mHRflGQqwTTahRAHpXKkGwkrdYen5nCjr0gBDC1BbLQoOxi/XLpeEU3uS
	 zcSF7rV4CJoShkNjPIiGrPOsUmn6erPVUPsaI4roWH/E2vKX8n4EHMFXImdkbe8OhM
	 iyk9xnFwFTxxFxOEpySepA39twljtSjOFImZ1OJ57w2+EqGBTs86mrD4TdCGkN2sh8
	 wIiTYliaoUpwuhwBKVvAgXfMmxEsNbsxQ4juItxhJFl5Ei7t8imP9x1aDe+KYtLtBK
	 BumaHD9KrXChC7LHadVfu+4ZiGfm671eesJRp6kU6DxL9/dH394C7dAryY2gcWQoXv
	 zzwL8VTVomCZQ==
Date: Wed, 9 Apr 2025 09:56:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Message-ID: <20250409-ludicrous-blazing-chimpanzee-e5dba5@shite>
References: <20250404214030.401629-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404214030.401629-1-robh@kernel.org>

On Fri, Apr 04, 2025 at 04:40:29PM GMT, Rob Herring (Arm) wrote:
> assigned-clock properties are implicitly allowed in any node with
> 'clocks' and don't have to be specified. The max here also appears to be
> wrong as there's a case with 4 entries.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-vop.yaml  | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

