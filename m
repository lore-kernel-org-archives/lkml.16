Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671EE225795;
	Wed, 14 May 2025 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229437; cv=none; b=QVeMZbUTQq/+NujsQdagkaUK393e9uKFomaNRRm2cSzjlwtOHNZlV1Ma5NdeYuhbHnktUAf9XsdtR9CFSVyb7WpzSryn0YaKFbTlv5hCJpGn4RCHOy6d8P+0hUIcS6Y1E/XAGfejlha3TaX6D3MV/TqaTk66XW0B44FYjxkZYDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229437; c=relaxed/simple;
	bh=eeF2dlINhLUUc35rEnAWISp45n0DKiXO832qOlZanjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLg8qCpWEobDXOFnH2TKC3QUG3x6wM5r82b5A0AHHnCUz40kw83MMY4n/NxmYl/bwCsenR9sJ3kvXbfeaw8gjdenVRG8QDZrnLjE/jP0kGgA2SDJ9v9Su3kY3UPVTOBECg0wB0A5ZEXsyIPiUvBNXnWckHFH/uXWtOSfipPs8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmHP9kCZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmHP9kCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C35C4CEE9;
	Wed, 14 May 2025 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747229436;
	bh=eeF2dlINhLUUc35rEnAWISp45n0DKiXO832qOlZanjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmHP9kCZlTWyHux438PqFYSwIpMJlpeUevwx+iyNc826PkjZADKHFYbmt0zM5zohL
	 TVQU7lvn3CN/smKjc6/gsmYTA5si6fxjeaJKbvOSDT4EAz//VkKuskBbQShbyIFHHG
	 sTGgozV2G7zWXnQ4kQHPd+2ZkJRec0GSbwi0N54FtEKk21+r987JiGXDUrH/tmokG0
	 sNF9hW+/0RjUt3BRKllwb82oGdTDIwJmjZqvbGAmRWB25Cz8keop+LvbmISxaB9Fet
	 NkSsQ+cUR9F7r2S2S/FMNPanzMWEX+2WFm0ErL0Pcs8zNJMqaM3HPABphItA3Xd0eT
	 SAPLi9RMtE43g==
Date: Wed, 14 May 2025 08:30:34 -0500
From: Rob Herring <robh@kernel.org>
To: dongxuyang@eswincomputing.com
Cc: p.zabel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com
Subject: Re: [PATCH 1/2] dt-bindings: reset: eswin: Documentation for eic7700
 SoC
Message-ID: <20250514133034.GA1791146-robh@kernel.org>
References: <20250514002945.415-1-dongxuyang@eswincomputing.com>
 <20250514003121.473-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514003121.473-1-dongxuyang@eswincomputing.com>

On Wed, May 14, 2025 at 08:31:21AM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add device tree binding documentation and header file for the ESWIN
> eic7700 reset controller module.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/reset/eswin,eic7700-reset.yaml   |  47 +++
>  .../dt-bindings/reset/eswin,eic7700-reset.h   | 460 ++++++++++++++++++
>  2 files changed, 517 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
>  create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml b/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
> new file mode 100644
> index 000000000000..1a3c6d230efe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/eswin,eic7700-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN EIC7700 SoC reset controller
> +
> +maintainers:
> +  - Yifeng Huang <huangyifeng@eswincomputing.com>
> +  - Xuyang Dong <dongxuyang@eswincomputing.com>
> +
> +description: |
> +  The reset controller registers are part of the syscrg block on
> +  the EIC7700 SoC.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: eswin,eic7700-reset
> +
> +  '#reset-cells':
> +    description: |
> +      Specifies the number of cells needed to encode a reset source.
> +      Cell #1 : module id of the reset consumer
> +      Cell #2 : bit position of the reset in each reset consumer module
> +    const: 2
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/eswin,eic7700-reset.h>
> +
> +    sys_crg: sys-crg@51828000 {
> +        compatible = "syscon", "simple-mfd";
> +        reg = <0x000000 0x51828000 0x000000 0x80000>;
> +        reset: reset-controller {
> +            compatible = "eswin,eic7700-reset";
> +            #reset-cells = <2>;

Same comment here as #clock-cells.

This is one h/w block, so there should be 1 binding for it. Make the 
binding for the sys-crg as complete as possible rather than adding 1 
feature at a time.

Rob
