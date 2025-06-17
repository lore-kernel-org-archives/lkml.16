Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A782264B0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195201; cv=none; b=gQ2zrcWEKhKlD5/vOmwrYyf9hgfzsLBE+uaraL/2ei4D9ifRn/30dgSrl1C9vPUAZSIWCn5hu2jYYUhBkFDFRpcujZrbPeuPyBEjy/TE+onbp4Q2Jgesb/Xq/uj3LFZhvVW67nLL4qVeuFkzQl/YwHh/B4eh7+UA5apTvqE5bGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195201; c=relaxed/simple;
	bh=l/D5NMvXAn+poLQPgkO1RMnglJ5burjvSRypMQfBzl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oga7By2SpRufn8Vm7/EXQcBQFQt0c76SzulyiOiCPbyq3VflwgBsjTYzKqI0Ba2gAQbY/dPfA7YO+WwMJ6nr6Xk2wy2/sssbBwjb8WSop6mk430a+GQWtZnoX+TBUDO0aGj7UoDx6CBc/GFsgiZ98kXdhXCr4/zbjuVxGF1iXtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=coVAa+9J; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="coVAa+9J"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-873501d2ca1so200228439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750195199; x=1750799999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHXoE1l6VmkaktquQQpfS4tQHCY95q6ZnsLPHOm+DMk=;
        b=coVAa+9JiOa/qbCjkh3B7RMvFqfXF8zPcT5AQnsh2w2529gun0FLZPxr/BT3AtG2EZ
         6J5ePhNgD0jCxroLBY6qMEO0CWzFahfExQ5MKtvKtnlvXCKfbb0MP8npKB7InqLDKRzo
         i9uFW1CKsoNK1s114E0hnksZa7W4WRsRGmOCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195199; x=1750799999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHXoE1l6VmkaktquQQpfS4tQHCY95q6ZnsLPHOm+DMk=;
        b=fDEJPpadsLPGRhKtPoLOOijuk4pdFZf6/25MUFl7/tvyJL6fIi0NiPiTf9zPsPBX29
         Za8h373k0GpOYOFqO6XaFpXQkNEzY0DVoTXYaSEW4IMFMR3GANzoczPdwaS4UFR+GESb
         7nzs0/QyBqDSuRDr/jXr+pwl835XYRQ75CyulkR93mtDEMy0/3uvb0BcvD9SDS3mT89q
         BP4Nrd55t8Ea1gyrKKHNXNipTq7KLjke1fiiy43BzrZ7AYbeP/g2hNwKKgxkXaS1KSiU
         ZERxKJ3h7yEgOuudNYlAqI2YDEkrzzmOOxbYdCTyiwR/BgbwKylN/NEx8Wc1uqgJ1P2U
         +XlA==
X-Forwarded-Encrypted: i=1; AJvYcCXq9cXoIAdAPA7UiezJl/YNLxTM//56gOM0OP9a610jRtZ2VFGqeiGteUamQbnfrHparuuBXQZGy2jrv8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpBDhruZmxYVyaQ72kW9G7IU9ZOh3j2mn5arK7iJ02uI74a5b
	x0BGTIM/9hRkKolnfywM5gLCyHrGbmdhiJQlJ38kMpXDrvdrJ15a/LrYnDm1rQoBwJ8=
X-Gm-Gg: ASbGncsgCxW+lFHeoZePvpjAVya8qwR6j84TJ6VNLxDrkz/K7RBuLIpryizb0Kqp58T
	pp72Co/q8IE3dImdWDzOIsHwbRSNKZFk1isDvLBxLwp2BPI4hp9e2s5nC3kmJhcqMXYcdbGuEXz
	zEBz5dSHsdR6+qnKsdqfkRA9PE90ngDxc0cJpTRE2JPEiQqGF7N7/PPzeqKySIUKZ418D3IDylb
	P2ozyOcg1QC7fnDn6zvTyr1gahnquRUi4NPC3tF4E0JJy0hWNdn3L9K8XHZ353aNAlgz7NgHhIz
	2AszNExAZO5DL0cISFYf65Bm4LVyMqh5DUGGaH5IDlx+OOm5bsi3eLnvUgVSf2btotdddoqpWw=
	=
X-Google-Smtp-Source: AGHT+IEWunlYJczIJ/My0qwdNVaCNeeax0MjC7QLjknh2C/jvr94Y70XxYA83yB6cMACh2HZsjWOmQ==
X-Received: by 2002:a05:6602:158e:b0:875:ba23:a062 with SMTP id ca18e2360f4ac-875dedb3cb0mr1806235039f.12.1750195199269;
        Tue, 17 Jun 2025 14:19:59 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d570f54fsm225868539f.10.2025.06.17.14.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:19:58 -0700 (PDT)
Message-ID: <787f5b84-5969-4214-ae0d-7438a38d2735@linuxfoundation.org>
Date: Tue, 17 Jun 2025 15:19:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/356] 6.6.94-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250617152338.212798615@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250617152338.212798615@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/25 09:21, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.94 release.
> There are 356 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 19 Jun 2025 15:22:33 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.94-rc1.gz
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
