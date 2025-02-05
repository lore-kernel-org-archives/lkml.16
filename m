Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A0C1519A4;
	Wed,  5 Feb 2025 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765079; cv=none; b=j7KY3PoGOhZvNR9Qw5IXsqXi9AnXV79aGXeC4pJfQuTFNtU7hoIpLh5RiDfQnXcKozbdaRuCW8udaSTY9EkFbGIx/X7RQaV/AD1AT0wDZLnklh7vGGAfmpMHHxD8DFsGzHLWoyYFx65YIHUoYoOx5Lb3Y1YL0ML4qCTlflLuAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765079; c=relaxed/simple;
	bh=kCfUchpAvQdouRUqOtAYr68h+koq2v7nnCCAuvbXfks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i61pn72molvLXixxAjzJFbkpJC4RwuCXGT3ejksABHJ6oeuhMXVuJh3QlyLk5y8e9VJ536kqYB80wu3mVMYn5zUrWuGxxG7DPnqmwHsT1Z2reId71BkSDUG12Kk/hk8jlk0FSEpI72CUZLtyzBBAoIZHcFgMFP0tDla5vcNKZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUOZDYAA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUOZDYAA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f01fe1ce8so28182205ad.2;
        Wed, 05 Feb 2025 06:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738765077; x=1739369877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VcuHV//CqWEAEPHklwA8JRpMX3hskDBhsy+HhwiU6j4=;
        b=kUOZDYAArTOCoNm5Rwh8bK61/WccMDxcMF7DMitTmN3uctc9/c8EaOLFpdzGB0a3BR
         TOIZgIEZFxQEtL7phozUIvxSZLi6nCp3JOu5kyfvPPB4MLd6xNNzxG2R2i9mrKQUYucn
         iGPT90JgWFtkGyW8zkhXVvZjQeG5Zqrf3IE5tW8qJQ0KfSQIHLPVZWZE+B5uyP4XrvNc
         9ohcUnv7MDUPwsB65lTackusleC54u0NUb+aBHe+OtG4eYJZeCbBd2saIR4wUnpv7hhE
         q9BPHWISthoSSmGhQH8eQUFjZCXxsgfAVFJyHfInwNkHHDU1nB2Vu+raIdscsoxGH8el
         sxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738765077; x=1739369877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcuHV//CqWEAEPHklwA8JRpMX3hskDBhsy+HhwiU6j4=;
        b=bJOO+A77SmLy1S4hRnz9d75344U1OGIWKQ8AsQydM2ge4qOjmAqFBU8OJTDxNOfU4E
         7uDA8XmSK/4XuqMn7OAlcJpMO3QGeMHxeU5AnIteHaaDyycu6URWVRw5njGHBKLcY91s
         h6HDyms10/qhmnuY9F8OSm675s5160y5uCH4ctxeed9AogvFx7toIAhfaBG3IoEpJgX4
         H6OGmRwWDWlQFD7PAURy22xlFN7UURUAbZV9mv3TFIiiwBgeqNI6GkzP2oE9eYdYVb2t
         0L7srAE9j4fTDDyrZzJVlhObsi64ImTziuoDbpqCOrF9FTBMsCMBcQ5Ls02lLcaB4Ej2
         pnyA==
X-Forwarded-Encrypted: i=1; AJvYcCWAJxWYQMS5wMn8tOSetNnMMFh/jeKYT7mqadN9efnDIlu+i7C/bOovQS0U1jPhN5QWlVrP+51Kn7y6@vger.kernel.org, AJvYcCXmStnSADe722fMxta2SZunJDLHdiS0NunujmWMCwyQMQkWJ54C+2/kJZ4HInSRwHCVrafeY4O8eso2LPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrVMHLb5QpuXG/D+j1WZ33/XlO6L6Jbuu38ni5yIqldqL0Yqh
	75UE3gODogYyYE/ET26maxTnn1HP0gVsESPJ+P9eCnhAeBAuBtyB71qkokxCn7U=
X-Gm-Gg: ASbGncskvoVkMWlUY8AK28cCtrsg3AbhuujOfKuzVVUOihsOuSzzdLp2zFFka+4xRaD
	EeMid2UoxrUX4qH29DcetYKMDvmpapuZm8pgviBT50Kd+iA2u8u8LFgQRVmb+NKAtIprm/HlRE4
	E5e/LG1Q3yBZ1P/1Mby9HPONmwIUyfCbREj8lw0VXDVyefNm3VYpUMYmetjnIEq81Id9mhaGo9h
	w7PhcI5hkCJdXprc8U/lpqEtC8IiZ2KjJZwpnOTUjT0E6YWZrPr9xXdPuwKUvNbi3kvxf9Yay/j
	S+tsozPOg3LrhmU1R9E7CG1Akdzt59n3IdrxvZ5ylmmO8VkrAqkUMn6MP9DhFxYgBDJ13g==
X-Google-Smtp-Source: AGHT+IHm/dN8qGlut67b7C3DuIdKOJbfPC8+1zoE7gEw/+7gw8TQQJP1s+o8VkWrlNQTK5/GY+/QgQ==
X-Received: by 2002:a17:902:ced2:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21f17f031bamr42642835ad.37.1738765076795;
        Wed, 05 Feb 2025 06:17:56 -0800 (PST)
Received: from ?IPV6:2409:40c0:101d:c4fc:7d0c:2c80:3117:848c? ([2409:40c0:101d:c4fc:7d0c:2c80:3117:848c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f234f3cedsm7034455ad.81.2025.02.05.06.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:17:56 -0800 (PST)
Message-ID: <752c6c87-567f-4569-8eda-2ca4d67211b3@gmail.com>
Date: Wed, 5 Feb 2025 19:47:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, skhan@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250204134423.28051-1-purvayeshi550@gmail.com>
 <2025020439-bulgur-ludicrous-5071@gregkh>
 <cc1694bc-88fd-4557-b957-aabf1f444eaf@gmail.com>
 <2025020552-sandstorm-thaw-132e@gregkh>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <2025020552-sandstorm-thaw-132e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/02/25 10:57, Greg KH wrote:
> On Wed, Feb 05, 2025 at 02:15:08AM +0530, Purva Yeshi wrote:
>> On 04/02/25 19:15, Greg KH wrote:
>>> On Tue, Feb 04, 2025 at 07:14:23PM +0530, Purva Yeshi wrote:
>>>> Added description for the 'sg' member in struct dwc3_request to
>>>> resolve the kerneldoc warning when running 'make htmldocs'.
>>>>
>>>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>>>> ---
>>>>    drivers/usb/dwc3/core.h | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>>> index f11570c8ffd0..5e4daec322b7 100644
>>>> --- a/drivers/usb/dwc3/core.h
>>>> +++ b/drivers/usb/dwc3/core.h
>>>> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>>>>     * @request: struct usb_request to be transferred
>>>>     * @list: a list_head used for request queueing
>>>>     * @dep: struct dwc3_ep owning this request
>>>> + * @sg: pointer to the scatter-gather list
>>>>     * @start_sg: pointer to the sg which should be queued next
>>>>     * @num_pending_sgs: counter to pending sgs
>>>>     * @remaining: amount of data remaining
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>> What kernel version/tree did you make this change against?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> The change was made against kernel version 6.13.0-rc7+.
> 
> Please always work against the latest development tree for the subsystem
> you are working on, OR against linux-next, so that you don't end up
> duplicating work that others have already done, like was done here.
> 
> thanks,
> 
> greg k-h

Thanks for the feedback. I’ll use the latest development tree and make 
sure to work against the right one next time.

Best regards,
Purva Yeshi
