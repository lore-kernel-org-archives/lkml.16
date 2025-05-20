Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1B537160
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747708138; cv=none; b=uQTsJll4tvTNtYD/5fUsGOm8C2SuoDTJQ+/KjsZA6YNIn984oSm4ztEark76uBlgaRvpVYJHvyDDunZHNZc0gIBvmP13g77A3xAsVTtAPEsPievZUfK5taZM5upZTed2NfEXg3UvCVIq9srUKRE1ZwqYUNMOwTtayqdFGSjBb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747708138; c=relaxed/simple;
	bh=o1tvgUU/M4qqpPOczUSFTplzNAkmXw1q03kHBXA9INg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KmTcsDjPcLb2ASQXqGfrqnN+/iY9m5eD2c/Yv61Zmlni9fvmqQs4HjJjdVmFTqvxeWrjKiGwh1SIaKDa5zySeu+S3lcLcT1zJffXHR6kIbotDQV4XHx/02qAPdXBLfRgoGmlei/OStRf3qqh0YbYnvSEtgpnV2UjNf8wpgs/X1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=woLq8KcQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="woLq8KcQ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54K2SjRT1064816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 21:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747708125;
	bh=7ztqKvXs9iP0NaCndZ0ZJgG3h2dkOj1IbmrmphDxVbw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=woLq8KcQ+ekQtl+EsYJviA6pcEdnK9F70dsAJRBCO0WvnvKN6SF/AoWPD8rka6K0K
	 uBOB52C7aQBSjcESmlIbbz203OfppVTcHqE4xEMVL4/UgyFlR9qfocshEvMVZ9XbtY
	 6tvav1aVrI9UvH97Z+ZZxoP/rCebD9qIUPnJs3E0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54K2SjSB116187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 21:28:45 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 21:28:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 21:28:45 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54K2SjDY067028;
	Mon, 19 May 2025 21:28:45 -0500
Message-ID: <125293c8-c5a6-4fa8-bf5c-4da8d2fbf510@ti.com>
Date: Mon, 19 May 2025 21:28:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] regmap: Move selecting for REGMAP_MDIO and REGMAP_IRQ
To: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-kernel@vger.kernel.org>
References: <20250516141722.13772-1-afd@ti.com>
 <5340db48-f7cb-4c81-ae2b-2fdd31694416@sirena.org.uk>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <5340db48-f7cb-4c81-ae2b-2fdd31694416@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/19/25 5:12 AM, Mark Brown wrote:
> On Fri, May 16, 2025 at 09:17:22AM -0500, Andrew Davis wrote:
>> If either REGMAP_IRQ or REGMAP_MDIO are set then REGMAP is also set.
>> This then enables the selecting of IRQ_DOMAIN or MDIO_BUS from REGMAP
>> based on the above two symbols respectively. This makes it very easy
>> to end up with "circular dependencies".
>>
>> Instead select the IRQ_DOMAIN or MDIO_BUS from the symbols that make
>> use of them. This is almost equivalent to before but makes it less
>> likely to end up with false circular dependency detections.
> 
> None of these selects should actually do anything since the symbols are
> themselves selected?

I was thinking the same, but turns out (and I had to check to prove it to
myself) that "select" actually follows up the dependency tree. So unlike
"depends on" which is weird(broken), "select" functions in a sane way.

Andrew
