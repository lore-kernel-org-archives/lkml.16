Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932628003A;
	Tue, 24 Jun 2025 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786345; cv=none; b=FnT4m+Jg+k9pXflFnD5qF1lZbEsjiXgaZOxn+ypFwtX3eZ90k5s4Smg9tOeAnZFT7HqCGVk5WECmdoSNlVz8XbwuF4sQ2FOIKCk5vQOhCHpio82sSXg7H7+l6z9fhwnmkTVKOqcxSMrgUs1zF7lEXcDigCh08LqcUOS9c2Rvynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786345; c=relaxed/simple;
	bh=3Gfoz12u4n3dZw2dpTpLvMAIURpuyh3gULKIlYm11H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bfMIkprK75EWLR/EGpVsOpLzJ2im+0xZKuE0LGVSTxwG+20JXaTxJ0/hgkStr4jXga9iNjtQq6SqJWm2l2qwOQl0xyb46nhaDx3HMQShgSukhcQPYVrfq1JH1Re2UfnkmZZ9GLowShcVGwjfvL0j0GRrXSPamZjseCjn0y2qqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5xThmII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5xThmII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFB3C4CEE3;
	Tue, 24 Jun 2025 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750786345;
	bh=3Gfoz12u4n3dZw2dpTpLvMAIURpuyh3gULKIlYm11H8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=e5xThmIIQw1Fu5aejPOHOGUnCTT/bJGW5V4Daf1ZsVn6FTucYlmSkizm8sRTduwkC
	 62a49+eVGqhR/dhZS96Slr+hp54b+yZk7MYfF1Fdd2Kskj59qU6EPfuhWFELdqBCD1
	 epISL4WmR+8wPDnuM283/LT2+bon2z8FRCI4HVIeyfA5of4vvDJVtmBupgS2KRrt0J
	 cScVTKYV1ZpTxyyXgww8hGMdoEE5ChQw5Ym7mA8JbrNOsrYZUzNK10MvWDY8iVzxuU
	 Lhu0U8Hj2g1Mfyu4qT6H+a8TnhuYB5jLBnlEGrgyYDCUeLdAL2uiF+z5lcOowdmnp/
	 aPBApP5QNTP9g==
Message-ID: <70e3a367-8d9d-477b-9858-9f2a7b97bbca@kernel.org>
Date: Tue, 24 Jun 2025 12:32:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add 4-bit SPI bus width on target devices
To: yankei.fong@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>
References: <cover.1750747163.git.yan.kei.fong@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1750747163.git.yan.kei.fong@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 01:52, yankei.fong@altera.com wrote:
> From: "Fong, Yan Kei" <yan.kei.fong@altera.com>
> 
> Add SPI bus width properties to correctly describe the hardware on the following devices:
>   - Stratix10
>   - Agilex
>   - Agilex5
>   - N5X
> 
> Fong, Yan Kei (4):
>    arm64: dts: socfpga: n5x: Add 4-bit SPI bus width
>    arm64: dts: socfpga: stratix10: Add 4-bit SPI bus width
>    arm64: dts: socfpga: agilex: Add 4-bit SPI bus width
>    arm64: dts: socfpga: agilex5: Add 4-bit SPI bus width
> 
>   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 2 ++
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts    | 2 ++
>   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts     | 2 ++
>   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts        | 2 ++
>   4 files changed, 8 insertions(+)
> 

This is for the QSPI driver right? I don't even see the driver using 
this property. So how would this help?
