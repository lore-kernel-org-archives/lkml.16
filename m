Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2E275100
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936648; cv=none; b=hbUO6cHb0CI0r/DVmNYdBEZDJ8DMq+GrBSIogsswNBTX+5d1asE+ctosq8VP6X6eTovqMbKO5mMGgYwfG2gQpLQXka+oO04B2oI+mQdV2P/EQOJ9Mn4I8C8GTo3VEhmku6ex/uO6DFiYy4I6bJ4JwnrSgsyMkvWXc8IZL4IcrDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936648; c=relaxed/simple;
	bh=5MGZdg+vXH2bqcVkQFR7yR65Vui1/Yriyo02DPZvTQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEbdTqrF1Hc5TBDX4br481AVjeATTMT/UBHoBezTWvbxIpb0qSbp3N6EOcRlSOCO6JOo7vWw26cKnxCBSaEHECIX32P9/RnCeXRh7g+jVisySYUde5lT49fTZ8YkwfzRWRI0QnB+CneoU/fHVmwkcD6JuTIwDVyQjT60PVD2DLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgbL3pEl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgbL3pEl"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553aba2f99eso109332e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750936645; x=1751541445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6AEqL65FtZQf+2LXaLIM2w9Axgikr/BCU/niUzILgo=;
        b=CgbL3pEl6nFf57UNDwiR3dug77FHVn9DfzvD4sue5JVSsMSD3ALYYAOkfOPiDVMMmL
         fUr6EMnPMiDgQf8aGXcpYGx7MRhzQi82nSbCjo51WFehvWvB+KAQXfA01g5Ln1q7z9Tj
         /38ExWslloxECZ3k7ypqFJE+72KJ3AseyjIsVtN4RvYIde1KygAnnmMB7BRnbS84rcaU
         bHl8RnuNM7ckoQa7Xuf2kGsrRV3t0Zkcdfgq5d/tsuQODVRzY99n8H6+mmnXc0uTJ3S3
         fYiKrYkt30qaHehcADjZtnUwzjy70eLgHdQYdyn5p5cB388D0CywFX30HslWvz2eUbx2
         zZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936645; x=1751541445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6AEqL65FtZQf+2LXaLIM2w9Axgikr/BCU/niUzILgo=;
        b=ape+vZI9ZNAPhBiAKzU5RpnYjnObVVWLXnk5GLZ9mBpjtueowlxRzmRWPBp+bzM2Zm
         Vhxj9DJsfcGAnKSZ/3kWNQ017q3pqjD0lun87CDPe31GB5R8FzvX7nVkPh35vi/ojNbz
         8gNwZEB7jaa4LqyhmS2WRtB6bj7wuKQAen0BhUBbofFa8gKsWhaXQR+iYEMrormwGCS5
         o361K4Jak9ZJcbiipEWdD1Q1Q1LhdpGsNF5eOFpB0uAH7P1itfiNV+O/YNFO7+7PkNd9
         +8ntS9A9KsgHXT1r+7SFraY+E6sJOFw5xRqotYLsozc3oHGLvJMh+z+qXyXKuQwDyLCK
         uocg==
X-Gm-Message-State: AOJu0Yy4wBjMast1IxmP9Ov3oNWGRlzV2AbSH1AohPQhDibppClvrYyP
	NiGszuCWYqk9vgpO3qiSvJ5wjTJXtvZnmnP7UmLwjKiBktqM+YeF5B7ooT1vsyqR0QE=
X-Gm-Gg: ASbGncuqvhG4p2688e4fOTaqNXvncPvn1vLf0kXVPQC05oKp6wDrq6ROr7i4M0/hmz1
	QC1K6cEj/qzvrTOKBGbgk3fnbmuw2csKChXAmbKKUXy4VgrgqtOOjUJ5sYGFpdJgwdBT9KEvb9O
	TbxPOPg7eCjfbM7F6plrQcwxqVXixwPApkdApAeIh5bC/kZqPWWV7mYEOeUdjGE5G/qqtzqghbO
	O/Z2zFovwgLxwc8DSgKL/vSheJxTRXju+mIcL76/DEFWRs//8OCfunsrzGtfmx07mc5jl+/zzP1
	DQEzLYKGV0mbGFUTDK+js5HnhivuBc4fxpksMJBiC6JXB8HfhVIs5AaV88CYu7+/MVZivPDvdjo
	ErGPt99wmNpGC3wwaJ8O6hxsJl+sq4YgGzrGUIwaw
X-Google-Smtp-Source: AGHT+IGBJlwN74XgM78qvBOHGnOxNOq6kgysRtY+TPDa6PAvLbg5NOgW6MpVbMWgaDTM0mKf0wSNPQ==
X-Received: by 2002:a05:6512:3b0b:b0:553:3422:c38b with SMTP id 2adb3069b0e04-554fdcf150bmr787177e87.1.1750936644740;
        Thu, 26 Jun 2025 04:17:24 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2d71sm2521048e87.142.2025.06.26.04.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 04:17:24 -0700 (PDT)
Message-ID: <ea5d7622-ef9d-4bfc-af64-87bd19664333@linaro.org>
Date: Thu, 26 Jun 2025 14:17:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
 <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
 <e928a7c5-56d5-4f2b-b667-bdbefb506d1f@linaro.org>
 <0e030c09-0a89-4883-b958-85ddd6831407@kernel.org>
 <d1b0b5c1-a031-4429-bb4b-ad8bc914c971@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d1b0b5c1-a031-4429-bb4b-ad8bc914c971@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/25 13:48, Bryan O'Donoghue wrote:
> On 26/06/2025 11:28, Krzysztof Kozlowski wrote:
>> On 26/06/2025 12:19, Bryan O'Donoghue wrote:
>>> On 26/06/2025 11:00, Krzysztof Kozlowski wrote:
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csi_clk_mux
>>>> No, I already provided arguments in two lengthy discussions - this is
>>>> not sorted by name.
>>>>
>>>> Keep the same order as in previous device, so msm8916 for example. Or
>>>> any other, but listen to some requests to sort it by some arbitrary rule
>>>> which was never communicated by DT maintainers.
>>>
>>> I don't think if you look through the history that you can find a
>>> consistent rule that was used to arrange the registers.
>>>
>>> So we are trying to have a consistent way of doing that. Thats why the
>>> last number of additions have been sort by name, because it seemed to be
>>> the most consistent.
>>
>>
>> Why are we discussing it again? You asked me the same here:
>> https://lore.kernel.org/all/8f11c99b-f3ca-4501-aec4-0795643fc3a9@kernel.org/
>>
>> and I already said - not sorting by name. You take the same order as
>> previous.
>>
>> If you ever want to sort by name, answer to yourself:
>> NO. Take the same order as other existing device.
>>
>> If you ever want to sort by value, answer to yourself:
>> NO.
>>
>> You both came with some new, invented rules of sorting, applied it, and
>> now you claim that "existing devices were sorted like that". What? NO!
>>
>> Best regards,
>> Krzysztof
> 
> OK.
> 
> Discussed this on Slack with Krzysztof.

The problem with private communications is that it produces
sacral knowledge.

> 8939 should be like 8916 because these are devices of a similar class.
> 

What's about MSM8953 then?

Please see commit c830aff08d51 ("media: dt-bindings: Add qcom,msm8953-camss").

> x1e has a particular order if a new device x1e+1 comes along with a new
> register then
> 

> 
> I think I personally haven't understood what was meant by "devices of a
> class" but its clearer now.
> 

And I still didn't get it, how to read this "devices of a class"?

In particular why is MSM8939 a device of MSM8916 class and MSM8953 is
not?

For sake of simplicity I list only accepted CAMSS dt bindings:

qcom,msm8916-camss.yaml
qcom,msm8953-camss.yaml
qcom,msm8996-camss.yaml
qcom,sc7280-camss.yaml
qcom,sc8280xp-camss.yaml
qcom,sdm660-camss.yaml
qcom,sdm670-camss.yaml
qcom,sdm845-camss.yaml
qcom,sm8250-camss.yaml
qcom,sm8550-camss.yaml
qcom,x1e80100-camss.yaml

I kindly ask to select a number of class defining IPs from the list,
so that all next ones will derive from those only, and not from
"another class". It's a task for a DT maintainer I presume.

Before completing this and getting a common understanding all next
work to provide CAMSS suppor for new platforms is not directed by
any policy, because the policy "do as it's been done before" is
applied inconsistently.

-- 
Best wishes,
Vladimir
