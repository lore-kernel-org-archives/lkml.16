Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E593182B4;
	Wed, 11 Jun 2025 03:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613549; cv=none; b=ElyUhBpnV+S9oafWF42V8a/KVwravG/RaRRJid6yj1BTjWjIiZwSa4Hqom6MdU2C3cCbgDXhQtFW+DC3JQ45GsNCQxnkmWHY2SXmrzrG19AXgNLPTH0wIAIhIjduVrAQWyE6O1QN1+6Z/KhTo8u8y5jraXVB1cyUrcHlAqoewK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613549; c=relaxed/simple;
	bh=qKFJzbosf4mDCS/14sJ3cMRoNH33yesUmP64ZdIXvEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8SIxlsoT7pWmlYyQKc1/Q/X3+Kx5oUVI7yXD5LlY+yskZiCU5i+PnoK0fEKfY7JtyexSJY4+FScD2ynBiFJjoPg8hhHCiOUmEHCOATHSq3w/C+5EAngnC7qKU4DEwf6tZaYE3X26spxdm/ZSlGBIN5pLo/3fJZKIZLOie06OcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gc6KLZH1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gc6KLZH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B5DC4CEEE;
	Wed, 11 Jun 2025 03:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749613548;
	bh=qKFJzbosf4mDCS/14sJ3cMRoNH33yesUmP64ZdIXvEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gc6KLZH1g42eYuB7liBv7QTxpqwUqA28QQ3XBHAYv7x1kovg/fSdVwWzJ3BMgDci8
	 IgEcPTMbQ2nGCGkH/j5+/zNgHHbElvkgHA8ADGZ54aXR+A8rbEKnprD+SkyUI36ZWM
	 qHme9Py3PsAx+VCNnd7Z7A0IzoAeLzOG+FgOGsEI3Xuo0hqPne+oohnfzsWMlU3FC1
	 AT2C+pPQjw+YTC0LiaHVauPoC1+UAQklbVfkKxWgPPSVzqFGF6dkk2M9wRuc18vZyU
	 GfP/hG04V+eR0iSW9q7ce2WDIm7iOyhgF0I6KkVQ8WtubsR9elFA8i5P5uC9efUOJQ
	 q6qqnE2x0jXuA==
Date: Tue, 10 Jun 2025 22:45:47 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Message-ID: <20250611034547.GA3317268-robh@kernel.org>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
 <174957889856.2397515.16063954809229071708.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174957889856.2397515.16063954809229071708.robh@kernel.org>

On Tue, Jun 10, 2025 at 01:08:18PM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 10 Jun 2025 12:01:47 -0400, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > 
> > Add documentation for IMX AIPSTZ bridge.
> > 
> > Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml: oneOf: Missing additionalProperties/unevaluatedProperties constraint

You can ignore this. It's an issue in the tools.

Rob
