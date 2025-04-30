Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71332DC79B;
	Wed, 30 Apr 2025 04:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745986383; cv=none; b=TJhKg4alpZdd7GRCGGw779UEFhuaVbByi9ZVIJgZU17TqoHjUggphidvyl2UKqIWPhwyYlcbx7sD0y3Dn8zgHzwI9nlh/TUZcnk7etPRQ4sN7YC8HdwOv7qcrSkKOWGZhDhNfNQ1/OzVRXNOj0fo+p6HVD7tZrIhavm7MOvi2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745986383; c=relaxed/simple;
	bh=+vLoBUyBbfOW0p5ALQYRQl8+76l+gGtrQlSwtlhjiuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFoES3Y2t0pyqic8aH1ug050oMj3AAp3hyyTWCw14CtKEta7/KF0lg4vzER6r4pp4VeZOHsbZsCbWl7KJxbdzR2HxfLtk94/ALpzkcWb4BYfYJIOek93AopFZxqhBr1/Td8qOfZC7QdqctZJMWvHv0ldlwHxYzU1TcqifxwTjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAirQK6V; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAirQK6V"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b07d607dc83so6028677a12.1;
        Tue, 29 Apr 2025 21:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745986381; x=1746591181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0lYyz7kp9ApBKDgqYYFRmH6DF4QHhnm2TCrMOMq27l0=;
        b=CAirQK6VxKHulZ1uswwQOiXnfXiicHHKcI1WNISVnhkhdQFobq1XWfWtfChUxHZgSd
         sLLEqhtjpHpgTANiRziE9AHfek/QM5PrXC5KomeRp4/co41twROSy8fXwnOWNd3qokEM
         VRyRyjOiym7U4fLdEHQqnv6kiswYh/G9BbcPtV5nrXkB6HS8y9NG5QgrAY9hUqtOBe/D
         hfWNYfFjvYR1CcTy6kvhGn0K9oH//gm87WG8iAzDV08AePqETF99NYK+CTeY/YWaECGX
         4qSPfyPvnfVjo7yS0NwRUfKDr+UD+FRVE8unioGhhjPedvYPyOapLKzTg4LftJ+b/XOU
         PS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745986381; x=1746591181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lYyz7kp9ApBKDgqYYFRmH6DF4QHhnm2TCrMOMq27l0=;
        b=BVLiUmsGKeJ6c3Quhc5ushrh9WgW/LWOrrghZ1ZcWUWugHrXULXMQ4ltTNUztbA3br
         EEKasHbRW9WlVwtTJnogUdVzhABAQxFkXAWuSAjxnZstAU6bBgzB5492cUo4O3/yns/4
         bBpYkG9nkUweqWZDT8bI7bN+N3G2B3qPIUfUrwhMOhdZRKNX+YdEHNcdFDu394BarUfv
         NnMwVMIyl6/PP3ISEF3MjQb3RE8cLkirl7QuNNMZlMTwC1qjLuiRodW/p193IaOvA5au
         S/A4urQpz3JA3xUhu+65TOlsBy/EhLvocSnOIbWk0eSD/KOd8R5Q1MRggGHPGmsoWmw9
         4lnA==
X-Forwarded-Encrypted: i=1; AJvYcCU/vBNLJDE8f6y0PPFvH3R5yldUIMPjxU8FAxPV+Yx8JWNw90+Yra3i1TjlfbAUccjOUQsh6itlmuaSNjHt@vger.kernel.org, AJvYcCVC4rcF/LAseSx2+fzu9rz+fLn7FMohbskSfgDYnyfzTQikJQpNc7671HoClXRylM9fOcPEff1ayrYdnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9j4NbQyN/sc47X/RckRU8v/iFL1YYEvdv38pQhleHmcFlEbO
	1MODHgiJoofdmaMpvlp1h6ashS4hdigF1wf8joykjOqlC33jxrKa
X-Gm-Gg: ASbGncv73Y/xB4eY0KHRyYwNL4saiwxjLRoZ7tcLsUiunXjB0rL7tOwmP53qNFiRMVH
	1PGnfGOpSyJOaTete15tKLSJtYAOUqgLit4+658WxdrS3iW24gQCa39t4RSzMmeQQSAUF4WuxZM
	NL/DKhjeeereOFgT9S47ZSZh0qjcflpVH+3Y1Bh89CO2haZvIhbaxxOSxnfiwBSRtXAaq1YQt2V
	XwmZpRBz6h9+8EAlp6d97mr6Vh3wOwNQNjmUwUQH6std0PehCNncX2hMqvOVDVf6aTNUzRuuaBK
	qQS4Q6Kjdj2ILyRyetxmxbwHHQqEgibE9K1QyMGVc2jvZVDhDqIycJNAg+pFgeDU9hQqJNQnCvb
	iDcynYZHmyNmZzg==
X-Google-Smtp-Source: AGHT+IHtnuHWAoSrminxdcgGjYVFGhJojAPq9aAZvh1ApVsw69SD+kJ7qrCFSFQe9PRM0uaASalHuQ==
X-Received: by 2002:a17:90b:6d0:b0:2fe:b9be:216 with SMTP id 98e67ed59e1d1-30a3336ba48mr2221689a91.31.1745986380842;
        Tue, 29 Apr 2025 21:13:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349ffd27sm468389a91.11.2025.04.29.21.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 21:13:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <38c7114e-3ea0-4f4b-bb12-5715c992656a@roeck-us.net>
Date: Tue, 29 Apr 2025 21:12:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Alexei Safin <a.safin@rosa.ru>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20250425200051.2410-1-a.safin@rosa.ru>
 <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
 <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net>
 <CAB95QAT4JJFYiXviJB78KELFnsitDj=Zb3EM_1F8uqiRHMwBhw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAB95QAT4JJFYiXviJB78KELFnsitDj=Zb3EM_1F8uqiRHMwBhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 04:30, Eugene Shalygin wrote:
>> If this is seen, it is an implementation error which needs to be fixed.
>> Returning an error to userspace will leave users annoyed but will not
>> result in a fix. The warning backtrace is warranted in this situation.
> 
> Thanks for the explanation! I'm still not convinced that such a
> generic error message (without the type and channel) can be of great

Feel free to suggest a better one. Maybe I misunderstood your earlier
concerns, but it seemed to me that you objected to having a message
in the first place, not to its contents.

Thanks,
Guenter

> help. Something serious needs to happen to trigger this error, like a
> hardware change, or a RAM failure... If the purpose of the message is
> only to grab attention, it could say that explicitly. But anyway,
> 
> Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> 
> Eugene

