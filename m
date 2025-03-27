Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6118FC67
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091588; cv=none; b=d1Z5yo9CAmSMU3sr9WLc9VxHZbWRMNyYWLWX1f8yrpb1PDbMFxMDvAw9tffcu8pHpzztLEMzZ5PVryk1grSzet7UlU3gAfz6imA7SuKdeGhRy9STzymPMAnuKbCo2Xw5azfrwsyXEndDTy+6kJQQi3Xy+wp38bwSLZamYezNk3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091588; c=relaxed/simple;
	bh=OkJr6RzsuFOxmCNBp9t1NWyWBcILwsrgG/WRKx1Oq1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzzIAM/h7HxFOEohLIhD1XnzHHQRCo4JuHi0SOnc4/50lxh4+CtHyg1NgAU2JXkNR9ik0j3ye9X/jUu8M9DtlQbSllT06fVFBAZoK0X231uyEF+Lop/Lx5v/GI5zsWreizO3svuP8VglYXbgHjGzVrYJ+i0tI3vSbxIw/Ag1KbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1xZtLu7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1xZtLu7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso973974f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743091585; x=1743696385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ODrfdElEoZY28zkjI1X/y1XHn/8Sp8TS7E4huVpSoi0=;
        b=Y1xZtLu7j+JJ1CzpBqa3ymXnxYvGJ9BsY1v2p4AJ6SiRy8vOQAe7b8Lmq5q1qRm62r
         4h/GHsNhfjB2fF8c5FfAaQCX8WWZ+xIS6iAWGHQ6DtHXBJKsVHKN4v0/cKP1qsle0JCA
         RxbnVYt/mMwnZm4oAHEfpJStfjnD9kC7L/4oCRwf2AnWS63GY2eu8PpMITK0+OCoYbZR
         gmhklKZfKJa/l+bB1W34K6G4CoSievqTx5YHm7rhmfBJvOabKSHW+95yv9FzhFwldrnu
         8c3cKt5yP+k+iUBei2quWfad39ESF4XtFHBjVgfGQdVyAY+8Q9E2aBKLqO6fWCDy2iIY
         2xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091585; x=1743696385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODrfdElEoZY28zkjI1X/y1XHn/8Sp8TS7E4huVpSoi0=;
        b=S+b55TQ/4T6FVcp9Pe9uCta2Vzyw7SJ27ROrU3IqCLLgt/Fv3Dm5O4RabGtePzw1NO
         EsCR2GWoTvR3LqXGOil1/UQwM5s3Sy9ZrzQEwN+9DYKwozveGRD2T7PohFXA9fqRUGpx
         ckjtq03dc0OfdFLytkmz3g1f/VIOxH+vzj3KIg2VLyp/uwPGff5zsk0OJ5bDFEYgNVI8
         8KKB0Ux6fxvDCRpEO0VGVFsLiaGj/CnYeTZAqR+WhwXK1xixolkwKzL9uYHK68Iv3cEA
         NmNmSk5oSVXFKGreK48R8vvRoEu9U+e1KpvnxZxYqLoP0ppMP1mIayxV4tTnjQ3tgT+m
         m+lw==
X-Forwarded-Encrypted: i=1; AJvYcCWgczOWn1W2brGZl0DEeSTt9gR8o8WdszWQN9z6Q0L7RJemE3iYIlo38l6K3TY/7fRBllJKBHWw4sHUYis=@vger.kernel.org
X-Gm-Message-State: AOJu0YypXL+8mO2BiGy6OeHt1KcIO+b9bU0cy6BSsKz8fyQL9JkMtP+k
	PRQk1JrdE6WGNiqylnuEw1yQIhHhAQctJzUDYz40cE04GcDSAwD9hBesNEdyu0tPP2RXkpGVtkR
	FNT0=
X-Gm-Gg: ASbGncsX7Fz5sxZFcGMycRHKuJZSR1r8qnp+busda3NoxULvPPm3bgqXx4rsFsr/hL4
	1LbahIZqEGo2tVmpvpCvM4lmYFU2DCVlTyl7pwWJdXD9PqEBG+DnoLhbAE/eUTxQBglE1voD1i+
	c+Odt4eVrUi3mS1AvS/px/TFvIdShLXRarE9+pP58jmrb1UfLvIVFTI5HeUJNvXNZ6wklBuXwN/
	OtBFJzYg/OmNTqQo5aK0GAMMcOLwUKXkvsXtksCTVWkWF50wEilh7teaSIe4Z1ueXtW3GC+Ap7n
	CpZVnOM17gkQbhEG6r0l7m5UnHEFu72lXHerJ72G8OPvPkEbkcsG3d0IEYG4fCmU2X8dr8iJh6g
	ppONxaew5Bg==
X-Google-Smtp-Source: AGHT+IGuO+8I/uLt2SZkUoc9sZKT7aW014fnnYSdtQtAXDT/MEjmR+Gj85f/p44Xz8ZWTRvpYb/uGQ==
X-Received: by 2002:a05:6000:1889:b0:391:39ea:7866 with SMTP id ffacd0b85a97d-39ad174b468mr3726108f8f.19.1743091584816;
        Thu, 27 Mar 2025 09:06:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f32573sm41228375e9.32.2025.03.27.09.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:06:24 -0700 (PDT)
Message-ID: <21393e75-d9a2-4410-9616-b1bd6af7a7d8@linaro.org>
Date: Thu, 27 Mar 2025 16:06:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Add OmniVision OV02C10
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 robh@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250324171508.GA668235-robh@kernel.org>
 <20250326150114.71401-1-bryan.odonoghue@linaro.org>
 <W8_0Ch2J0PWJ5pKHojZjFbM8huvxWlaWajtl_uhQF3UszGH_O8WTRZdQxh_eHs2JzLOx7CCxx01UZDHPQqAyCA==@protonmail.internalid>
 <1dd46a9e-e97d-415a-9e33-67ee234c4bac@kernel.org>
 <0de575dc-5afb-40fb-be30-99906d0e493b@linaro.org>
 <c1959f95-9ee1-4597-b6ec-fbedc8a872db@kernel.org>
 <afae182f-b264-4b57-acd7-2c2cf090e1ad@linaro.org>
 <JdPoQXJoHcHuLJ-32TBarKN302TbQtmjhY6VC-GEBWlERJj-eDKKj7QdAPl22deMA1SFCSnN-3AfPoLreqANFw==@protonmail.internalid>
 <da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org>
 <9ad5d838-19d5-4557-b028-0ad88be60b8b@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9ad5d838-19d5-4557-b028-0ad88be60b8b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 15:07, Bryan O'Donoghue wrote:
> On 27/03/2025 07:09, Krzysztof Kozlowski wrote:
>> On 26/03/2025 18:34, Bryan O'Donoghue wrote:
>>>>
>>>> I meant bindings are exactly the same, unless I missed something.
>>>> Devices are similar enough as well.
>>>>
>>>>> Seems simpler to me to have two separate files ?
>>>>
>>>> Not really, more files to maintain, more trivialities to fix if we
>>>> decide to change something in all bindings (e.g. style).
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Hmm, so we have two in-flight series and one yaml file.
>>>
>>> OK, I'll drop this patch and add ov02c10 to the ov02e10 yaml as you 
>>> suggest.
>>>
>>> So long as the yaml file goes in first, the order of application of the
>>> ov02c10/ov02e10 drivers won't matter and can be fixed with a cherry- 
>>> pick.
>> You can combine the series or add here a dependency.
>>
>> Best regards,
>> Krzysztof
> 
> So just in terms of sequencing, are you happy for us to merge ovo2c10 
> and then do ov02e10 ?
> 
> Since I have a bunch of driver work to do on ov02e10 I think this would 
> make sense.
> 
> ---
> bod

Just to be clear I mean merge this yaml with ov02c10, then adding ov02e 
to that yaml later on.

I'd expect there is 1-3 more submission cycles on the ov02e side.

---
bod
