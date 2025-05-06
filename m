Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD211F8753;
	Tue,  6 May 2025 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526996; cv=none; b=K/002dDAMer+pbp/rdjqnPLcfnmhClLRo26qqWYlTDZRx4pX/jq50S4/TDwSaZCRYpf9RQFSKbfLZhAqYuaXQFQnKgWMRaYYxj/baoe37i0wi9ypyoHTrNq6R/bmpCUyP1Y7pildcaPqQQv0mCQuEIOaVQi/ngKoq+rDkYPcJgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526996; c=relaxed/simple;
	bh=Rih2slY++JAhSfM8+Jw/xV/xW0d8Xz+lMvXwh5vpM6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQUOdTKh33lVo57P5HVJ4QkeNZ6Or6rAsC3k0WuZKNs0n11kHpexJHhkwB5N4RXQykF8P3Kp3EWP94MMdYhV3PDsqoJ4RKeS8FYaGz16VpBuyxMEw82YmKvddIAj88ImQtjHCS7QavGsB61G/FvLlD7xSxdBxT0j+WwUO5KfU3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.172.53])
	by smtp.qiye.163.com (Hmail) with ESMTP id 141c989fd;
	Tue, 6 May 2025 18:17:53 +0800 (GMT+08:00)
Message-ID: <9847f411-c2cc-4543-9f61-1242ff8a0cef@whut.edu.cn>
Date: Tue, 6 May 2025 18:17:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yu Yuan <yu.yuan@sjtu.edu.cn>, ze huang <huangze@whut.edu.cn>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
 <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR0ZVhgaTB1KSB5LQx1PTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKTElVTkhZV1kWGg8SFR0UWUFZT0tIVUpLSElMQktVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a96a51a1cc703a1kunm141c989fd
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6OQw5TzJCIxc8Dj8WFjES
	My0wClFVSlVKTE9NTklNTUNLSktCVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKTElVTkhZV1kIAVlBSU9PTTcG

On 4/30/25 2:54 PM, Inochi Amaoto wrote:
> On Mon, Apr 28, 2025 at 05:24:36PM +0800, Ze Huang wrote:
>> The "snps,data-width" property[1] defines the AXI data width of the DMA
>> controller as:
>>
>>      width = 8 × (2^n) bits
>>
>> (0 = 8 bits, 1 = 16 bits, 2 = 32 bits, ..., 6 = 512 bits)
>> where "n" is the value of "snps,data-width".
>>
>> For the CV18xx DMA controller, the correct AXI data width is 32 bits,
>> corresponding to "snps,data-width = 2".
>>
>> Test results on Milkv Duo S can be found here [2].
>>
>> Link: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/dma/snps%2Cdw-axi-dmac.yaml#L74 [1]
>> Link: https://gist.github.com/Sutter099/4fa99bb2d89e5af975983124704b3861 [2]
>>
>> Co-developed-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
>> Signed-off-by: Yu Yuan <yu.yuan@sjtu.edu.cn>

>> Signed-off-by: Ze Huang <huange@whut.edu.cn>

>> ---
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> I think there is a wrong sob here,

Yeah... There's a typo in mail address.

> also, please add a fixes tag if
> you fix something. I will take care of this when merging.
>
> Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
>

Thank you for your review and reminder. I will follow that :-)

