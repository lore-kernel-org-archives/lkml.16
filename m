Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E72980A3;
	Thu, 15 May 2025 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306112; cv=none; b=FKZ46Kz1RfGjmZifeKTptO/Q8jPyDjAtJ1E38PYbsACt9KJ+rgrD49x4UT0+EZQE/eayGj9Q+HBYUrPCWkVSjEOjp0VJrRibiujumuSUZV7iH76hWb5omjEm7s0n4z7LFqKiTiy0fVhGfLZjrizSNdtd+Ho9NlGI40BFjW/N+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306112; c=relaxed/simple;
	bh=adxalg7H3lV44b62vZBcg+BCmQflj5misd5wybzAhrk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tb2gZ1PSFoIxQU+c0fD98fHVx3E8rhkdlUBVjrru/9pxJ1zyiSU5vkC5AK+VLgIGTLMth8IeETHfGo5FUlj8KG64pwSqBltXrrkbzxK2Zb/PIvx0LcyPgmAnbtfW1OuM/UfV8qK+pxvQj3UBkwPYctwNvxe+OwqqtBoLB+h4zzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7DeagEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7DeagEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2176DC4CEE7;
	Thu, 15 May 2025 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747306112;
	bh=adxalg7H3lV44b62vZBcg+BCmQflj5misd5wybzAhrk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u7DeagEUEiexQGncuTRbIUiVohH0r9Yv/kmqm+EZaKWZsCoK4Cfh43a3y4gqdXWtx
	 lG6aDJSr5GlY/zwP4+xtCu2IF3yYaRcpqqFQ7pEP2YbEMl9tafTCc3Wbg1T3ZetDx+
	 S7Dr07ViBTwbdcoPp3xMI+BYPcipOz9cYhdVQzdlCZycbA4WVjGWgZVPctUru/smxt
	 rsHP4HksXSkcOoNoA5LazlUNOsY+b/bD3A1t5cctBTq/wTVSXxaS4xITr1QLGQBs+v
	 cD7aJmx+dm7h97l6Jlh/aeIifn55CJmfS8E2QMtqOB7wrnd21eRq0VP1ZOklrxxBgr
	 4Vy7hhIETPFYw==
Date: Thu, 15 May 2025 05:48:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: fshao@chromium.org, devicetree@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 xiandong.wang@mediatek.com, krzk+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, nancy.lin@mediatek.com, 
 linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com, 
 singo.chang@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 p.zabel@pengutronix.de, treapking@chromium.org, jason-jh.lin@mediatek.com, 
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, conor+dt@kernel.org, 
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, 
 sunny.shen@mediatek.com
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
Message-Id: <174730611044.164934.18396756831118218280.robh@kernel.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: display: mediatek: add EXDMA
 yaml for MT8196


On Thu, 15 May 2025 17:34:14 +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/mediatek,exdma.example.dtb: dma-controller@32850000 (mediatek,mt8196-exdma): 'mediatek,larb' is a required property
	from schema $id: http://devicetree.org/schemas/dma/mediatek,exdma.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250515093454.1729720-3-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

