Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3C25E822
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521961; cv=none; b=LK84kfbtAGuwrJF2T9yHTZG5zUmMguyX4v6m4/Xmwo43wb2NDQNfAT/d2HyHPB0P+zVkSzV50hedcggpA2/mtDdPRqS0MwiyNdE47zSbAVE6RUVPJzaJ7isT2wdTfd7+pZKYi5KclLQXenonpCeTTZgT+a44HbkLTrU6oLZfxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521961; c=relaxed/simple;
	bh=SMLklkMtwkEJ27okmODX/Cq94tNArRjGlPeeM5s/2c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lMSMJerrfgWUHgVp6uZrGTPaouLNmKzDmAXlCB3owS0CBI2u1yB1kwFgm2y+bI/zjAEY2Ljo19dEQhPiL4BQtxAncv/tVLXrHWa3RAd0pRzglnoFFCnTT0MnRWta+Zs7Bv22nXbR3gUZp1D8Hmv7H2EEaI5336OqXvKvuCud1Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AL1w9akL; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AL1w9akL"
Message-ID: <7e56091d-0e91-44ef-b314-facb102ee468@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746521946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cuju97zzlBFsfo/a9MaZFctzRxnL5LXNm5kzVfm8v6s=;
	b=AL1w9akLe9WKnXJLs8Ijkkpms5+7rMh4HE04fCiQ6O/QZFkWCLvu0T2WSEOi3/kllsgx3g
	VdSj0EmH+tGbvrSOxD+QYDo2h+J0H2aL2V3pYUb9AiTQuvgosEPOxLQzkdoUddvtDsG8qB
	wab2CZiAB6XMIRREFGekSScfsTSfqrU=
Date: Tue, 6 May 2025 16:58:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
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
 <20250501044239.9404-4-ziyao@disroot.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250501044239.9404-4-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/1/25 12:42 PM, Yao Zi 写道:
> Ninenine Pi is an Loongson 2K0300-based development board produced by
I think "Ninenine Pi" doesn't make sense. I browsed 
<https://bbs.ctcisz.com/forum.php?mod=forumdisplay&fid=2> and found that 
the Chinese name of this development board is "久久派". Interestingly, its 
selling price is 99 yuan. In Chinese, the Roman numeral "9" has the same 
pronunciation as the Chinese character "久". It seems that you intended 
to name the development board after its selling price. But shouldn't it 
be "Ninety-nine Pi" in English? Or "99 Pi"? Perhaps "Jiujiu Pi" is a 
better option?


Thanks,
Yanteng


> CTCISZ. Features include,
> 
> - 512MiB DDR4 RAM
> - On-board eMMC storage
> - Optional SD Card support
> - 2 USB 2.0 Ports (OTG and HOST)
> - 1 GbE Ethernet port
> - Optional WiFi/BT support
> - Audio output through 3.5mm phone connector
> - Optional display output through RAW RGB interface
> 
> Add compatible string for the board.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>   Documentation/devicetree/bindings/loongarch/loongson.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/loongarch/loongson.yaml b/Documentation/devicetree/bindings/loongarch/loongson.yaml
> index e1a4a97b7576..aac4af9ee97a 100644
> --- a/Documentation/devicetree/bindings/loongarch/loongson.yaml
> +++ b/Documentation/devicetree/bindings/loongarch/loongson.yaml
> @@ -14,6 +14,11 @@ properties:
>       const: '/'
>     compatible:
>       oneOf:
> +      - description: CTCISZ Ninenine Pi
> +        items:
> +          - const: ctcisz,ninenine-pi
> +          - const: loongson,ls2k0300
> +
>         - description: Loongson-2K0500 processor based boards
>           items:
>             - const: loongson,ls2k0500-ref

