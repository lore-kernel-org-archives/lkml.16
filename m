Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2723716B;
	Thu, 19 Jun 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750347762; cv=none; b=UZQYhwTeP2f4vTpb6GNDlhDO9U1zMcMFN+GVCq9Pk18UhEfKoLHZcJ4ekQw8ch3hqeL9NMdzQc3CVXt5hSKxy6O+oytU2thrjO6A8G/L8On35jlL6qCiY1yLRbTNreX/N11LgxuwUMiAR4s8ey5q/0Y2UrIiqaHaFVW9jS8/Tm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750347762; c=relaxed/simple;
	bh=K75b45Z+kn0Z6yKcs1BxrZIA2ZZow4VG61YQ+eMDe90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aq3wjfo9kRy6eXRpbyU3kCOxg/UFelcaHkCOGh9jtmU5M4NnBNqQQmv0quPHCc6FzlLD6ikP3JWhQ+dxSp1/brIxBH0zbWnsr45V3I2npJnwcEzQ7nBZ/0sedDwLQuKwR4CDYIkwho1Lp3GC7R53OtLbUoyZvCPitWi3GajGTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.111] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAnZxTZL1RoE7qwBw--.30021S2;
	Thu, 19 Jun 2025 23:42:17 +0800 (CST)
Message-ID: <9e5e54a9-ef90-4a87-b082-d6eb9c7468c5@iscas.ac.cn>
Date: Thu, 19 Jun 2025 23:42:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Alex Elder <elder@ieee.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>,
 Ze Huang <huangze@whut.edu.cn>, spacemit@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnZxTZL1RoE7qwBw--.30021S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF43JF4UuryDXrWxZrWfuFg_yoWxJF48pF
	s3GFsxKrWDtr1Ik39F934xXa4rtws5AFWUJFn8Wry5Ars8WFyIqryfKw1jvFyDursayw42
	vr43Kr95WF1qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Hi Alex,

Thank you for your comments on this.

On 6/19/25 23:11, Alex Elder wrote:
> On 6/17/25 12:21 AM, Vivian Wang wrote:
>> The SpacemiT K1 has various static translations of DMA accesses. Add
>> these as simple-bus nodes. Devices actually using these translation will
>> be added in later patches.
>>
>> The bus names are assigned according to consensus with SpacemiT [1].
>>
>> [1] 
>> https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com/
>
> So what you include here very closely matches what Guodong
> said in the message above.  Yours differs from his proposal
> and that makes it hard to compare them.  I have a few comments
> on that below.
>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
>> This is my concrete proposal for representing DMA translations for
>> SpacemiT K1.
>
> It's worth acknowledging that this is derived from what Guodong
> proposed (it's not "your" proposal in that respect).  That said,
> yours is a more complete and "formal" RFP than what he wrote.
>
I had thought that since the addresses were already there in vendor's DT 
[2], and the names were provided by SpacemiT, anything other than the 
names was "well-known information". In retrospect, I should have made 
the chain of information of this clearer and make it explicit that this 
was based on Guodong's note.

So, just to be clear, the information in my proposal is based on 
Guodong's reply [1] (link the quoted text), which I had assumed, but not 
explicitly confirmed, was based on already addresses in SpacemiT's DT 
and names provided by SpacemiT.

[2]: https://github.com/spacemit-com/linux-k1x/blob/k1/arch/riscv/boot/dts/spacemit/k1-x.dtsi

>> For context, memory on the SpacemiT K1 is split into two chunks:
>>
>> - 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
>> - 0x1_0000_0000 above: Rest of memory
>>
>> DMA-capable devices on the K1 all have access to the lower 2G of memory
>> through an identity mapping. However, for the upper region of memory,
>> each device falls under one of six different mappings. The mappings are
>> provided in this patch as simple-bus nodes that device nodes should be
>> added to.
>>
>> This patch is an RFC because it is not meant to be applied, or at least,
>> not certainly meant to be applied. Instead, this is an attempt to come
>> to a consensus on how these bus nodes should look like.
>
> I think the above is what Krzysztof might not have seen.  Perhaps
> it could have been made more clear--maybe in the "main" description
> section (above the ---) or even the subject line.
>
Yeah, that's my mistake in organizing the paragraphs.

>> More specifically, I propose that the process proceeds as follows:
>>
>> - Firstly, relevant parties agree on these bus nodes given here.
>> - After that, each time the first user of a bus appears, the series
>>    should include a patch to add the bus required for that driver.
>> - If a driver being submitted uses the same bus as another one that has
>>    been submitted but hasn't yet landed, it can depend on the bus patch
>>    from that previous series.
>
> Getting agreement is good, but otherwise this is basically
> the process Guodong was suggesting, right?

Hmm, actually re-reading the discussion now, I realized that I may have 
come to this late and missed out on some previous discussions, which 
were alluded to in Yixun's messages. (This is again thread around link 
[1] in quoted text.) This led me to believe that some of these were not 
really agreed upon.

I also realized I think one of the things I may have not yet made clear 
is that I would like the bus node to be a *separate* patch. I think this 
makes sense, because it's dealing with two different subsystems.

>
>> For conventions regarding coding style, I propose that:
>>
>> - #address-cells and #size-cells are 2 for consistency
>> - These bus nodes are put at the end of /soc, inside /soc
>> - These bus nodes are sorted alphabetically, not in vendor's order
>> - Devices are added into *-bus nodes directly, not appended towards the
>>    end with a label reference
>
> I do like that you're trying to be more complete and explicit
> on what you think needs agreement on.
>
Being thorough was the main goal of this RFC. If there was previous 
agreement on how dma-ranges should be done, I'm sorry for missing them, 
but from my observations on the mailing list on how these ended up into 
patches I really haven't seen much consistency. Maybe there was 
misunderstanding, which I'm hoping to clear up.

(Although see my paragraph above, maybe I haven't been thorough enough.)

>> The K1 DMA translations are *not* interconnects, since they do not
>> provide any configuration capabilities.
>>
>> These bus nodes names and properties are provided compliant with
>> "simple-bus" bindings, and should pass "make dtbs_check".
>>
>> Remaining questions:
>>
>> - Should storage-bus exist? Or should drivers under it simply specify
>>    32-bit DMA?
>
> Explicitly saying storage devices have one-to-one mapping
> seems informative, to me.
>
>> ---
>>   arch/riscv/boot/dts/spacemit/k1.dtsi | 53 
>> ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>
> The short summary of what differs between your proposal
> and what Guodong said is:
> - You sort nodes alphabetically, Guodong did not
> - You dropped the unit address
> - You dropped the comments he had, which indicated which
>   devices "belonged" to each mapping
> - You added a compatible property to each ("simple-bus")
> - You added an explicit (empty) ranges property to each
> - You add #address-cells and #size-cells properties, both 2
> - Your dma-ranges properties are identical to Guodong's,
>   for all nodes
>
That was a good summary. Thanks!

My main goal of organizing the bus this way is making it actually pass 
"make dtbs_check". I'm not sure if Krzysztof still objects to my reading 
of simple-bus.yaml though.

By the way, I don't think I will be making an RFC v2 of this. I think we 
should get everything sorted under this one thread.

Thanks again for taking a look.

Vivian "dramforever" Wang

