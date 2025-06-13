Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB545948
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802005; cv=none; b=Kh2s1LTse1Nh1W5e44ku6f0lMWfuSemCVXTzmqVDfwlf74yMhaave+Vdp4sp5+nVHLfKeFoARm2qOa7J3QE9aE70DDVSQ86AekwPPatO+rRjyFdUkzwCoFAWSxBG9Q0gS4fdSbaq0DNMsBrikicbdj5a2DwhdRw91nOlK47/2hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802005; c=relaxed/simple;
	bh=SS6GUy7+iSGrMAI8Lio5hdVZyVEhieiGp9O0m4ddPPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NukhqYda6fJ4zm6TnF39I0+WqRDghz5rcBSooY5YmdzX1P0nc05ivoMsLGLL5Jcf9/l1Upp/0+1A+UNrncUIssEez3d7bPobFntNaPBG4Fb8Ve+dtBJfT73fMD7mt+N5aJLZDOXKUBmF9rBHZG6b4kH1kuDLm2iVGczOy90wuoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EsU2OSJH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EsU2OSJH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1048585f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749802000; x=1750406800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkqDFUZXCEB8bR8DaJ2XDhGAG8e6Iv9Jz4tCnxztU5U=;
        b=EsU2OSJH8aW92PaxpbLI9nQ0uktIgs64bW6Q/7YE+yj5YTwjEP5wr/44RSb4s4PT9Z
         i0JrxeE95LjFUAm84dOodnUN2O47ha1oJV5BDUm7TboIxCel4kdWE1AZ148oqQYVNV0X
         V35e42BUX38VqqzxxlLSAsxopnYvwsHKlyWO8Uy9D1KkE6c95rJLKjqLwZbnyFyBpqWT
         XCA0PbRQz0tnDtigC25LeOxgVoCmZ5Es11wBvWvH5W+finrYiZA7fqCSsKsQzzpU4rF/
         qcs3DgYtWDqR0j2Ec+HTfRTHI7+gjxzs5CItLEYzeFuhX3pVXiTR4EOo2BFh8lcu7H3v
         25/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749802000; x=1750406800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkqDFUZXCEB8bR8DaJ2XDhGAG8e6Iv9Jz4tCnxztU5U=;
        b=C19OqBthCt9utXaxuCDG7xWhYUCx7PGiPsPfouVKrjXo/ipfw4mheevFC19VEhLpHK
         nOD2MH+ykQzgnjGn/bzuvR1YnVEhC78sLLUxCz7nN+pT7O6aAhRA7lZSO001UUVIixSg
         NY/QnwkAwqLO8i/LCVLECSqouYYaMC2bf6dU9T9V4fRU+oi6sLRZM7nt8FfbzoQDYpzt
         sKVIdbCTUve+DRVZ49onuzlTu4n/yFW2IZuMGyaS0r3ze7KVehxfKMajzzHO12CBh3Ks
         jvxNK01c/gEB6LysecFwqFl5J3WAcvvg3P2RftQpLtsg3zCs8MiOFhaQ2kg8iN4jiBhi
         xFvQ==
X-Gm-Message-State: AOJu0YzuIfhYPraRFUFOsQgAzZ1C8FXYmQs96v6si2hdOmMDeabrd1nz
	0DSAGKxkmThv/Hsv0BAjgOF1W+otzw0ucTIa3sodUPevtTCmvTm9GTXkcIInMSuMA6s=
X-Gm-Gg: ASbGncu9NhLPJm+Iaw3GbAApsGCTI9kOLwuZW0KNDfSAr7n7kY31BbQfIp+VBOd5ypc
	L9SAqENo/6uTqwq7x38RT5uQ+vCLGytJzsmI8hdaQq+sZTJ+w+1WfsjjXEAZKoNPIrPpEH3GS4w
	B2rMZ3IfnCQPhWObyppf5vwvcCA6fcJB3xu5MjQOvqA7YaCQkoVHEak2v7VySgrLqghDAtVITV6
	Q74b6gRttMw/c82JvGbRw7PUQb7AQRkgwtXMvxn26CDw+9v/htvifUA/2FgQu9xr8ii46Uh4zj/
	aqViybmEHUn6MZxpK7/VcYF4XjRvnX7Yi4osPlwYeXI3dZM2eJE3zLy2ZEL3zXGDmuFMTTyWYGY
	ZYVyBoVeXx/OmV4vToIIKQUDErkc=
X-Google-Smtp-Source: AGHT+IG/O5UhDJVykXf2VjbwfD0QSNx5aG0GPegjXalhCDoQfY+0ubOtvsqOybm9J5xA3EHEjqAziQ==
X-Received: by 2002:a05:6000:3103:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a56871e167mr1902935f8f.56.1749801999608;
        Fri, 13 Jun 2025 01:06:39 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4ba58sm1540669f8f.84.2025.06.13.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:06:39 -0700 (PDT)
Message-ID: <03f54bb4-ddbb-4be8-9f9b-8328fdb98443@linaro.org>
Date: Fri, 13 Jun 2025 09:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
To: Vincent Knecht <vincent.knecht@mailoo.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
 <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
 <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/06/2025 22:43, Vincent Knecht wrote:
> Le vendredi 06 juin 2025 à 13:59 +0300, Vladimir Zapolskiy a écrit :
>> Hello Vincent.
>>
>> On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
>>> From: Vincent Knecht <vincent.knecht@mailoo.org>
>>>
>>> The camera subsystem for the MSM8939 is the same as MSM8916 except with
>>> 3 CSID instead of 2, and some higher clock rates.
>>>
>>> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
>>> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
>>> This fixes black stripes across sensor and garbage in CSID TPG outputs.
>>>
>>> Add support for the MSM8939 camera subsystem.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
>>
>> There was a preceding and partially reviewed changeset published on
>> linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
>> due to a merge conflict this platform changeset should be rebased IMHO.
>>
>> [1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/
>>
>> --
>> Best wishes,
>> Vladimir
> 
> Thank you, I'll look into it
> 
> 

I think I will take 8939, plus any of the other now 3 SoCs waiting to be 
merged with RBs.

Bindings consistent with the last 10 years can go ahead. Its not 
reasonable or in the interests of the community and developers to gate 
any further.

---
bod
