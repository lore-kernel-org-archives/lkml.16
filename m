Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC576026;
	Tue, 17 Jun 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150126; cv=none; b=RaUvPAR9oEyEaFoHgobgebSFAQga0WTJc2A6PUvy1UAPv7jASG8vOJEhwZbC+jHky/tlxHYWYMWxyRbi2JkPrAwBwqI/Y2tlFUPpPluycNVgZwyeRJtWtZ0R1SSXmMbPVanYfJ7CwKKQmMs0PTk5bgwCzEjcqPyzAVAuQaA9QYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150126; c=relaxed/simple;
	bh=vuoNr13Rqzsj6LgDL0QJ3v3rep1txRGacEWw//RdxO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUWwCwe+5hbrL+W1B0n/CGnUPAYQESfiDN6rQnXAu6CtnNaP1lKV7X7gVNB9ZFQKi+r25e9nD9qrSjQjI9QiBqnhOeyfm4Z1M1qFH5wVe6EAaHTSvuwBHnZDm3iBdInH10OkQ7fB45xfxwYgZQqVPRlF7W5+HZFgJzd9CVXnD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.151] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAAn2dfZK1FoBBEkBw--.8277S2;
	Tue, 17 Jun 2025 16:48:26 +0800 (CST)
Message-ID: <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
Date: Tue, 17 Jun 2025 16:48:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Vivian Wang <uwu@dram.page>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAn2dfZK1FoBBEkBw--.8277S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4kCw13Kr1kWF1rZw15CFg_yoW8CF45pr
	Z3u3ZayFZrAF40gws29rZrWa4ruwn7Za15JFn5Gr1rAFZ8XFyagrWxJw1j9w1UXrZ5Xa47
	Xa1DZ3s7uF4UJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUy38nDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Hi Krzysztof,

On 6/17/25 14:21, Krzysztof Kozlowski wrote:
> On 17/06/2025 07:21, Vivian Wang wrote:
>> The SpacemiT K1 has various static translations of DMA accesses. Add
>> these as simple-bus nodes. Devices actually using these translation will
>> be added in later patches.
>>
>> The bus names are assigned according to consensus with SpacemiT [1].
>
> Read the feedback there:
>
> "So, as you are submitting the first node(s) under network_bus: bus@5, you
> should have this added into your patchset, instead of sending out with
> none."
As mentioned in the patch extra message, this is an RFC meant for
achieving consensus on what the bus nodes should look like, not an
actual patch meant to be taken. I was hoping I was clear on that, but I
guess that paragraph was buried too deep. Well...
> Plus simple bus within MMIO node needs unit address. IOW, don't mix MMIO
> with non-MMIO. I also suspect this does not pass checks, so the tools
> can do our review...

This DT passes "make dtbs_check" fine, with only unrelated warnings on
sec_uart1 that was already there before:

  DTC [C] arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb
.../arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000
(spacemit,k1-uart): 'clock-names' is a required property
        from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
  DTC [C] arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb
.../arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000
(spacemit,k1-uart): 'clock-names' is a required property
        from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

To be honest, I don't understand what "within MMIO node" means here.
Should the buses be taken out of /soc and added as its siblings?

Thanks,
Vivian "dramforever" Wang

> Best regards,
> Krzysztof

