Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F82153E8;
	Thu, 17 Apr 2025 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873124; cv=none; b=U56R9rgwa3Ko/bU3GRGRJrgCLvmOQwzwPrOH8R83A5rCpeCI8gDO9T7pWpcFKYpgqkMbUYubTX/zajjFOAqBJvMsL+HA8BZKBdZxT2q+8ijwQOLXIAfPr8uGggilHeyjqSu7YkxfEXjyuS3jZofOeEKcqRDm5HJnHTzEzx42muY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873124; c=relaxed/simple;
	bh=M8uhNaUfmeUfmXvJOijmkV9Vyu1HDRBd4RGQBNHkCwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxhMVfLM8/bA5YSX63AaH/L17w2NLNerLWU1J8BICfoaYr8HyBpUXNGxAMb43ABT0XO0cSYSSAsC5c2xD5XLkwkTsDoGSU0hY4pNDD4eEDa5m/wSbrZlmbC0cEhKVHwR/mr7AsItd2aRcePTIrOhLfwC4LGeYUTGy8opPUhuo10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdOtQtMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdOtQtMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE74C4CEE4;
	Thu, 17 Apr 2025 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744873124;
	bh=M8uhNaUfmeUfmXvJOijmkV9Vyu1HDRBd4RGQBNHkCwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NdOtQtMA1jsQ37MWkDC+nxveJNU226XU5TVyph3Esd5oOMolljHxa8HGtmzToKw78
	 R4Ta5snFJPGUhPuPIP5vPzlLg+T89NMzWdKXMVNhUe6/sr1P9jh3IyCSYbbLYebhnX
	 SBM+/KzTeu0mIyxvtiT4boW+ftgywy1g667fugvJJ+1Ddq6q6ihG5365+29wpK1udj
	 fwzL/S/Db0kvZoV6RxE0ntD+4R+KbLgdodeAdlwljlVRsn5oD9lLcq+wvjFOHEEqXj
	 LmrN2rKUB9F0Gc/LjcTwR+Wuj042TExn5I1eGp6mqqrl7RXij0LEnReKV4U4ZqlDv4
	 4GsLC/qj24RLw==
Message-ID: <b90c05e9-feb7-4569-b79a-b623e535c1d0@kernel.org>
Date: Thu, 17 Apr 2025 08:58:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, maz@kernel.org, kajetan.puchalski@arm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fugang Duan <fugang.duan@cixtech.com>, Guomin Chen
 <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <74b9fc25-0815-4ece-845a-5f730c87fe78@kernel.org>
 <aAChkWPn4ThMx44A@nchen-desktop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <aAChkWPn4ThMx44A@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 08:37, Peter Chen wrote:
> On 25-04-17 08:18:44, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL
>>
>> On 15/04/2025 09:27, Peter Chen wrote:
>>> +
>>> +             mbox_ap2pm: mailbox@6590080 {
>>> +                     compatible = "cix,sky1-mbox";
>>> +                     reg = <0x0 0x06590080 0x0 0xff80>;
>>> +                     interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +                     #mbox-cells = <1>;
>>> +                     cix,mbox-dir = "tx";
>>> +             };
>>> +
>>> +             pm2ap_scmi_mem: pm2ap-shmem@65a0000 {
>>> +                     compatible = "arm,scmi-shmem";
>>> +                     #address-cells = <2>;
>>> +                     #size-cells = <2>;
>>> +                     reg-io-width = <4>;
>>> +                     reg = <0x0 0x065a0000 0x0 0x80>;
>>
>> Messed order of properties. Keep it consistent (see DTS conding style).
>> Other nodes also have oddly placed reg.
> 
> Thanks for your reviewing, Krzysztof.
> 
> All the nodes mailbox and shmem (in mailbox) are on the same bus, so
> I keep it by unit address in ascending order like DTS coding sytle
> says. I think below rules are two options, isn't it?

You speak about nodes I wrote about properties. I don't understand how
your question is relevant to my comment.


Best regards,
Krzysztof
