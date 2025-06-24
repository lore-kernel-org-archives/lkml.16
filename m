Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC4D2989AC;
	Tue, 24 Jun 2025 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769539; cv=none; b=u05OOYHZq/XouZpYAIoUbL7EgSEQ+adeQKq6Obz4M3N+hp1Va0jTHa/wuf2Dauheg0cnKOYGpD4KNISZpXiF8e/6bIdrlXhpNWpxvFW7nbeKeTYc9WdE0KGsuqMoCwwLb0Q4f5EwtdK2ZUfc9vuHqZRDvrFk8BTmu/2i7370G4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769539; c=relaxed/simple;
	bh=VaPTYJDkXtYftHizaw2auTaOnEWyZ69JJZUc2N8WFzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQn8a1r7aGKuDRbRDRlWtSCAZJgOT+8+9WApvbOfg09FVXs/Dd0avxJO1VRXaik0h/lbansUyJUCdIOBkZVvoi1qPrDm0UaTLlv44iSR2sEJgKLmQk4Q9iXMz7wwtiJ3BahqOn+62BpcaF6dCeDyp9ZTMmj7LLAKMX0ViEE7P4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.107] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowACnWNdnn1po+ZrnCA--.56515S2;
	Tue, 24 Jun 2025 20:51:53 +0800 (CST)
Message-ID: <78227da5-52a9-4378-a6b2-4b2e01444399@iscas.ac.cn>
Date: Tue, 24 Jun 2025 20:51:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>,
 Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
 <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnWNdnn1po+ZrnCA--.56515S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jr1rZw1fur1fCFy5CFyUJrb_yoW8Jr1rpa
	9xXFsxGw1ktr48JrWqvF1qgrWvgrsYvF48WryDG3Z8ZFWDXF1IgF4Skry7try2grn5Aw1F
	yFsYva4v9F15XrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j1rWrUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 6/24/25 20:21, Guodong Xu wrote:
> On Mon, Jun 23, 2025 at 6:04 PM Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>> UART devices in Spacemit K1 use dma-bus DMA translations. Move these
>> nodes under dma-bus to reflect this fact.
...
>>
>> -               sec_uart1: serial@f0612000 {
>> -                       compatible = "spacemit,k1-uart", "intel,xscale-uart";
>> -                       reg = <0x0 0xf0612000 0x0 0x100>;
>> -                       interrupts = <43>;
>> -                       clock-frequency = <14857000>;
>> -                       reg-shift = <2>;
>> -                       reg-io-width = <4>;
>> -                       status = "reserved"; /* for TEE usage */
>> -               };
>> -
> Are you sure sec_uart1 should be placed under the dma_bus? Please double
> check. If sec_uart1 and other peripherals supported by the secure DMA
> (base address: 0xF0600000) share the same address mapping as dma_bus, and
> if they can be accessed by the linux kernel in some cases (as saying
> 'reserved'), then that makes sense. If not, better not move them.

Bianbu's DT from SpacemiT [1] shows sec_uart1 using dram_range4, and it 
made sense to me. However just to be sure I will ask SpacemiT for 
confirmation.

Vivian "dramforever" Wang

[1]: https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi

> --
> Guodong

