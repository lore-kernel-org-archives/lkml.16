Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D257EC5;
	Tue, 22 Apr 2025 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340353; cv=none; b=scPePaC6B8wjp/xksPjPgjcDch23QFlw8opvBkRb/Mu4JiZCW8haErdyZbKBLBNThNMxhdzNPs9KQKezx5O2yBlmRtj7UI4WOSph4nzHihfNayW5k6/U4lEgJC1ow/jbXiGUveWdOBLH5ssOjc7WjTswyYY5xDR7y/Fvm9daxrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340353; c=relaxed/simple;
	bh=6hYFaE0m5yq67AEq3oB4W81H+aPi7P48NCUcd4RgVGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G9dfPrajQt6p59ld5Nv2zHhF6QabgYyOcLnaIuf2twQu9RNV3IagSyGUtea+7HMT4jUyweM3e++HEVMyurp+vqijJnbWJXgucyb978zBV7Upz6EkmIfjyrsE9jC9YSTbPaBgItqJhGCOgnDUscwzJtMIUU5SUsFd5dsDLg2Pzs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yk++wuDg; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yk++wuDg"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MGjgEr1280827
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 11:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745340342;
	bh=TR1wne2z6M0V0X3ccLc0XGsWg0Ga+NHut6t6xs/k11A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yk++wuDgc5NBWyPrVnhcZUtVuEVBFYBQlwWw3MNmpaKKwn2N7Zrv5O7vl7RlE6hr5
	 /KIbE9x/daMdN/EJ0ixKVIpZ4qEnc5Lvq3l41PErThzBo2vO09/L+lBoLykzGBJ+de
	 /zCu/wuGvbl6vP6GYaFZRBjPUelBK6u01vTSLoqI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MGjgWE078413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 11:45:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 11:45:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 11:45:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MGjfx6051531;
	Tue, 22 Apr 2025 11:45:41 -0500
Message-ID: <39ead65c-0040-4a22-9cdc-081696b3d967@ti.com>
Date: Tue, 22 Apr 2025 11:45:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: David Lechner <dlechner@baylibre.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
 <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
 <b7f6570f-3b80-4fc1-8201-d44f5692867f@ti.com>
 <07bf9f93-deb8-48a1-aae9-a8a053680cc9@linaro.org>
 <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
 <8fe546e7-4fbc-4c63-ad0f-576ffb117508@baylibre.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <8fe546e7-4fbc-4c63-ad0f-576ffb117508@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/22/25 11:12 AM, David Lechner wrote:
> On 4/21/25 12:03 PM, Andrew Davis wrote:
> 
> ...
> 
>> Which parent device? That is my point, if the top level node for the
>> whole CTRL_MMR region is made into one big syscon, then a big regmap
>> is made that covers the whole region. All the child devices also make
>> regmaps covering their device range. Now these registers under the child
>> device belong to two different regmaps. No synchronization is done as
>> these are not the same regmap, regmap only handles this for multiple
>> access to registers within the same regmap.
>>
> 
> Why does the child device have to create a new/separate regmap? Can it not use
> something like syscon_regmap_lookup_by_phandle_args() to get the regmap from
> the "syscon" node along with 1 or more args specifying the one or few registers
> out of the full range that are assigned to that specific child node? This way,
> all child nodes would be using the same shared regmap.
> 
> (And yes, I know technically they don't need to be child nodes - just using that
> terminology to be consistent with the previous discussion.)

Yes, this can be done, and is done for a couple drivers today. The issue is most
drivers do not expect to be a child node of a syscon nor fetch a regmap with
syscon_regmap_lookup_*() functions. The vast majority drivers do the normal thing,
which is platform_get_resource() and similar, that gets the memory from the standard
"reg" property inside their own node.

We have then two options, retrofit all the existing drivers we might use with
support for fetching syscon regmaps (some drivers do not use regmap in the
first place, so we would also have to add regmap support first). Or we do what
we are doing here, which is to have these devices not use overlapping register
regions (which has the minor side effect of sometimes causing some nodes to
cover only small range of registers, which seems to be a problem?).

We went for the latter option, and it has been working fine for all our
new devices. And we are fixing the same for some of our older devices, we
are actually almost done with that too (if we could get this patch and maybe
two others in we would be completely converted).

Andrew
