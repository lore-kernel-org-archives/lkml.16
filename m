Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7F21C19F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593830; cv=none; b=ienZnwQNzbR5YOXHWi8dJ+gTZzyspo/vPbOqNnyGoLrrINzFbOwBnKIvKIiHVYLqTps4CbUkzFE+KRUQ2rIiAdOU4SuUdx1GjDZPnT++rDuvh7pSWizDRuxialKIpSES0OfBYcZFTkFISBOpZ2ikU0Nb7JTBGeI8le34hLhBwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593830; c=relaxed/simple;
	bh=7TfUR8R2IrpRs1f5np0P2PSPG9JH0doPxboC0XmNhik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpvLgKFG5G1g9e/L2Ews/g3wvnfegVzXEzuj9fKIyT0K4xbVDXXHyx/z6ksX4gFqSGGbDsR4KTNEtLDRUIfQUBUb3HNWIyZaOtArP4rD7i6V2TCPhN2yd/5zIhUoTK7kzE6Ip19rwTM/lVH66iYu1HkeITy4edcVw1LLMwrN5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlVtTujI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlVtTujI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4860786f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593826; x=1750198626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIt2WsPysp6xDtdH49fFBClr+UXdYRyo8pVXPNJ74C0=;
        b=AlVtTujIl4s2x1TJUtdWI+Nc4y3lKISil4BGa4q50EP0cuwOOk+NFS9hEt+Chdezk6
         ozYCX8q048nj02uxRcDGafRs5bZ6xxErghsoS4XW7mmGrBQZNjeC6T7LkM68WWPBbfog
         0JmvDx7RhuYAfoJy9FBecQBt2L3zQXsyG2RtXm3Fdh/wZH6m/ceVEnS+bjWyU+xZpB0F
         Lto1ejC4VBenDjmlaYQIbEh4crXYxTx/t1sN09Rw1EWCsTURFCM5ba/1Yrz9j0ofo6B7
         qZZ+Vlym9w62N+U7/FtIrlTKdpXKA48ZSlnwz9hPwV88grY3GMtEXZytHfQQyIgHUcVi
         2hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593826; x=1750198626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIt2WsPysp6xDtdH49fFBClr+UXdYRyo8pVXPNJ74C0=;
        b=v5MrumDKypi1eYhhB+sxoB2W9E0SBvwG42na5Wr7jF7DvQtgpqcU6/c1cDWAN2KRAe
         7D33GvQ6nJOB2g/JmeHJ/PI8xlPNO8kAa1bHsjWqezgEXOqSknshgOdro7JAiv6riNBr
         tXunlByrwYGLq4RJN1AKXqyuoMhyPdrBuzNZU2sWZjopxf7HkhOuGZvzgw3tlY6zov3b
         r9Tj6RstdWEWs8hwyUm2Zir1vQD9Vtk3A1WwAsriZXdM00O6310AVvWKbuAGRSpuA+z+
         Cx8F7tLNWVIlgTfEnxTdIrCN+5vLy9626Ftn+vH+gQKv8PvnONcWk85VMXr+wqywbTdy
         b4ig==
X-Forwarded-Encrypted: i=1; AJvYcCUtYqJFFcuuV1j78huG+P22Z7tmJnCey/3AziCLAxghQDkJtfpb7Rf6bHnfg2KycLvz5PM3PZLs2XWPnRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdnsMTxVpLfTYoOZAkwt6Mo5tCOUzwTDXpQJjZ6KxR3czuZP45
	4G0jQnJe9fYGDVkfUD1XTEv9CY7qYpbWLBmoh7QCVHm4FetW/iZYTqHDW+G4gBl5nlk=
X-Gm-Gg: ASbGncuY+YIsZ+hhsRKp4Zu2kt9C2dkbEu2WlNfEp32oXtIy0P4xbsO6Mlxwv5ukD36
	Y6PG4AFM2YkyFY991xbXWN2576Bt6OpuMwBgROhAuTCtNnb29QOogStWHN40zsMZy0fIvM7S7yZ
	1+pz6TYYtqAaV1j4G8J2iN85uQLeDT3QYoOeImTJlbuLQFcS635f1YVGV3FBKfGsqhcxTbw6s4y
	ee2MPJnaBQG28yjYqdc6J4AKlUJ6VsNtYyl45cPw7kCisgnzXvpig7mAfqM5hXFLMVrLM8Lh3aC
	ucWs/mZaS2Ar0vOM+jxcs3W8nIMWUO8rmJTxPMvUaA99pbqSBgS58TlIEDCVG6Aqm0awQF0yYE4
	a1Hd66CtPQtfu1b4VOo5wrk1J3zI=
X-Google-Smtp-Source: AGHT+IERnljNf31VprhAEokS9VT8ilK90CxWqw6sUIOgCUXrKGJiaOEei3ELCJOxQ0LlxD+btzZ1Ww==
X-Received: by 2002:a05:6000:2285:b0:3a4:d6ed:8e07 with SMTP id ffacd0b85a97d-3a558a27717mr467480f8f.32.1749593826029;
        Tue, 10 Jun 2025 15:17:06 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464f20sm13422204f8f.98.2025.06.10.15.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:17:05 -0700 (PDT)
Message-ID: <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
Date: Tue, 10 Jun 2025 23:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
 <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 22:13, Vladimir Zapolskiy wrote:
> Hi Konrad.
> 
> On 6/11/25 00:04, Konrad Dybcio wrote:
>> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>>
>>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>>
>>>>>
>>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>>
>>>>> The expressed concern is about the novel label name.
>>>>
>>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>>> not camss@ and I agree.
>>>>
>>>
>>> Let me repeat it thrice, it's okay...
>>>
>>> I don't object against the properly selected device tree node name 
>>> "isp",
>>> here I object against a never used and very questionable label name 
>>> "isp".
>>>
>>> Please feel free to ask more questions, if you still find it confusing.
>>>
>>> Again, I may missed a discussion about the need to get and use a novel
>>> label name, then please share a link to it, it'll be very much 
>>> appreciated.
>>
>> To hopefully help out:
>>
>> label: node-name@unit-address {
>>     property = value;
>> };
>>
> 
> Thank you, here is a link to the wanted section of the dt specification
> for Bryan's comprehension:
> 
> * https://github.com/devicetree-org/devicetree-specification/blob/main/ 
> source/chapter6-source-language.rst.
> 
> If for whatever reason a proposed "isp" label is preferred, then
> since a label rename is not an ABI change, it would make sense to
> do a massive change of renaming all camss labels. Otherwise there will
> be an outstanding incorrespondence/confusion of the label names in
> board .dts files, and that's bad.
> 
> -- 
> Best wishes,
> Vladimir

Ah the label, I thought you meant node.

camss: isp@value

Yes
---
bod
