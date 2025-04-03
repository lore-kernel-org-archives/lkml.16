Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9618DB10
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672429; cv=none; b=sldHp6XL0ZmJVOlGb5L5zRThkWsf0owPFWGAGnAMOi2KD0DYgQA1WH4zX8TPJnDlRFaJcxLaN/gIqNM82dQU8CS1ebp6WPVatmHlzfX9z2yVXcS67ClyGI7JgHyTFt4fsnz97O7ARqlM3kv5E0c/r/6BCPdtyiDBEgablmbS93M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672429; c=relaxed/simple;
	bh=DFXiNGsUZS/prZTX0AohzGMataOwoc1Yd+ldROPQS/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phR+x9kY4jJRdW+YfBMvVSepaJ4hbC6s9Q+s2DNNidu8nmyIJcHjlAbwQul41EBcAYatBquuxKrapWZrQ7ZcjZ6wRHYn9t5uBzSATwr088vhl1LRBFMm0vASCqvRL/84Ro5FzusARWBD0NvTENoYRXrtna3gleOVRqbWRDa6GqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krARmDtl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krARmDtl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe574976so3831665e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743672425; x=1744277225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJGDJldsHHtphvbrRdY3xvo2/HKpWaaiy6mJGk4cOVw=;
        b=krARmDtl2uaYY/adrrcdc4bByKoN3jbrmj8QFyYmQWS2izPbivZ7Ai+9Owj5ZpWXLI
         wV2IuACZ2zSD/LsqMH8bDAQBGEJFSBmrlzfMxa3rRgIOrgWc5Xns/MaWYGDklnYbH2iq
         QCXSQO4alMgA3vkTStFaHmdXHtX1HPv/C0yDAzvAHeWo238pUDX+0UhhMyN3ReCXkSzw
         zof4qfXYSIMb1WIYPJ4PlCjZ1VRZuhRuVFQb2JVxNiC+Mg9kFEtRQ40FC98EC/mOhaBQ
         hZjMQqJ8eJVatOyVpA72eVVy2HEUQMY+/EjW9RmxTykQjQvSJJk1VTkKOFHuClNCsNzZ
         QZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672425; x=1744277225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJGDJldsHHtphvbrRdY3xvo2/HKpWaaiy6mJGk4cOVw=;
        b=gCHD7QnEgEYK5tQB97uH9g+WwbttQBzUHuBXK5mfoOLMF7U2DyCM1ZAKXMAouUMmLe
         7M2sfk/yyMbFrRYOxsvvFoQgAyOiDuetbfedAkxE/mzpbVUkBYoIlTU2UvK21r8YOd1C
         vqVLULznZYFzIzrad9U3I6gVrgyTxVxF2GlsEpngRld8rXr3LHqBbPosihmaKyrR6xG4
         dLhlC65F6NtT5PsFQvwUn0bJX4+88NmvgVsTtz4IPODrvKlZPsAr9P4CKwlwdYqgxG82
         8UgsUbJFgfxwOdFgISDDZ9DWMmju/1a53Zd2FtJjb7+3DkZpdjOBocRg6ScVRXEgA5id
         Yi8A==
X-Gm-Message-State: AOJu0Yzqqf3nhEgca8i4y7oCbS47Usbvn0rADbT4RrFGdo9+yYDH8HE/
	a+vDK5w8GDRURVO5PbT5wv43oBntXbbbxHwp8VON3Pp3rHwQOxZLKWMfGSLyo445ghoBIDewShW
	CHWg=
X-Gm-Gg: ASbGncvak6BRtSsf8e4DyqZ4CnUPAB03z/rBNC58LTieEihHnaj5XcJxVsdioS4RJFd
	TC7FCaNXRRCKvYRlgX96kWVhq/lussKkB6B5spTQJLkm1A2HNwuyCn9m5ZxhupZMAv2ENDLmAoH
	jJsFPGS6uJdn2KKxL+B9F2X53aFvFCN7QDsJWfAkyqo0/VLqvFehe2a9XAR2w0pHW3TXgjy5kyK
	Yz+lVg+QMpTatC8SMj7iN4Xz5343aqDCPkE2yZIvswu0SaQYWvbAe+cXlb2XULKbJ6m7CNfIRdz
	9YoI81IlRGQlOMb+/UmaQUJ7SlI/Z+e7ewQTSHzousWGeuiV5EfIC5nZcYS7NaU=
X-Google-Smtp-Source: AGHT+IHb374ieUWPcmM3fn26V5cLpqAG9MCExKHt91U29Au+ntrDfznKTSKKncx3a2Q6TekchVXZxA==
X-Received: by 2002:a05:600c:49aa:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-43ec775b29fmr4842305e9.33.1743672425502;
        Thu, 03 Apr 2025 02:27:05 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec364d071sm12563725e9.32.2025.04.03.02.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:27:05 -0700 (PDT)
Message-ID: <e8c91706-1a94-4e3d-b2a9-9d670021bbc8@linaro.org>
Date: Thu, 3 Apr 2025 10:27:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh>
 <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
 <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/04/2025 10:25, Dmitry Baryshkov wrote:
> On 03/04/2025 12:18, Srinivas Kandagatla wrote:
>>
>>
>> On 02/04/2025 12:31, Greg KH wrote:
>>> On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
>>>> HI Greg,
>>>>
>>>> On 01/04/2025 20:18, Greg KH wrote:
>>>>> On Sun, Mar 09, 2025 at 02:56:50PM +0000, 
>>>>> srinivas.kandagatla@linaro.org wrote:
>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>>>
>>>>>> Hi Greg,
>>>>>>
>>>>>> Here are few nvmem patches for 6.15, Could you queue
>>>>>> these for 6.15.
>>>>>>
>>>>>> patche include
>>>>>>     - updates to bindings to include MSM8960, X1E80100, MS8937,
>>>>>>       IPQ5018
>>>>>>     - add support to bit offsets for register strides exceeding
>>>>>>       single byte
>>>>>>     - add rockchip-otp variants.
>>>>>>     - Few enhancements in qfprom and rochchip nvmem providers.
>>>>>
>>>>> Ok, I wanted to apply these, and tried to, but they fail horribly
>>>>> because:
>>>>>
>>>>> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
>>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's 
>>>>> raw_len")
>>>>>     Has these problem(s):
>>>>>         - Target SHA1 does not exist
>>>>> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit 
>>>>> reading is required")
>>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's 
>>>>> raw_len")
>>>>>     Has these problem(s):
>>>>>         - Target SHA1 does not exist
>>>>> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than 
>>>>> one byte")
>>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's 
>>>>> raw_len")
>>>>>     Has these problem(s):
>>>>>         - Target SHA1 does not exist
>>>>
>>>> Looks some of your scripts or b4 is picking up older version v1 of the
>>>> patchset
>>>>
>>>> None of the above patches have Fixes tags in the V2 patches that I 
>>>> shared
>>>> aswell as patches in linux-next.
>>>
>>> Yes, that looks odd, it looks like b4 pulled in the wrong series, yes.
>>>
>>
>> Even that looked incorrect, as the v1 series only had one 
>> patch("[PATCH 12/14] nvmem: make the misaligned raw_len non-fatal") 
>> that had fixes tag. Not sure how these 3 patches are tagged as fixes.
>>
>>> But, that's even worse.  Those "fixes" are now not actually marked as
>>> fixes of the previous patch.  So that information is totally lost, and
>>
>> Its because this patch("PATCH 12/14] nvmem: make the misaligned 
>> raw_len non-fatal") is taken as fixup patch and wrapped into the 
>> original patch ("nvmem: core: verify cell's raw_len"), Also the sha 
>> will not be valid for linus or char-misc tree.
>>
>>> again, the first commit here, "nvmem: core: verify cell's raw_len" is
>>> broken so much that it took 3 other changes to fix it, which implies
>>> that bisection would cause problems if you hit it in the middle here.
>>>
>>
>> All the patches related to this are enhancements to nvmem core to 
>> allow specifying bit offsets for nvmem cell that have 4 bytes strides.
>>
>> Specially this check is also an additional check in core to make sure 
>> that cell offsets are aligned to register strides.
>>
>>> While fixing patches is great, and something we do in the tree all the
>>> time, let's not purposefully break things and then fix them up in the
>>> same exact patch series please.  That's just sloppy engineering.
>>>
>>> Please redo this series completely.  I can take the "new device support"
>>
>> I can send them but its going to be exactly same series, I dont think 
>> anything will change as all of these patches are enhancements and 
>> there are no fixes.
>>
>> I hope this clarifies a bit, Please let me know if you still want me 
>> to resend this series, which is going to be exactly same.
> 
> I think Greg is asking to squash the fixup into the relevant patch.

Its already squashed up in v2.

thanks,
Srini
> 
>>
>> --srini
>>> patches at any time, and really, those should be marked with Cc: stable
>>> to get backported, right?  The other ones are written as if they are
>>> fixes, so again, I can take them any time, no need to wait for the -rc1
>>> merge cycle.
>>>
>>> thanks,
>>>
>>> greg k-h
> 
> 
