Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C81E9916;
	Mon, 21 Apr 2025 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271224; cv=none; b=LMz/Ul64kxQRexSpheNMA5BjQ4DjmHIDv+in4C2IECLp3rBnzWaZGPgZlN83m1T/z/sWnOSBjsvEGC0wkpozKcqbHPosBqYYZtV8wBDNm52F/DZPOEkvMaVW713fhRh+C8OWDApbuh/qz2kFIWYZzOmOpf1Gpt2wJRwnBNdeN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271224; c=relaxed/simple;
	bh=eWQGFVOb67pwuM4hIzwD8j+qtic7xt7xLG1iErnbV80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRzomoUQo1ywx0ePp+N5LUzzNCNUUthJdWtjXoNA2VzvmfbkUZUbE7CiFBWFHVo89GHZekbsbTY6pjW1GSaCVPgtG3YPMI1U8BOXzWza+mcRdWaLR+VxD8e5v+r5FMK490GeT7+Z8xvAbGPGMCqLVpx4NzxBGMp/Jpc7XrUUEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCAjD2yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCAjD2yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763DCC4CEE4;
	Mon, 21 Apr 2025 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271222;
	bh=eWQGFVOb67pwuM4hIzwD8j+qtic7xt7xLG1iErnbV80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCAjD2ygtiAME3dvLC9OERSMi0Jt62PUQw+UiYuJddJJm6p+wa4wPNvpuRw27UNoO
	 Z8fZ9QIXyDDiPidkqjeojtNyWk4/9+KjqCyhv/aHdrQ2jK6rxU36sw4bBi/pktY+aC
	 bhnC/nG5sVxPjb2es8OJ8f4RHx/4aAGx0VrTnni9XL5AtXKuCOsMlH7DyRMu9jP1ik
	 K9YjZV6qTqXH5Bd2qDyAVObzFiDY73aid1Zy5LxMqHMKcosGoRAehEYLmKkt9gH8Tj
	 87Gf818rys1vlW2TimPTSq7NDn2KmRXsFPQFzR6/SpmXbq2o1u1PQ+G6Y0+TWNR4fx
	 pV6fyLI7mADAA==
Date: Mon, 21 Apr 2025 16:33:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, mandyjh.liu@mediatek.com, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, krzk+dt@kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support
 for MT6893
Message-ID: <174527122027.2966032.17419699387190944980.robh@kernel.org>
References: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>


On Wed, 16 Apr 2025 14:02:25 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

