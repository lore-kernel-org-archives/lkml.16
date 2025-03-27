Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD7204F76;
	Thu, 27 Mar 2025 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064819; cv=none; b=iXzFicyNN46vhXRGaqKYatyDT+r/MGg8S7iT5TnNmjI+pKS6IjwlOkCFkv/He99XbNseSBav0AG/l1DLfhsWzaBfT6rF3tXLbDUd0xx6vTBfMMyXqY49VtkWQU3i/Q5mjuozleYB+YVo4ii37y/CXEBS2/ErmsJ3IIYWgUnoC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064819; c=relaxed/simple;
	bh=M7YLTOwmxz8VNCLJQrpSFgrai1rDE44BnsnAtSQ+8g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SO+5oNEkQcCTV/G76mNq+YjusLAibrsgtgiaRjJAAC6oPfmfDqhotr9vHSkUr3J4v/3uEolfCJg2XPhtqgmFHcj6ncIh3sMjN7qqoJt0dD2bTrMU9jwafyvR9SNwc+SZfoo7XBjYLb1NBGIBe1z0HkDImIuaHVoyEjouPe8xlXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bdf6RvOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bdf6RvOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD14C4CEE5;
	Thu, 27 Mar 2025 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743064818;
	bh=M7YLTOwmxz8VNCLJQrpSFgrai1rDE44BnsnAtSQ+8g8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bdf6RvOvjEYGXlZr9JhtetcwgGmZLV4uKQvjuyvEWbnJDYHu1tbclQY2tjfznu1FQ
	 zbi/zRNqFeRhmiWVpaxPSug73eKw25hU31ypTmaQdw5i+07Mrz9mUdnaYloqrCOOEk
	 XfkG/SAOQm6ZDkq/7ym88pdQ6V0qQdDpkqqWkA3daJmzv1NzZCxCFJhvi1nIiRye/o
	 CeqnIvKDHUSDBA2gq11N2l8n3Qj1bSrH/qNyrw5S1OF4nLwiGyGxUCRdyRd6KIzI4Q
	 EQnfw5OfTtxqYFyHJXw3aPv6KurYyzCbqi0oUtmQX+D5/BBRr2R6QURTVmZ1FU/lJb
	 AOQyB4RR4EBDw==
Message-ID: <b2e1da92-0dfe-42c6-9f36-32486b768220@kernel.org>
Date: Thu, 27 Mar 2025 09:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
To: Peter Chen <peter.chen@cixtech.com>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl,
 kajetan.puchalski@arm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fugang Duan <fugang.duan@cixtech.com>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org> <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org> <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
 <Z-UNufwSNmZreKya@nchen-desktop>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z-UNufwSNmZreKya@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:35, Peter Chen wrote:
> On 25-03-27 08:16:33, Krzysztof Kozlowski wrote:
>>>>
>>>> No, you are deliberately choosing to make this platform useless.
>>>>
>>>> That's a bit sad, and a waste of everybody's time.
>>>>
>>>
>>> Hi Marc,
>>>
>>> Thanks for your interesting of our platform, and your comments
>>> help us a lot. But I don't think it wastes reviewers and maintainers
>>> time, a clean patch set saves everyone's time during upstream process.
>>>
>>> For how to organize the patch set for SoC, Krzysztof gave good summary
>>> at [1]. We are going on upstream [2], this patch set is just a start
>>> and base but not like you said for marketing purpose.
>>
>>
>> I do not think I suggested in [1] to ever send new SoC containing only
>> CPUs and interrupt controller, without even serial. My instruction [1]
>> was how to organize it. The DTS can be even fully complete, see the
>> upstreaming example I have been using all the time - Qualcomm SM8650:
>>
>> https://lore.kernel.org/all/20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org/
>>
>> Entire SoC sent to mailing list on the day one of public release of that
>> flagship Qualcomm SoC. The SoC DTSI and board DTS have almost complete
>> picture, except few trickier pieces... but it even has full display and
>> GPU! Plus, as I explained on my email on samsung-soc, that DTS/DTSI
>> patchset references all other bindings with their state, so SoC
>> maintainers can understand what is the overall progress and what will be
>> the result in DT schema checks, if they apply the patchset.
>>
> 
> Hi Krzysztof,
> 
> Like I said in this thread before, without this initial support,
> we can't even add mailbox binding that the dt_binding_check will
> report warnings/errors [1], the reason is "cix" has not existed
> at vendor-prefixes binding. How we handle this dependency?

Not different than all other SoCs. There is no dependency, you just send
your patch and tell where the bindings are. Just like I asked in the [1]
you linked on samsung-soc. Just like all Qualcomm upstreaming goes, e.g.
SM8650 I linked here.

Just like maintainer-soc profiles are explaining. I told you to read
them on IRC.

Your way is contradictory to three sources describing process and two of
these sources - my samsung-soc posting and maintainers-soc-clean-dts
profile - are known to you.

> 
> I thought we need to move one step and step before, and keep clean
> and avoid warning and error for every submission, but it seems not
> the way you prefer. 

No, from where did you get such impression? Maintainers-soc-clean-dts
explicitly covers this case and I WROTE IT, so how can I prefer
something else?

Follow SM8650 style or what's written in maintainer soc profiles.

Best regards,
Krzysztof
