Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B52E4275;
	Wed, 25 Jun 2025 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876732; cv=none; b=JPC0eUn1c/Z2T6h707oiDh4KODwdKpttzA6ZbVmNJD5cp6b3gMNes41W6dln70kq7mNUfMU6RKHZQnSbocGhPW6QQ+r0W2uj95swzCAEU1WSc/8N3UtnMU1l1qk5EWaGzRlNr9vT7SQIkmqxEGOiv2bySKYwDBrUhDW7WIFIuic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876732; c=relaxed/simple;
	bh=V4icwH68waoexuc0mmtBEz2gMdcHNXDMILpxUOfQ1O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhE+eZ5MohY/+8yIQ+/XPytFziIVWIha4yyDV3sZdpsJao5dYMPiwUBrjSpZcQc3PGVGZSb+FtADch/YpJziaF7er1Qup11Wq1NkVakV45NRCUy6HsJ/+XZ4hJN0uJDwE+zr+VQwyF8OYjdRY1ZnxFnbowGqXwWlj2g1Jtwo4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6Et6eyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6Et6eyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC205C4CEEE;
	Wed, 25 Jun 2025 18:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876731;
	bh=V4icwH68waoexuc0mmtBEz2gMdcHNXDMILpxUOfQ1O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6Et6eypzNZPnzqhVij1b0Z1l7+8UhfT5ltLp664B5495JFelSrdHNreqHhXgyvK4
	 MX7zuLek+Ls02TdkUNwZhWIeQrxayIKaEDSsmb3OwxWW9jxRY3Fy2LYCJK8QRkg4mX
	 V8Uei6BeKd/PmoKalV7A0TrUmubbeAdmC+shE1QcxVsYxG6IIsqG09jWebwup2eHFf
	 pxFRXqFxW+KyHZWedGETo8hLk3N76tGfVRr2gQcLcOi7nZ78yTHYzXTN7QG2fpdYXD
	 Gn4GIzll2wMegj7jxfUkHhVKT7Ev3jhdkDAjruD+hBITaz+XAHGGfVBODt3FxcBait
	 yMl+s+nwRAfkQ==
Date: Wed, 25 Jun 2025 13:38:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: add missed compatible string for
 arm64 layerscape
Message-ID: <175087673034.1996309.6332672675034782029.robh@kernel.org>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
 <20250602-ls_dma_coherence-v1-1-c67484d6ab64@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-ls_dma_coherence-v1-1-c67484d6ab64@nxp.com>


On Mon, 02 Jun 2025 18:01:01 -0400, Frank Li wrote:
> Add missed compatible string for arm64 layerscape platform. Allow these
> fallback to fsl,ls1028a-dwc3.
> 
> Remove fallback snps,dwc3 because layerscape dwc3 is not full compatible
> with common snps,dwc3 device, a special value gsburstcfg0 need be set when
> dma coherence enabled.
> 
> Allow iommus property.
> 
> Change ref to snps,dwc3-common.yaml to use dwc3 flatten library.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,ls1028a.yaml       | 33 ++++++++++++----------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

