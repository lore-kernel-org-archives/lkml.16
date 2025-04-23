Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B67B298CB0;
	Wed, 23 Apr 2025 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421807; cv=none; b=fL/q7hCnKs8HTFOdg8RKXscYmXK9nuy5Oz/eaVT5/C6uP1o6Qs0Qv/S8Xt/lblqQ58vJkL/A5rlpAOx0DZEnGOUn6uxsVhi/7/X+gdOmBRfFIBucPWH/mmYKzITPfHX5As58c4gg78YjNBNCTbIhVO/o5OrYK87edsjDuuu9/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421807; c=relaxed/simple;
	bh=ttYFtyupJCMupeSXwyqSaNxnbRiKjhqkBV9hyVnYY30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7dLB4nmy3LkG3ZMebUsb/0cCDJkKzTqqqw9BDvxIlOFb5uOcJH7t3kvtaCZE42BMOi/mg/KS5DjLu5Rk/fQUdm5TFbnzxO8qPmMrfJ2FPKU9mJ/kfGSaJaF6gATeyh24Osabd+S16nRMUxxJzhyd93Tlnf2e/yz9KzpGCKtrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLQsHTSR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLQsHTSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D98C4CEE2;
	Wed, 23 Apr 2025 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421806;
	bh=ttYFtyupJCMupeSXwyqSaNxnbRiKjhqkBV9hyVnYY30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLQsHTSROUAK6ThwkWXhF5VTQtSjbjK5MKQgPWBeAYm3OnQl3xo9vUW3c5NIrFpzg
	 z+lp7GpBGY+WxxQMdQI0S5e9vR73KD0m+fgVfer7oIVylZ0pDaQSMvatCNmhoAYjJz
	 WjC+opRME537JuHl44GZKOV0qEjjp92qrZ18eFetM0akxL79A+P90DDu+CKlRgaKUc
	 +2oRVCZHEj7iQ802qNTm67K8mbY+93IrU7H5otIH+P13xmfpnzMl3ELoTX0YE+MNMi
	 zDHktPncfG76nUvxqFwQANV/QL0RWZHJPaNKtMlkPxd2+oKXeWR5eToaz5f6GmRs6a
	 qhWfSTuHn/N6Q==
Date: Wed, 23 Apr 2025 10:23:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3
 combo PHY
Message-ID: <174542180456.549434.17717366396864684617.robh@kernel.org>
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
 <20250418-b4-k1-usb3-phy-v2-v2-2-b69e02da84eb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-b4-k1-usb3-phy-v2-v2-2-b69e02da84eb@whut.edu.cn>


On Fri, 18 Apr 2025 21:19:51 +0800, Ze Huang wrote:
> Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.
> 
> PCIe portA and USB3 controller share this phy, only one of them can work
> at any given application scenario.
> 
> Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

