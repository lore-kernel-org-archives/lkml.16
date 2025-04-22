Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39352258CF7;
	Tue, 22 Apr 2025 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311355; cv=none; b=nUVqbKCQRtMpk78P/gJf8cwDmL0ytCt34+SMbVs+XbMlND508OuCLcrkw7QBIzGxNQRPZzbzFuPaCAkU4YJNTrRBDYcQ5Iq861UmNnTfsfsCRqUn6FsKAeCDyY5au5fpUxrHbw426jLkpX/fIGYeJ/SQmar5pkQKcJgGCjEMHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311355; c=relaxed/simple;
	bh=HllI2mmo1MTRNB7i4U5FUDBsGrO/lRgawXYhh1xch5M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=hippl9AYHEe2HV5L1B8NR7ms3K2SubV2GeEhFun/BmTed1uyDlOIVZMh7aYgitlL//J6K7ixx2xbl+2JEmlHARi6WaqIFrssOZ0aT63v+0HhBN/KE2tNFc0TfxsmHakZ2yX4JIZUxXmx0TrB+zabsiD+h+4OSMO1TfkpxldjSMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KdrXX7D9; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KdrXX7D9"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M8gPit1164978
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 03:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745311345;
	bh=UwJf0BaT/sEyp931/8IreL5XjG62aGTsxqkYlNz021s=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=KdrXX7D9zqIiQ14yBd0rbXzb6qRSbY05SZ52sjo1xv+FiWHaTw809lo4EuvAvlzRi
	 AmXCqOCMt86k0OACa0UdPHfMr/kaybxXlBiouqfinlr780bXhW/oRcLzbVA8CsyV2R
	 GP4ZFX4SOkJE9OOADhHPDlaynAYPpaWqhbRm8avc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M8gPQw032312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 03:42:25 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 03:42:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 03:42:25 -0500
Received: from [172.24.227.220] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M8gL7d004161;
	Tue, 22 Apr 2025 03:42:22 -0500
Message-ID: <1ce1fc6b-fc16-4fb7-9f68-57b495aa5eae@ti.com>
Date: Tue, 22 Apr 2025 14:12:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] devicetree: bindings: mux: reg-mux: Update
 bindings for reg-mux for new property
From: Chintan Vankar <c-vankar@ti.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Peter Rosin <peda@axentia.se>, <s-vadapalli@ti.com>,
        <danishanwar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth
 Menon <nm@ti.com>
References: <20250304102306.2977836-1-c-vankar@ti.com>
 <20250304102306.2977836-2-c-vankar@ti.com>
 <20250304153959.GA2654372-robh@kernel.org>
 <66283781-69d6-4d0a-ada4-3a6bf4744a37@ti.com>
 <CAL_Jsq++DUv5_LHg7sPNXDJZ84JtS94Rwr-WAb9hDWp6rJqZLQ@mail.gmail.com>
 <11982b12-a359-467a-a6fc-e39adccca413@ti.com>
 <CAL_JsqLb5hrYD_-dqW5ELtbXohd8a1UL7nOuP2a9ZhE+3+f=eA@mail.gmail.com>
 <b6fdfe6e-dbd3-4dc8-acf2-f2983f150df1@ti.com>
Content-Language: en-US
In-Reply-To: <b6fdfe6e-dbd3-4dc8-acf2-f2983f150df1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Rob,

The reason to introduce new bindings for mux-controller is to make use
of it to implement Timesync Router. Timesync Router module provides a
mechanism to mux M interrupt inputs to N interrupt outputs, where all M
inputs are selectable to be driven per N ouput.

More details about Timesync Router can be found in section 11.3.2.1 of
TRM at: https://www.ti.com/lit/ug/spruiu1d/spruiu1d.pdf

Timesync Router is identical to mux-controller, but the issue to use
mux-controller subsystem for it is it's current binding. As it is
discussed in the series, drawback of this approach is, while configuring
mux-controller one need to specify every register of memory space with
offset and mask in "mux-reg-masks" and "idle-states" property, it would
be complex for the devices with large memory space. To overcome this
limitation, new bindings are introduced, which allows to define all
these values in the same property, making it easy to define and extend
the mux-controller node.

We tried to implement Timesync Router by modeling it as an Interrupt
Router. But that is not accepted, RFC series for that is at:
https://lore.kernel.org/r/20250205160119.136639-1-c-vankar@ti.com/.

Also we tried to implement it as a new driver in MUX subsystem, but that
is almost identical to "mmio.c" driver, which I posted it as this
series.

I want your suggestion on whether a new bindings can be acceptable and
we can use the same to implement Timesync Router, if not can you please
advice me on how can I implement it ?

Regards,
Chintan.

On 06/03/25 04:00, Vankar, Chintan wrote:
> Hello Rob,
> 
> On 3/6/2025 3:44 AM, Rob Herring wrote:
>> On Wed, Mar 5, 2025 at 3:43 PM Vankar, Chintan <c-vankar@ti.com> wrote:
>>>
>>> Hello Rob,
>>>
>>> On 3/5/2025 2:10 AM, Rob Herring wrote:
>>>> On Tue, Mar 4, 2025 at 1:03 PM Vankar, Chintan <c-vankar@ti.com> wrote:
>>>>>
>>>>> Hello Rob,
>>>>>
>>>>> On 3/4/2025 9:09 PM, Rob Herring wrote:
>>>>>> On Tue, Mar 04, 2025 at 03:53:05PM +0530, Chintan Vankar wrote:
>>>>>>> DT-binding of reg-mux is defined in such a way that one need to 
>>>>>>> provide
>>>>>>> register offset and mask in a "mux-reg-masks" property and 
>>>>>>> corresponding
>>>>>>> register value in "idle-states" property. This constraint forces 
>>>>>>> to define
>>>>>>> these values in such a way that "mux-reg-masks" and "idle-states" 
>>>>>>> must be
>>>>>>> in sync with each other. This implementation would be more 
>>>>>>> complex if
>>>>>>> specific register or set of registers need to be configured which 
>>>>>>> has
>>>>>>> large memory space. Introduce a new property 
>>>>>>> "mux-reg-masks-state" which
>>>>>>> allow to specify offset, mask and value as a tuple in a single 
>>>>>>> property.
>>>>>>
>>>>>> Maybe in hindsight that would have been better, but having 2 ways to
>>>>>> specify the same thing that we have to maintain forever is not an
>>>>>> improvement.
>>>>>>
>>>>>> No one is making you use this binding. If you have a large number of
>>>>>> muxes, then maybe you should use a specific binding.
>>>>>>
>>>>>
>>>>> Thank you for reviewing the patch. The reason behind choosing mux
>>>>> subsystem is working and implementation of mmio driver. As we can see
>>>>> that implementing this new property in mux-controller is almost
>>>>> identical to mmio driver, and it would make it easier to define and
>>>>> extend mux-controller's functionality. If we introduce the new driver
>>>>> than that would be most likely a clone of mmio driver.
>>>>
>>>> I'm talking about the binding, not the driver. They are independent.
>>>> Generic drivers are great. I love them. Generic bindings, not so much.
>>>>
>>>>> Let me know if implementation would be accepted by adding a new
>>>>> compatible for it.
>>>>
>>>> Adding a new compatible to the mmio driver? Certainly. That happens
>>>> all the time.
>>>>
>>>> I also didn't say don't use this binding as-is. That's fine too.
>>>>
>>>
>>> Can you please review the following binding:
>>>
>>> oneOf:
>>>     - required: [ mux-reg-masks ]
>>>     - required: [ mux-reg-masks-state ]
>>>
>>> allOf:
>>>     - if:
>>>         required:
>>>           - mux-reg-masks-state
>>>       then:
>>>         properties:
>>>           idle-states: false
>>>
>>> required:
>>>     - compatible
>>>     - '#mux-control-cells'
>>>
>>> I think it won't disturb the current bindings and keep backward
>>> compatibility with existing implementation.
>>
>> Wasn't that the case before? There's nothing really different here.
>>
> 
> No, the binding before was not considering "mux-reg-masks" as required
> property which was breaking actual dt-binding. In this binding, one of
> the properties from "mux-reg-masks" or "mux-reg-masks-state" is required
> which keeps the binding as it is unless someone wants to use
> "mux-reg-masks-state".
> 
> Regards,
> Chintan.
> 
>> Rob
