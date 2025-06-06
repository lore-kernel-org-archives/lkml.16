Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C72126C17;
	Fri,  6 Jun 2025 23:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749252014; cv=none; b=dYk6kxvu8XSnsia9811LNIqupfKEJns2uTldQAAY9Us+ZSWAPXNQR32BL5iVRdO2HVo3RsRcm4BjnhTZ0qjAXK8qXs3oBExsS3V8A//7E1c7PM+WKeL3+MfYf5Yv9J7SKibAdvGsoofQLqsu9QiFMeqBociCSPbw8J1pKZEnCAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749252014; c=relaxed/simple;
	bh=pylFDSoovx1eheY6L0fuY2PkOFx41ur5gKrOoQv3lNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxgHTSs/zndrGMoODNmg4lsi6qR2VsTrYralLDQ9htkalB5pgEUqqx7jzF2zmbvsL57OwBLx4I5IOJ5fTSfMU8JkGBVkYbI6xbuo/6WzIzA1y6O+zsTelaX3AJECHbG/NtaAbOYWR5IPpB9CWKUsgQxob5BqCZHJDik6QkV87NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvW4Ls09; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvW4Ls09"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so1346994a12.1;
        Fri, 06 Jun 2025 16:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749252012; x=1749856812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FZDG+brYeDJSMPDJyK2aKomnouK2UpyUMRQzFahwJIo=;
        b=OvW4Ls09OsjYLhT4sBOS+LHpPixgaStOKCZMlr1cayECoAUFfMLdao6K/b7gsay+Nj
         O2bcHMJfR5d8i5zmn7XCwGkjApPNkcVC5wATPfPl5Ic0Xk3GJOnx6MS0eW0ax484h+NC
         rM2qFPjDx/EB5Oubm9uOkoguKvuKsLvLJJaMt3Y4eZ40TeJP61c0+uDF04YbKQeyrRam
         FbPbhjo/IEFvZMX60It4GIYZppypjneTTl6yTHWik/JrWIH2YGMbC9Y0w7C2gG1/g4Ta
         gzfyHFDswF6/QRzR6IYslie0xmhFw47BWkUaqv4IYm/iQBsh2gQ6wNJtaD/+2kMMfsxu
         xb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749252012; x=1749856812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZDG+brYeDJSMPDJyK2aKomnouK2UpyUMRQzFahwJIo=;
        b=cbjxZ+fQbddRDYDMRKW4/xY0vm/AvTiqZjr30nCeoJro/ExbEDUUuW42ZlqYXmUfai
         9AKiOAcShwxu0f7WQVx9pixgOthCUQkUZk+Jl1729T2ZN6qLinDz7LInSxbjdgh70N7g
         ev1BijwFWcICSAkOdODYgLCpBF6FTdcCKW40mEIX435b6xDjeUZDOQmXgsKA4ONhRt8P
         wipBM4Opd6xETJj20JcFrRZogwK44nfxPqEn3BOzdwYLK83CeX3sGofkA6vbXukYwwId
         26xrb/vYVisru7k/AK9AbrpEqlnHQkD5hc1DM6/Whx0cdlnxLYTDzE2Dj12gJs7DCCaE
         Oeyg==
X-Forwarded-Encrypted: i=1; AJvYcCUqXyzr7NJkn3qaPwpNJWg1TC7IOskccdPTRqCqCNBSibqTWADuPslanqa4lGhhn6tYfbKnhvBJeGX1y2YS@vger.kernel.org, AJvYcCWbZNJZ7mnDja4YIRAHO3NxZ3HlccHUbsYlfuThdqjnmoHa9WdqwRF/dmeHAdTCFrMPfxD7vUGfmj+8Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/s8cTcUniMwqOoYZ4Esgxz+ErRmnQr2vcrQng2+efS0EpYZGI
	IyqDIk9Zhvkf+pBTIfuJVdvsZE8J6F/MZxm2dOPipgb28K1yTzhRjeDL
X-Gm-Gg: ASbGncsO6qMHDyvy7rMnwUSuHqeeuYlZ6aY1DAg/hw0T/nR/W6R4FnYJkf4YiUpKHLG
	gN3VocvLcGZHk4UQ9fSyRyI8tc2JZYNhZ+83AnQ6Kq+HyXxhazUl1WpHVEIPgWYs12iZGF2F686
	5H2IAQqUXL+Td5D8M40zXhrD4pXRxAslZVyMssKNzq/kKj1gsswSKgkMzFNks6T4zTvOWA/YUQt
	MM2fdWNmS7Nc+yZjkJJesx+ofqTloodfo7/GciKFrVzeP5teJ5+f1XWs+tyiRJRQRYWa3moU4/z
	OsTJX4S8jmwiOc8gD71AJGYZm/NPe1JdUX4Q/pXWpnWDVNZ09ANLQCiyu2pd8M65TviqOw7G5S2
	6Ban8HiTVWmIIFBRv5LvrMB5f
X-Google-Smtp-Source: AGHT+IE+FduGJg/M+00PM7BQpb42nYmhb30gyIG51HLSFNqu1KWYb7qAQ9Pf5P4bU8rm6yUVrfjsUA==
X-Received: by 2002:a17:90b:3b42:b0:312:959:dc42 with SMTP id 98e67ed59e1d1-31347302b63mr7480258a91.11.1749252011919;
        Fri, 06 Jun 2025 16:20:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fdfe58sm1833405a91.38.2025.06.06.16.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 16:20:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72661c37-c4f4-4265-9fa4-e4b31b43f6df@roeck-us.net>
Date: Fri, 6 Jun 2025 16:20:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
To: Armin Wolf <W_Armin@gmx.de>, Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
 <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
 <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
 <0a3a06df-5da9-4b39-bf38-0894b8084132@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0a3a06df-5da9-4b39-bf38-0894b8084132@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 14:30, Armin Wolf wrote:
> Am 06.06.25 um 09:03 schrieb Gui-Dong Han:
> 
>>> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
>>>>> I would like to discuss these issues further and collaborate on the
>>>>> best way to address them comprehensively.
>>>>>
>>>> I'd suggest to start submitting patches, with the goal of minimizing
>>>> the scope of changes. Sometimes that may mean expanding the scope of
>>>> locks, sometimes it may mean converting macros to functions. When
>>>> converting to functions, it doesn't have to be inline functions: I'd
>>>> leave that up to the compiler to decide. None of that code is performance
>>>> critical.
>>>>
>>> Actualy, that makes me wonder if it would make sense to introduce
>>> subsystem-level locking. We could introduce a lock in struct
>>> hwmon_device_attribute and lock it whenever a show or store function
>>> executes in drivers/hwmon/hwmon.c. That would only help for drivers
>>> using the _with_info API, but it would simplify driver code a lot.
>>> Any thoughts on that ?
> 
> Hi,
> 
> i am against adding a subsystem lock just to work around buggy drivers. Many drivers
> should use fine-grained locking to avoid high latencies when reading a single attribute.
> 

The point would be driver code simplification and increasing robustness, not
working around buggy drivers.

Anyway, what high latency are you talking about ? Serialization of attribute
accesses would only increase latency if multiple processes read attributes from
the same driver at the same time, which is hardly a typical use case.

Guenter

