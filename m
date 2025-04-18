Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62EF19ADA4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744986620; cv=none; b=BpDhuVUipp4KbYJl2NqG8JxuW3HWHRWs9p0t9p7Gc5KLY4seNUjzNlvwQ6GPbtgVPmzqbbBthlKcKzu65m1/P9r/9ZYzkFKbgEgHX0UX6XnuEhnwUM6z5pK0P+qh+3L+BL2mC18q2CQPoiZaMSS2YHfYbOXBBr5d9+kkP1WMn+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744986620; c=relaxed/simple;
	bh=y52Pjz1ACjSiMzj5j6qOs9QaWh8OcxZGdCpc07HXUtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jqu4YfbIXFU0dTBFOz7wOGUwgRgTYqR1nMayWCGtDSMZhNYpFkQWMCKqFsrI+wmVlVDkrj40O/vGy9rPd5nrr2/I271lFFPUovrJNYcx50zgpknFqIJTagqVlAqibIoH/uXFylTtmuQqgwcjlHDjixY6SkV19ADYisDQWWSpifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bKvBv8Ro; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bKvBv8Ro"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d8020ba858so17836775ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744986615; x=1745591415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+DrJFQCA6EQjbNVUXpVraYRT/z+CCrEaV+7erS4l+0=;
        b=bKvBv8RoDxsg7PjmYQz/TMw7P/bQyasg9UMYWVqAmxnx2MhP5570brtU0IDfwNzC/8
         PAc4RkbNus82EBvxEp4PbJL2FZEtH7ZUaeK/TX0U4DJeDETfJAiduXoYUNHV+2GOVP/m
         g98BdNvw12Q5nFZ5eAt95+FxLv5BpzNUP8D+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986615; x=1745591415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+DrJFQCA6EQjbNVUXpVraYRT/z+CCrEaV+7erS4l+0=;
        b=AipCgbkZcnN139AhangDiivODl1U8h+FVcMns64BkpjxY1BGeiNX80Dv6hcgVjqNgn
         DXla4zXqMSjSdSsMsda6CGaXTeTMJDBN7BRpqhuFrNOWKu9lqjnUMlswQTMtl6Wqpx8X
         RyGypRlr+bqJGEDge+T1VL2WCbmCxROasvZafrxuAaGBJxO/S7rg3wsxk8+Q0mQCqZty
         KHviFNzEFWghZRewUbW/1a+zMW6H/7JNzNdB17BxOnMilaugh9d8GCPxJf+gpC6SUjsU
         U7sE+g6vsKSKZuxSVPAC2eM+1ZHcR2Yp3tOJAWfKHWEdlWv4ZdZG8+7GT24ng+MxSCt6
         J67w==
X-Forwarded-Encrypted: i=1; AJvYcCUBWnzSqDRFCpyrG4b2vjSYkh5QIAR8M8kIBmhyjPyHCd7J+WQETcNPjGzYABWXUrAOQ2rESmDaljFDEXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPet51z4O835L+ZCHFZxnl9jaI3M5R/sScKi6Cmmy78ktqSQ1
	c+kYyDqU9DCyG6zvzNq/HosLVAhFVJGHT77kPT1rf64v3KK2qovg+tVjz7bqBxg=
X-Gm-Gg: ASbGncvhwOKCGURrSREp2KhX7N6fPRjP9mJxvd6PQxA9Zbmt7zAHCs4sZs/+s8CNwHW
	k2rw5Roh9wNC2OE3fXfxo62sOilWL06/6i88yhWhJZuhmLT2S0HXJcoWkztBPvmZi7L26Tmt+1i
	emUUHe6yWFgtqRhCR3JXzasq6q34hgqEzSbv6EVdDGSoDszUcGCqksi69VaykPiX0SPTjfH6D5N
	9TIYW8OBbamKUM7zne0OzoQW1Y3cqvsHeja6jDHKwHqjIOo3qHaw7m7uQMjgW9AF+5p/5VLUw8t
	qcY6tA56TALgm1gPn9hcTCv/9ttBqNjUPa11q7bY7FMNqkTE+4Q=
X-Google-Smtp-Source: AGHT+IFA83L5hUxqqmTbet129g/fiwMMso0nEIQL+ThEQwkZJZTSp9HJ7jI3SU4GxtqStPvfy/7M+A==
X-Received: by 2002:a05:6e02:308d:b0:3d8:1bd0:9a79 with SMTP id e9e14a558f8ab-3d88ee75ff8mr39030005ab.21.1744986614675;
        Fri, 18 Apr 2025 07:30:14 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a39335efsm469087173.79.2025.04.18.07.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 07:30:14 -0700 (PDT)
Message-ID: <634ce469-983d-4153-ac62-0dd7c3876d45@linuxfoundation.org>
Date: Fri, 18 Apr 2025 08:30:13 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/449] 6.14.3-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250417175117.964400335@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250417175117.964400335@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/25 11:44, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.3 release.
> There are 449 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 19 Apr 2025 17:49:48 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.3-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
