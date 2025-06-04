Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB311EEA5D;
	Wed,  4 Jun 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028034; cv=none; b=TUF0fbM6IGMyb7T+s1Rr3sR7wKx4t4IA/rghNZc4ePN8xJIfFO1KA0QBolJqnL/RPv647JSi87TQ2nwpaMUcZaxg6cqt2ua5//5do8qO0zANVyj6rRPfm/JYDbEKQ1incPpJBEfkse+ADb7SErTpuUL+kPDJ9C/Wj+Q3ZM6n8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028034; c=relaxed/simple;
	bh=2LfvYBBuB61cvGqQ+O19xrEGVsNJSyMRqavEO2CEclU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtSL2vmIfUd63JeZoBlmN7iduVm8ziRgdl/mAe3qyRafQgIy8fEu3rYxQw8v/ZBWkSq9TM1n+V41whVNAtPGc1yoRSdkG2+pgH6Ch0nqW4GuOwdvRCXwLezWj4/EI1NOybOT6BUw5Eg/X+NOMB6uytp816IeN9GTGYlHmFSYJd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shd1f7LX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shd1f7LX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2C8C4CEF0;
	Wed,  4 Jun 2025 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749028033;
	bh=2LfvYBBuB61cvGqQ+O19xrEGVsNJSyMRqavEO2CEclU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=shd1f7LXEXsrT3HCLpzFlkPEyCNtZLHo8ypfjHX1HSsZ1NeQFEu6p2XiAEFTc6Bs7
	 KGKGSVstGO4gldoPMuNrLMphI5YCLpmy/5xpP9dIUHdefkp+Um0KP4Lfb9y1BZKeNB
	 946vprGXVkbXpW7LuZgzU313KNUq3ryTR9eGOolSD1dCgvI/kQyO0IxhZDnj6CxE29
	 6b3siIax+3Mzc10dXUyRegt45njWac5r/Ej2Bh1yVYBKRFAi8x7jseAgalXRgi/JzK
	 Mgzkj3fsYF8ZSnX0+NxO/Cth4WnZjp26inzW5vP21/dFdZ3tffJ9EwXZGDi63eBfjl
	 n3oNw2VN/q4gw==
Message-ID: <ab813159-14e1-434f-8055-80486f5d6b3f@kernel.org>
Date: Wed, 4 Jun 2025 11:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
 <aced65a2-937e-494d-a3bd-aa9b295f73b7@prodrive-technologies.com>
 <5ea091c6-7e78-4945-81b4-9b5c427d2e4d@kernel.org>
 <194f6c85-ad28-4217-b014-54bc64c6a9ca@prodrive-technologies.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <194f6c85-ad28-4217-b014-54bc64c6a9ca@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/06/2025 10:58, Martijn de Gouw wrote:
> 
> 
> On 6/4/2025 10:27 AM, Krzysztof Kozlowski wrote:
>> On 04/06/2025 09:04, Martijn de Gouw wrote:
>>> Hi,
>>>
>>> On 5/25/2025 9:18 AM, Martijn de Gouw wrote:
>>>> Make the PWM mode on the buck controllers configurable from devicetree.
>>>> Some boards require forced PWM mode to keep the supply ripple within
>>>> acceptable limits under light load conditions.
>>>>
>>>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>>>> ---
>>>> Changes in v3:
>>>>   - Fix typo in the examples
>>>> Changes in v2:
>>>>   - Add the header to the binding patch
>>>>   - Improve commit message
>>>>
>>>>  .../regulator/nxp,pca9450-regulator.yaml       | 14 ++++++++++++++
>>>>  .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
>>>>  2 files changed, 32 insertions(+)
>>>
>>> Does this patch need additional changes?
>>
>> What is wrong with the email you already received? What do you exactly
>> need from us?
> 
> V2 was merged rather quickly, on V3 there was only the Acked-by: Conor Dooley. So it's safe to assume V3 is now waiting to be merged?

So this was ping for merging of entire patchset, not that patch? There
is little point in pinging frequent and during the merge window -
usually nothing can happen now.

Best regards,
Krzysztof
