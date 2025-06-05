Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79764202C2D;
	Thu,  5 Jun 2025 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749155447; cv=none; b=YcXLQGIbMdOqofucEeZx8dagJn+icGvlohGpWAF3nY4VmCPSwVyXbIWYxeWGEeJFEntd/y3CbkwxR/fE2imryTS8NP4j+gJNbJp/rvdmsn14AeDcUc7kT7a1BDPPqMuQZlHe1qqF5UP61OokXHGtm2Nj7/NxkYAsHXHaWMWPsIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749155447; c=relaxed/simple;
	bh=bv0xFgLcZNNYnV0+6JE5/3qYI/y7M2/uLuyVgvXsdDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fj5zTL6sxTMKI+5FJlBIGRDBFyZEzV4r5tooFq+MawwGld96S1HxG/9cX7fzEhuv+Qb2e657pPf05HuyX7PqaUiABIicHJNIentLKL5JX2P20A0sWLLWsWJKNOVp66TXsShz3FoKbtApimfHC9qc8535SyKEtdy5FKONoFFXaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMBVX7VW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMBVX7VW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C17C4CEE7;
	Thu,  5 Jun 2025 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749155446;
	bh=bv0xFgLcZNNYnV0+6JE5/3qYI/y7M2/uLuyVgvXsdDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cMBVX7VWG55izBQYKOvnv+nhhRJ5MH0Wab48RdreVFHrmW1Fs2zxVa0JNAiz8OpUI
	 cwpzT6hXNxjT9lnUHpWpKogAaySOwlX9Dsz9bwdwV7aR/VmvSu0p2aQdggsOTI63RX
	 2jzNknvau7mD6kwfN05nExyh+SJV65TuWITYKatjTj4cx2Tu2IoUeVeeLGRZBNSv6R
	 /C98oD///1ILjFW3oA9xmqs1lIBxiag7HhfmPZpv/LrUDW2JTkLWlnvfth6nJxkRNo
	 WfhhlyVEyct+8pMX4MeDh/XAsIK/nyJsHo/JFhcTYYnyA75udGHbg/LhlS/hLz67xV
	 y6yfQTtVv8D7g==
Message-ID: <86b6c9a8-5ecf-4aa5-a6cf-afee64d28efa@kernel.org>
Date: Thu, 5 Jun 2025 22:30:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, justin.chen@broadcom.com,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
 <20250523184354.1249577-3-florian.fainelli@broadcom.com>
 <20250605185557.GA3023589-robh@kernel.org>
 <ac57663b-3bcc-42ae-898e-06592d417715@broadcom.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ac57663b-3bcc-42ae-898e-06592d417715@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2025 21:10, Florian Fainelli wrote:
> On 6/5/25 11:55, Rob Herring wrote:
>> On Fri, May 23, 2025 at 11:43:54AM -0700, Florian Fainelli wrote:
>>> Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
>>> has been defined, we can greatly simplify the matching within the driver
>>> to only look for that compatible string and nothing else.
>>>
>>> The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
>>> register layout since that is the most common nowadays.
>>>
>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>> ---
>>>   drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
>>>   1 file changed, 3 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
>>> index c87b37e2c1f0..ec4c198ddc49 100644
>>> --- a/drivers/memory/brcmstb_memc.c
>>> +++ b/drivers/memory/brcmstb_memc.c
>>> @@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
>>>   		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
>>>   	},
>>>   	{
>>> -		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
>>> +		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
>>>   		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
>>
>> This entry is pointless because the default will get V21.
>>
>> In fact, I don't think you need the new compatible string at all. It
>> doesn't work to add fallbacks after the fact.
> 
> I agree and would prefer to keep adding new compatible strings which is 

So you agree that adding such entries is pointless?

> what I initially did here:
> 
> https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> 
> but the feedback was that this should not be done, and hence this 
> attempt at defining a compatible string that would avoid needless churn.
> 
> So which way should I go now?

And the advice was to use v2.1 fallback, not replace v2.1 with something
else or keep adding pointless entries:
https://lore.kernel.org/all/2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi/


Best regards,
Krzysztof
