Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8328CF68
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442885; cv=none; b=LIv0dOYkZxJfAI0M+6baglbIeztKUDjVRhKs72/LlOM7B8K836+WHXjIuknAb/ypfTUffl8cmEcr7B55ER9EVF4V29RKddjuZcmz3o+m4eSmWIBDQZYlAvYymBc7oNTHtfUTvSlBRf5ddq1dTh7bZqO50ZaIzRXHP+JdwrbWXBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442885; c=relaxed/simple;
	bh=6tq9Ua/xdZaRB1yMj385Xjabj8eAWItkrC8osTxEbew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tICgv+EDjtJmlnaSWGJUkwrC1PRroS14LggYVbMNSoIxy3BzzR1iVSWjIOBihLXwr91r+uBuIQDH3lbjqgfQER2FBuUJR4elZWbEIPkSmq7ViSW72S8hTdSAdJ1TIdGx9Zs1OvY4WR+ZanyK9nnPvm3Q3yZvWuJYrc7thU2BfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CzC88QbI; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CzC88QbI"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d8020ba858so3207915ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745442881; x=1746047681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nk82mK/oVbn/gatmlztXyHlLD3lRtbsVbG0sPLQKW/s=;
        b=CzC88QbI1WxKUxgkGzpXLBEXadUshrPt01GUaKj5+RFShGY9YEO9PlxwokTkAf+h8W
         HV86LZjuVgJlsJ3uSJOmQ2S0D0hnSc2Li7zjd+fE1VOOP/Zl8KWb9MaNSSTuKwqAWEd0
         gU4ZIHPuBdfMvm2K3vetNePDRakLaDkmNyZAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442881; x=1746047681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk82mK/oVbn/gatmlztXyHlLD3lRtbsVbG0sPLQKW/s=;
        b=YHRI5RuhxBW4iBvCS1PhJp3F3IQPJauFN5suSm1poxrJNYTnPfXDH7SEJ3zgkPvvf+
         7hZujDLdhPlhMlNqo01vjLdUaejTLaHjvwK/A8lZu6/aBhUtNN+4/Sg7Zfd++Fhh34AS
         PP38M6fDj0G0UL8t5oyoU4qVEgiP+PNGoN3liprzy2VHn9AWeMygymBNZ3vi40spJhLH
         d1O6q5Pa/5ouT68gn+VXp1wvn9GLr+mgGQAMVL9wU90CoLXdwQcRFisHR67bOBN2AQ/H
         im0aheUoY1od/H+bCV9Xs+3gWu7G2v82ahX4hiGbAcDMQlEfCYqMwplYyok/24ua4bv+
         /1/g==
X-Forwarded-Encrypted: i=1; AJvYcCWAGUXuNjvf50ohu0Bx6/u0XZh2RX6nPMQPrYqD4tA351ZPVK/QLk+EF3mp54AawCJfE5+yH5qeMWVQj4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxydfI8+YS+u5QMV3yivZKy5UAm7yZ9/oPd7xbNcSlIdB6UrLHj
	ZTKK9ccx9AX0+YbGp52/Jqk6A9Ta+KRdILGJFV0sEXmlddidohVNX+WPL4WVcgc=
X-Gm-Gg: ASbGncsTNOLS2PZcGhzHN4tVW0fo5qKamRIvL96K8EruUQKwVdnwcXSMd4vnm9qJpc/
	lNq7DO2QOAcWOOTwgg6uE7VqEI7WOTCHmHft3nxgGTcPg7k9XrVp4hprCeSYZjzGSu3O5fc031C
	DKktaCQ4Z+KE1fM0ScWWlqyQMqteDcmtPZIuV1tK303lvTrgo3g3+1Q7TTJlCdceamCoCrTQO98
	+58/cs1t1y1j20D9YrjkSndaVijqNyT8h2WidDYi4c08frPuH1d/JQhccZTee8EofEeKBF3CQbk
	ls+PtUVbrilOLBZTbVtC7rEN3jojh98dqrB/0mh+CfD21SqcNf6/cv1emUYQ0A==
X-Google-Smtp-Source: AGHT+IG0txJrMUkch3h4xwE3V6S68H8BHmpzfqRZMXfkUbFBJk8lpVf5BrXiDWrlVfZA3krODMl4QQ==
X-Received: by 2002:a05:6e02:1747:b0:3d8:2178:5c5e with SMTP id e9e14a558f8ab-3d93040976amr1529665ab.14.1745442880994;
        Wed, 23 Apr 2025 14:14:40 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9276ac9easm5458045ab.69.2025.04.23.14.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:14:40 -0700 (PDT)
Message-ID: <942e0d37-53bb-4d7d-accc-9cb2b5149d95@linuxfoundation.org>
Date: Wed, 23 Apr 2025 15:14:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/223] 6.12.25-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250423142617.120834124@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250423142617.120834124@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 08:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.25 release.
> There are 223 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.25-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
