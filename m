Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BC244670
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952781; cv=none; b=Zy6UIIdXTMHe0zX8uI8PEKKqhM225eeEqsC009EmZAhKFQMoXu4ADPaeFbuGiEUZNN1j5x2ZaWP4CEiD3Mfc3nMsHbvPzpR1KBv5cRtI/QGLQo8xLJi9naC1F0Tc7M/YtqsP+FWRVp0cC2palYzwMI7sGnpesinX1HW59b4kv/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952781; c=relaxed/simple;
	bh=QK6Ymfa95GtyUuSHfuI4LiDezyinKpzbQUwdqooUatI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhAI/RDE7IWMS45RJUaxABBbUCWfCL0nyCaaDfIn1LWtFnQgk6gfto8r2m/D1zz8LrF9AXuE9ZoWUp8Kd06RvEQojzfGDqCrschX5kHfsLU2E6jZY2m+GnLBT99h3//DSmYNMED8GGlSE2SeSdCMVYbmV9ybUq+bPsjt4tW79VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZK8ydnkJ; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZK8ydnkJ"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d9327d0720so44488785ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745952778; x=1746557578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4yPNijB8LHnY5DZirk/kjkGFS1gFcodp+LjleefMUg=;
        b=ZK8ydnkJfqk1i9aKMKIyviyxEgj7Zg3VXwimeCo3DH7bVp6RMhC1/T2LhK58zXH+yo
         x28nWacXLhOCvO9evB2n8VZqTR2rwLWJ1qvvN33qmwRa46j62dumVpH3fqW/TVhbhd2o
         bYM6K8ii/b8MiP+ABtPTMAuE5r07KPW8CFh90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745952778; x=1746557578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4yPNijB8LHnY5DZirk/kjkGFS1gFcodp+LjleefMUg=;
        b=TmZlGtOoNr0gPMvoGf5TEKGAEgEjhrRSOLQYi1meS8L+08QWgMIdKGVsqvpvoL0Iq8
         5c1ILbt2cH7z2lRhPEg281vVExbR5ZGhlOMjF6FZ8Nl5MqHDy+O02zt37pNsOs3V6bDJ
         F2Rqq2LMGiHde8c8L6g/V7xPQqfJ64/S4o3RZQpb1oy9uBIWAURuxgJb+fg2fzVhOtiG
         PAkbGq5H03mb9rX+woQMKL3MVqqONFD5p/pFxr7xOR5Ds6jJgkycwjvxdXzGHPalsWWJ
         rzy01nfHv1E4L2P1OGrFDPfUxeArstDbLraHyvn/T/5mEdsrQfy3xPHuhQ9JDU4C636Q
         U2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTRH21FdatSngfkIBEExAMz2b/TISirEqYaUfWJ8qmFP4rCohgdiDxc24O3R10fThFgDrFROJp9lJ/I9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0vItCsKgNi+QQ7NLg+Qi9Ijinm/tC7evonb7HVPfCnHyJtYqT
	4IqFTdr4pAayyekpw6pUO6fV2C8yvT0dS5vq0CYyqg8qFtRWaEhDh/MPPSWDI7s=
X-Gm-Gg: ASbGncup0KKHqZvFPNZNzQQls8W7cHhwCtzNI7uBkK11dx3vunYwZvuxcjYft+sKDPo
	s5rH0aAmEEoMY98PVv6Wa4d75zo6Chj3RVFHKP0rg3RP0C+VyI2UIIwmKyfS2DRwNqrNyttInDE
	uTX29jQmJSgO6gE8afILulW1bx/326DN9+sZ1G78R/jsYeOR4iqdLj8IkO9+S9NEVKN03jcIpt1
	Vr0CQEo/k8FbkI3UPdRXt11iXrOOBj4E7ODfXW8Yym4O5YirBSWcMGap/NeMAeYtxLQamYJZBML
	9nDFc24PXEbVkG6kN+F0FwiS2D6WRl9KzNg/BI4Bpco5b7RzdTQ=
X-Google-Smtp-Source: AGHT+IFUibPOjHr1A15bkj6HHuP+OSD5vPAsxUFRFKdm4ZJbzf5xV4+dCjqTUUtJoV5mzYv98EokRA==
X-Received: by 2002:a05:6e02:2307:b0:3d9:39f3:f250 with SMTP id e9e14a558f8ab-3d9676b66f4mr3103995ab.3.1745952778078;
        Tue, 29 Apr 2025 11:52:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f2a2ffbsm4559515ab.7.2025.04.29.11.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 11:52:57 -0700 (PDT)
Message-ID: <329e186d-50e9-46b6-b0ea-ee22ad6e88cb@linuxfoundation.org>
Date: Tue, 29 Apr 2025 12:52:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/32] kselftest harness and nolibc compatibility
To: Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kees Cook <kees@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250411-nolibc-kselftest-harness-v3-0-4d9c0295893f@linutronix.de>
 <20250422103612-64ea71dd-d51d-487e-b387-508c372af07c@linutronix.de>
 <20250422085145.GB14589@1wt.eu>
 <7bb64160-103c-4882-a69b-9bc054e62db8@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <7bb64160-103c-4882-a69b-9bc054e62db8@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/24/25 14:06, Shuah Khan wrote:
> On 4/22/25 02:51, Willy Tarreau wrote:
>> Hi Thomas,
>>
>> On Tue, Apr 22, 2025 at 10:48:28AM +0200, Thomas Weißschuh wrote:
>>> Hi,
>>>
>>> On Fri, Apr 11, 2025 at 11:00:24AM +0200, Thomas Weißschuh wrote:
>>>> Nolibc is useful for selftests as the test programs can be very small,
>>>> and compiled with just a kernel crosscompiler, without userspace support.
>>>> Currently nolibc is only usable with kselftest.h, not the more
>>>> convenient to use kselftest_harness.h
>>>> This series provides this compatibility by adding new features to nolibc
>>>> and removing the usage of problematic features from the harness.
>>>>
>>>> The first half of the series are changes to the harness, the second one
>>>> are for nolibc. Both parts are very independent and should go through
>>>> different trees.
>>>
>>> I need a few nolibc bits of this series (snprintf() and prep patches) to base
>>> further patches on. For that I'd like to pick up all the nolibc patches from
>>> this series through the nolibc tree. They got Acks from Willy.
>>>
>>> Any objections?
>>
>> No objection on my side!
>>
> 
> Thanks.
> 
> Kees, do you have any comments on this series? If you are okay
> with it, I would like to apply this for next.
> 

Thomas,

Can this be part of no libc pull request for 6.16-rc1 which I will
be fielding this time around?

If so here is my Ack
Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

