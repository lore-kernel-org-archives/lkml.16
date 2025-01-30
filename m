Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B884A2B;
	Thu, 30 Jan 2025 05:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738213661; cv=none; b=IXym18mdlxQQuj0625hDCNGyv/8TGU5KNP2OERTNVZJsYmPGo9U+GqJ6vq8gb2HGUMCNrB3vHVk6zRoaRY+DFCAsxxhrfHPOpVKxyzvREz6vN+gw0kW+6Pd5C4yUH7gjDutabi85oXRpmOLP7YS7gddDWrCkN1J8DLO/C5OXRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738213661; c=relaxed/simple;
	bh=/3vzIf519sEoRT39v7pzfqjnIlEQTGs5OGXO9Y1tXoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIlrMJrSqtRjjiPoEj9W1+cf5VPG979JYzeJ2APgglhIcEzR2VEO6SAS89SL2s9B5W1FMXjOvVq3vifVyYoJueY70F9jc6evHF14zIb4BiwXXr2XLkFXqd+C/H5V2vtH0ugVWH4bN4qLXbTGs8ancuW/vwKzUu4sMv1HVk0Sfxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abWfmyq7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abWfmyq7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2167141dfa1so5258755ad.1;
        Wed, 29 Jan 2025 21:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738213658; x=1738818458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y4+j1ebiE+NFGWL47CEk+gXSE+D9dAG1jpkq0eYDVQ=;
        b=abWfmyq79OA06yilu5ebPPKU3jqOFWuEZXgHHyZWu/BwjvfOn1bmlzzIQz0cVVuWQ5
         UxWnsqQGb+SFvE82PPBFrR8fozaRLjBo6sb6ngOHuM3OPzpDgH4UmPfjDne3YJkckHTk
         RxcwJgBvAPiFJGAwYksz4KvaEbkWRwzQp9cDBGssgbEJ9bR/w7sOpN2od1ttNyDGNjfv
         ZzuQ51E149MQWM867OXK8DnlgLyLMJWtkOwnPcYLYxunrF6u3i+/EHUp40fN6qroe0NN
         EQd2nbZFJp8fqXZNVaQ0Wbu4EpaNSqQDsNPcVhNU0t3q18nCq5ZKmQWPFe8gTAPQA+Kk
         PeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738213658; x=1738818458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Y4+j1ebiE+NFGWL47CEk+gXSE+D9dAG1jpkq0eYDVQ=;
        b=c4LIQmu7xwite9ty9KZuTKiihkKMce7SOe5yt27BmZLHZnSAIPV5xBcbTyXyciFbJC
         Q95gGSFBmkQp2yD+QKX0nKHGSnT4Ml3TM66BuG1t26hCPoO2kXj4rz/RiXT3gdxVENO+
         tCLyC9YzbDBf0KL/FUJvTpSveOWqKYVvh4rN4O7KnAiY9cG6ZAzmPsVSoBw6E8/0t7KD
         O4oOhY8Tetzvhxz/0bsitawbVzxZO7dKzny7znr9CajRAOpyziGbOMI9c0wZPKIoXkM6
         z4c/CkNydaYofHVqqGwivgZSPK84+S8UwOHZ1JKrQDGjfTaIXu5Aqwr5fYlAfJenTrGI
         +e7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCoEWnHOzZDLDwd59UFajnrGfdp7dVJ0aT65oieb4NuBjsa6EexMkVZqreOem6WhtZHwD2JWvUrWiBgxm9@vger.kernel.org, AJvYcCVZprChRPDXKRdrTFx3F401qPcpY+dzKNF2VdzXY8C7CRh6AVD4SRd/Tg/o1GYF8KwLSNLrWGWUAaSt+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmC/M3WFVU76amevjwQZzJxmEfUQlWonbhDxbBu3D6auqeiZk
	m6RqMHbs8Ait5FvcIK8hRBBS3imOIJKIN785styBppUbW0TqYYC9
X-Gm-Gg: ASbGncsSYfvngScMjaLgIjygV/iSGjw1rCgL6dBc+TfhyRFvYMF1dG5xqZv8C/GLvoU
	2Cd0rLJagXisZS85+/4oGEd39/zjlDhVbF9XOUVxg57YUOFvoHOGkWRhCfnT5UTqI36TZqD3ISW
	ksv2Xdrpy//Q4lZOP8IFXzs5tQS98rDhHZT4r4M5nlMHLwTiuleS7N3HmWDHg9Pi9jNebS98zRW
	R8h23smPe2IbDFGIZ2tLerjvVcKKOm4UhB44eq5SSSi0fz47X0SzVl3qMrdEsS0FvqQ98NIljJX
	duKWuSH3k0VZWIi12iWbgb44hIgOwGfYC0O3X1DkV5HCmCzv2iOGfZJNRWBXgVxX
X-Google-Smtp-Source: AGHT+IG+e0+M8OABpCZAblUGX2Aqgcs9/w7x0x57etLZZNytykmPuE1hULri8XvDZ1E7nBn3q1wk/w==
X-Received: by 2002:a17:902:ec92:b0:216:33f0:58d5 with SMTP id d9443c01a7336-21de195d01fmr30045775ad.17.1738213658382;
        Wed, 29 Jan 2025 21:07:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7037sm5067755ad.55.2025.01.29.21.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 21:07:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <657230af-2675-4746-b2a0-060aad7026da@roeck-us.net>
Date: Wed, 29 Jan 2025 21:07:36 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmom/applesmc: add imacpro
To: Aditya Garg <gargaditya08@live.com>
Cc: Atharva Tiwari <evepolonium@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
References: <20250123121728.1383-1-evepolonium@gmail.com>
 <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
 <7D2F2DB0-E94C-4372-9285-A91C4C856934@live.com>
 <74114528-3c5c-47fd-bcbb-3e8b9bcb6669@roeck-us.net>
 <MAZPR01MB828051F6B356FC4BDA029D1AB8E92@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <MAZPR01MB828051F6B356FC4BDA029D1AB8E92@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/29/25 19:54, Aditya Garg wrote:
> Hi
> 
>> On 30 Jan 2025, at 1:06 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> ﻿Hi Aditya,
>>
>>> On 1/29/25 10:22, Aditya Garg wrote:
>>> Hi Guenter
>>> Sorry to barge in like that but I have some issues with this here.
>>
>> No worries. Thanks for stepping in.
>>
>>> 1. The iMacPro1,1 is a T2 Mac and the applesmc driver does not support T2 Macs upstream, thus making no point of adding this. We at t2linux have downstream patches to support T2 Macs, but we do not aim to upstream them since we wish to use a separate, and better driver for the SMC on T2 Macs.
>>> 2. The person who submitted the patch took it from the t2linux project, of which I am a part of, but didn't care to even credit the original author of the patch. I’m not sure how legal it is to redistribute the code in his own name and removing the original author’s name without taking permission from the author as per the GPL2 license, but I think the author should be credited. In fact the original patch was Signed-off-by the original author.
>>> For reference, the original patch, which we never intended to be sent upstream, is given over here:
>>> https://github.com/t2linux/linux-t2-patches/blob/main/3007-applesmc-Add-iMacPro-to-applesmc_whitelist.patch
>>
>> FWIW, that patch looks much better than this patch.
>>
>> I am a bit confused, though: You are saying above that the patch is pointless.
>> Is that because context patches adding support for T2 are missing ?
>>
>> Also, what about the patch at [1] ? It also adds t2 specific functionality,
>> and it seems to match another patch from the t2linux project.
>> Is that also missing some context ?
>>
> 
> As far as patch in [1] in considered:
> 
> 1. The patch alone cannot make fan work on T2 Macs. As you saw the other T2 patches, the 300x patch series in total is needed for T2 support, the reason is mentioned in the patch description of individual patch, which you may read if interested.
> 
> 2. The patch becomes pointless again, since the driver still doesn't support T2 Macs. Ideally the whole patch series should be submitted.
> 
> 3. We do not plan to send the whole patch series to add T2 support in applesmc, since Asahi Linux has a better SMC driver and we aim to use that. Just in case we change our decision to use applesmc, the whole series with proper credits shall be sent upstream, and not random patches without crediting the original people who wrote the code.
> 
> 4. This patch was originally authored by Paul Pawlowski, and not the submitter, which you might have noticed when you saw the t2linux patch repo (it's the same repo which I sent in the previous email). The author had not yet signed-off the patch, thus requiring permission from the author as well.
> 
> I've also noticed the Aun-Ali Zaidi, the who the submitter has added in the signed-off-by was not Cced, which is kinda strange.
> 
> Again, like previous patch, the final call stays with you being a maintainer.
> 

That is a simple call: I'll reject that patch. Thanks for letting me know.

Guenter

