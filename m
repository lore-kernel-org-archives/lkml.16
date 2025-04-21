Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D91519B8;
	Mon, 21 Apr 2025 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260327; cv=none; b=ThwdGNxY4r7BUnGHBo55hcFxbykx9a1rZ/pzmaFkz/lS3yS7XCUIUZOfkwEwPrMsCjsGsn6ONQB/zdnCfROBX5k6M5G6d6jIF2g8gaHIp+HCvD1dRWdOFbzJovikanNO5tO1/ZnHLB5V0K8eZzchPvM6DI4SkhfGrE+EC27T2G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260327; c=relaxed/simple;
	bh=MSwfIUdh67VlXODh5jeQ8Hf4YamBkvYNgv34xQPDdNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzQQP0c/W9vP9DNWk9IkOCD/WKFCeD6gMAdSFNTi60DhIaUqev2WdD8TpNQSH/bh6f/otyQU5/DOn5ojpHmbQ8v6hV99R8ki1d79MJLqZoTsTcZexGZOOMWW+T06+P7d9zZgx7ru+fZgePitMRXGRAoirwCr0dudx2vlMhkbjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0CUXXPy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0CUXXPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE48DC4CEE4;
	Mon, 21 Apr 2025 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745260327;
	bh=MSwfIUdh67VlXODh5jeQ8Hf4YamBkvYNgv34xQPDdNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0CUXXPyvat9Ny6XB4ukzq55rF6L5X4/PFZ7mwObD0qSZ/zz+kaYmGTc/m2KolGkq
	 16qMxvhdx0QFz06hPAeSvaV7sPOAT2zO4I0pNy930pJD9fpZoAynHJ4XJo/yemwsl+
	 sjwLwKFfl0djDMStpwoq9Ln6MAnoWBian2lM+EOYhLOQcpv/PEAeX2LmuTGB9w6cqx
	 wWzUfRkaF5yTPap0FcGq6pkdHA7TWriPFSbeZvZ0r4oRbNDvo5cp8Gw2gLpzTueThq
	 2WjdeS7n7UkxkgqXtoM8UPFBIbZsqasfjXmJ7eCMHNuoj8iGLPvJ0NN6RAYzy/e3RZ
	 8RbvWqUi8vk1g==
Date: Mon, 21 Apr 2025 13:32:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	linux-mtd@lists.infradead.org, andersson@kernel.org,
	miquel.raynal@bootlin.com, agross@kernel.org, richard@nod.at,
	vigneshr@ti.com, vkoul@kernel.org, konradybcio@kernel.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: dma: qcom,bam: Document dma-coherent
 property
Message-ID: <174526032446.2585027.3719839146163780221.robh@kernel.org>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-3-quic_kaushalk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072756.20046-3-quic_kaushalk@quicinc.com>


On Tue, 15 Apr 2025 12:57:53 +0530, Kaushal Kumar wrote:
> Qualcomm BAM DMA controller has DMA-coherent support so define it in the
> properties section.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

