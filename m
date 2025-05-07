Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F36E76410
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612552; cv=none; b=C9ozFmja986686HvQnAyrJ+DDhKVKGhaDSJhMeiaXCWDzb0V0ZbEv0Cuw95g6MtJ1MJ7Ykwu/pAOH3jBIEkr+JvESeEplibLSEHJMR1SEK8D9Joutt3i/3fNf9h7RVt4WgltvLy+faVJy86zNuR1NqyvEqm1MGqkr18vf8SWLj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612552; c=relaxed/simple;
	bh=n6lCw1sy+ORvSo4bCuquNbCP1w/NFXIXgJE2ssF21RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mRFP5BCNeK6nYztDjF8NI97EiN+owE+9DoyqDtVYioDejQbCqQx9I1wYOHUlyIEQItC5sysH0c1NtGUDvrSni3BB1HCl2E+fih0J5bqtiD2dSafbFuu0FJNjmQ5B0T8ktmPN5pFMlF2Ko+0OOxXMegcqDyb/kDPFPn7dacvr0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SvM5WGcu; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SvM5WGcu"
Message-ID: <d0575ec1-1901-4534-875c-fa9375e54e3d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746612537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iauQdHWNLGQR4lEBlGfPU1DZ2z64r7U0kJb+L52u76c=;
	b=SvM5WGcuwP2+z8BxEC6+TLSd66DP442/+bmUDxuzi9mnA3AvK0qY1j9evy2xNLKueMZYQq
	kOWanddwuJJWC58Li8dmADN3Xy0GUsrBKYLfKRn2n04A5AyS4G4LCKxziAiWwJiDqztU26
	kA6tY7ChkXaNMTbvHZJ+mF+JLR5S3zw=
Date: Wed, 7 May 2025 18:08:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Initial support for CTCISZ Ninenine Pi
To: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250501044239.9404-2-ziyao@disroot.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250501044239.9404-2-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/1/25 12:42 PM, Yao Zi 写道:
> This series adds support for CTCISZ Ninenine Pi, which ships an Loongson
> 2K0300 SoC and various peripherals. The vendor prefix and the board are
> documented and basic SoC/board devicetrees are added.
> 
> I've successfully booted into console with vendor U-Boot, a bootlog
> could be obtained here[1]. DTB and initramfs must be built into the
> kernel as the vendor bootloader cannot pass them and upstream U-Boot
> support for LoongArch is still WIP.
> 
> Thanks for your time and review.
> 
> [1]: https://gist.github.com/ziyao233/7fd2c8b3b51ef9b30fe5c17faae1bc4e
> 
> Yao Zi (4):
>    dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
>    dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
>    LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
>    LoongArch: dts: Add initial devicetree for CTCISZ Ninenine Pi
> 
>   .../bindings/loongarch/loongson.yaml          |   5 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/loongarch/boot/dts/Makefile              |   1 +
>   arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 197 ++++++++++++++++++
>   .../boot/dts/ls2k0300-ctcisz-nineninepi.dts   |  41 ++++
>   5 files changed, 246 insertions(+)
>   create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
>   create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-nineninepi.dts

For all the patch sets:

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,
Yanteng
> 

