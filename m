Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C21DE88C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224388; cv=none; b=W0KGQW4TLZ+5WZWqNhnXzttSyZvxdBzwT8OsFQV5cHewQxvAm0kqE1ILyJWK+qY8dmS/dIlGtlmlBcnkSEQd3Hz04hiugOXQ4kpvxnyoF7hcbIp0o/R/ngk9Jsez98qw0nehJfAVcwV0yOiezVWtBMfy29tLAPp0DFp7fp1F7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224388; c=relaxed/simple;
	bh=GB+KgBrxXEDkjE6FtaK3WN4JU3vY/RUiE6ujvmcCTWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erhqRJyZ1FZioM1oU5I1yP2qN49314mqVdRxThAIX5bHWqiEPHXQEH5ws9x0ydf8NJ4Cty2BsMBl5GmNRHSrtmzVQJxmnXy4Wssvik8sGShlxGGGM61xY88pkT9RmZNdIP+k7uIBIxrOPTSXHCm5xvWAkV5NmpSIcL8nX1iLTXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WA+r3Tgf; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WA+r3Tgf"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-8613f456960so1707039f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744224385; x=1744829185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifMmUjJGIsQhwUTV/RCg0YV0PIkSUdUeNOFNrIPNanA=;
        b=WA+r3TgfktEIAhMZRGAfBM1Rwg7rqRtOAJ2lQTwsC8PssLw+HpyJ8DqBQNbV8jQ/eX
         juLogMf/dLg4G5vAn+xzBjxSfVB1hX2unSyR78r72Hti1jA/jUwssM03FNcsE2VPzEdl
         QOjfsYnKaDEECfeKa6/PGGtpGzfW9H1ki9oIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224385; x=1744829185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifMmUjJGIsQhwUTV/RCg0YV0PIkSUdUeNOFNrIPNanA=;
        b=a5zFnJBOPBBlhkKASSbwL72qX+STdCCo9ZD8JeEFN02e/Ln4DgMDGozn5EyzScb6iI
         PxiME/PBpQDw00mi2zMeGCvRforNtbMzBH3PSxpd8Dmqczx/HGjpfY+gK8J58acsa3zj
         pbf5wAgswOIW2Im52YmLn4Amkqj3jR/gGdgERV9txPJbcXS9XTV/hF/D4TFG1/2fhoRp
         xccVPYv36aoWLEjer3VgNTOXFcKTGTqyV7Dh6JEYUYR4uXNQ0AFe4Fks9DA8EayHbXpL
         dzcW9eX8f1uxqj00077oioVN7dMhhFRd6ct92/A964aQ2mUXUlHoOYMguQbeKH9l2olj
         mPVA==
X-Forwarded-Encrypted: i=1; AJvYcCW32WqrcqyLW6HGtwm+PBX2i9+hN0XRV3s/PMjRmQQKajxAGoMqdAXrRCWvqlLRYCijWAEN9cFjuXPkHAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR14bqI42t35/yoGwqx48ONGkzlFMyGm0E/Ha98J3pZNpaq9rF
	B2IvcRmCoi6kgOzq5IfeMkkCxhjbX8KgYr7u4ZJB6lngKwPZeHHwWGuecb1Oxew=
X-Gm-Gg: ASbGncu+Nlj3mPZPgrncD7hsqcZ2ipDleyPGsMHr9GyjlsxOn4YQo2AKHkpsgOnXzkD
	FuFC1Gi2xE/KA6Zeib3vmTGalOR/nItwB1xtY3+KvY2WGo9cyAtWRNr2tdcYLo8AB9aHN5Ek30m
	NnHZ96Y1O1JKHjDjn6KDxW/v1kMpdCyYsp1ogSY3F6VE94N27/GiE81qrOqfuX2hCsserGkacRU
	p5fhAYGjJ5FZtFgg6VNyxQ2uxuNtUOBq/EdI08mUE/HxBBUizWsuQh+UWR/UklAxHkoO1SlOf3x
	XiU6JUt8p91sR2PSRwU14YeTZYWpCm9I2VrKa2d2agvgdXSjR7M=
X-Google-Smtp-Source: AGHT+IFQuufNWokgX5APUUxZrBWTZn+tndy1/mhA0AQzSeV+nWt/l+N9Jvp35CKItDvgOWHyX5DPUw==
X-Received: by 2002:a05:6e02:2207:b0:3d6:d162:be02 with SMTP id e9e14a558f8ab-3d7e476fa60mr1761985ab.21.1744224385548;
        Wed, 09 Apr 2025 11:46:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7da491383sm4091795ab.0.2025.04.09.11.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:46:25 -0700 (PDT)
Message-ID: <16d90cc9-72e2-41de-9484-224ee23f6cf7@linuxfoundation.org>
Date: Wed, 9 Apr 2025 12:46:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/731] 6.14.2-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250408154144.815882523@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250408154144.815882523@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 09:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.2 release.
> There are 731 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 10 Apr 2025 15:40:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.2-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

This is the one I tested - please ignore my reply for rc4.
Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
