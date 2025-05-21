Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E22256C9F;
	Wed, 21 May 2025 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827086; cv=none; b=I3ncdwX7awtAhH2GafzKiYBAAj64gV7fyKQ6/RJ2sm6FUp5HZHiJAUPmZJq7fIG2PD5clu5B818lqbITY/5aGdEyIOB0zFf5hJBZ4ZS41U7GNftXGEiThFla+8fy37io7BYaRA70kW0x2zXLsmbZwh10cSevg/z4ITUUZX4dciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827086; c=relaxed/simple;
	bh=SZaZHLqvu+Jd8/fIMdk0kc05kafs/Xkgnw6JWo0Pn3Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lbWyAb5WWCfiIcBA0w5xPVAA6UAu+k7INAA8qJ8sYdSlgIMU/nUMJVBOx5KuvpWwyrP542B1ylCq35ULlKvw6Sp7ceWlxoLon8B6evedDrWpVPHM+UGJTv4PmEQybEk/E7TMmDA3609+BYb6uyB45c6q4eKHDtmbSi9Yykn56ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2a4aoC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2a4aoC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC483C4CEEA;
	Wed, 21 May 2025 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747827085;
	bh=SZaZHLqvu+Jd8/fIMdk0kc05kafs/Xkgnw6JWo0Pn3Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=q2a4aoC0w7PtDOnBQWFc8dwbMY//udUxPsHh+GKU381TNAidlDUdjYmG5qgsBL+Xs
	 V8ThKvXa4YpkfKHSmP9mge9aYddkdLkLZ+92YKJPPH+/RZrhvhsd7isvMT3bxZ1Dw+
	 FrOnJGwEjWRD+gNNdR3T5Y3fntXPiC2SP3zfzkIe3G0L8qKkQoDWs8BPyJgiM4x+3u
	 Djt64GAWAX1SKoM2a+cvh0L6YyPunjUI6L9gpwUx9PLifOSpUtlpFvgHXeo4b6gR+p
	 bjgb9FhtP1jig3V+gwTML9j3Rg3HHWWKrXEnrn5FVWNYV7tedxLm9w0DFJKGL3zjx1
	 GxsB+G3me0Rfw==
Date: Wed, 21 May 2025 06:31:23 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, amadeuszx.slawinski@linux.intel.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, krzk@kernel.org, 
 broonie@kernel.org, linux-sound@vger.kernel.org, tiwai@suse.com
To: Zhang Yi <zhangyi@everest-semi.com>
In-Reply-To: <20250521104247.6595-2-zhangyi@everest-semi.com>
References: <20250521104247.6595-1-zhangyi@everest-semi.com>
 <20250521104247.6595-2-zhangyi@everest-semi.com>
Message-Id: <174782708395.3055821.16941579445110236970.robh@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add Everest ES8375 audio CODEC


On Wed, 21 May 2025 18:42:46 +0800, Zhang Yi wrote:
> Add device tree binding documentation for Everest ES8375
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  .../bindings/sound/everest,es8375.yaml        | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/everest,es8375.example.dts:21.28-27.13: Warning (i2c_bus_reg): /example-0/i2c/codec@10: I2C bus unit address format error, expected "18"

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250521104247.6595-2-zhangyi@everest-semi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

