Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DCF1A0B08;
	Thu, 29 May 2025 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748543260; cv=none; b=ShbX0K1laf26ysZ5rkJSDHpx+1/peYrlksyfsvQhlTcRhLyL9s/wjM67/ssvXb+VZd1La1wF1iks0etWVPcy+CCjeFvgVOd1pWNz0RXg6jfyQuy2rAQja/792qTnCxmlBEDc+O9O6yCqYExmiuuY4l43ho02p+HjDauGV61jeks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748543260; c=relaxed/simple;
	bh=tUOd0i9aWh62z/M/bOtetrCc2SMGSBcYIhoErkaGfCQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LdAiiQwJd9rvs7UvSNs4DnKBzwZ7yR3fSDe2ZB99SviFNI/cyFDJ2+wj15TG9LzeUlEE6VZ8hpnrCqAUtCYSOXvsfhOYU7qlRBmVEsGlqVMz9SNgBSw1MhkfN0/RLyA0xkLB9CO4cuX13rVYH2hqxpfeWI30l8IoJg4/0cJ1IGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5+bEy2q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5+bEy2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC670C4CEE7;
	Thu, 29 May 2025 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748543260;
	bh=tUOd0i9aWh62z/M/bOtetrCc2SMGSBcYIhoErkaGfCQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A5+bEy2qePCV8yhkkEUkuAJXwp7ssYOxnY4DRDNXrRySqVYq/nj1yky0Gj1X6oSUj
	 643A7syOHwYmaSCtb9ttZubWFzSR8yOxkHt441Qa+2K7LeUcUVVCVagA+MngJyS0YJ
	 yiTGsAx1xrgVd4u6tFsuPZgxqnWEjy0Cbpm2Tb0JX/07iMJm65zTA7vHKq33qqddEA
	 ZWhp94VWaXHS3hcEtZZYO8wi6lCPUlmYa5pb6UIiTdkCog26rAP+HV85Q7SVrOAYy6
	 BMux35qsRSjTyCR2G2fjqRTB41Qr2Upw1aYYK42hpVP0si6Mu/patsuAVaTqyZBJLm
	 UytRZvmITofLA==
Date: Thu, 29 May 2025 13:27:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250529164822.777908-1-Frank.Li@nxp.com>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
Message-Id: <174854325819.3595451.10273154567966477690.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax,hx8357d.txt to
 yaml format


On Thu, 29 May 2025 12:48:21 -0400, Frank Li wrote:
> Convert himax,hx8357d.txt to yaml format.
> 
> Additional changes:
> - add spi parent node in examples.
> - ref to spi-peripheral-props.yaml.
> - change himax,hx8357a to himax,hx8357 to align driver and existed dts.
> - add himax,hx8369a and fallback to himax,hx8369.
> - allow gpios-reset, spi-cpha and spi-cpol to align existed dts.
> - add im-gpios for interface selections.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/himax,hx8357.yaml        | 77 +++++++++++++++++++
>  .../bindings/display/himax,hx8357d.txt        | 26 -------
>  2 files changed, 77 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/himax,hx8357.yaml: gpios-reset: missing type definition

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/himax,hx8357d.txt
MAINTAINERS: Documentation/devicetree/bindings/display/himax,hx8357d.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250529164822.777908-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

