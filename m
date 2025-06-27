Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4DA20B80B;
	Fri, 27 Jun 2025 20:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055140; cv=none; b=SYH3Arryk4B9MytT9O15tEa5k/04r+PJMsgV+XSno2XMCMnjuXXGvpi3vOBV3e17UeRyfbicIvIxUj8+SlXNdq27PEDOujryrN6+Kt9KSi3NWRroEyN8oWCGRy+VWHSLkG498t/5jN0t4bsV3pumWnUBW/7dp7IFi7TkMakBaP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055140; c=relaxed/simple;
	bh=s0Xged9J2HnvN6x2GXvoVG4DhENWGLcw1Wvk3UDfhk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbN8HWAtbojg8EC6UwJi4Gnb3A6lC2CBUtITnpFnbeYiHqpGPoS16gws+F0FFniAN6bZiSF+cq7XoW3KgUH7b6NJXFtQx2StqTnFL03en71eOm0WPAH1BZI50bLdBSPEr8I1nX35CROx0EgUJUSQqyP9MEsNvBWx4RPEtix7fPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbvaIv84; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbvaIv84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C113C4CEE3;
	Fri, 27 Jun 2025 20:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055140;
	bh=s0Xged9J2HnvN6x2GXvoVG4DhENWGLcw1Wvk3UDfhk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbvaIv84Q8/hxga+QPQuAVOJo1iAVrT3k3tciBHSB01FYbsIbgXMqUtXbZrrFDe7X
	 OnKj4xc8bpec1TE1VMfxS3vlCZrcGxvj7bc4r/NIR12UEp/SiKK/CgY2CumCXTuN7V
	 8ojRypb9bxPPbTwJJTbX8Y0o79DHcv9DNRt7NoAumwz+/uSm65r2kqL93yx6KZuk2k
	 vsuNKV59kFj7IlI25mMmAv0GEed5gou1mK4SZao+NxLP+Ze3pG4lvXbCZD8EujeMN7
	 G7xBF+ar5OYrvQi6rlNIqhmgeLhNuhYmpf3qvkYTWYnf7f0L7XCyGqDRTGHUWiQKp9
	 LaEvc20NP2RCg==
Date: Fri, 27 Jun 2025 15:12:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, kernel@collabora.com, krzk+dt@kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: Add MediaTek TinySYS MHU
 mailbox
Message-ID: <175105513896.4155718.5094277254740319329.robh@kernel.org>
References: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
 <20250623120127.109237-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120127.109237-2-angelogioacchino.delregno@collabora.com>


On Mon, 23 Jun 2025 14:01:26 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek TinySYS MHU mailbox, used for IPC
> with the TinySYS hardware integrated in various MediaTek SoCs.
> 
> This mailbox handles a custom MHU enabling communication through
> the TinySYS SCMI protocol.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6985-tinysys-mhu-mbox.yaml     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

