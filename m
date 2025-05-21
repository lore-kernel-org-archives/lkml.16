Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A7280CE3;
	Wed, 21 May 2025 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747858924; cv=none; b=Ix5Qk4BUnxh9idiMLhKj7KHTKXJADbgOVbEh/fPo3c37wgk5Y3arfmsfqYBpN4fllnhRy37t0uY9s94/KRahlVGh2sP/4ZRSKC0w01MVFf+y76PKy0SfchNE/GJ7jCaSDwEbMfVWuZVCz2LeVzxi2EQNEOKE7AkFr8U5Xk7C63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747858924; c=relaxed/simple;
	bh=gaqD7yThtClmjr00ue5gJq3J5xiUu7ivz/Ifgrs+IWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skdHr6UG+nH4uMK4vcCuRzZOU5H2yOCRNz1yc0jo4wFXjusV9IMCnOzFzfRdw5img07prvPsZCJr0glh5CILiYD7tLIOx6UT/RanWKoSyHcV+PrBfmXdk9SNVxNarHqras3oMMOnhMm2/TTwUS0yzLR71QBH1ai7zZCotkELOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KM37XXJv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KM37XXJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DAAC4CEE4;
	Wed, 21 May 2025 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747858923;
	bh=gaqD7yThtClmjr00ue5gJq3J5xiUu7ivz/Ifgrs+IWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KM37XXJvMWPIDa2nPGXYzOhtkRFESy3FDRZGOd4lDT7IrsIUlIlYm8R9lLb4c+SVY
	 qYsdouOUg2b0tmeNN2Xy9rDCjZGnmtEvKsMwJW4VitfI0RpRP0UYazYJ4hatSLzCJe
	 cJYthxRpQwKNSdE4sfrtS5nA206XDP1cniGcYBUoagfXRd4WFz7BNZqsuv0KadAevB
	 jB2bXghaBUGYs0z46/EpC12M2v/I+MT5qp7CFNK6irxyEGFAjP8Atmfe+H5R8YqP87
	 mtvWq+RBQVo0yjgJscXUM/JvNlATVGVdsaSIlVq9Vf0z/afFiTAWKeCYoYazXp6o+y
	 gjzaK4ukvkLBg==
Message-ID: <df8db66b-89a4-40d9-bd44-6705fdbb4517@kernel.org>
Date: Wed, 21 May 2025 15:22:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] dts: agilex: Add support for SDM mailbox interrupt
 for Intel Agilex SoC FPGA.
To: mahesh.rao@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250512-sip_svc_upstream-v2-0-fae5c45c059d@altera.com>
 <20250512-sip_svc_upstream-v2-5-fae5c45c059d@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250512-sip_svc_upstream-v2-5-fae5c45c059d@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 06:39, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
> 
> Add support for Secure Device Manager (SDM) mailbox
> doorbell interrupt on Agilex SoC FPGA for supporting
> asynchronous transactions.
> 
> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 2 ++

I don't see how patch #4 and this patch will applies to this series? 
Please send them separately. It helps with the confusion.

Thanks,
Dinh

