Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC52F2951C8;
	Tue, 17 Jun 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155069; cv=none; b=WJ2tuf7DddK2apK8rPw2x04FdB0ozEwJW450dAb8NtHtukzeFS5aRb6Vt7H1QM1Vj5dGLruzV2KcLFSShWnBEWTx4l56BzCqh7dLGZdP5umu4JJ5a3dJJuFPVO9eRfZT0ChumqhL+IXlLG0Kz8pmftI5gwrQfxdaYETMs/cze7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155069; c=relaxed/simple;
	bh=VhqtVe/12RyNdzwO39QyuBj46xkJKX8jJtYoD60M2rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGEM/q6icFlSDaGdisN4GAYDZkOlIMNIAnC2twz/0K/nVSS6EJe8m6g27q1wkSjqFMrwiK81Czr87kCT33g04rcNvNXMf9dwUlNSB8362jfZPg8oog7m+yeBJ1Or+Hmj/QnFT+ts+Eqqtpoq8srzha25O3oo+0EkYXgdirRBl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.151] (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowACnvFQoP1FokJcgBw--.2075S2;
	Tue, 17 Jun 2025 18:10:50 +0800 (CST)
Message-ID: <fd9b3bbc-3318-4845-90ca-7f245049665e@iscas.ac.cn>
Date: Tue, 17 Jun 2025 18:10:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
 <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
 <2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnvFQoP1FokJcgBw--.2075S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfKrWrJFyDJrW3Xw15twb_yoW5GFy7pF
	Z3GF9akFZ2yFyxWrs2vrnrW340yws7Z3W5Jrs5GryrAFZ8WFySgrs7tw1Y934UXr4rJay7
	ZF4UZ3s7uF45ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUb8hL5UUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 6/17/25 17:35, Krzysztof Kozlowski wrote:
> On 17/06/2025 10:48, Vivian Wang wrote:
>> Hi Krzysztof,
>>
>> On 6/17/25 14:21, Krzysztof Kozlowski wrote:
>>> On 17/06/2025 07:21, Vivian Wang wrote:
>>>> The SpacemiT K1 has various static translations of DMA accesses. Add
>>>> these as simple-bus nodes. Devices actually using these translation will
>>>> be added in later patches.
>>>>
>>>> The bus names are assigned according to consensus with SpacemiT [1].
>>> Read the feedback there:
>>>
>>> "So, as you are submitting the first node(s) under network_bus: bus@5, you
>>> should have this added into your patchset, instead of sending out with
>>> none."
>> As mentioned in the patch extra message, this is an RFC meant for
>> achieving consensus on what the bus nodes should look like, not an
>> actual patch meant to be taken. I was hoping I was clear on that, but I
>> guess that paragraph was buried too deep. Well...
>>> Plus simple bus within MMIO node needs unit address. IOW, don't mix MMIO
>>> with non-MMIO. I also suspect this does not pass checks, so the tools
>>> can do our review...
>> This DT passes "make dtbs_check" fine, with only unrelated warnings on
>> sec_uart1 that was already there before:
>>
>>   DTC [C] arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb
>> .../arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000
>> (spacemit,k1-uart): 'clock-names' is a required property
>>         from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>>   DTC [C] arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb
>> .../arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000
>> (spacemit,k1-uart): 'clock-names' is a required property
>>         from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>>
>> To be honest, I don't understand what "within MMIO node" means here.
>> Should the buses be taken out of /soc and added as its siblings?
> These looks like children of simple-bus. If that's right: children of
> simple-bus are supposed to have unit addresses (see also simple-bus in
> the DT schema).

The history of the simple-bus.yaml bindings file suggests that a
simple-bus with empty ranges and no unit address as a child of a parent
simple-bus is intentionally allowed [1]. The commit message also
suggests that even in older versions of the same file it was not the
intention to disallow such nested buses.

[1]: https://github.com/devicetree-org/dt-schema/commit/ed9190d20f146d13e262cc9138506326f7d4da91

Regards,
Vivian "dramforever" Wang

