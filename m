Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10331E5701
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731121; cv=none; b=dZp7NxpK5DjNzkQi0RvJpAcA7z8OaTi72uoRVVVU6RwJTgos+FlNcHl1wv1uwACmHbLO5SUMJnSgx8CLsbh5463r0PvwPryyLYo0xYEevFsIBGM/WNRIHhYD31NjM+In6zU/YgsTLOjZ+vBZ/ewhKlxCRuKZGCnGHPoBWJ9+p24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731121; c=relaxed/simple;
	bh=YCrqNFKUKD4zinSt1TMUJca2aMf9Hj3UkJPZF9E78wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcmhpWvM6k9qiwDfYs+O0HA3uwL8QbLRQvbVh1Pk3C12e08PwQlsUypCmWXgKWQsbnJFrtemlImW/T55mS4VQJNtZl3QxWTswTLeewz36IPpk9aO0hHwM3Cn5NlJLIYH0zrW8vZHNQySp41PywsXk/5X6gdyYxKaUsR2o6lljUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QUUjELLP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QUUjELLP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-601d91f36feso387849a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747731118; x=1748335918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F9B1v/gS4gHKj6aqa0YLCYdit5fsKzxzh7WU+CmWXYM=;
        b=QUUjELLPjfDTB9hwzEMkCtGbkQ8Mp7dFbwhLaEi97jMPwS5E/tOcZuPmQ8n1XDa4j7
         4bwFnHKcAgZxkhijKLpPxWQEhWI0gOj3wzFQamrpoAPcYOvNAAdST50afzC0NMHih+zu
         0KqCL2BwaLTgjVWRDwrv23porIcNxoW1k4n+8ZQpyVQ15SxvYGJbgkoOse121vwmRQYK
         uhaLiKrBzlzUcVPtx7Pyf3OR6SqFhA33DugagXhhryjPP4vrukPaGgDnxGeij5Uz3xS7
         5BHCRKOhfNOtYzo6FZotZY5QURrBRTrDs9WMxi/gckyna69U57A5bh5RyMSBDlpUblP5
         Njdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731118; x=1748335918;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9B1v/gS4gHKj6aqa0YLCYdit5fsKzxzh7WU+CmWXYM=;
        b=OVGpRSNGmaCSEE0v/rRlVufGss6oCIRSFTuD1Pa2NSrsZyM5gJ6k+JlK3EjPU/5usB
         MJ1qYdv2r5EgLE8M61/xlxqZGvUrMPQTk6nhHsT4CGTen7wUK9stkpZLIde+2Xfx88h2
         KbDavcg75aHsmze3ho5mJvEoQ00tWpqHbiImuS65hYY/OLLGxHObVspJQbVTtZaICj9j
         oVQp1u+v5NvTHic81OYRPh6BbRDuiTrdqLPS+UwPPrfiLHeNOIb4qOOv4H7a6ZgrUGGi
         a7SNTnTX8DvXvzBg1Qu4NzmhVviBL/5eFZZ9csNE1sZwxOpn8u/5+BtyvoaBtYa/Cf4/
         I2mw==
X-Forwarded-Encrypted: i=1; AJvYcCUfS341I6yPYrf474DNJNQTh2XFeh4mwXtgTZ2nESGwu1KhGzehwJvkUGmn0yfqrKV9XE2YezqyPfKmw6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuL0ZxuflSjJ84EsTtxoqU36HOuSDa4VN5rwAMEwVsPkqTHTND
	3wcnzQYNPXI1Tmu9+3GY2Uk+3rH9niU61PBt2F5DLX/ckCApPj8zXnjBQcpIl6I13kc=
X-Gm-Gg: ASbGnctZ30YOmeSiwuSBAiYbCJ+vWUkTDFHWzjroizkJltwjNnz6VqN1OwJvGaysIv1
	bHHez6hhZDD8DhFAR3NmmDDvaehFTKPRjAG4VIDHFosyeTvQsXMRD6DmaHZFRVQbrmm48irYVgT
	+Q6FaQpTi5TPHWWoUxZPdZPPj5Z/FPUhzwZ6hPDVSfp0SbVvm2mO3rrekmGLydMrvYJRUoA6lDe
	uwFHObmBTXWelYMDoDW4nTH6in/Zqx5B1dXcsPi6RRxI8l1yijUk+QczOeBLaLaHeEl537/zYMH
	Nrr4Z6V+UDlyN5v+UyTN8r47icw/oenKay8Fe7iP7TchlWn23lPug6qCkkbkNe2XnuZNUg02qTW
	H70Rdcg==
X-Google-Smtp-Source: AGHT+IGg07atEuyp2187jP+7t5twQC1qi6mfhpuH68MH0EKiAzSk9v+ESzad5yqvUWDbN00pfXCW+A==
X-Received: by 2002:a17:907:2713:b0:ad2:292d:6b9b with SMTP id a640c23a62f3a-ad52d50f06fmr498338566b.9.1747731117922;
        Tue, 20 May 2025 01:51:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e80asm697292766b.2.2025.05.20.01.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:51:57 -0700 (PDT)
Message-ID: <d81de587-7452-4fa1-836e-9e30b6d63c57@linaro.org>
Date: Tue, 20 May 2025 10:51:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
 <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 10:44, Bryan O'Donoghue wrote:
> On 20/05/2025 09:30, Krzysztof Kozlowski wrote:
>> On 20/05/2025 10:23, Johan Hovold wrote:
>>> On Tue, May 20, 2025 at 10:02:32AM +0200, Krzysztof Kozlowski wrote:
>>>> On 20/05/2025 09:53, Johan Hovold wrote:
>>>
>>>>> Spamming the logs as the driver currently does is clearly broken and
>>>>> should be fixed. Keeping a hw version dev_dbg() is generally perfectly
>>>>> fine, though.
>>>
>>>> My main argument, expressed in the commit msg to which no one objected,
>>>> is that this debug is 100% useless: deducible from the compatible,
>>>> always known upfront, always the same.
>>>
>>> To me that deduction does not seem straightforward, at least not without
>>> access to internal qualcomm docs, for example:
>>>
>>> 	compatible = "qcom,sc8280xp-camss";
>>>
>>>          qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>>> 	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>>>          qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>>>          qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>>>          qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>>>          qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>>>          qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>>>          qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>>>
>>
>> I understand that deduction is not straightforward, but it is also a
>> fixed one, meaning it will be always sc8280xp -> (vFOO, vBAR), thus the
>> only usefulness of above is to map each compatible to pair of two HW
>> versions. This can be done via debugfs interface once and stored in
>> public docs. No need to do that mapping every time driver probes and my
>> patches drop nice chunk of code, including indirect function calls.
>>
>> At least so far no one objected that same compatible maps to same pairs
>> of HW versions.
>>
>>> Whether the hw version is actually useful to anyone debugging this
>>> driver I can't say, but keeping it printed *once* seems perfectly
>>> alright if someone wants to keep it (e.g. as we have a long history of
>>> working around hw bugs based on revision information like this).
>>
>> Now if you claim that one needs access to qcom docs to deduce it, I
>> claim this version would be useful only to qcom people (or
>> qcom-NDA-access-to-HPG) folks.
>>
>>
>> Best regards,
>> Krzysztof
> 
> I find the debug prints useful in that I know the hardware block has 
> been powered on, clocked etc. I agree the number of those prints seems 
> excessive.
> 
> The reason it is printed out multiple time is the blocks get powered on/off.
> 
> Personally I agree with Johan - it would be nice/useful to print it out 
> once with DEBUG on, so that we know we have successfully powered-on and 

That's opposite to what coding style asks. Success should be silent.

> identified the blocks once.

Last time you suggested to print it once, so this is contradictory. If
you need simple probe success (or component bind) confirmation, then
fortunately we already have infrastructure for that: sysfs and tracing.

This log should either say something useful or not be there at all.
Printing same version 4 times is not useful at all, considering all my
previous arguments that this maps to compatible 1-to-1.

> 
> Doing it over and over again is excessive as failure to power-on will 
> surely produce error messages anyway.


Best regards,
Krzysztof
