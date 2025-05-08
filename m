Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376BC8F49;
	Thu,  8 May 2025 04:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677327; cv=none; b=fz61+wu1ZNYGIexR6hjEQCmRJIPQcnC3qYbV/Fe22BfgmxEsqtwD1gSlRLEfEUNmotdCBwoM1NNCMqA+Najni21Ki2q8fvt3bPAQOu6uSkTY7AgziGxWwRYbvF+QjI1+dcgMrOZ1LwmNL2DNbc0X/Fu7anv93y4b5l2W/mLXoFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677327; c=relaxed/simple;
	bh=FRmGQ/gZH9pLnsOjZq5BDtyaGgSGkbsCHLxemvgghzM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KmVkHmfbCy5/tCBesUFhxXtuJmAeia6fhXv160GCBSpy8bgLSlaZIkMfaXENFXkd1j+GIp9XJcpG27UTPsXeD54j7o5z5KS3j3bKg4luPalm3OqWRjxmQuPfCOWemAQPtrTJiWICD7/nyZPPbo77hitH6IzwakmTHSfg4MgBL4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=If4QnV4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="If4QnV4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBFBC4CEE8;
	Thu,  8 May 2025 04:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746677325;
	bh=FRmGQ/gZH9pLnsOjZq5BDtyaGgSGkbsCHLxemvgghzM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=If4QnV4FeG45KM4Dr/E3NwavmHDDTR7mb/K5N7XFS0/yRpg0HNX0MQpIMrnOioxMn
	 Q7cKdnXGBlEP6Bwg0yjYiBablDcTRZGU+ngVWaYglyJbq1x5F2PQY6xd3R7i0C5bxC
	 m9vUaB1PX2T1FED1sJtsKmS+FIZwz2aENe+Ma6uSqk0ku9cPxCsx0B+Fnd53UVzdCC
	 nPxXhiYO+aS6ktaw+y8UkFE6YHEiv8sd4pDD/RMT+p9jH5zVsEqfYJqlkI41w++xo+
	 lTH4wPPhQbHE8ALXUAm2K3YKUv2lwQgvAxLs0h/5wo+4L3HBI59Z2nV9A/1qXRav5T
	 DtCi/5mpYtmmg==
Date: Wed, 07 May 2025 23:08:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
Message-Id: <174667732370.3297648.1645643101424363334.robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: ti: Add binding for AM62L
 SoCs


On Wed, 07 May 2025 22:09:19 -0500, Bryan Brattlof wrote:
> Add the binding for TI's AM62L family of devices.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - separated out devicetree bindings
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507-am62lx-v5-1-4b57ea878e62@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

