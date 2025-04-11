Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEBC2144AC;
	Fri, 11 Apr 2025 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391646; cv=none; b=PwVcnHdj97Trl52i8WpTsCoMpKCTbI31dIlYYq7dNQmGJyyreFA0CHrN0HasmfpIErvsHtXDnEbb9Nh9udULfeHxjOOY0QOK5VzobvrugefIGBdzIF0BhrkIt+ckVREBGVXhJ/5lLnJb5IJ/dpsgqnk1bnfDSg0MvQ1+8NnSzm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391646; c=relaxed/simple;
	bh=TwKuXdMXLl/pcvwBG5W5wTvzlmepWvCzKcCB3n05zX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9ElMgqVWhiLivbHYDP+1RJc8C/io2hNxszyN0RC6bqc0+gEmxZNkiQbS6HdzO+g78Bls7MwYJFH+gpfF7HgFkz2ggzORNbFRueZB21+BeaPSvEfsGjur3fUkfunclkc0E8MtJ19OZJOQRXMJzp9Uiz0Fwxysp3FSUoPaTtWQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGYqkKGC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGYqkKGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC68C4CEE2;
	Fri, 11 Apr 2025 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744391645;
	bh=TwKuXdMXLl/pcvwBG5W5wTvzlmepWvCzKcCB3n05zX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGYqkKGCbJ9ohQnk8mkJHJNxkFVNkied7WhI0SRTv4hBg7+qSPVcAAlWHyNMgrV87
	 VmL34ctKmXMnZTYufwWTExCZIAE7qbpKKdU6zvPmtHwN5t84rJWp1F2JsjBzaOgVuH
	 2aaY+DWS3DjA87uNlreDrMUf3jyFuC7givpuU/YC4L5ty8bU/b4c734plwyNf3gw/6
	 r+Exwenlo/5SEjWXAsuHZmWuMmPqIcIssY+HOZrMUvE+MVXo/quSKyh3J4Pepkhxc7
	 gWNcpRBvr0ngTT2o7cbdMxInl1dZj6XrrsXbKqaidTw1T5tRfNacrly0Ue6o2iJF5M
	 uzTDw4bAIAGAg==
Date: Fri, 11 Apr 2025 12:14:04 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio
 DSP
Message-ID: <20250411171404.GA3431723-robh@kernel.org>
References: <20250410094212.1155529-1-rf@opensource.cirrus.com>
 <20250410094212.1155529-2-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410094212.1155529-2-rf@opensource.cirrus.com>

On Thu, Apr 10, 2025 at 10:42:11AM +0100, Richard Fitzgerald wrote:
> The CS48L32 is an Audio DSP with microphone inputs and SPI
> control interface. It has a programmable DSP and a variety of
> power-efficient fixed-function audio processors, with configurable
> digital mixing and routing.
> 
> Most properties are core properties: supply regulators, gpios, clocks,
> interrupt parent and SPI interface. The custom properties define
> the configuration of the microphone inputs to match what is physically
> attached to them.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> No changes since V1.
> ---
>  .../bindings/sound/cirrus,cs48l32.yaml        | 196 ++++++++++++++++++
>  MAINTAINERS                                   |   3 +
>  include/dt-bindings/sound/cs48l32.h           |  20 ++
>  3 files changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>  create mode 100644 include/dt-bindings/sound/cs48l32.h
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
> new file mode 100644
> index 000000000000..1d58d12291d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cirrus,cs48l32.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS48L32 audio DSP.
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +
> +description: |
> +  The CS48L32 is a high-performance low-power audio DSP for smartphones and
> +  other portable audio devices. The CS48L32 combines a programmable Halo Core
> +  DSP with a variety of power-efficient fixed-function audio processors.
> +
> +  See also the binding headers:
> +
> +    include/dt-bindings/sound/cs48l32.yaml
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs48l32
> +
> +  reg:
> +    description: SPI chip-select number.
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 25000000
> +
> +  vdd-a-supply:
> +    description: Regulator supplying VDD_A
> +
> +  vdd-d-supply:
> +    description: Regulator supplying VDD_D
> +
> +  vdd-io-supply:
> +    description: Regulator supplying VDD_IO
> +
> +  vdd-cp-supply:
> +    description: Regulator supplying VDD_CP
> +
> +  reset-gpios:
> +    description:
> +      One entry specifying the GPIO controlling /RESET.  As defined in
> +      bindings/gpio.txt.  Although optional, it is strongly recommended
> +      to use a hardware reset.

Drop 'As defined in bindings/gpio.txt'. We don't need more references to 
old docs.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob
