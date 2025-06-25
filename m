Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195A86340;
	Wed, 25 Jun 2025 03:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821713; cv=none; b=WI2rCMDtmuOWIAzZVDNc6sWEfwQs6G0Mx+bXU1BNBuBN+mVtHQ0llp9SgqSvKLYyKhh7EMl0Nx4S1dGb9lrx5wc8y6aHZ6f7BWRs3X1WpXCxZ068/SEPaVhHuKvlEXl9imcXuOOHacUvWKRlRqr4DCBslLE6oIVxZwRcm7nJgKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821713; c=relaxed/simple;
	bh=auKUwDNEzSM73v/abj4MgCTJOYrYqJpWEqtbm5AFlUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hESFoIhgy0dv/4FN/oWsyrccUloL1uWaUT33S8NkMFr2P5wo3Irf7rnUsKKC3j2ychb7FXlTlnj5chBF43i+1oFWdPwfWWcButKavgLg+CrRO+CEzoky/SWHjnrOfZ+JuCJi4Dyr5IpN93LfOFKGiRD22ImDdE5L1luV0Vf0yco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.186] (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3vgw4a1toj5shCQ--.56893S2;
	Wed, 25 Jun 2025 11:21:30 +0800 (CST)
Message-ID: <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
Date: Wed, 25 Jun 2025 11:21:28 +0800
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:zQCowAA3vgw4a1toj5shCQ--.56893S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryxGr1rtFy7tr45CF47XFb_yoW8GrW5pa
	y7Xr4kKrWkJr4kArnrXF1qgFWfWr4Sqa4xCFyDGwn8Za98WF12qFWSkr9Fkry7Wwn5Aa1I
	yanava4q9FW5XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2X_-DUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 6/24/25 20:21, Guodong Xu wrote:
> On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Vivian Wang <wangruikang@iscas.=
ac.cn> wrote:
>> UART devices in Spacemit K1 use dma-bus DMA translations. Move these
>> nodes under dma-bus to reflect this fact.
=2E..
>>
>> -               sec_uart1: serial@f0612000 {
>> -                       compatible =3D "spacemit,k1-uart", "intel,xsca=
le-uart";
>> -                       reg =3D <0x0 0xf0612000 0x0 0x100>;
>> -                       interrupts =3D <43>;
>> -                       clock-frequency =3D <14857000>;
>> -                       reg-shift =3D <2>;
>> -                       reg-io-width =3D <4>;
>> -                       status =3D "reserved"; /* for TEE usage */
>> -               };
>> -
> Are you sure sec_uart1 should be placed under the dma_bus? Please doubl=
e
> check. If sec_uart1 and other peripherals supported by the secure DMA
> (base address: 0xF0600000) share the same address mapping as dma_bus, a=
nd
> if they can be accessed by the linux kernel in some cases (as saying
> 'reserved'), then that makes sense. If not, better not move them.

Hi Guodong,

I have confirmed with SpacemiT that sec_uart1 uses dram_range4, a.k.a.
dma-bus, which is same as the rest of the UARTs.

Also, sec_uart1 is usable in e.g. Linux, but only if no TEE is in use.
Using status =3D "reserved" is the safe choice here. Platforms that do no=
t
run a TEE (or anything similar that would disable access to the
0xf000_0000 to 0xffff_ffff range) and wishing to enable use of sec_uart1
can change the status to "okay".

Vivian "dramforever" Wang

