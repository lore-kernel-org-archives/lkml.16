Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7CF126C17;
	Fri,  6 Jun 2025 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252156; cv=none; b=V6HA/yWjhuvQT8fLMMq4OsJNwqbQLfevYEljLzGEas7jbGCHivIMe8+EHxdUkZ5Wbt/H0d8P6hLoXwR0MDsUvU4LgkewkP/Xv/VyGL6CsQrAf4AdzRWNmlrVZrIrfJQSpfVZPv1SH4gGBbqBtOQA8iTIWcYk2WiXM9jvPicineY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252156; c=relaxed/simple;
	bh=eU6dJTRuSepL+YXxHQcCQugYvZ4dpFlIG/FuE/Zk4uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruepToSV+lqeLIEgYeHTr1TaKrrvd9Rw2jpgQlwKafeBlZkR9Ilr43n3hgMqbqnRkEOGmDfo7PwV5vuHz8LCE+OYmdkjS/wjmYsvM6nNIjaUvmG/gLXYbd9iMYUhqA4R+8VikcgywHO0EwUGQjN8J5uyXDZaDTCn0f7OAnezsUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLTb49um; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLTb49um"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73972a54919so2353276b3a.3;
        Fri, 06 Jun 2025 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749252154; x=1749856954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DHT5NNzIwTrIO0R9BCW1/mpj8WR664Wz8IKyxl721Do=;
        b=GLTb49umYRu6kSssHf3SaCuRpDZnF8kjgVt3B7hglq087iqLt222B0e4eYdjvkdmxS
         /16l9cAK1x7KrLtpO2OCYqYJ8rLS/N4PhYTFO+W2eIE9w4lrJ81KELOqO4zgQLZyqVPj
         BkLbUJtNYr/qIASzsznRVmYQUv29XqNLBSZJkpQmZTLJh765iM0ERxulkWOtS6kO0axo
         9/LSF6Ulxh619ZYocvVUmRN2BERgFXmkDCEzfXbX1X7Q8tmzYLg2Kf89N/adqVoWBYHj
         CfvSaCEdNxYDKsi+RdurcxF9W7b3950XavPVK+caZjQxloD80Kh9aFYYaXiyVnCke5jx
         3O+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749252154; x=1749856954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHT5NNzIwTrIO0R9BCW1/mpj8WR664Wz8IKyxl721Do=;
        b=YjtqIpywA7MZKNs+Cf3LuohSEH2hZCDSXjX/Vsw6Jq1X9F4mO6ZBhSYbj1AkYnIMpV
         ko4at+Hg6ZAbTXmYQrcN5E46f7oqQcgLoae6dmVs445yfwC27hZ9JnBfwP+BSTbUW+Zw
         cdma1jCmnG1YtRD5CdJCoEOyElgm6ue9VT5ZSroGhsSiISVrgZigYwsQWShGEN2aP+3J
         CVlxTv/X8rmWosEwd6UF49Tp7SqZv8B0PxLGicanrKk3CV9J3JLkNWKT4N02aarkIfw3
         Wi0LujEqrLVytpiPI0ETzRQsOHC5Oo6SW8fK0ogg7YE/cmTvRB2TgkoJE4DNpL3swQ0E
         fWRw==
X-Forwarded-Encrypted: i=1; AJvYcCUIQUBecoe+3bv2YBqND9nGF+fQxrpfDZv0QMdIe+oIl7hrRvw4lcCnJ2gyaJVMinFhhSW6DVGVcvjqzVul@vger.kernel.org, AJvYcCWYoyukMb342uxJoKrE/KbIiL6gH1f9ouVPNAqkQhgx7Yk8YfnjfT26aSQC0jalZYfMq7HRfCGBO9I9Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk+2R/1Pa9jSbgfgSTmjCaT6b+UzIdK/FpkxMMGAr4+pbbMbo2
	W/B1mWbVLJR2FYg/D0DUtTsUmDyyh2CBpmOHGZJz8rXvDRsFaWBb0AyfvV3bd1Tm
X-Gm-Gg: ASbGncvYXOWfkYv7d8kf9GiETzg6Ikz9HOSWN9PuPIQoZ6j+JlI/niBZ9h6IJYEpWKZ
	9B2ak4m9AGy/JNpkHpW77bthBjLUp1pFeOoEiRx83vdlOdAQZqtnDRdP7n+/B8EKYm8wwy1ZVsC
	KsssFBY6OEY7ubXIbgVy3WsfQD069GZdkw0aJ3vBm5SfxCvIbMYkQE9RZx2pV3vlb+dZd0C9RU1
	6I9IBoXoU/mgMrF2q8qWZaVCU2jmGeM96dbWL/unw7ZB8MIcf/s4nV1Q1zbNd0hW//avDKedkSJ
	cy4oiZi6sWdaJdHx6KnPalj5QyjlKTFiJpsQbghkTgQQw0fypStr3mZ8F/VkYqYs9kdiOjyUvrM
	fahrqOK87LHuh5svP4m5UUxfQGtX8iI3x0kw=
X-Google-Smtp-Source: AGHT+IGHTvu028ZoHLu/wVKArhIW0nBJg+enw9a8b6/JbqWjTI9dJuXjFPtlTBoOAbcq72XCs4MSZA==
X-Received: by 2002:a05:6a00:cce:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-74827ea58b7mr6886276b3a.13.1749252154129;
        Fri, 06 Jun 2025 16:22:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7825c8sm1669147a12.52.2025.06.06.16.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 16:22:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f56be7b-d5b4-4753-8649-62ee21d2c6bd@roeck-us.net>
Date: Fri, 6 Jun 2025 16:22:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
 <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
 <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 00:03, Gui-Dong Han wrote:
>> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
>>>>
>>>> I would like to discuss these issues further and collaborate on the
>>>> best way to address them comprehensively.
>>>>
>>>
>>> I'd suggest to start submitting patches, with the goal of minimizing
>>> the scope of changes. Sometimes that may mean expanding the scope of
>>> locks, sometimes it may mean converting macros to functions. When
>>> converting to functions, it doesn't have to be inline functions: I'd
>>> leave that up to the compiler to decide. None of that code is performance
>>> critical.
>>>
>> Actualy, that makes me wonder if it would make sense to introduce
>> subsystem-level locking. We could introduce a lock in struct
>> hwmon_device_attribute and lock it whenever a show or store function
>> executes in drivers/hwmon/hwmon.c. That would only help for drivers
>> using the _with_info API, but it would simplify driver code a lot.
>> Any thoughts on that ?
> 
> Hi Guenter,
> 
> Thanks for your quick and insightful feedback!
> 
> I agree with your suggestion. Adding a note to
> Documentation/hwmon/submitting-patches.rst about avoiding calculations
> in macros is also a great idea to prevent this class of bugs in the
> future.
> 
> Regarding your thoughts on subsystem-level locking, it sounds like a
> promising approach to simplify the drivers using the _with_info API.
> As you mentioned, some drivers don't use this API, so they would still
> require manual fixes.
> 
> For the subsystem-level lock itself, I was wondering if a read-write
> semaphore might be more appropriate than a standard mutex. This would
> prevent a single show operation from blocking other concurrent reads.
> I'm not entirely sure about all the implications, but it might be
> worth considering to maintain read performance.
> 

Various drivers need write locks when reading attributes, so that would not
work well. We'd need some flag indicating "this driver needs write locks
when reading data", and then things become complicated again, defeating the
benefit.

Guenter

