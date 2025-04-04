Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA11207A1D;
	Fri,  4 Apr 2025 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783028; cv=none; b=dCTg50wnjrQhrwtrUaExoayqqXPkFMMSz3LB/YQmquzED4hJP0rte+RjNG9f8geWAUqmcBkQqkPHQEb0xMBxCRZziYJthkCiSCUlALozsqhyyT/ma3RNkfI6vsDlfMFe2rRpjAi0pVsxw0vNaPB3Z8nB/5/Ud9Db1R882OK+0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783028; c=relaxed/simple;
	bh=jwbHYXZtY5R3dVPRP+meufIuWtuijc/hbV0YXLcVleg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWS5JBG1WD/kV74QcGZn+y69Jum9Z2TlOgY2fNUCuN+Jlre69yFEfWDg9k7AHiwigAq6vTxgwv5VkqemeOdrs8/h5UcPn5vOQ1vgYjbfV0Im2MTebdG7Yx2oC+kYwWdE7Cyk1pRG4v94ULwU0PReZQjK1qCb6NiCmqVsMd9RDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVtwKuFj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVtwKuFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768BDC4CEE8;
	Fri,  4 Apr 2025 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743783027;
	bh=jwbHYXZtY5R3dVPRP+meufIuWtuijc/hbV0YXLcVleg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVtwKuFjJcANfMFV8yxzENFjdkGaNWTRrxrsTn3coAC0ItrSMEu3LmcsUjPbLKLw1
	 9p3/4jMK7MiOuetyKuC2kzqjYaqaTGkPX2TEJ1OU6OQn659/uxczxf0piPCRE51GN9
	 VpozkFSqmxaw1QagHH7WzYB9JrTfvJ9Ruas6BMQrxG+U4HFlsUq5ibrql6fSe/EWFt
	 poit+003exJ3VIMShlYVsy0202TJScWJwRo7Hec6qsjdCnZE+WgsHZq9xuaUFmvI3C
	 24GnxE3yZ1pwrfu39W6xgSs3V8r1SD9SA4TUTJGA7J/dS7mlb6jAeO5YOK+pJ3aaLH
	 6k6Qes6W2LgfQ==
Date: Fri, 4 Apr 2025 11:10:26 -0500
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
	afd@ti.com, s-vadapalli@ti.com, linux-kernel@vger.kernel.org,
	kristo@kernel.org, rogerq@kernel.org, kishon@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add PCIe ctrl property
Message-ID: <20250404161026.GA1524211-robh@kernel.org>
References: <20250402113201.151195-1-j-choudhary@ti.com>
 <20250402113201.151195-2-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402113201.151195-2-j-choudhary@ti.com>

On Wed, Apr 02, 2025 at 05:01:57PM +0530, Jayesh Choudhary wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Add a pattern property for pcie-ctrl which can be part of this controller.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> [j-choudhary@ti.com: Change description and add example]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index 378e9cc5fac2..13b6b6fa5dee 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,11 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^pcie-ctrl@[0-9a-f]+$":
> +    type: object
> +    description:
> +      The node corresponding to PCIe control register.
> +
>  required:
>    - compatible
>    - reg
> @@ -110,5 +115,10 @@ examples:
>              compatible = "ti,am654-chipid";
>              reg = <0x14 0x4>;
>          };
> +
> +        pcie0_ctrl: pcie-ctrl@4070 {
> +            compatible = "ti,j784s4-pcie-ctrl", "syscon";

If the parent is a syscon, then this shouldn't really be a syscon. You 
can just use the parent's regmap.

But I guess that ship has sailed. This is why bindings should be 
complete, so we can review the whole block.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
