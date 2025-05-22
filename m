Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B82221545;
	Thu, 22 May 2025 06:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894799; cv=none; b=Nv3a4vGEl6nyXa+XAjdBaRWeHkRWVNWk7Q7zVW5nEeBmr2drXvM8z0cHH398nH3SIS+FZH1pccTAM7OeCk8rrQ/vNDLZeWr9+6pyA10wON+SYpIMzo3CkthcuxyzQgNEjJsF0k6BCjgpHH0H9hKJy9IMNkPhsgZq1dzCj7HWqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894799; c=relaxed/simple;
	bh=I3uUYxB9gq0LkC82C7gZzNJaJajWj4XOzEUutTldBiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W++UEnIVKUkYHDs0Kbs2MeMu3RseyyTPhPkprHkAEQKeZSfjzHqE2w+aI9AFW8U9qQqLs6W3H7NSPV6gyhqiqYmu6Eu03y2o7LIIcxedw1B6EItcvri/X82VRRqqmzMZxnzlRT56jdNOWe/j4OD4ScQAj65aYEht3aUTpWZD/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AURGy7jX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AURGy7jX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C897C4CEE4;
	Thu, 22 May 2025 06:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747894798;
	bh=I3uUYxB9gq0LkC82C7gZzNJaJajWj4XOzEUutTldBiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AURGy7jXvJgXpb73jjgq1fA7kXI7UM82gFb4ofwDpgJxeV3WhAU1pVLU02a4jYuYm
	 OGtPocsuzDv+/7OJ8iwrL6DBrN2mnav2+g65msJeFVg0AYDaSLtmQ9Yz17zR9fuR+Q
	 B51X4grM+e/y3KaoWxes2TLpXCQ/Ctz7z0kUkbCYw5I/N2nbesbiOu30/e1NdpsYya
	 L3gksTjYrpLneZXVdLhkn4ncfSIRde3NWSVw9CNI6FkuAA6h1V+BOjNGjaiI5Ykn3Z
	 kL8KpminC/nMlKlEobligibbPDnX6X+rkroXqQgvzqVGJB5KkKVTHQxz1kZIoIyVhs
	 54CUUZtAOhWNw==
Message-ID: <650740e3-1a21-46b1-a297-f8d6b7df9ae9@kernel.org>
Date: Thu, 22 May 2025 08:19:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Maud Spierings | GOcontroll <maudspierings@gocontroll.com>,
 Shawn Guo <shawnguo2@yeah.net>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <aB3DuZMBIwsFXrVz@dragon>
 <PA4PR04MB76309AE2C6E2C774DF8FAE29C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <3ba28773-61ec-4e1e-949d-e8285525d1d2@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3ba28773-61ec-4e1e-949d-e8285525d1d2@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2025 22:39, Ahmad Fatoum wrote:
> Dear Device Tree Maintainers,
> Dear Maud and Shawn,
> 
> On 09.05.25 11:03, Maud Spierings | GOcontroll wrote:
>> On 5/9/25 10:58, Shawn Guo wrote:
>>>>>> +KA-RO TX8P COM MODULE
>>>>>> +M:	Maud Spierings <maudspierings@gocontroll.com>
>>>>>> +L:	imx@lists.linux.dev
>>>>>> +S:	Maintained
>>>>>> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
>>>>>> +
>>>>>
>>>>> I'm not fond of such changes, as MAINTAINERS file could be bloated
>>>>> quickly by individual DTS.
>>>>
>>>> Is there some way you would prefer to see it? I don't really know of a better
>>>> way.
>>>
>>> There was some discussion about getting ./scripts/get_maintainer.pl pick
>>> up the Author: field (in DTS header area).  But I'm not sure where it
>>> ended.
>>
>> I feel like that would be wrong in this situation too, it would pull in
>> Lothar Wassmann, who has nothing to do with me upstreaming this. I have
>> seen him around on the mailing list but given that Ka-Ro are not
>> upstreaming these themselves, I feel it would be weird to pull him into
>> this.
> 
> We can add multiple authors. Authors not wishing to receive mail can always
> remove their name or blackhole their mail address via the mailmap.
> 
> I am not leaning strongly in favor of either way, but I am bothered a little
> by b4 nagging me about adding MAINTAINERS entry for device trees that I've
> added. It would be nice to have a guideline here.

Hm? That's not a warning anyone should fix. If any of these patches are
because of checkpatch, then obviously this should never be accepted.

And that's true for every other change, every addition of C or H file.
You do not add maintainer entries for them.

> 


Best regards,
Krzysztof
