Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602F210F5A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127209; cv=none; b=nLGo/Vrr1KRPlq6+1fEOidOIoAc78YIgX+SKiekFHe8K3xDwD+studthg+NThLLAjxWVLzmglNOEDii30/zMHKfpa45c3sfJv5hKxFyiPOIcxkgK85o3hIu/uMVHnFHpW5ReGllspEcqPm8kBm3JJ/hv9mkyCbaAjVp+HBmkXxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127209; c=relaxed/simple;
	bh=nCUKXO6dCKnHu7IzoBDjMlKdgxKzmF/UGOro8VhrZ4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8cTkyj+97OHWgt/GleVZIlrhWbAuehauV02I1Nl/rfrXV+hNEmsBEkGBr82lrknpFUF6Iuvcr8rJdJ/hSLKfd4hYBlKTmDb3mzGS4uW7W9+SKsYaeMS0aJp2w9z8EJs+w8TmFCZgyRHZ81mIGzfAt5bNnSWzwm6UE1UqDiz5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIITwvXC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIITwvXC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so7631855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749127206; x=1749732006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jleYuFzLzfRA5MPpLBL/znJ4nBJa4J0zBphZ1LfbvF4=;
        b=QIITwvXCjlewtNIKy8GsOeU2pqzswByg3eg25LHXsOHirndubtlBEfEYqRlMHn8Ji0
         ECwuB0e+yZha+dO3oPZ25wsUvvWrWXlEMnJtM5gz+RbeglE5vBRK6ahd5xiZqf3PkWWc
         qQW8/GQjsT3/vqTD1Y4dpg9nMNpLa14LA5ZfOHXTi1tvVzZG0nEb1pW+P2sIDB5joYcr
         bbmp2hN1ngpzEzvCHjqkm/JU4RQKjIWv4YY1tMmA45hxnYuThF+yBSVSSI4tP/4yTicu
         l6CPaydk0sgZTbR2jFaobbBmi+CkOKIKhP7L9o/MCZ+CQH00AyWMwHZckpBieERthEVL
         GHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127206; x=1749732006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jleYuFzLzfRA5MPpLBL/znJ4nBJa4J0zBphZ1LfbvF4=;
        b=QwgMLiskiskLCsO7FFSEotIMSogBnewN+I9oa5VbgRwf4PODTX7lH6AgORpUwd/CDt
         37LBTEwZ0gibbIxWk2WItfqJ9grUrfCoZfHDteU5TYq2rFUNBihKxxibdOzNfZAWMbBw
         2lDPea4avXEi9/3vdQN55P6E/tUQGkH3bNWwt2kmwkIQ74p99kH2qtdt+u0rb9a9XsRj
         N7tta69e0wJuG51zo/rwvrdM8SGdHXFDeR/sn0Qw3PTPA3P7esw/KDZlup8Q7Zei7AZF
         M8xRcgEmzow4W0iaBGSMKa+Q1QUgSIyUglHqkqZdf6GUeqUNmZnoypjLYloVlyKrkY/T
         enOA==
X-Forwarded-Encrypted: i=1; AJvYcCXoEZlXbyMShVQ+i3YAO4a9WqoAq8ENpFf+/c5PnLx4RqJLihAeEPlp+spRFXiS/Kv22LOF3Hoe6T84Nn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5t6nxWA/3V2HBRSXsbO8Kvs8JimGaMDIQCj1XxJ2K+xy6rO3t
	oSjxUcAyxitAuA8tNrNH4W2JwY8Uy2k4sv5pd0fBvJfJ3oUrHlyDVmr/PJcftU4lqxw=
X-Gm-Gg: ASbGncu85ktDjZO4aDLrJ7u4Y5qvdLJfZzqqNrnW214paQ6/Hh+4rCgkU8aWX+aN/gg
	lHI3nShr0eqJtSw+HBKHPWFBWv7Pn9HF6wetjHkABtFzox3wUwqN1bL9VO/yKqLEbgT/R5br0PI
	BeWBqhAdfPEG8XX3rWxV3H/jzVyUexhcB2RZ2J4HH+2HO7IveWXmbIznbU5ei4XqtnM9AS2u2am
	nLqS20RRZZMA/7DtG80Rxc+19Y0zZTdWvcG97lCuo2ljr+/43hw3YSL8kvQCV3qXT9EpvuBZ6MN
	UEcx9GGFqH1+9nQSo68kXdSBWFyem9jgYa2ly26OVWe7IEeKWmPCTi3c6EyQKXtPTxCD11k3F34
	46EmC1NwwMSrpu7DB
X-Google-Smtp-Source: AGHT+IEsxxsTElehsXiy/j9gvQgKD6AbOSqheG88RGHTrVgmb0CU8UNDkYtrV/BImx3zQJlDwaL0EA==
X-Received: by 2002:a05:600c:a42:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-451f0a8d601mr68257205e9.14.1749127206162;
        Thu, 05 Jun 2025 05:40:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb169309sm18073265e9.4.2025.06.05.05.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:40:05 -0700 (PDT)
Message-ID: <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
Date: Thu, 5 Jun 2025 13:40:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2025 13:33, Krzysztof Kozlowski wrote:
> On 05/06/2025 14:30, Dmitry Baryshkov wrote:
>> On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 02/06/2025 08:16, Dmitry Baryshkov wrote:
>>>> On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
>>>>>
>>>>> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
>>>>>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
>>>>>>> QCS615 uses the same video core as SC7180, so reuse the same resource
>>>>>>> data of SC7180 for QCS615 to enable video functionality.
>>>>>>>
>>>>>>> There are no resources for the video-decoder and video-encoder nodes
>>>>>>> in the device tree, so remove these two nodes from the device tree. In
>>>>>>> addition, to ensure that the video codec functions properly, use [3]
>>>>>>> to add encoder and decoder node entries in the venus driver.
>>>>>>>
>>>>>>> Validated this series on QCS615 and SC7180.
>>>>>>>
>>>>>>> Note:
>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>> DT patches, still depend on [1].
>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>>>>>> on QCS615 over(?)clocked.
>>>>> Agree, so we need to make sure that the driver patch is not picked after the
>>>>> DT patch.
>>>>
>>>> Worse: we need to make sure that the driver patch is present in the
>>>> branch which picks up DT patches. Otherwise building & testing that
>>>
>>>
>>> Well, that's a NAK then (although depends what you mean by DT).
>>
>> I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
> 
> Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
> one branch.
> 
>> patch. Or just merging the patches in two consequent releases.
> 
> That's a new device nodes, new hardware so it should not be blocked by
> any driver patch. This is just totally broken process / patchset / work.
> 
> Best regards,
> Krzysztof

Reading this thread, I don't think that is the case.

I don't see how patches 2/3 or 3/3 depend on 1/3.

The frequency table is a fallback in the driver and the DT changes are 
completely straight forward.

TBH, I think we are hitting an email comms/social barrier here, not a 
technical one.

@Renjiang can you please confirm that freq_table is a fallback, qcs615 
will work without OPP table and the DTS stuff doesn't depend on the driver.

TBH, I don't see how the DTS can or should but...

---
bod

