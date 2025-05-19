Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D01CF96;
	Mon, 19 May 2025 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636864; cv=none; b=B7bbssRyHTqRNkiFCvUCeGjpZ9t9WrYZkldfDrqNFWPIsYn5jU8Dj6H1pCXe1B1zUMNOpwiFhXQCJd0yQxV+Sd+mMGrxdG0wYAEz+DFIIJ1HHuFHb6+iAAfnkLHXK+wuRM4dIJOnSp+Y+pyz2O9cyNsQfKtWckAGFOcd70VvvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636864; c=relaxed/simple;
	bh=z6PkVA/mqsiOglxY99AquuWRZRZdA3zq9rfQqBwoGgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCanufk8kLNDuJNmq/JnU+2QLHx0hXxUS/piWUSbMBG+5cT4ONbpZsSEvZ5SkfeSLTnHP1cwZGiUyeClFytg9Q0hpTns5Dy3q4PXJ6tT+rdWM0fEefVZnV2bMRJ58wvQ+tm1aGpcEh7bZfzaN3m4oy9urtV5fB6zTBmi1uvI+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63780C4CEE4;
	Mon, 19 May 2025 06:41:03 +0000 (UTC)
Date: Mon, 19 May 2025 08:41:01 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com, 
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 03/17] dt-bindings: display: mediatek: add BLENDER
 yaml for MT8196
Message-ID: <20250519-orthodox-wolf-of-piety-7cecfd@kuoka>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-4-paul-pl.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-4-paul-pl.chen@mediatek.com>

On Thu, May 15, 2025 at 05:34:15PM GMT, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,blender.yaml to support BLENDER for MT8196.
> MediaTek display overlap blender, namely OVL_BLENDER or BLENDER,
> executes the alpha blending function for overlapping layers
> from different sources.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

No blank line between tags, wrong order of tags.

> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>

If you are the author, what does this SoB mean? When was this patch
written, by whom and when was the review given?

Can you start using b4?

You did not provide proper lore links to previous versions and tags are
not correctly added.

Best regards,
Krzysztof

