Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01945AD5A;
	Tue, 27 May 2025 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363143; cv=none; b=CyCj0BLxSl7Y+uEBLFVvIAgnfYdApyiqiw1Tkg1+gcO6hPtZ0OFw3fnCjqPvwjFY3Az3uxte4ldaZDzveapt1OdQFga2/JuEftiFSO+eCJJ3vxlgb1Yp5bbrUyHtBjh8gk6ySDF4aPO+3PIlwTzTrVnjWX/wheFrnXc1D5/fDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363143; c=relaxed/simple;
	bh=khpow4kcf5haMZyrMlXnzn3OiMY4A+7VzQ+k+AAUENc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MltSmG+e7UCWMFWxSWdBqOZ9zIF/D0eYhRGTY2iKSfYdq6+z+RnKMIu2UjUqqYlCA15vJrfFfAIEcNws3QjzfH46x+UBsAxvfyI3SM03tvnT6iM6dCSRgN2sROn5EToVQoKO4Jrx5U6MfCsS+M6cnW5XSs4PJhwwJCONwetqB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhoZgrS9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhoZgrS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D000C4CEE9;
	Tue, 27 May 2025 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363141;
	bh=khpow4kcf5haMZyrMlXnzn3OiMY4A+7VzQ+k+AAUENc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhoZgrS9CfrZrUrKsBRtGfXRvzKWwFPvIjU5tBt+JDizFPxfF6WKs4K0/Vh7ytKVP
	 6cA7M5q5J2YF2UHwPGWnoCVcKqjfpMQY01IgQ4OXtAutQS01mCd4KjnIYKASNas6pm
	 SrdixFpXXqICs8qs+h9VLkayRce4SkLqcxQY6ahsALr5Re9w8vTImnJfkV5AvPQ3oq
	 AMlrGH5jYGatla4QLg1D4JYDBoQDIljKSgy/feyudncXxgVNPPUWVV/TA5MWKiVQnU
	 6M2yjo6ud743OqGgmUTz2ThDmfqy0Vv2qI2B39yl/oizxNQLiJdbX/uO3ePvdNaVk6
	 12KI9ftzH1bJw==
Date: Tue, 27 May 2025 11:25:39 -0500
From: Rob Herring <robh@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <20250527162539.GA423198-robh@kernel.org>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-energetic-pink-cricket-a282fd@kuoka>
 <aDWeQfqKfxrgTA__@jean.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDWeQfqKfxrgTA__@jean.localdomain>

On Tue, May 27, 2025 at 07:13:05PM +0800, Ze Huang wrote:
> On Tue, May 27, 2025 at 08:51:19AM +0200, Krzysztof Kozlowski wrote:
> > On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> > > Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> > > (MBUS) that is not their immediate parent in the device tree. This bus
> > > uses a different address mapping than the CPU.
> > > 
> > > To express this topology properly, devices are expected to use the
> > > interconnects with name "dma-mem" to reference the MBUS controller.
> > 
> > I don't get it, sorry. Devices performing DMA through foo-bar should use
> > dmas property for foo-bar DMA controller. Interconnects is not for that.
> > 
> 
> Hi Krzysztof,
> 
> Sorry for not clarifying this earlier - let me provide some context.
> 
> The purpose of this node is to describe the address translation used for DMA
> device to memory transactions. I’m using the "interconnects" property with the
> reserved name "dma-mem" [1] in consumer devices to express this relationship.
> The actual translation is handled by the `of_translate_dma_address()` [2].
> This support was introduced in the series linked in [3].
> 
> This setup is similar to what we see on platforms like Allwinner sun5i,
> sun8i-r40, and NVIDIA Tegra. [4][5]
> 
> I considered reusing the existing Allwinner MBUS driver and bindings.
> However, the Allwinner MBUS includes additional functionality such as
> bandwidth monitoring and frequency control - features that are either
> absent or undocumented on the SpacemiT K1 SoC.

The interconnect binding is for when you have those software controls. 
If you only have address translation, then 'dma-ranges' in a parent node 
is all you need.

Rob
