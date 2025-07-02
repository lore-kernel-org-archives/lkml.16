Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5C2DE714;
	Wed,  2 Jul 2025 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751488243; cv=none; b=UhX7Wgv/UMuhczX6Fhi7PU/yc2CtvFzG+v7/3T0kKy14R3P/JTg5jDI94eDaqnVymwHOpCkninF1L2WX4tovyyDShB9Apotf4NeVc5r9siuqWlND7irXHo5v2xCp32qPA3oqX1o/q7yo2Q/vAFX7PV92/AGZgc6KgvMmT+q3WO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751488243; c=relaxed/simple;
	bh=40B926dekfZk7Pc/F4+emVpgtLxhyiFMEso0dncmUIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWge2T9iWqxeRe2fFvbQyXfX5jNBwHW1+ObGEC8CIYiVptqzPE9TH8BzEmXfPk+AnQdLHUWHAiLcglyVFTE/2J44T5YECvClJiNymmJtClgWEmF4GskSyD5ETjUW1A0wE8UMSkpxpXTKTzNxSBgAftGb4tn4ESxzaKwjbIaq4Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6AqKF+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6AqKF+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0023DC4CEE7;
	Wed,  2 Jul 2025 20:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751488242;
	bh=40B926dekfZk7Pc/F4+emVpgtLxhyiFMEso0dncmUIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p6AqKF+cwI6HQXTqSt5ZPVF9JLfz3+WXIMuVDLSo9DziV9jgI0nOlVDgMAESYW7gT
	 saIRoebpuGVzZMKWJ9qidFdeYouV7Bhvw0+f7s5MnZFIXeLkJsLaKIRxYORqpmOhLn
	 MNrFoqSKaSeLK0lwz1CtHvl6loQ5Kiqr/7xV6jr3oE9mpx3vbxdKHw6l2CkrXPBZg/
	 mKYkp2evTMXnnhatUO8zM+3ewUyONf+Lx1P7YAAiza+aPlhKaLDySnwAbtyxDCxl3c
	 EV6voz3nrjSW490VyW+CLJUFVhRvqaEj3s35hC7WZpVVnZLp/68ivxkpI6z05fUeun
	 YAHxOa0hOA6MQ==
Message-ID: <04a0d550-3fb4-4cf9-8adf-4ed54e3af7ba@kernel.org>
Date: Wed, 2 Jul 2025 22:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf"
 node a "simple-bus"
To: Jayesh Choudhary <j-choudhary@ti.com>, nm@ti.com, vigneshr@ti.com,
 devicetree@vger.kernel.org
Cc: kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org, afd@ti.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-2-j-choudhary@ti.com>
 <15da3051-c35e-4876-9185-9079493dc66c@kernel.org>
 <0c69137d-93ad-4843-8512-9885b9cba452@ti.com>
 <d8a8293d-2759-4408-b1a7-a2689383b043@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d8a8293d-2759-4408-b1a7-a2689383b043@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 12:23, Jayesh Choudhary wrote:
> Hello Krzysztof,
> 
> On 04/06/25 15:18, Jayesh Choudhary wrote:
>> Hello Krzysztof,
>>
>> On 03/06/25 16:32, Krzysztof Kozlowski wrote:
>>> On 03/06/2025 11:56, Jayesh Choudhary wrote:
>>>> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
>>>> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
>>>> "scm_conf" node to "simple-bus".
>>>> Also remove "reg" property as it is not needed by "simple-bus".
>>>
>>> This (possibly) affects all other users of DTS which were expecting this
>>> ABI. It's not only about forward-compatibility, but other projects.
>>>
>>> Maybe this doe snot matter for you, so explain that in commit msg and
>>> provide rationale why you are affecting other users.
>>>
>>>
>>
>> This should not affect other users of DTS. J784S4 already has this
>> change and it serves as a validation that DT nodes are compatible
>> with other projects (for example uboot driver handles it).
>> Other SoCs are being modified with taking J784S4 as a working reference.
>>
>> Considering this, do I still need to add something? Or is it okay
>> since I am not exactly affecting other projects?
>> Should I add something along the lines of "similar to j784s4...."?
>>
> 
> Gentle ping on the above comment.
> 
> I have checked other projects like Barebox. That supports TI K3 SoC
> but only AM62x and AM62L. Nothing in this series affects it.

Your answer is really not sufficient, just something to reply so I will
bug off, so I decided to ignore it.

This affects other projects - it is clearly visible in the diff. You
removed a compatible and you cannot do that.

Best regards,
Krzysztof
