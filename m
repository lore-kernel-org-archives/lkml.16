Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81D1E990B;
	Fri, 11 Apr 2025 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392472; cv=none; b=kbZiYWHT2C+A9OVPqmHDbvKpol1+3UTshqLjKj+yOFx6XohQGYaZeNZUa3yMuBRGwEAagceRa1Mjl8ZWETLbQdDZc74snYjjej8TNl/n9QO3bNyq7swjbf11XTZgt3vW8Gk3wB0pZOd4X2iix1ZOzLFGzBFkb6KSOame7bXAZYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392472; c=relaxed/simple;
	bh=Rq89H9SMiq2yg4sKJ/QwztGczTxjXMGmssMWq0QWhQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDQVCodsSvG4Mpyiy0fdLYHS15h7cJPs5n5ZqERjMHm4TAMoANMUckD7xHvORSjaqDKzT/C3kLOs/aXyuZPqqWJZ3GfN8SW/qceSbQwR9zi6KgQGmfRGB36MO/am4Hw0G5HsfBrpcJg3BhB+8aPFPvwXwfg+CEhYRKrhbB6aciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isg9oMAI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isg9oMAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49A3C4CEE2;
	Fri, 11 Apr 2025 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392471;
	bh=Rq89H9SMiq2yg4sKJ/QwztGczTxjXMGmssMWq0QWhQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isg9oMAIBFyxJZXnUR35Se1wo0788KwdF9b4xMOT+gOQVVgN2lN6lF/VBNdpJi0cW
	 OZRIfqVt2GELLslVNehFX2xaNdMGBTRPXz4AG72WEBeE757NwMuyZqhDpT+6iisp8B
	 QCXbNYlEBf1H7PAUkJ2I/6t7FMnDTkg+Jr+dFN/wz9HWXuuZ2UPFAUWoPOQ4WQAHre
	 kS8j/KK6cJTORxHqon7nHkU4bTNr1083efcqXMdD3aR6XgnSEUl6fwWhc1l31FV1zS
	 yFjDmlMpHmg8SYlSO6RbF0K+mUxfTebRHqzb0dDyD6pKvxOtvM6BedXFUlYCg+6zDN
	 BWzeBInOjwUOA==
Date: Fri, 11 Apr 2025 12:27:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, kernel@collabora.com, henryc.chen@mediatek.com,
	broonie@kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: mediatek: dvfsrc: Add support
 for MT6893
Message-ID: <174439246900.3585473.9168983781812319449.robh@kernel.org>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
 <20250410144019.475930-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144019.475930-2-angelogioacchino.delregno@collabora.com>


On Thu, 10 Apr 2025 16:40:15 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
> DVFSRC hardware, introducing capability to communicate with it.
> 
> Even though this SoC uses the same basic version of the DVFSRC
> IP as MT8195, the vcore-vdram parameters are different, hence
> no fallback compatibility is possible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

