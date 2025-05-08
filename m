Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FB278E6D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716016; cv=none; b=p+sN32Ymj8B/zyP/tfw9l/hn9tXQTt5pZdj05A/Nh2cS5EF5PVjcMRzQnCR+9WWatKiiO+u391X5hy8SMMQoLFGArgRXWt9tqe79DUML41W8gfSLCEiKeCs5szVn2nF2X4ikxqeI1uAC5c6LqJDhpP3yt91w9Fhm3Ouc76loUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716016; c=relaxed/simple;
	bh=odtgSXwh0bCzCfLwxDrlyXiDnmGY2jKlNaMTO9n4Odo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiNR1Zpks+G2j3mIRaGjrQ/nYeCfSt4zbNntZz4vAwPUwUIkjfCiKRhAdBN9i6PtKsXxsNLgRW+zMqG2Gxa5EB9tCf6aTcSgmmv4kKW2jC6/o9OdEZKHHfr19xGclIvQ5CmPGVy187d12H6KqGcX3l0gq8WMp/LzprtQYPNS1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LVufCD7o; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LVufCD7o"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86135ac9542so42805439f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746716012; x=1747320812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWrVVNVJo/P+Yuo62NX1HsdonWLhPO6Bwy/uZRZodUc=;
        b=LVufCD7oxqvo45XAn+KFDNfLyUt3OST1xWy4mL6JVYzjvbAqqPuH95oiE3fgC0L1q4
         nhZAgRYtF8wxphb+wPJRgDgTXgt4XNJT+6a+4yVY9DU1MXXKdCzgqUXpbxOoBIX4oIBS
         roeiTBU0WMr4RF+wbuvhxlMj36iDPldipV4WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716012; x=1747320812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWrVVNVJo/P+Yuo62NX1HsdonWLhPO6Bwy/uZRZodUc=;
        b=B5kaNx8EnbIpzRUZthpyT0UE0eK/tPnPf5V6ievEklm/rYUm+3gN7H81ypc/+DDDNW
         gQuQmaHS7eYtUwgSGBDySrJcGvfUAaz8QvfPygPv4coaYp0argdGIW0BlA0bvvefaV/I
         aJ/1pOlTOFlIbqxTjAIcqnezkjgN+d3fcqeCEX+YlDiJIsJV38LChQJbS9llcx+HOgP6
         6AvJA12IFsgv0cgh8hrqFkFHa95fzNFFyAN0bnUUsqUqIRGzERqGzNs+pi+urwBB8mnq
         IquAlFUgbINgrVNCOsWVI+uAGBg1zlrxHGu3VmB0Igno9yXyOhkXzp+O1RKRSRNSAouS
         dQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsnsSVxnhcBYoXiHhzu52ASc56Y2YNP5b1of8+jS84QYx2Oh/NH+v3lLQpbKcK56hPQq4nYkfixTD+wGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlIncF4n+22FHkKkyi2Hg2FVMIMu52IeOjjX/EYlH3PWu5Z7j/
	qfMQRE4JKW6+/eR4ZjuE/Gq5vXCAdc2vK/Ysnxi/wwgy1LStbIrewmYZDAeNZhg=
X-Gm-Gg: ASbGncu4p6WatmFt95dyVkbZ8C6Q1sjpHlFIAgf5MmYu6LoyNj+GEhR4JhU/52Y+VEY
	6aMwOlnAv7YK1NWK0QPz6XETUfgStFP2dPVbEu26scPj5iV6HrMTwZqKhhUcv36WD6qaj3YnwGy
	d9WVboV99fTcPLKpHSLujspxJ9Yu25pkQ3gvAQIIS8xU1UzATaaiSTxlrVwOeUJD1f+fVfywLfz
	DMgAC+p/dqgkvJk0N+BW+/HErQJyB/Q5Rc43WO09Gh0LecIu9YPmRpAoK4Q79yCvg9HsiCCRvdz
	KyfCCSWrh6RKhZHCeEN6uU+eZ4IKrQriH2msjLReCJ17Y0+/IAs=
X-Google-Smtp-Source: AGHT+IEwWmhE/+y7H/n+FT285k0C9IJ/JV2prQ46n2CbFOH6T/B5DegUcSij7J/6yY3M2ZKgO7icBg==
X-Received: by 2002:a05:6602:29c9:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-867550e2fdemr524506239f.7.1746716012533;
        Thu, 08 May 2025 07:53:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a917564sm3250822173.49.2025.05.08.07.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:53:32 -0700 (PDT)
Message-ID: <62541900-5287-4fe5-b2d7-7ae182d22331@linuxfoundation.org>
Date: Thu, 8 May 2025 08:53:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/129] 6.6.90-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250507183813.500572371@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507183813.500572371@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 12:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.90 release.
> There are 129 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.90-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
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
