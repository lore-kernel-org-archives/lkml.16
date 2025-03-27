Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF42E18A6DB;
	Thu, 27 Mar 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101686; cv=none; b=I5YSg1431z0wj+FMosxzndtlEwJUMX09+4TnEsTLNDcAeUON5bT5nDpAAmBSuv2kPUAiwYHDhEzNUZf5ehThjUA1+RRkzvrh73n2MnCYiHAwDuG6uBM/6wj8zTpClUXDyoeOG9sOnGAZH068YJ3SZgvg2MAbE/DymvHq6ocnFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101686; c=relaxed/simple;
	bh=uabHTwXNiUSLGR9Ummjt22WbyaFspVuHtI65WYwdHDQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=du/JCW9ylPJ4TBHNoQ7Ce0NNbGr+LoiyIfP8eI2JCAkKmZhAOydul7++sFT87ayQXZsXIP14mxi/d77ZwrBapU7TRfPKlcH8HM4FdtWe6W58b7zITEt9CGL/+K5JuH+zQ+FzCmRFCuzbBsKfGOZQuC0bE3GZUxSEjemHLh8/EHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPqvAlYy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPqvAlYy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB6CC4CEDD;
	Thu, 27 Mar 2025 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743101684;
	bh=uabHTwXNiUSLGR9Ummjt22WbyaFspVuHtI65WYwdHDQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cPqvAlYyfK78jUfAUGPGahHlav7yEovampDTsuYheOshrBU/eFOVxy9HukzmVm91Y
	 k9Y4npqFSk+/onEKbXLjOnhc6J5HKVcPriwkMfJ8/emIqZ3h+C/7gG1PcYOICh0OQc
	 qmAB3+BFPEwwQsRDz2EWP1h25uK6gjbF/471Gee1kXCh5/rfuJJe5/1OXRJPAFPP69
	 FN2ICDQNGW4FY21brmSkqrRZNZeqQrXSsUZeNAi+tKSKRPZDjmeShQ2yNPBkxgOx6e
	 3+CLSsCKNE9Kvxb0VTLzTuFaRVasxEIeA1M2Bfcqlrqzl5dRwM62wsUxFPlm22eYJA
	 5yF21FLLcNk7Q==
Date: Thu, 27 Mar 2025 13:54:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-usb@vger.kernel.org, 
 mka@chromium.org, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, 
 festevam@gmail.com, broonie@kernel.org, kernel@pengutronix.de, 
 krzk+dt@kernel.org, festevam@denx.de, devicetree@vger.kernel.org, 
 gregkh@linuxfoundation.org
To: Marco Felsch <m.felsch@pengutronix.de>
In-Reply-To: <20250327172803.3404615-4-m.felsch@pengutronix.de>
References: <20250327172803.3404615-1-m.felsch@pengutronix.de>
 <20250327172803.3404615-4-m.felsch@pengutronix.de>
Message-Id: <174310167224.833960.653017791858218794.robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: usb: microchip,usb2514: add
 support for port vbus-supply


On Thu, 27 Mar 2025 18:28:02 +0100, Marco Felsch wrote:
> Some PCB designs don't connect the USB hub port power control GPIO and
> instead make use of a host controllable regulator. Add support for this
> use-case by introducing portX-vbus-supply property.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/usb/microchip,usb2514.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/microchip,usb2514.yaml:53:5: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/usb/microchip,usb2514.yaml:53:5: could not find expected ':'
make[2]: *** Deleting file 'Documentation/devicetree/bindings/usb/microchip,usb2514.example.dts'
Documentation/devicetree/bindings/usb/microchip,usb2514.yaml:53:5: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/usb/microchip,usb2514.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250327172803.3404615-4-m.felsch@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

