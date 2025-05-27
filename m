Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107027F756;
	Tue, 27 May 2025 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364141; cv=none; b=X3rwn6FICJY/Ftc4rUHY4ASC1tVD68ljYroqKNHO410gFBObbGb4S5iTBlRFdymJOLckNLjmAc3DvV+0CWgFOzta1hbMOdvKZL/4YEz3p74F64JtQ7mKxZ1VV0cGq6JZ6alBXzFKg9yoDNFg5sWjsNQz/10Hb5kNtD0vv5UZspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364141; c=relaxed/simple;
	bh=v23pZK4+LlSG8HcZ3RIjXmtSlwRxRLp+kl3Bg1oL4OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHRkHqT7ROQ0og/Uh7XVNb+t/x9X1sLLd0H5BlwRHFW1yhkVD3Kf71ndylIt6Tolxih+sh45N/pdYMEr7IpngMlYekbtg/SSnpBQvEY63yljA+qvJwoO2vz1QKJ/nv5LQD+lfioKwQq+nL+fKZ8WL7SnQ1yoVbvBU95tmRWMhwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (10.88.157.134 [34.28.57.145])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1697939e2;
	Wed, 28 May 2025 00:42:00 +0800 (GMT+08:00)
Message-ID: <d855eedf-099f-4396-a79b-ee51b3bf24cb@whut.edu.cn>
Date: Wed, 28 May 2025 00:41:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-energetic-pink-cricket-a282fd@kuoka>
 <aDWeQfqKfxrgTA__@jean.localdomain> <20250527162539.GA423198-robh@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250527162539.GA423198-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSExPVkMaT0IeTUJLHxpCQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlIT1VJQ1VOTFVKT05ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
X-HM-Tid: 0a97129f4caf03a1kunm0054c905d0011
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhA6Qio4LTErDFY4NysBEhIM
	LRdPChpVSlVKTE9DSE1PSkhJQ0hMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlI
	T1VJQ1VOTFVKT05ZV1kIAVlBSElDSzcG

On 5/28/25 12:25 AM, Rob Herring wrote:
> On Tue, May 27, 2025 at 07:13:05PM +0800, Ze Huang wrote:
>> On Tue, May 27, 2025 at 08:51:19AM +0200, Krzysztof Kozlowski wrote:
>>> On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
>>>> Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
>>>> (MBUS) that is not their immediate parent in the device tree. This bus
>>>> uses a different address mapping than the CPU.
>>>>
>>>> To express this topology properly, devices are expected to use the
>>>> interconnects with name "dma-mem" to reference the MBUS controller.
>>> I don't get it, sorry. Devices performing DMA through foo-bar should use
>>> dmas property for foo-bar DMA controller. Interconnects is not for that.
>>>
>> Hi Krzysztof,
>>
>> Sorry for not clarifying this earlier - let me provide some context.
>>
>> The purpose of this node is to describe the address translation used for DMA
>> device to memory transactions. I’m using the "interconnects" property with the
>> reserved name "dma-mem" [1] in consumer devices to express this relationship.
>> The actual translation is handled by the `of_translate_dma_address()` [2].
>> This support was introduced in the series linked in [3].
>>
>> This setup is similar to what we see on platforms like Allwinner sun5i,
>> sun8i-r40, and NVIDIA Tegra. [4][5]
>>
>> I considered reusing the existing Allwinner MBUS driver and bindings.
>> However, the Allwinner MBUS includes additional functionality such as
>> bandwidth monitoring and frequency control - features that are either
>> absent or undocumented on the SpacemiT K1 SoC.
> The interconnect binding is for when you have those software controls.
> If you only have address translation, then 'dma-ranges' in a parent node
> is all you need.
>
> Rob

Different devices on the SoC may have distinct DMA address translations.
A common dma-ranges in the parent node may not represent this accurately.
