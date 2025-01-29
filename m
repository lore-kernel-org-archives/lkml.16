Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90A158A09;
	Wed, 29 Jan 2025 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738179414; cv=none; b=aP71UyuerTcNX19pSkWYtojaRn4903seZajpuq2qi0nX0gkv2vu3cACDDCFGh/9gRqApRw0SHZpf9wu9BO46wfZKpLf4YlEjUe7pWPOhv6mU6o3BYxNL2Jle7JkrFFgK/pKIMtDCVkBquMLTZGQFXJ6GHKfDrSXfPp1sQ3VHvTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738179414; c=relaxed/simple;
	bh=85Nst3zgKLsMMsMpGDAbz3zfKoe5RWAK3Rr7KO13TPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpApoLsyCi9nK0teCC/k99SLi80mdW9ukSUGbyHumDK9MmWiFYPI/39jIsJj3gWE5FLBOUwnOyly3VvmX1C9XzTWAb7+hsqi7hDKNSX0JEThodPOChvZ9cHSbwnmSnKr7TyGZtCZqiM8VQjHLPuPNcw2w7L9NgNLwZuMoC/pUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhJ2zIh7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhJ2zIh7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso1895561a91.1;
        Wed, 29 Jan 2025 11:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738179412; x=1738784212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8hnOpxbdd8qH0rRNGi8wy4FwfbIRvYJsU1wzOEmVbq4=;
        b=UhJ2zIh7YGNxrn9DAPNCdNAx1DdhR8h+7XKRtFO3EItPfVJflfyT/ksqVkERaGWuLS
         EHr5Mj70HS4jfLKM4ImGne4pj/tFUcYu0MRwZLiO3HPDPxLBy+e28ExUog8RMu9m5stP
         3RHNBDMZWGQJ8plvoKKWLch4SiO/ql1dHB/kKLK3u9ZciqLilSgEamWKh2KLRmq7RLWx
         is5VL4HeEAEku5Mo43P+COlOHngN6KZlJGZPacBImn2nNgS919q3jMyVJ1GrEFG3riGY
         zqjbaatlXShin5TqZ3Uu4Rw3n93EWVfxX35vPUOLtOtXuAa6rXSJATbGdOopCevT+dFZ
         xiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738179412; x=1738784212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hnOpxbdd8qH0rRNGi8wy4FwfbIRvYJsU1wzOEmVbq4=;
        b=Q2tCs+cWcpi5sMv2k9vL7JsCxHzUYz+Qa7aovUSzLd2EB2cvpp0JQglPG9rWh2l5ma
         7V6HWYRDpGc5mbyB9orftUX9QXvXbZuHlnRoHg2KPe2IWR2rGX6bET40PzaE5u+BePyz
         Ze0rkn/H3pI/X+ECR29LH3J0BZ3SRrzffw/YaHn8yVlBMrpuF5Fy7rkOPjxaCxVpnQe5
         lE1APihv2Vejkn9Lke0Zqvo8TGIokHg5Q0spjUSX39THUdh1LIsle5edg/bYt6oaKa7S
         VHlvlNBpX7n1eMzNbl+O7QJkdcGZx9YtdXJXdtuIkS6GnG0dNPw5al6iquuBMi3NIG3o
         OxEg==
X-Forwarded-Encrypted: i=1; AJvYcCW3ImMEQJb+B7YTLUd1vLUHHPg5CWwCc1iyMGNnPCbc9MtY2Zv6PDQnEekniIiSdu6JD8ZvZsCQKXCjqA==@vger.kernel.org, AJvYcCWQGjiAsXOCAYe+TjxNQQ6JGIhAK5vLddLv9E4zbAb4NuSixX0mJkmTWLstFv0VhKBl2ZqWF99sz7th0d0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lHalNTQNmvAzmiKCWpEpI1TISfcJt6hfenr4+GsTlcXXsmP0
	GFa9LotSQpbVz7PK3JaDU/sUZTHNyo4FowH6qJvC9g51HVFNtRjo5PBuhg==
X-Gm-Gg: ASbGnctEFs68Oy7n9NlhMvYn5XllPyrefw1c+tGJLv+MoIwrWDZzJHPc6YUTUDqMmKi
	sTU9i+2o5FTKsKmBexwhXKUxkXLN7pCR3u2GifZ+5WZKpqcAORha7/1jXooQKi60cfrDjNAE6e3
	tSBbw2RI+h7JpUMGm4GwjLtytTqJ7JtuknybFOKcPMxesZbbYGn6W8aQ6n7SLpjQjX4RqVGNJoi
	SqMH4LjYG3w14iTafv5urKeNr8qo1rrf/w7+zyzSZuaB2NaWLRqm5Mf+JkVgQNyEKA8ne+hY3Qi
	vRC1l+P7dSkcJFk5AHf/L/eE0KyEb1IdXlETHdbrv2ela3I4JiWybQE4r+r4iiia
X-Google-Smtp-Source: AGHT+IFNzbx5ab/ainulbmiqhQciP1bmsM2HPIMtbi6XSg68WxqAF02jDNYnw7/wsSg37mu90+v8qQ==
X-Received: by 2002:a17:90a:e18c:b0:2ee:5106:f565 with SMTP id 98e67ed59e1d1-2f846483ca0mr724418a91.16.1738179411683;
        Wed, 29 Jan 2025 11:36:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbe630sm2322434a91.41.2025.01.29.11.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 11:36:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <74114528-3c5c-47fd-bcbb-3e8b9bcb6669@roeck-us.net>
Date: Wed, 29 Jan 2025 11:36:49 -0800
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7D2F2DB0-E94C-4372-9285-A91C4C856934@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Aditya,

On 1/29/25 10:22, Aditya Garg wrote:
> Hi Guenter
> 
> Sorry to barge in like that but I have some issues with this here.
> 

No worries. Thanks for stepping in.

> 1. The iMacPro1,1 is a T2 Mac and the applesmc driver does not support T2 Macs upstream, thus making no point of adding this. We at t2linux have downstream patches to support T2 Macs, but we do not aim to upstream them since we wish to use a separate, and better driver for the SMC on T2 Macs.
> 
> 2. The person who submitted the patch took it from the t2linux project, of which I am a part of, but didn't care to even credit the original author of the patch. I’m not sure how legal it is to redistribute the code in his own name and removing the original author’s name without taking permission from the author as per the GPL2 license, but I think the author should be credited. In fact the original patch was Signed-off-by the original author.
> 
> For reference, the original patch, which we never intended to be sent upstream, is given over here:
> 
> https://github.com/t2linux/linux-t2-patches/blob/main/3007-applesmc-Add-iMacPro-to-applesmc_whitelist.patch
> 

FWIW, that patch looks much better than this patch.

I am a bit confused, though: You are saying above that the patch is pointless.
Is that because context patches adding support for T2 are missing ?

Also, what about the patch at [1] ? It also adds t2 specific functionality,
and it seems to match another patch from the t2linux project.
Is that also missing some context ?

> I leave the fate of this to you now.
> 

Thanks for letting me know. I dropped the patch. I'll also wait for your feedback
about the patch at [1] before looking into it further.

Thanks,
Guenter

---
[1] https://patchwork.kernel.org/project/linux-hwmon/patch/20250120183343.3494-1-evepolonium@gmail.com/

