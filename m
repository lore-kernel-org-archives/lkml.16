Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC042989AB;
	Thu, 15 May 2025 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747308502; cv=none; b=XuhkdEQA6MBAq20YFb6R7ZRlCdVNkFFjgEeJ/yioBa6yEVEQu0bNfkWEYMxP7n29oDh50Xk0kSRDiSU+L+Rw/2GloXugl+i4g8/4E+UWkvZARBYQsLpwlpykEqs+BpL0kIHkRiZ3j6Ec+BUNvSEKTHD8Hqt+tDq3NDzF/9yM4hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747308502; c=relaxed/simple;
	bh=4MT/DLTi7niUGZGCsKqI5kYWYDZiwVQCm5tQvlHebZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGtSuzjjN/2AAOiBSUzsMIjfBfr2YSBRb5VduATFILJuURM45E1BkrO/J7EcV+g79fJU/NuufUpcVhOZhYEyE4+ol7g+uF/l8nSMt0oOd7QN9ujOc64tema1Qap6ujkpOgfWFWE0v1O53rIuEjm8VbWPckw8CNNhk4Ah9q9MwkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/Jd2wzm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/Jd2wzm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbdf6973e7so999303a12.2;
        Thu, 15 May 2025 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747308498; x=1747913298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJL0KPlMp6DZzpx4wyF8HL/lXswTHi9cEl/RHcvMRDg=;
        b=S/Jd2wzmHALJtwX/6XRTk312otdP4f5Rvzgk0e1LIdSt0rB6t8T8td9MyM4/E1XjKV
         bZYLgHUBysKaU9xDmQAvKlhPVhoFBeP+rGWHBRYXSndjiZGYsnP9khYLHn3+jGMsLJF7
         DngEbigABuMC8cpsPO4ObIC+zbAbq/5WsAa6fIOdHA6YnECxhWg7cA9UEuS3wOukV9A/
         14dGF50RjM3P/9jmzBLbq+rX8yFLQvVTNHDzzMjZSjTxHMh1z/ReDd+1aZ/zqAMQarbG
         g4m9A1Q0lq7urrZCuCccgiBHq6d8L4mSrUV1+XoywDAV05ddAMhUXcziOtQUuAs8Xh1l
         gKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308498; x=1747913298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJL0KPlMp6DZzpx4wyF8HL/lXswTHi9cEl/RHcvMRDg=;
        b=j2w0n19bizaI+FTmdNQGrXcbMaS4UpzwL+8OAxOqMXSdOGM129e4h/chldjWRz+QVx
         2wE2U6N8Lw2/H+nkiYpkXO/udLf6zIVEL8OGyh7svtziKkF98p2cME6ktmrXRuHQvojo
         fWKnuflnwpEAaAcsYqjViAmgFnfihPuBkBQ7nS2qL/WgdjdKhFZKzEeUpZepQ/PnJye5
         G2LmUp5kINcQ9ufxAAA6eHa0X26PuoO1JG+1McgEVVCBn4TJwbtE+KUYfDsL2yqrl2fg
         SuY/R+gOBw2dp3X5zHd/Q7KgWWS3Yfa3TXsiaRld+TRK1p+PfpUWKY/6QzyZPdhw/6l3
         US+A==
X-Forwarded-Encrypted: i=1; AJvYcCVtneUiexKtG2IylVa9eTV8HEYlHCsyiI/vQhjHV03YOm7W6A052+G350CVItkXTautovpDm2sY/RTh@vger.kernel.org, AJvYcCWEjPafRxSQrXBPKTnbTbWpFLuC75xti1l6dtXtwr0Vdz8/Qrx6KEzEUS/D3HrImA2XkujI+fh/TG6nkbHN@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrfd1saNS/Ohf/VFpsmw8Xu3K4mvV1WnB5Onqhek7ILf/+mnv
	N7193MjWettf9OKOhB0fLJdJ6hmfaTZ1AZ15+yYnQ3ARtDs/n4AZ
X-Gm-Gg: ASbGncsuVX+Q/Uld7C5i6cZKOGRDTBuvCY8k7R0DNQkN5ZTY/lDJ6zuaKUrKjWynwjz
	g/hkhu8TKcj8Uos0zDIZ9GBbE54PJkG2OvHGulpU3kK0oE3uaHvIxATzkaw6WWRtB05AkpRvizC
	hSyJwIr5AWR/L1eJiFMALlseF0c9ZZf1xa4mcP4ukps+cfpPWrH/yxL2LJx9RerxW0cGCob3JqP
	Lm3Oivlkza5/TEl/BmNGTCLp0Jrj5CrwdORA9Po9KWyIXmmavsUOsOVb8LueoFEgMaLDgbTtZcv
	q8rC6t7E10rI8lsRKofetAauOyZZePNyHSGehDqVlM23x/JnVMsjhrqoKvggk26V4cQYBEU8TVI
	cENixFDIxGBJd/rdpoHcu/hkE5A==
X-Google-Smtp-Source: AGHT+IFhJS8thqNyc4H03aabnDsTjQOnAfvBj670xwICkIM30ExHIQVJjpRwvQeCLIt5Heh5jZmXuQ==
X-Received: by 2002:a17:906:99cd:b0:ad5:2907:eeb6 with SMTP id a640c23a62f3a-ad529080dd0mr2896966b.38.1747308497559;
        Thu, 15 May 2025 04:28:17 -0700 (PDT)
Received: from [192.168.50.244] (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23ad2b386sm909023366b.104.2025.05.15.04.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:28:17 -0700 (PDT)
Message-ID: <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
Date: Thu, 15 May 2025 13:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 11:33, Mark Brown wrote:
> On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
>> On Thu, 15 May 2025, Mark Brown wrote:
> 
>>> Well, you choose 3 - I do think it'd be a lot easier to go with option
>>> 2, or with applying the rest to your tree as acks come in.  There seemed
>>> to still be a reasonable amount of discussion on the MFD bits (eg,
>>> there's some formatting comments still) so I was expecting this series
>>> to churn some more and was waiting for a resend.
> 
>> Yes, I expected to apply v9 with your Ack.
> 
> OK, that's about where I was expecting - at least one more respin before
> the MFD bits are stable.
> 
>> I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
>> in would be sub-optimal and would likely end up in a mess.
> 
> Well, then just going a head and applying them on a branch with a tag
> seems easier than delaying then.

I can split the patchset into two parts (one for MFD, one for regulator)
if it helps.

Best regards
Artur
