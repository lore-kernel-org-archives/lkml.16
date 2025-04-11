Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062A27C17D;
	Fri, 11 Apr 2025 19:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400541; cv=none; b=A/cdrW29/F3qSiuMD43f2pJe51EoBKVYOoa/6itdQsEpIc+k8QsqD6QFJ+23FQDJfRqHLfhKTwSmmIv7+CDz6XIVBnbM17Q20RbysSx9ptiBWRmlRr3lkSxy5FUU1rupFdNVx8CA8S4z4SDKBys+ShcWhBUxlJPKoY/d+hTr5ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400541; c=relaxed/simple;
	bh=GIcyZThvoYXaHxUFa3uu98idbETsxCqqaZINj5bP1Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inRirLMLP/xB/2EeV8xEAzpFVZmfug9ADS5nF2Z3pu1taJ8armu4H4YyFVZsTsiycGkAE7EZ2ndRyIqCqYkcH6wA5T5RJffDsgtYyBPPaw+SEbni80iETPlHhLd+SY679ADt34E/n360aFtKlNz2QiBZTBYzcYbVnYM90nTREtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bx69LwlN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bx69LwlN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFBDC4CEE2;
	Fri, 11 Apr 2025 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744400539;
	bh=GIcyZThvoYXaHxUFa3uu98idbETsxCqqaZINj5bP1Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bx69LwlN4gDJwXWMTiGjpADgGOkfzd6DpRdh3i2THAnBow67TMqLPFbO4HOP5i0He
	 wobzWvKUHEoOAJcNuiK8Sm6MaP7ffQbzasARcRWK13LHUmH0xkEIScK7/9xVuhLbAG
	 pkIrHBOpapVCoLZ+jODtWHwH4Dko1rjr1iU5oPENOw4Lm94uC2pbH7K+7/zheP95SH
	 usTcfyQ2uav6fw3pR3xAXK/i3s3P3llCGBLimEAZEhuAf0skxxbqg4AwnYxdTB4eEK
	 i/vdgOG4Ot0YCr2gL2wH/dg75Vk+KgMU7yyFrpnBY4w/mGtKTnygugNfGPd8cA+zU8
	 sY4ksq2isZECQ==
Date: Fri, 11 Apr 2025 14:42:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org, srk@ti.com, yamonkar@cadence.com,
	sjakhade@cadence.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH] dt-bindings: phy: cadence-torrent: enable
 PHY_TYPE_USXGMII
Message-ID: <174440053779.3778537.10228186490743369615.robh@kernel.org>
References: <20250411055743.623135-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411055743.623135-1-s-vadapalli@ti.com>


On Fri, 11 Apr 2025 11:27:43 +0530, Siddharth Vadapalli wrote:
> The Cadence Torrent SERDES supports USXGMII protocol. Hence, update the
> bindings to allow PHY_TYPE_USXGMII. Since PHY_TYPE_USXGMII has the value
> of "12" while the existing maximum allowed PHY TYPE is "9", switch back to
> using "enum" property in the bindings to account for this discontinuity.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on linux-next tagged next-20250411.
> 
> Regards,
> Siddharth.
> 
>  Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

