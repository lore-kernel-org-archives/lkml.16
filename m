Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B8E22C35B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497236; cv=none; b=F3Wmu65oumeUubHqXvNFpdBUasNwl8nCWC0qKKIgfeP4j6jySWHhpJWqJdIzir18lmTUlz26JG7b27Zse5ty50kb+/1MdaifEMoykVq7CUJZ/Pw8phFc2qFD83rc8777d3vRHObI3MEbhQEWT5+YQypA/CCZdSYMW59w7DMBv+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497236; c=relaxed/simple;
	bh=bL8XZJpIQ328FckjzxCTkScUdzNQtFOutrtggIAGvho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3pEC8IJ6oP3ng8kj6qOad20de6RNDVn2o+a132R/62yOimsHbJsWWbTVK7heGcjxl5YIkepjTVQleXRarF6fCQ9eZ5xFJSpMww/F88i9BYqMpnk+nYGRCysxowIOlipfkP3+eM0PBt4qS/RRbmxE/gRUz9hao/fa+s8RbjqpSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Suw1LZxz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Suw1LZxz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso623496f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745497233; x=1746102033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u50Yy5Vg8srr8Se1a2fDdmj5mgoY3leB+NYiaQ0tKb4=;
        b=Suw1LZxzxoOoMZRlMgxKMu1qNBFbVt8fWs5AsneTXtfH7gNAf3SADchKKJdj2Qtkk6
         R/tWdiYKrYdtTEANlwpYvO6rWYSP0J4uqmU7i13FIGQ5ZkmYyf9uG39MoRrnuvPXWFxa
         Ll7Mk5yzRQgfl1W1Tq+622z0uLfPgF21YB+I2HpYEHtPs2iLLiGJwlrpJeNErtHiRTF6
         KgUhm3gPVAdhZtOIdxM1Q6vWYrNEX8DUOGF7WpT6E+8kC+U2lpAWUsIiB6Z3vNuczVQ1
         UweEmiHzHQ9opntm2TTGfWjBlkYIMXixUO45fVYi5fg+SuyKTgRHs9n0A3I1PUl16rjV
         ZxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497233; x=1746102033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u50Yy5Vg8srr8Se1a2fDdmj5mgoY3leB+NYiaQ0tKb4=;
        b=QLVdOHGfFSSlSKZXDkUtiOdGcEluUWEso45ypoK4Efg24OtkHDLnL3A+bOTxpUH0yB
         XXLVia1kR2qfG+dEUmf67SWChm8mE9rXA+BBqHVz/rh03KhjclpMUXYBw9bpLZTpsVMg
         Hb1Jn1u/JBeHDYfwd4n9rvdKJTmFZfB2GCfAE5EC3V1ffWziPezb8tmykzuUZPA2M1tW
         yKcg6bW8QWQ73qxqlAewdG5l1Lb2VlOe+rDdY5zvtCprDLvHwS22l9wiZhKOcjfjCk5D
         qq4WdeoQnJhV/csy+/rG4VgB4tdYXPRTWNiRsIPUI0a9db8H7ba22X/Vmq2NNSEqsiio
         HTWw==
X-Forwarded-Encrypted: i=1; AJvYcCURsudLqR3IEcmnUCcXWalsydVsFrjdfEyV72rppW25cb2kmi2uVDAMMGbD73M+yIuEYNJ64MS1CWo/K5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhbKADG5mSd61UO+KIj1ShgxnHod9zopXot/AIZpENbCB0w7O
	HdKl1rBqIwu2l3enCd2lsdJmNOywUSzqiHiYkxRm3YRRTaBb0GDj5X/uP0MUafs=
X-Gm-Gg: ASbGncu8XBPf6vKX3A2gP7mnBqHWcjG9p2+BFaLrzCusrkB+MCxrMDSzdgA7zMd+MGY
	cYV74d6w2b9UxbO/WOBo79+ykeWLZs1quNcRKaJ4bCeOfbMW55uxFKOvbX0qiXZQcIXNfoqffPV
	MbMR4Vk04fFkW+cAAxsFlSThK/XjLhDChm4THBF6jl03ulwdyhYYJyhqzLClce7AzfILW85Jq4k
	zR0fdtf7OijEgV8GO6gOXVzscOrZCbf5jk93Wevl0hL37u5cGSKNBWZiUT+sqE6lkMq3qcva5Qw
	4COy/xIIQrkgzrvByHV6ynpFGUDQqB/UG6H0ZVaaviG273snHD2VlGZghFEGQthz5qjB24QdjgL
	aedxO0g==
X-Google-Smtp-Source: AGHT+IErGqD7SWmT3PoP2Qcfi8RzPWJTMPf2UDlu9jVrXtYNixkU0DJW45avJrW+b31pNkThEJFAjQ==
X-Received: by 2002:a5d:64cf:0:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-3a06cf4a80emr1986260f8f.11.1745497232880;
        Thu, 24 Apr 2025 05:20:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c031sm1884747f8f.84.2025.04.24.05.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:20:32 -0700 (PDT)
Message-ID: <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Date: Thu, 24 Apr 2025 13:20:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
 <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
 <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:28, Vikash Garodia wrote:
> 
> On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
>> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>>> Add the IRIS video-codec node on QCS8300.
>>
>> Nit: you can not "add support for the video node". You can either add
>> video node or add support for video en/decoding.
> Makes sense. Will wait for any other comments, before resending.
> 
> Regards,
> Vikash
>>
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 71 insertions(+)
>>>
>>

Unless you get another comment, there's no need to resend.

I can fix the commit log for you on the way in.

---
bod
