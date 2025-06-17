Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F721B91F;
	Tue, 17 Jun 2025 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152959; cv=none; b=FWDPkhXIY4LjwroNJ3MH0ABT5BWHplSp8fZfR1aWDYJxNEdkf6hZfiv8LXPlA4oQORvXRH9ZsOSxIBTLW6wKdBlk/bKigcinDcYhxaKYRL2iflrvO4CSitdokw2hr4Wz3+WAsEppQF7qjg5QkYiADHyRMqOtneFVDRJ/20lLQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152959; c=relaxed/simple;
	bh=5+Hk/dvoHi+dJCSxoObqNt9FLvtu4FJvjhKLYDy0rD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCD7nYz9bbIIUWYdUNqfZda04qHia9OVzieAI26hMhP/BxLE21adZpTqNT264XXkk7uBp8s//pkNBNg/my9LN4bLoDKFIU4AENlqcDr+E6d/78dsT3Xnk54fg2JwfmTMU+W9u5Ezs4o3cOsm9fSmmlh+P350ZuWWFr0RCJsrmT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrdK4TNZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrdK4TNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F0BC4CEE3;
	Tue, 17 Jun 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750152958;
	bh=5+Hk/dvoHi+dJCSxoObqNt9FLvtu4FJvjhKLYDy0rD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UrdK4TNZQwO5Nf4sfMJcuj3gpzDoZDnQU1rj9mmAnbW8syqpKIzvTT58TIPG5Nzuq
	 dqOeeXK1RqlLY3MtS/hVlxOlh8UCuLZhZcEpTwlli+fVOTmHOaSpb06bFtYWQE01c7
	 auv8gQNyUk8UBh8AbZKO4mgTIxCUph2fT1M66/jRtmX5tGF7mv0dEkrkGjoXcyW0Bh
	 vyuDr87jWUgSan9Y5CXGkdNSiIJtPkVf7EisPgy5bz5B31vK0OPsXmvbkqLMeRS1mH
	 51dhPi4VysJsa+k5QSvjy5CJbBmFIg4ycaVRqK0WdlxONwZ+WqQ5UjOYP9pDIhdztS
	 he/U6m1DgFSyA==
Message-ID: <2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org>
Date: Tue, 17 Jun 2025 11:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
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
 <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2025 10:48, Vivian Wang wrote:
> Hi Krzysztof,
> 
> On 6/17/25 14:21, Krzysztof Kozlowski wrote:
>> On 17/06/2025 07:21, Vivian Wang wrote:
>>> The SpacemiT K1 has various static translations of DMA accesses. Add
>>> these as simple-bus nodes. Devices actually using these translation will
>>> be added in later patches.
>>>
>>> The bus names are assigned according to consensus with SpacemiT [1].
>>
>> Read the feedback there:
>>
>> "So, as you are submitting the first node(s) under network_bus: bus@5, you
>> should have this added into your patchset, instead of sending out with
>> none."
> As mentioned in the patch extra message, this is an RFC meant for
> achieving consensus on what the bus nodes should look like, not an
> actual patch meant to be taken. I was hoping I was clear on that, but I
> guess that paragraph was buried too deep. Well...
>> Plus simple bus within MMIO node needs unit address. IOW, don't mix MMIO
>> with non-MMIO. I also suspect this does not pass checks, so the tools
>> can do our review...
> 
> This DT passes "make dtbs_check" fine, with only unrelated warnings on
> sec_uart1 that was already there before:
> 
>   DTC [C] arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb
> .../arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000
> (spacemit,k1-uart): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>   DTC [C] arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb
> .../arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000
> (spacemit,k1-uart): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
> 
> To be honest, I don't understand what "within MMIO node" means here.
> Should the buses be taken out of /soc and added as its siblings?
These looks like children of simple-bus. If that's right: children of
simple-bus are supposed to have unit addresses (see also simple-bus in
the DT schema).

Best regards,
Krzysztof
