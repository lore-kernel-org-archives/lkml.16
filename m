Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D4EA50;
	Sat, 29 Mar 2025 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743222919; cv=none; b=NQUY000g0fzuHWjcD6VcNMUc0xlhPltdyJriHVwelUagpGwRrDwXO7VgsIk/3yOK9vX4fkSThTtcHZZetPljTfpeazRrZH7xrmbSgSoEg3dHxfAfXH1BBozwzvRPUZ1zpbzh/Yn2rK9V73tKGaTlNRzcxl9cbfAPpw4vIODv3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743222919; c=relaxed/simple;
	bh=v0cfE1DRzxT5S46yhgmeP5GBIfVEyu77Bp03e+u1BK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILiyd74A3GyRZxQFmn3VMixnmhprKowust+sdiDlOun3LxMB6lka3SffQc3miMnQj4jUcgU7uZ+uSe0TiPJRvkL4rm2YeHJmPbL+U+0Ghj+XnEM5vtxQpYftxB02CHMAxCg1tk153wMo7ME7Pwvw1owSD2cl3FC+ZgWES0RQAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEJ52tBs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEJ52tBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296AFC4CEE2;
	Sat, 29 Mar 2025 04:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743222915;
	bh=v0cfE1DRzxT5S46yhgmeP5GBIfVEyu77Bp03e+u1BK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEJ52tBsR2jJ7zUuLtV+vJofx3QvJ14UMTatjpdiwASdnz+tdALzjwovxt30PHI62
	 ZXdTHd4+Cma7OkNXe00XRJ3QZDE3iy96XN1h4/FrdHOh/QNCF3J5Verng4T6jJP14P
	 cFvZCYeIYhyNfzOBaPBO2dNqrFSOfoGiROF/cabtv4amIyGWRS8YMJ8UXPeV/bYcBZ
	 rp0WICI6pKrulb4opPmYrsjPlk1DZiMTZ6Vrh+o4rD/y9dUORYRUrMCTHVdmL9n1gK
	 3jnJpJ9gjW5H8wA3A4Y9m19p2fR908xRLHoG3Vt4OeFvtljDCZe4g+N3sDMXXqnDoI
	 0bqhQwEnzH7FQ==
Message-ID: <5a460228-ab50-490d-a222-d6a10aea3ff0@kernel.org>
Date: Sat, 29 Mar 2025 05:35:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: Add devicetree binding for
 bcm74110 mbox
To: Justin Chen <justin.chen@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250327221628.651042-1-justin.chen@broadcom.com>
 <20250327221628.651042-3-justin.chen@broadcom.com>
 <e7f51014-10b2-4f9c-9929-f2a4f32b023c@kernel.org>
 <cb0905ec-1e80-4c56-befd-b90243dcfa31@broadcom.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <cb0905ec-1e80-4c56-befd-b90243dcfa31@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 19:36, Justin Chen wrote:
>>> +    const: 2
>>> +    description:
>>> +      The first cell is channel type and second cell is shared memory slot
>>> +
>>> +  brcm,mbox_tx:
>>
>> No underscores. See DTS coding style.
>>
> 
> Acked. I already had this fixed in the driver, but not in the doc. Woops!

So this did not even work and you did not test DTS.

Where is the DTS?

> 
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Mailbox transmit doorbell
>>
>> Why is this needed in DT? How many instances do you have in one SoC?
>> Where is the SoC DTS?
>>
> 
> We have 3 possible instances in our current SoC. We currently only 
> implement one. arm,scmi. But more will come in the future. I'll put a 
> sample arm,scmi node as an example consumer in v2.

No. Post your DTS instead.

> 
>>> +
>>> +  brcm,mbox_rx:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Mailbox receive doorbell
>>> +
>>> +  brcm,mbox_shmem:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    maxItems: 2
>>> +    description: Mailbox shared memory region and size
>>
>> No, use existing properties, e.g. memory region.
>>
> 
> This is a region from the on chip memory. I will rename to be clear. It 

memory? so reserved region is for what? Not memory?

If this is memory, then reserved region. If this is not memory, but
MMIO, then you have reg for that.


Best regards,
Krzysztof
