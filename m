Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5107269CF2;
	Tue,  8 Apr 2025 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107006; cv=none; b=JIiIB8rufqTcTB2hHkiMoS0vwOtGQsJwEjCvVgDwFyl/pCRWBPBLJ/4XOc/2osFAYdpyIR2IL39BsZjsOmxe8p7Y0e70QpwJui8yIFWaIQ4YArEU6x4d1VDOiJnEpzCXsnpNeQnPwIRBL8Js5JZu1Z8seXItSLHlCb3PLwXhsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107006; c=relaxed/simple;
	bh=zKoPiYcz99Nz4xf/JHPeWfzhs+Akk0ORk8KQJztJIxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEkdBxYHHi6DdipbJ8BK9ILqr1iXfhM64269Tnzdqbt9c8fydyoefFXDT6xTb25H5kZGHhBIEKOPpJsgjal1QbYfLIn94RzBe5wRDN4j1vWpgbT+LnuoNzBZNtTX3XCDlBAKXCL/B1fLrFJ7fIDiK7FmB6yGZg9ROkeQkyy0H/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QbKB7Hnu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QbKB7Hnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744106995;
	bh=zKoPiYcz99Nz4xf/JHPeWfzhs+Akk0ORk8KQJztJIxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbKB7Hnuj7ZBKkSBv3cR7rUneJAWMFXGUNA2RlvgRAAa1CE/eyVhw+cTMS9R2St27
	 SY+aAKK7+tpi2H2knNvVcHXpaHtcmrs6uAShV4d/FuBat2tnGJN6tWO85BPStSNJ7j
	 JteOu1GtkRGekbkzFGq5oBg5/E6qzWLhfdos8uTCNTti9FheqrOxphMDfwhhTI4Ceq
	 DF2CsyyTHpEerv9N7B1HfZr0pjHcRtHhFXY4op4H9xERbyo3Q36zT7BIG04l7UsScx
	 6qiqVNloHKIJGsn/jxOyaPjHMNGR5YBeX0kQ67wcH75tMHgVfELm/JF9aJdocanaOX
	 lUjWERyst7HVw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 147C517E0F9E;
	Tue,  8 Apr 2025 12:09:55 +0200 (CEST)
Message-ID: <ae6b9a80-c8b6-48dc-9229-da4e8c102551@collabora.com>
Date: Tue, 8 Apr 2025 12:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Chengci . Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20250408092303.3563231-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250408092303.3563231-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/04/25 11:23, Chen-Yu Tsai ha scritto:
> Based on the comments in the MT8188 IOMMU binding header, the rdma0
> device specifies the wrong IOMMU device for the IOMMU port it is
> tied to:
> 
>      This SoC have two MM IOMMU HWs, this is the connected information:
>      iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
>      iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27
> 
> rdma0's endpoint is M4U_PORT_L1_DISP_RDMA0 (on larb1), which should use
> iommu-vpp, but it is currently tied to iommu-vdo.
> 
> Somehow this went undetected until recently in Linux v6.15-rc1 with some
> IOMMU subsystem framework changes that caused the IOMMU to no longer
> work. The IOMMU would fail to probe if any devices associated with it
> could not be successfully attached. Prior to these changes, only the
> end device would be left without an IOMMU attached.
> 
> Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys0")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



