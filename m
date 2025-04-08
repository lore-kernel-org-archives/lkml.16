Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1D226170;
	Tue,  8 Apr 2025 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093752; cv=none; b=euUvXUVvxLQvFHeTOb93TfA8sQWU73hRS84RqyP0dgO5c/xFbUp3l9rnVbbsoRuXnkov1viGCGhyI+jicnmO/vx+6pFM90OkKVzMJivVUqpq03uj30b0y0LYDkT43+menG/jxfzyxC4ho8XY9tegQfqL0D07CIMRwxltjkHQ13E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093752; c=relaxed/simple;
	bh=OLLi5Lp4foT1nQeIS5bBtPzSI/fuO0b+C8fsID1r/r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jo+3BkLoQhr6wu1wSO5CWZ53zhYCvhR/UM557WEjqj0WeXL9lkxxfKycpv0qQ19hXI7rENHZa9PHbludJhPQhVZxx48rbWO02GslS1D2OD4chC16T71soeRFTElNcxgAMeInFQs46xAF8fLeXz/gm47bDUZb/ofr6XqsbmA+8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNoUfRHm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNoUfRHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAA2C4CEE5;
	Tue,  8 Apr 2025 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093751;
	bh=OLLi5Lp4foT1nQeIS5bBtPzSI/fuO0b+C8fsID1r/r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNoUfRHmZvqb+BW/YiOmrlVpV5cMcIBLwSFiRZ2Ap6B2KrOsu7JS/Oj2iuTyqE2Vx
	 t3MEOT4Sy9p+1hyiUDlyzxSOOa2x8gxHyoKa2TjRoPJsXeZzuc1TBEgtu5357uq2pY
	 ZZtP2q611R24psKpzeSk+83NDso78CtRAgY6vdvs8P2Yv3H1eUTWHIJj2aSzVPFZvg
	 UK7NdiLPWWX5vFhNpbpqC28s8Gp1xclSmLDFC/4RE+5ClP7GOQ5QNwvhsxLmrW/7+o
	 yHnPx4eFD3it9x2XCJlw3k6M0+lYD6Wo8r3NWNSe5jy4e+egUJaw6nL0h+l4yyp3Gg
	 8KPRSeGTcD9pA==
Date: Tue, 8 Apr 2025 08:29:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use
 devm_pm_runtime_enable
Message-ID: <20250408-woodoo-quick-worm-bf82b4@shite>
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-4-friday.yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408033206.12176-4-friday.yang@mediatek.com>

On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
> Replace pm_runtime_enable with the devres-enabled version which
> can trigger pm_runtime_disable.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index f25d46d2ef33..daef6d350419 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_link_remove;
> 
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto err_link_remove;
> +
>  	platform_set_drvdata(pdev, larb);
>  	ret = component_add(dev, &mtk_smi_larb_component_ops);
>  	if (ret)
> -		goto err_pm_disable;
> +		goto err_link_remove;
> 
>  	return 0;
> 
> -err_pm_disable:
> -	pm_runtime_disable(dev);

You now broke/changed the order of cleanup without any explanation.

Best regards,
Krzysztof

