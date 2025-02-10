Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D9257422;
	Mon, 10 Feb 2025 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211812; cv=none; b=mDetlEsxNJ63msyej3cXro66kIfchc4abYcGqHENuaV2Qf0HKk/UMaSBytSfNXXVks1wg4CdrdnZGDkw0fOwdFbKkmtNsiwFdUSuWlHn3tKF8w1lmn2bjroOZuF0pnzfWL2CVqlNgI5oYS0CkvPUsP9S2IerLZGkHLzKRSEWOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211812; c=relaxed/simple;
	bh=acd9COQLFDN5gRd5/GOJ2Ge9i2RRPpwPQsPAyv1SxtY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=c9gW9/dEsp6T1fUzBFzN/l70fRKpoqd9M3LVzbbhw8/I3NQMUt0LDgmWLcJbu9baSFlvcGOCtOoF4coBl+2UwR5qMiXGIKHrFvmi2ScoanH/JgXARj4hb2ff9QSLK/bUdscwDMS76cLhMdM+605NH6TPEXmlJHPzmXdyaPBP8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=KzB7fxZt; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="KzB7fxZt"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739211802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdqhCB4hXabwkdtEITMDy97ItQnEBoqzYanBuxH4qII=;
	b=KzB7fxZt+phnih+KMdT/jFC0YLXuIQhPmG8vJjua9rAgZ1NtFI3C6JlbR0BRirFJqzAsT4
	rtG60hlkMhJ8vZm8pKh8/jDC/mpnoXRWHhwljYZiMl2hfXqLSTeFp4mA7GKsdaqbbCMaSG
	Uoj9iwRa4i1mpLsUOVCEOYiWG72c636UWOx8q2wn3V8bgu3YXH5MgAX/3Ikd3vaayFBKlI
	vHKGEZFkcohZ0P7gxQpOvSFxrAanDqYd/obwH1nFeVNfhlIU7pJLXXKKc0k5NtibPaCO70
	Qyww5e6cL+5dU6zAw40kcCmvZyxeXAS8nCMCibjlabJcaQsS4tMswhYMX47KXg==
Date: Mon, 10 Feb 2025 19:23:22 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki
 <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] arm64: dts: rockchip: add overlay test for
 WolfVision PF5
In-Reply-To: <9615521e-8a2a-44d7-99ea-5571f5de1e57@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-1-a70819ea0692@cherry.de>
 <ef9133d217bc35f611ef390da8042510@manjaro.org>
 <9615521e-8a2a-44d7-99ea-5571f5de1e57@cherry.de>
Message-ID: <3cadb698a9bf7a898c91c0d851233ac1@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Quentin,

On 2025-02-10 18:56, Quentin Schulz wrote:
> On 2/10/25 9:46 AM, Dragan Simic wrote:
>> On 2025-02-07 16:19, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>> 
>>> The WolfVision PF5 can have a PF5 Visualizer display and PF5 IO 
>>> Expander
>>> board connected to it. Therefore, let's generate an overlay test so 
>>> the
>>> application of the two overlays are validated against the base DTB.
>>> 
>>> Suggested-by: Michael Riesch <michael.riesch@wolfvision.net>
>>> Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> 
>>> ---
>>>  arch/arm64/boot/dts/rockchip/Makefile | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>> 
>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>>> b/arch/arm64/boot/dts/rockchip/Makefile
>>> index
>>> def1222c1907eb16b23cff6d540174a4e897abc9..534e70a649eeada7f9b6f12596b83f5c47b184b4
>>> 100644
>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>> @@ -170,3 +170,25 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s- 
>>> orangepi-5.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
>>> +
>>> +# Overlay application tests
>>> +#
>>> +# A .dtbo must have its own
>>> +#
>>> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <overlay>.dtbo
>>> +#
>>> +# entry, and at least one overlay application test - ideally 
>>> reflecting how it
>>> +# will be used in real life -:
>> 
>> Hmm, what's "-:" actually doing in the line right above?  I mean,
>> it's a minor nitpick, so might be worth addressing only if there
>> will be the v6...  Also, "test - ideally" might be replaced by
>> "test, ideally", because splicing sentences together using em/en
>> dashes is generally frowned upon. :)
> 
> That was supposed to be an em-dash yes.

I see.  To explain it a bit further, here's how hyphens, en and em
dashes should look like when an unproportional font is used:

- When it comes to hyphens, it's a somewhat-limited option.
- Using en dashes -- as visible here -- is a bit more involved.
- If you use em dashes---like here---it gets borderline ugly.

> , and at least one overlay application test (ideally reflecting how it
> will be used in real life):
> 
> Would that work? I don't like the : following "ideally reflecting how
> it will be used in real life" as it applies to "overlay application
> test" and not the end of the sentence.

It works, although I'd suggest that a comma is added after "ideally".
Technically, it would be better not to use parentheses here, but it's
still fine.  Though, here's another option for the wording:

   , and at least one overlay application test that represents
   the overlay's intended real-life use:

>>> +#
>>> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application 
>>> test>.dtb
>>> +#  <name of overlay application test>-dtbs := <base>.dtb
>>> <overlay-1>.dtbo [<overlay-2>.dtbo ...]
>> 
>> As another minor nitpick, I'd suggest that
>> 
>>      "<name of overlay application test>.dtb"
>> 
>> is replaced with
>> 
>>      "<name-of-overlay-application-test>.dtb"
> 
> OK.

Thanks.
