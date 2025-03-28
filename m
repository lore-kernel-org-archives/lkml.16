Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB11DE883
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187018; cv=none; b=A+HYpuf3CRXvzihktmW3bBt4YG5PpabEPXqTQEpfSMWRMl/IY56GJ4hD/knVDIeCid2z/aLmMPvYhxNjdYBKr4XUo3ZZFfUtY6H3jZ8j067bYvRaSmbkzwEiPxLyJryLpNWZk8OubM8PnDyO4oa/VZvUVH1LcrmPHlKmCp1eZyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187018; c=relaxed/simple;
	bh=67PK3n4bqj/CsMfAEX9bEQwAneGMkwuCNWhLy8ni5Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEzGUHtRAPe+lOYtwJpUueRFv4iMdHX1i7JPrTznOsi/x6i8Rm5Cm+zx6HYg24cloMpGvenuVxMlbak9MnaMmvGIe1RJRlj1KpY9xMCUuTHDxzFR6n11APFdgq6ILaJ6kpy29XRRTVrWaUnBgNHGjz3YRLLAeZhlSK/HueS9Xas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ew11QesV; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ew11QesV"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c14138668so671337a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743187015; x=1743791815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTevsMP8EFw9pFW0FnKHOEWZb8KNpwVOa+vD8CP4lvw=;
        b=ew11QesVKvCQO8cohNVC/oR0AxhAxVbq9C/2BpisOKn1mLL4q2lmQIY8FPqqn5wgV1
         YzQ3++1c0+sIyWycAhrV3OECV8R/vQVp4M8ievtrk+9uRjaJO483fCQryaAwiql7q73w
         /abSNvmnLsfLkdBRMeuh6RDS33mzwyaaXw9HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187015; x=1743791815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTevsMP8EFw9pFW0FnKHOEWZb8KNpwVOa+vD8CP4lvw=;
        b=s2NQ2t12BCA1DtpGip+crbiaUU4wKDVbsLL+VejNLF/doN/ZuG13GzRU6oli5b09ol
         hxO3M6PUhWOclmBhxo98+1BEIb1LQlkgjPGzGBviyFRSo5SYEmxL5UwhfRUoluf/4SEk
         3qjZ7kGctTscPYaxw3PtkuY01L971Cozvm1HI8BfNVfGcSMUYFTatva+dIkDTWeSCRRM
         E6hZ59dLcufWnOFiMsMtrtnt7hqncalq+TIbEoyA1pmTA8kjH+pWVUDhdra5v5KrjSnp
         2ky9twQ+A+rvQIUj/wEXG7c/9i+cZacfnXjyL1S4irYuuoatLha22Mry9F7ap6WhNkpl
         KeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU+XIc0hLbK21Vdz3R1UfhnL/Qgk/9cHMfRq8XAENZXxwurmO0+bDUgNOp268rKBoQcnnvwG7KzuBIMTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxda357KMDosYmQlJtEqipRuA6DBH0KzWnQREV0SvtabSIJse3
	VYMlg6lIvaf8GVzwmbNZdI8WVu3UxM1EBDAspPsN32ZU9f6LPWYOeoRVBU9ZHA==
X-Gm-Gg: ASbGncu3TlXeeuc4G/tgSD7kKZ9qqsjaf+GgKuDU6zBsieDK4+vPvhI9ZoTpV0MtGTt
	Oxw/VHWVk98yWsix0ZU80yWH01qHZB5HMz292tevUE6EbrHz0nSmJscWgbsKoG1Ti7Md4idRK26
	OvUfUOU+LwfZt2jyvuXsaaKdgEumCIErBLTmP1AmX4eTLR4nqW0/lnJbiITEGpy2om9HBSsWpQf
	4UJXnlnzHHS08HGEKPKLDwBSmTizQMuRS1cdFE77+6rLZiB9j5YP65DqQb7oGxz9jXAzDMz+m2h
	wx4Sn9UjxMMzWMBITBI1vS9cQcxunF+KSXoTNaJlolef2jk+9WW8IFuM5S/LX4GKmxcyKNPLMga
	ecdbAMCZOy/rFMiRbyypT6fUP
X-Google-Smtp-Source: AGHT+IGmQMxc5/VNAGaWO0hCH+f4b8Q7SahIFp1LbdONT1qeOv/xmmAOcYnZj4hKpZi0xZdpvJ8x5A==
X-Received: by 2002:a05:6830:681a:b0:72c:3235:3b97 with SMTP id 46e09a7af769-72c6380774dmr326621a34.22.1743187015058;
        Fri, 28 Mar 2025 11:36:55 -0700 (PDT)
Received: from [10.69.70.230] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c58267b79sm460630a34.47.2025.03.28.11.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 11:36:54 -0700 (PDT)
Message-ID: <cb0905ec-1e80-4c56-befd-b90243dcfa31@broadcom.com>
Date: Fri, 28 Mar 2025 11:36:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: Add devicetree binding for
 bcm74110 mbox
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250327221628.651042-1-justin.chen@broadcom.com>
 <20250327221628.651042-3-justin.chen@broadcom.com>
 <e7f51014-10b2-4f9c-9929-f2a4f32b023c@kernel.org>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <e7f51014-10b2-4f9c-9929-f2a4f32b023c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/28/25 12:31 AM, Krzysztof Kozlowski wrote:
> On 27/03/2025 23:16, justin.chen@broadcom.com wrote:
>> From: Justin Chen <justin.chen@broadcom.com>
>>
>> Add devicetree YAML binding for brcmstb bcm74110 mailbox used
>> for communicating with a co-processor.
>>
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> 
> Bindings are before users, see DT submitting patches.
> 
>> ---
>>   .../bindings/mailbox/brcm,bcm74110-mbox.yaml  | 68 +++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
>> new file mode 100644
>> index 000000000000..139728a35303
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/brcm,bcm74110-mbox.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM74110 Mailbox Driver
> 
> Driver as Linux driver? Drop, bindings describe hardware.
> 
>> +
>> +maintainers:
>> +  - Justin Chen <justin.chen@broadcom.com>
>> +  - Florian Fainelli <florian.fainelli@broadcom.com>
>> +
>> +description: Broadcom mailbox driver first introduced with 74110
> 
> Same comments.
> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - brcm,bcm74110-mbox
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#mbox-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is channel type and second cell is shared memory slot
>> +
>> +  brcm,mbox_tx:
> 
> No underscores. See DTS coding style.
> 

Acked. I already had this fixed in the driver, but not in the doc. Woops!

>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Mailbox transmit doorbell
> 
> Why is this needed in DT? How many instances do you have in one SoC?
> Where is the SoC DTS?
> 

We have 3 possible instances in our current SoC. We currently only 
implement one. arm,scmi. But more will come in the future. I'll put a 
sample arm,scmi node as an example consumer in v2.

>> +
>> +  brcm,mbox_rx:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Mailbox receive doorbell
>> +
>> +  brcm,mbox_shmem:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    maxItems: 2
>> +    description: Mailbox shared memory region and size
> 
> No, use existing properties, e.g. memory region.
> 

This is a region from the on chip memory. I will rename to be clear. It 
lies in a different address space as reserved-memory. I can still use 
memory region if you prefer, but I will need to manually strip the 
offset in my driver as the API agreed upon with the FW is an offset from 
the beginning of on chip memory. IMHO this makes things unnecessarily 
complicated.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - "#mbox-cells"
>> +  - brcm,mbox_tx
>> +  - brcm,mbox_rx
>> +  - brcm,mbox_shmem
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +        brcm_pmc_mailbox: brcm_pmc_mailbox@a552000 {
> 
> Use indentation we expect. See writing schema, example-schema.
> 
>> +                #mbox-cells = <2>;
>> +                compatible = "brcm,bcm74110-mbox";
> 
> Fix order, see DTS coding style.
> 
> 
> 

Thanks for the review.
Justin

> Best regards,
> Krzysztof

