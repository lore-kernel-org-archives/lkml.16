Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCBE86338;
	Wed, 25 Jun 2025 00:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750812459; cv=none; b=JSI5T4nXM89zJrt9Fzc5wwsGUkd30BUnpqRAB6xF0c3kqaYgve0wq7rvbHT/06gcavtbOkUy9M1osWdH32/CmJUcyKpK1E7RSLarR65RNk/6WDqokx6Xyh4obAdAaVC8fg1zojeFyYq+iDzIKUQoz1cubhfo/GGkUZQnV3ryS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750812459; c=relaxed/simple;
	bh=ypeDCIqJN01knxine3UtPmHgKvFykSbRb7N69KRKmDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgD835FshhnSPXwjm6n288ZALEzHyvQcAdfB6mq3LWO+FOsnqEFN8n31hyjsqmU7pqARoQyOd9Vl+N/jPdOZIHlyQepZ+u3wDFikEQfp8/68/fjWmkpAUN1BT87AWh9ICfdqo5hRJ/GP8OvMGyQTtbZYKv2Y2xUTHGmG1Y72dX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI5bL/Hc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI5bL/Hc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B805C4CEE3;
	Wed, 25 Jun 2025 00:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750812458;
	bh=ypeDCIqJN01knxine3UtPmHgKvFykSbRb7N69KRKmDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NI5bL/HcFPqSJkNfF4SnfVOU2a45svebC9ZckKBw6DFIkD5evGWbV274EoGTL1/ep
	 AEjlAM69HcAhO5te/SkL78jtyp6Fn+t5W71ztthOEs3wQbTlXYyPqVubhZQgl1vomu
	 ++znLaq7O/Cws6dgqf3MLrwx5B25E5BdIab2AG8/KflPR0ErH6hHzBLvk4mc0AbEsn
	 l81+N3/mME8pnAxa6ccJcw1yrJXJju7mrz8e0BETb4mcNLjVMo0aFLOsO/UkrpoRxj
	 GhKAH+Uty929qBBAQT4lOTnN1zDHAQXOerehXzlhgcm33r7QTEWVy31zb6yKrkCe00
	 oRj1eXK/qVbAQ==
Date: Tue, 24 Jun 2025 19:47:37 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	kernel@collabora.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
Message-ID: <20250625004737.GA2087299-robh@kernel.org>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
 <175068852802.3230004.1923972457454728043.robh@kernel.org>
 <480c78cc-076f-44e2-bd90-1dcc91a235ee@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <480c78cc-076f-44e2-bd90-1dcc91a235ee@collabora.com>

On Tue, Jun 24, 2025 at 09:27:43AM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/06/25 16:22, Rob Herring (Arm) ha scritto:
> > 
> > On Mon, 23 Jun 2025 14:00:37 +0200, AngeloGioacchino Del Regno wrote:
> > > Add a binding for the MediaTek MT6363/6373 (and similar) multi
> > > function PMICs connected over SPMI.
> > > 
> > > These PMICs are found on board designs using newer MediaTek SoCs,
> > > such as the Dimensity 9400 Smartphone chip, or the Chromebook
> > > MT8196 chip.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
> > >   1 file changed, 98 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml:
> 
> Yeah, sorry about not adding the information at the very beginning (but I suspect
> the bot would still complain), but anyway that's because this series depends on the
> one that actually introduces the bindings for the regulators that are referenced in
> here...
> 
> https://lore.kernel.org/all/20250623120016.108732-1-angelogioacchino.delregno@collabora.com

If you set base-commit and/or dependencies then it would not complain. 
But really, it should be one series so we can review it as a whole. 
Examples go in the mfd schema so they are complete.

Rob
