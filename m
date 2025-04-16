Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBC18870C;
	Wed, 16 Apr 2025 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827238; cv=none; b=YEYIB6TsEXheBNUv/PgcKnLb8YdXEzt7CmOWwbUCNRb0agMJQeEYJfoc2oMNol3YQNF6uuvKr2UaLpSl5fYDJmDzClNarpjXHTRewItXLO4wYkX1mMwPI+A6vrgL6Rb42MO441bxh0e0ZWc1xHt8bBRNj8kQS7SBXFY/U8m1+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827238; c=relaxed/simple;
	bh=E4ZCn18zFjw6q5PMnJTlMEpj3cHQAfhZ5PeKZVr6sKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/FhSQgZlQUKzJ1BCi9cbej+3+sBOlBL2D/bHAmOhfFRSueVG2iuY6+T8W1wlQ2RecC0m9GUt4ANO+cD7HKgMpmuAFUaGgJ2HnR87mldo1MiUVTz4C5YvqOjOr0hc7emRTbydA5hdW71ZNRV1s3VkJkne62WTxmeTHr80VOx4f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFwg2W7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFwg2W7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98A1C4CEE2;
	Wed, 16 Apr 2025 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827238;
	bh=E4ZCn18zFjw6q5PMnJTlMEpj3cHQAfhZ5PeKZVr6sKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFwg2W7ulzfpoDWHo1BLmWMkAnQCxVGe2j5NOi6tePl5s07giWZMkhjfYjNaGhc+E
	 DoBfd+PAHJHY/uyGUOngwGsQdhpWJHeDC6rfW5EjIw+t0fUgVImU6oGJEL7ADtGIxP
	 6XJk9xzY9LEnlV+XZRLm/mfjI0maPA5jnsuQoRLQD7zcaiTgFVGcbomv13di2oNWOD
	 CRvFOfgosj6N16eIFvBGl8ilBctjMJxXdAbEcVnGTxSMAnidclUHGCLaB9Qu8f16rt
	 Rwpf8jN2dNbArsyt3fhr1k6LvGZP6RYSu6VLJDX54u6I0+4BdCLquqlRV0xVUbi3ZQ
	 Fp+tph9YwLL/g==
Date: Wed, 16 Apr 2025 13:13:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	imx@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl-imx-drm.txt
 to yaml format
Message-ID: <174482723439.3590548.522151644513682982.robh@kernel.org>
References: <20250415212943.3400852-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415212943.3400852-1-Frank.Li@nxp.com>


On Tue, 15 Apr 2025 17:29:42 -0400, Frank Li wrote:
> Convert fsl-imx-drm.txt to yaml format and create 5 yaml files for
> differences purpose.
> 
> Additional changes:
> - add missed include file in examples.
> - add clocks, clock-names for ipu.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../imx/fsl,imx-display-subsystem.yaml        |  36 ++++
>  .../display/imx/fsl,imx-parallel-display.yaml |  74 ++++++++
>  .../bindings/display/imx/fsl,imx6q-ipu.yaml   |  97 +++++++++++
>  .../bindings/display/imx/fsl,imx6qp-pre.yaml  |  55 ++++++
>  .../bindings/display/imx/fsl,imx6qp-prg.yaml  |  52 ++++++
>  .../bindings/display/imx/fsl-imx-drm.txt      | 160 ------------------
>  6 files changed, 314 insertions(+), 160 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> 

Applied, thanks!

