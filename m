Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE78258CEB;
	Mon, 12 May 2025 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046382; cv=none; b=hdde+OP4I9JX0KviTgbjxn0QJ1aDm2t1hdHWvBL+71TjCVR3uNkxr7vR5V1v4yLMXqqPfSMvRPo+VJ7LxcuEblkKRyRFnleBlLB2eXlS9PTjrobpyQUjc1At5QuECAk8WtVaTJiVw3i5pO/uODa3GWFfM4q1s8zWoAXXD3tYPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046382; c=relaxed/simple;
	bh=fhsyjR8QFHwu3idQVwqe5ohx0+Dd6OzfwXMSoVUKXA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzPr7Pkr6/YWBVxQ1O7X5fO2d5k8LfWW5Elp6I9YASj4YxLIjH4cgzkcXSjeAZQgsJvE5FgSQuwgJIKRyHCsu60Q7YWsULvxAvB5d3KRvuYi62FXMwfpboTrnfm7iSfw/RaO18gKVkIKQuK71jgDXkg870Z5Q2MfoXdfk88ICSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAyEhlsR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAyEhlsR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E3C4CEE7;
	Mon, 12 May 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046381;
	bh=fhsyjR8QFHwu3idQVwqe5ohx0+Dd6OzfwXMSoVUKXA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VAyEhlsReDz0EnSxSASu6bw+ipNSQ8lfCwiu8sHNERApVSkpIWZMfDx8nOGh3I/cs
	 blSaWM3g/ko4zQo/FA/BqY1n6oSWqFgtXFxyeDG4/AyAg55y7ZgYSxFaJuy7C2+zi9
	 nCS8hhnFU53sGUXjduYo3OEPCA3H8XuUT1ZdU2SMb3iLugG8zKrgB3suS3Doms158D
	 t6H3g5e2n3fbuFhwSnLgBeNuK9OBnpoKYB4JptJJXpUTnQCFZuU14j6lI6lCItUB5G
	 cf0eFWlZThkhrtOdv1g999BplT3LgKNFIuDypfkeK9678cb9ssETjUd4Oy93Jei2yG
	 3uJchDiuxQ2ZQ==
Message-ID: <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
Date: Mon, 12 May 2025 12:39:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
To: Nick Hu <nick.hu@sifive.com>
Cc: Cyan Yang <cyan.yang@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20250509021605.26764-1-nick.hu@sifive.com>
 <20250509-small-graceful-limpet-d0ea41@kuoka>
 <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 05:20, Nick Hu wrote:
> On Fri, May 9, 2025 at 2:40 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
>>> SiFive Domain Management controller includes the following components
>>> - SiFive Tile Management Controller
>>> - SiFive Cluster Management Controller
>>> - SiFive Core Complex Management Controller
>>>
>>> These controllers control the clock and power domain of the
>>> corresponding domain.
>>>
>>> Signed-off-by: Nick Hu <nick.hu@sifive.com>
>>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>>> ---
>>>  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++
>>
>> Where is a patch with the driver (user of the binding)?
>>
> We are hoping the driver can be submitted at a later stage.
> The driver that handles the MMIO is implemented in OpenSBI and depends
> on some prerequisite patches [1], so it will follow afterward.

This patch alone makes little sense and brings little benefit. Post this
with user.

...

>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  sifive,feature-level:
>>> +    description: |
>>> +      Supported power features. This property is absent if the full set of features
>>> +      is supported
>>
>> Compatible defines this. Drop.
>>
> The property depends on how the IP is hooked up to the rest of the SoC.
> Having this property simplifies the SW and allows us to use a single
> fallback compatible string, so we prefer to keep it.

And we prefer you to follow standard DT rules, see writing bindings or
talks on conferences.


Best regards,
Krzysztof
