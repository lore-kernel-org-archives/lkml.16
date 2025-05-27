Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE13FFD;
	Tue, 27 May 2025 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369728; cv=none; b=exuLhr5qr8QuxDpsGWNI8CfiHT2OdwdcuoPeigFcxMpyjpFl9xfnQ6KsYNRiObssYG27xGE8M6BRfacDdYA6gaYLzMOueHdkeRco4XUnKpdfJQflJk2eqL+jdZQgzlKktDCC5+tcsZTBxBf/+fiQ2CSwTbqXuVV7gwU8Y3a5p7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369728; c=relaxed/simple;
	bh=wyTPtsz4+3ra1RyixrCWgDLsRgUjFiTm2oJtL9t5Qhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=maGpZtsaqsiWNmRNKFFZtMMpZvMtZMgvZA7Ej5gS5Zu0WqUOK33Oat+Kj6mEXDfUZdVEzKL2OXlTtLwdIX9Q7ZjGMdm2/P7qJN5SmLljRzKMLJR/etJPNNw6MQVMuAO1l5tYmmdarHP0CWel67CwIQMbVsYafQKqv1R90+9BTrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LgsIiN8i; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LgsIiN8i"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RIF4qZ3029528;
	Tue, 27 May 2025 13:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748369704;
	bh=ZcqNJR+8VtW41JbCbTfke1fL6148OIWbmIsZ4Ld5R8Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LgsIiN8ivuotwzi99cArhQCpWe5Zzmmm4px+h2fS/yv38NvM22Rae7Q3nSC8Ok47I
	 pOe7poeaZYVZF2YSA4LeBzY8WigkzVTZTHiQnc1w1rqGYfDn2EP3+q7DpKmoF/y3M6
	 MXziNOUsVl6dfmhXregThLQFGcllGI5UOefCBylk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RIF4vD2831127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 13:15:04 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 13:15:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 13:15:04 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54RIExut3555206;
	Tue, 27 May 2025 13:15:00 -0500
Message-ID: <0fe3f172-5a88-4f1d-9eb2-7b748f9f6743@ti.com>
Date: Tue, 27 May 2025 23:44:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] TI: K3: Switch MCU R5F cluster into Split mode
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Beleswar Prasad
 Padhi <b-padhi@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <hnagalla@ti.com>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>
References: <20250522073426.329344-1-b-padhi@ti.com>
 <20250522155338.gpbcubkvygtju3qc@bagpipe>
 <5cfaed26-28ec-42dc-b9f6-836869ad3fa3@ti.com>
 <20250523114822.jrv73frz2wbzdd6d@falsify>
 <6f4b2271-7249-4285-9fee-1851135e1207@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <6f4b2271-7249-4285-9fee-1851135e1207@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 5/23/2025 6:46 PM, Andrew Davis wrote:
> On 5/23/25 6:48 AM, Nishanth Menon wrote:
>> On 14:27-20250523, Beleswar Prasad Padhi wrote:
>>> Hi Nishanth,
>>>
>>> On 5/22/2025 9:23 PM, Nishanth Menon wrote:
>>>> On 13:04-20250522, Beleswar Padhi wrote:
>>>>> Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 
>>>>> have a
>>>>> R5F cluster in the MCU domain which is configured for LockStep 
>>>>> mode at
>>>>> the moment. Switch this R5F cluster to Split mode by default in all
>>>>> corresponding board level DTs to maximize the number of R5F cores.
>>>> Why? I can read the patch to understand what you are trying to do, but
>>>> the rationale needs to be explained.
>>>
>>>
>>> [..]
>> I suggest the following:
>> * SoC dts files - use a common standard for remote proc - lockstep makes
>>    sense as it is right now
>> * Modification to board specific dts files - call them out as board
>>    files specific patches to flip over to split mode - while considering
>>    the possibilities that users may NOT upgrade kernel and bootloader at
>>    the same time and the existence of EFI based dtb handover from
>>    bootloader to kernel - which means, kernel should be able to 
>> handle the
>>    same combinations correctly. Also handle the carveouts correctly for
>>    the new processors - at least state the strategy - overlays etc.. 
>> Come
>>    to think of it, I think we should fix up the carveout strategy for
>>    user programmable remote cores first before attempting all this new
>>    processor additions.
>
> +1
>
> The core issue here is that split vs lockstep is a *configuration*, which
> means it doesn't belong in DT in the first place. This is the reason 
> to keep
> config out of DT, why should what mode my R5 core starts in be based 
> on what
> board I'm using? It hard-codes what should be configurable decisions.

configurable decisions is bootloader build .

and you know what you are building then change DT as well.


>
> Same issue with carveouts, so IMHO all of the: carveouts, mailbox 
> selection,
> timer reserved status, and mode selection belong in an overlay. It 
> doesn't
> fix the issues, but at least it isolates it.
>
Its usage model, and split mode is enabled at board level.

as default, split mode is used, in case lock-step is needed then change 
DT in custom build too.


Also, Patch 1/2 should be posted as different patch.


> Andrew
>
>> * Split out the fixes patches separately out - no reason to mix it up
>>    with the rest of the refactoring.
>> * Fix your commit messages and subject lines to indicate clearly what is
>>    impacted, rationale, backward compatibility status
>>
>> [1] 
>> https://lore.kernel.org/all/20250522071828.285462-7-b-padhi@ti.com/#Z31dts:upstream:src:arm64:ti:k3-j7200-mcu-wakeup.dtsi
>> [2] https://lore.kernel.org/all/20250522073426.329344-2-b-padhi@ti.com/
>>
