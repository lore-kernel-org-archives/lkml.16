Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F63290BD1;
	Thu, 10 Apr 2025 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318405; cv=none; b=uI0lnaV6GzJ+V6d3oVRxyE0k4z2CVJ73q7QXqMAANepds1EG3p3BGnU+JbGzaiCjAB65ombPGNH9gn3RWXitPWvJ/5NcRmIAYQy4cGeQc3aEPgUMoJf/fZ3cxP3b4m/8+qwWC24KxIiA0ihlCqtVTeqS8og/ZbX5E97OyW3muDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318405; c=relaxed/simple;
	bh=BALhi4UrMbOHA37ho5uqHpYpjwN+INMK6vrW7q6TxLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nd4fBGc8I23WBFe51gFmm+TV6sWc5guGKng0MqGTNVJpdyC7D01Po7os14ut1IDDfmTbtBKpuOAdyLxkDgjbAgyh6mdq4NlugVF4V2h51jqdXaWZhqmvqrap1VCWtfqkAhRsKe+Pm8HkpdvHMrnYkCOouDdxhIHG0W3tjPSEfNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8Vyz6cf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8Vyz6cf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B6DC4CEE9;
	Thu, 10 Apr 2025 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744318404;
	bh=BALhi4UrMbOHA37ho5uqHpYpjwN+INMK6vrW7q6TxLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8Vyz6cfJb/zRX/vLBSm8X+PPVyWrHbSmVVfybfeJ25+JlQOaUtD0X9QKcHfOSUY4
	 ejqEG36LkwZ0X1thU8D3+5KGySCJJ8OoPMp5rz7kuVNnZVIjl0HZbO5h3FvCpOLbuo
	 ZjsGQNqEj8XqjX9icWiqTZlPyy5NOVoomW6aFXTar7Tv49ayJuvgef0UU6SNq1S2vI
	 rKphEYb/zcsM2gzUVXGW1EwI9a+su8oreolWTPBWzhlDtBWeO11xFdmAGfP3Ivtz8L
	 GgiKk8Bg3NmuHJSLAcD5HYi7qNOKhMbI1juoCitot4icgIVzohwjBbgLmW1f/kglbS
	 +p8eQKJSg+/Bg==
Date: Thu, 10 Apr 2025 15:53:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/7] dt-bindings: phy: spacemit: add K1 USB2 PHY
Message-ID: <174431840229.1041655.15249977458763916963.robh@kernel.org>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>


On Mon, 07 Apr 2025 20:38:46 +0800, Ze Huang wrote:
> Add support for USB2 PHY found on SpacemiT K1 SoC.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/phy/spacemit,usb2-phy.yaml | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

