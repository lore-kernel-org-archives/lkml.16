Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFC522DF9F;
	Tue, 10 Jun 2025 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542203; cv=none; b=l3Z14uZHF75ULMUP9BmtXzjShVIAmQ8L/86xAQmGfi/IHvbrX6bf55YG5y+dwDfyEsYvlm45wKTZYCACv12XcCv/G25XHEAdrngjjDGpyQ9G2aJjf7IPRJegg5kPQy6Srp01PAoGrKdvv46DTGTwKpOtaYwuBO1JG9mM2KsDp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542203; c=relaxed/simple;
	bh=8KSFgIfeJ75CBDfAAmC8H9y35NzbCDTmXTTDHHmbZ54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUFRy+yjxvAgSnlTVWKZFn7GjSnqtLGRERS9Iha5RyuLqk9eIsFlXtW4Vz379uEC0j43G76KcEpB0+KaLv/w2kXe/gMlUsHFUM8PM+FkCkEXJjO5CSOgYSjMa4wwDO0zt6hTZRRBgww759Y8NJ5kmTHbEtyH6p8qxFIyFZYFQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8ojwWOq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8ojwWOq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad8826c05f2so974095466b.3;
        Tue, 10 Jun 2025 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749542199; x=1750146999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOUbBqM3ir5KebfQ8XMq8ZIcUlqPnpdgMkRLby67yUs=;
        b=a8ojwWOq0tplFhkXZiwOy0Z0KT7nZlD4DOfyyBMb2pIhLmqEJfYuJs5ilGUqok2qji
         mJ9nDIBWtIjR7zRR2pCzI9ILhobS2cF4fcfECMDxtLSdgtKIuAxG9YaBYXe5FNYhDxrG
         oLGczQUVIwuhhIcfg+enbLAKjDuxXdeOyR47ILqtwBYedONwYk88pK3/6gdemWVoF48G
         07oQrB1g6WK0KWWTNKy2hOTmL/fF1LVUlB22y19JcEyxApbpjeKh3pMHTxRMkhd+2JeQ
         NM72IjMG+tpqRCMGl/hxv7NAlY8cBEsnebsbKqhrt0yNZoz3HWNudu7L+CwL6XJ1Fzzk
         bwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542199; x=1750146999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOUbBqM3ir5KebfQ8XMq8ZIcUlqPnpdgMkRLby67yUs=;
        b=QUkOI+HqPFcSOQrUoAt0eJg/dNk4Oc9avbWDOr8HbCVWVdK22lw0EbMuRXVDiEzLpV
         X+OququdYhK5+cbHt9NBNdgWFP8HFI2fHc1Oh9Hq/XgVqJBBAm4OfZ0+VWxvSjandl9j
         C+xm4sDqsLhDGEsmbBKrCbHjHm44U9mUitdRYgC6N0EzQ/ybimfW42o5+31p7vpTafwK
         6MHl9dlF4H8uzWftkEEXxO8WrCO7nUlTTZBrbXnyedRTMVjapXREt7ISQ78dVvaoynwX
         dQoaLDLCXfWkRutNM+9v3ext9SeqB0RXtReHUdPCIX4Yq8qO+tIomv4dZ7Gge9DBjHrb
         m12A==
X-Forwarded-Encrypted: i=1; AJvYcCVK165fNYC18TJZd/hmO4GGI9qZT6S5UbG6o/YUPYSBZq1mSJf57JkEuJLyPE6e0Usz04oo+Xhd9E2RP8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPagJ9CHcOLsZ1d/BA8k8pHb2TU4G5qvgrM9c+49KDR5TpeTtK
	YOiR2o/V/xKB7NDa9eeke79aGW84SZdR+XgZSOZi04oWUqM7lAU+MEH5
X-Gm-Gg: ASbGnct7RhW+FTx1UAijSnxomr3FWd1pz4Rsd9ChSg8FX4OkeL6BrFg7pD+c/KfLKiI
	CTslHWUObfqsxmH/2UJJhMCj6Llve/id2ylWDzL/8vzNBDMMJAV0rgH33+w5ZgUH4Xf3jg1GVlM
	xxh/Ko3rFHxD73uE3khuTk/8VrpWVIWxDg3pTBrB1eilZxysoPc2eguOb9GB/wMgmwrvBclcdOm
	yu8k7W4zR0D9zwu1PJpibAXbzEXsheHdA/bRmZNDi40AX+tKDhAJdD2vai04FK5pmARsYuhBaQA
	hL4Bjl6DjNi+H8hGvqCV3pjx4AvTLFDVDZqYlVRDCcNc6A6a/CBoWVBo2nNxIGuq3kDVhyshBuD
	4+Z6WJE8QOINyaSXyfg==
X-Google-Smtp-Source: AGHT+IEqUuioeF06M4UEhjTf6G4KshJFWg/fKaZGLmzrQ29pFCkBaqkegPYTZzwVhiaXN+0O8ZO3Bw==
X-Received: by 2002:a17:907:2d08:b0:ad8:96d2:f38 with SMTP id a640c23a62f3a-ade1a9fd8b8mr1496967966b.18.1749542198602;
        Tue, 10 Jun 2025 00:56:38 -0700 (PDT)
Received: from [192.168.1.130] (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc389afsm683838466b.132.2025.06.10.00.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:56:38 -0700 (PDT)
Message-ID: <a787b26c-a721-4079-a6b3-31ab06dab8c5@gmail.com>
Date: Tue, 10 Jun 2025 09:56:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH
 SBC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
References: <20250605142728.2891465-1-goran.radni@gmail.com>
 <20250605142728.2891465-3-goran.radni@gmail.com>
 <9bac057f-efcd-4ff2-9217-9f2c3720f857@kernel.org>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <9bac057f-efcd-4ff2-9217-9f2c3720f857@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

thank You for the review. I'll fix it in v2.

Best regards
Goran

Krzysztof Kozlowski wrote:
> On 05/06/2025 16:27, Goran Rađenović wrote:
>> Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.
>>
>> This board is manufactured by Ultratronik GmbH and uses the compatible
>> string "ux,imx8mp-ultra-mach-sbc".
>>
>> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index d3b5e6923e41..49fa640b6806 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1232,6 +1232,11 @@ properties:
>>             - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
>>             - const: fsl,imx8mp
>>   
>> +      - description: Ultratronik SBC i.MX8MP based boards
>> +        items:
>> +          - const: ultratronik,imx8mp-ultra-mach-sbc
> 
> That's just part of the standard/first enum.
> 
> Best regards,
> Krzysztof

