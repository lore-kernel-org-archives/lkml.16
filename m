Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A467028466D;
	Fri, 16 May 2025 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431355; cv=none; b=pwSj5jNXHfvLJQx/bqbsZkuJ30W5q9nkELDVBxqzjQXk5uF7zsJ8682BtEFixQ9n0vJJL1Xk44Hejq2M0RYI0OutMQ3MrUCZdjQQ0P7x5rBKbCqxo3TvEC8ax1lj1UsDl9PiSeeR4yOCPLUZQ6J8963EPSxsacIT+aeF8rPOJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431355; c=relaxed/simple;
	bh=bLyZNDh57twuZ5u/SwC20jaSbr5jsZ/x4elmufChQC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUvyW1QimCpToZll27Wb/nDxOQSBQqngNwv3IYIsFSdweYmDGjCOhw396H1vgWndx1D9xURiA7P2ODflIxb8MXQdsJvfHZrW8Ma290fWZEM1LKSaooL8/rJnw9HNQhOt6MQ+Q27srhA3Gphgr1UKn5x/uU2fJQ4Q5nSLEXPLFxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJ/fjkd5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJ/fjkd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F65C4CEE4;
	Fri, 16 May 2025 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747431355;
	bh=bLyZNDh57twuZ5u/SwC20jaSbr5jsZ/x4elmufChQC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJ/fjkd5HQpsmR9FBzcNfeQ/H4ZUDgUgeEVkg3CnFA1D07wR5QPrWCZEWoAB/Zkeq
	 bMXvO4zDJKbmsyRi0lyTLbG/BdwTJfP90kgMfhHV58sS63MORa7CKZF0gcsEpqEjq0
	 dFcxnrRK/kroHB4xNmsndNh2953U7dpqscH3sWQVcGo/3HZtSHugB+kP6f9QQsqPIy
	 3lP67LiGuER55cLqO4dTiwBCXi8i1WyNab2fGB8Lx+THgKH6+vbSNGWvpgPYx8Dy7i
	 3Wyo9XMyE9418BuuDUKu3zfzBHkze8ckbj0hIl72IgYuY9P0QaPBZJd2hSl9QsLKZY
	 mIh7iNa7VV7Ng==
Message-ID: <a66eb6b7-3121-4383-b604-949090fc08d9@kernel.org>
Date: Fri, 16 May 2025 21:44:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
 <20250502-savvy-eccentric-hog-b4fed5@kuoka>
 <smfuskvhdhrfrgbpjflgymoadms6vfiwgjmipsmkrxldtor6we@tyvafv626bwr>
 <8ec115f7-1a35-4506-a20a-b4de27f10960@kernel.org>
 <z7knkmi7kjhwlqwokikozos7whwaj5vmseh7kjrdl2la3kmj5e@wwzlsxpq573v>
 <7d6b529e-ab26-4efe-8b91-1facbd041ba3@kernel.org>
 <20250507153811.ukkficut2f3jm2hg@skbuf>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250507153811.ukkficut2f3jm2hg@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2025 17:38, Vladimir Oltean wrote:
>> This sounds reasonable, thanks for providing context. Most of this (so a
>> summary) should be in the commit msg as the rationale for changing the
>> ABI, so please grow a bit the commit msg part:
>> "The MDIO mux on the LS1028A-QDS never worked in mainline because ...".
>>
>> With all this I still do not get why do you need to affect the
>> compatibles. What is wrong with the actual compatibles?
>>
>> Best regards,
>> Krzysztof
> 
> I really care about not breaking compatibility with device trees too,
> and that's why I occasionally report issues such as
> https://lore.kernel.org/all/20250412001703.qbbfhtb6koofvner@skbuf/,
> but in this case the compatibility breakage is not something to worry
> about.
> 
> The QDS (QorIQ Development System) boards are not made to deploy any
> production software on them, they are more fully-featured variants of
> our RDB (Reference Design Boards) which sit in labs and are used
> exclusively by engineers to test/prototype SoC features in order to
> develop for other (production) platforms. Most if not all engineers use
> TFTP to load the kernel and device tree at the same time. I think it's
> going to be a case of a tree falling in a forest with no one to hear it.

OK, this has to be clearly documented so the platform maintainer can
understand the impact.

> 
> In terms of other projects using the Linux device tree bindings - in
> this case that would be U-Boot, which unfortunately has yet another
> schema for the QIXIS CPLD:
> https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/fsl-ls1028a-qds.dtsi#L134
> So not really a concern right now, but we will take it as an action item
> to resync U-Boot with the upstream device trees for the LS1028A-QDS too,
> like was done for the LS1028A-RDB.
> 
> In this case, why would changing the compatible string be preferable to
> using the node as is? It would be nice for the QIXIS CPLD to have child
> nodes with "reg". The current format lacks that, so we thought it would
> be a cleaner break if we just introduced a new compatible string, to

So change the current form. I do not see any point in changing
compatibles. Whatever your drivers are doing is not really relevant
here, because you can change the implementation behind the ABI.

> make it easier to distinguish:
> - "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c", "simple-mfd" doesn't
>   expect children with "reg"
> - "fsl,ls1028a-qds-qixis-i2c" does.

Sorry but no, we are not going to have two different compatibles for the
same device.


Best regards,
Krzysztof
