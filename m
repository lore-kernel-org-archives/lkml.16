Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48301C701C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841118; cv=none; b=NKLKQIDngSZ8AAK6T/gVl7XplmnNCVETfbTDgVRHwniBES79KTFXOdH3Pxw446MAMDd3oEFm2N8QvNCc3pGmWfuTkACBnpfFwz6ZN4rf+mv/TWajUPIj0HWrmReg2OEUQlD/Ncji9tIrmviMIj0SOWHi0zE7S9OODbOgNBMrE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841118; c=relaxed/simple;
	bh=b0BKIjVW6neArcTQ7WOTImoG1e7nWySNFFlFAeoXa8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFIZYT9b9MP9a6Sm6vcXluh3AgtRPMz/BQX0PEnO4f7aN5H3fVngni+O9mhayW5bMsuBOtX+jQDfPx0LoOGSWceaj0yGYjPMP81pnADQqPNPyOvzEg/RU8+Y4lfYV2InlHdL2t0elH9K3ZOgOervr14nb11nWjqtKFfrS86dL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1+PSxv4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1+PSxv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D013AC4CEE4;
	Wed, 21 May 2025 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841118;
	bh=b0BKIjVW6neArcTQ7WOTImoG1e7nWySNFFlFAeoXa8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C1+PSxv47UT6Wc5H6vsuw+4WstD/HvfpwYJCkyjen56M+oysYXgaqlBFGmuHcDzsJ
	 Uh2LpcZl9jDJ19NoFRFJMtVjHhz5IloNCldk3ktZ0x0WnYg5TKKBmZkny64Vrmu5zT
	 PXbFoLn8Bb73/iUKTl4nZ3IzvhBsACn7OgBT3JqXyUvw7H9JVISkflLf9fOV+PEwQ5
	 o5YjmsCdvnDi9Qq4rFnTqQ7ejJezfdHv1/52inTupM+W/CUjoho87U1Ioap1niYbBI
	 BHrev1hZ2ie/wUouCErlwVk24gr4lhjaUqJvSsEcy0GSPoAEE8AuquZnvZRrL0ycFp
	 UW7aBKBwyhf3Q==
Message-ID: <a2a619f9-d6ca-419d-af11-e41b6ae59a48@kernel.org>
Date: Wed, 21 May 2025 17:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] mux drivers improvements for v6.16
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Mark Brown <broonie@kernel.org>
References: <20250513105058.27028-2-krzysztof.kozlowski@linaro.org>
 <f6f2fa8f-3502-4739-a977-14dd0a63a25a@kernel.org>
 <2025052102-estimate-algebra-c15c@gregkh>
 <a15a54e4-e6f2-4e63-9fc5-141d0e2b010b@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a15a54e4-e6f2-4e63-9fc5-141d0e2b010b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2025 14:19, Krzysztof Kozlowski wrote:
>>>>
>>>> ----------------------------------------------------------------
>>>> Andrew Davis (1):
>>>>       mux: mmio: Do not use syscon helper to build regmap
>>> I received LKP build error report for some specific configuration:
>>> https://lore.kernel.org/oe-kbuild-all/202505150312.dYbBqUhG-lkp@intel.com/
>>>
>>> I will send a follow up fix for that and then later updated pull
>>> request, if you do not pull it till that time.
>>
>> I've taken this now, do you have a fix somewhere?
> Fix is being discussed on the lists, because it exposes Kconfig circular
> dependency:
> 
> 1. The actual fix which also tries to break circular dependency:
> https://lore.kernel.org/all/20250515140555.325601-2-krzysztof.kozlowski@linaro.org/
> 
> 2. A better way to break circular dependency:
> https://lore.kernel.org/all/20250516141722.13772-1-afd@ti.com/

+Cc Mark Brown,

Above circular-dependency-break (2) was applied by Mark for v6.16-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?h=for-6.16&id=c5a219395b4e6312102a505bfe73aac8f8bada8c

This means that my fix for LKP build error, should come after. My
proposal is to live with the LKP build error till v6.16-rc1 and then
apply my fix. I just sent v2 of my fix for LKP build error:
https://lore.kernel.org/r/20250521152354.92720-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof
