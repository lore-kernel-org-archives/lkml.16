Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A02AF10;
	Tue, 27 May 2025 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328885; cv=none; b=n4AXHE6JU9cp+PwdFV4IW7kS4Yn1YG2vdZPikhIUzuOFL1bX8BJ29u0ajaA5d8mMXBvLTXJVJ7x/ls+UBzJbRxxVpza3PqTcQQhvI8QJrlg3UbhGP6BnaYqkOa5HaABtrCzyOX3w2vC0mkYIopZaXncfFBan+G+ABY3B1M5pvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328885; c=relaxed/simple;
	bh=QfDd2n6cFYxP02STJxzyK1KJcbrSY/2E6tZlrCZsMhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gW95PuX06ojVeIeX+kXl8PCaxjzZZyC/UlnIYxt2Sf0Mg46F+qYH5zw8jTQftrH+WmjunNBiB63HNNS3Blj+wn2Tvdx7iVo4XsNkK++R+mnlp31lXaZP7b3sCHTFkQOSCFhGZDyp7RbLdA+I0LmBfXoCOB2k3ayZzmnugYdBees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bclxlVw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bclxlVw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC18C4CEEA;
	Tue, 27 May 2025 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328885;
	bh=QfDd2n6cFYxP02STJxzyK1KJcbrSY/2E6tZlrCZsMhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bclxlVw2IYLcWxr58kYfVjk0uBUQyDLV/GHEOoTneMgUy1l6skSnG2YZaAcRDGiRe
	 oy1AWYOskvfgAISsj/OjcESMUi+PqsaeSW1k+hAgjxDCWVk1OJGgmtoAxLiUJAIkPM
	 UiuVQfOUgwK8KIvSZ+lOwu+IbBClMOxw34TMbLraUfL5KH1V4U9PtmjoD0SBX9SaAW
	 UphDeyBTfNyhfJcX+TYSfVFqdaQYpX5cBZBWr03Lmou/LZZrf1OJW8jXG087wCtXLp
	 WAV++B+Q1OiBEVhDPdKozWvOQd8402m0HSApU9ZrofZ5skcwzsD+V7miYb73d3UsOT
	 PXuELbK0ZMHPQ==
Date: Tue, 27 May 2025 08:54:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <20250527-friendly-armadillo-of-snow-5bec9e@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>

On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> (MBUS) that is not their immediate parent in the device tree. This bus
> uses a different address mapping than the CPU.
> 
> To express this topology properly, devices are expected to use the
> interconnects with name "dma-mem" to reference the MBUS controller.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml

Memory bus controllers go to /memory-controllers/ directory.

Best regards,
Krzysztof

