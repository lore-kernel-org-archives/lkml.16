Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B062550B3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028636; cv=none; b=cIRn9kiOpz2EipHRu+BHG6IAMjJzqDmw9N8Llc7Ov5IjFw1q9Z27ZfPQIkYxFpVd7iYPHtm6jnz3k/U/qS/kSVqmf8TdXuXjL4DMnnhwXg8ryT1m8T7/bfLrH/DIprAiFKLb2Bf1ST/jAuVNikqvVhNeg6Qo7hvShUo4u/DpZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028636; c=relaxed/simple;
	bh=YP0fZeLAlpTBiDWH5wF8m33b8xj8zwDegQm0YdkxX+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tm2/yeI2gB1RM1JIKEvonHa5lKKG3NoWonKmSmhLwGV/0I8BhsmXd45LU2HcVlpgI6imkZSQEKqSjs9krG+yhLcB5moVG7goqv7L+V1MXyJ74lCQOgeZFoyT+rCM3Z6ZO/FOMl/BcHToD7XKoJw4HSGiDlVh02Fe49vqHL1hz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L6CL6EY1; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L6CL6EY1"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85d9a87660fso710691539f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746028633; x=1746633433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbg0k1gnF7nXpY2T7u81fy1ukn3uxWlDYnypZdEAQtg=;
        b=L6CL6EY1zWDur16EVxpz09Cf8KshLS3wDuHRAeCfunzqkMygW88RTKLGtOt43+66Xi
         0+QQSATt87u0B2LX2c4tS3RAc4PkvsvfjSr1pI93NaaSRC+eGzbwoGmk9jRFnywxUNDH
         JLyuEtFlMgmjQ1O8VV9JRcNv8n6J5PsbxO7eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028633; x=1746633433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbg0k1gnF7nXpY2T7u81fy1ukn3uxWlDYnypZdEAQtg=;
        b=iSpDmTOzyzKmw/qP9KbpqpB6I4Rw2fR9smhZkDj8UR90rW4Iu0IvGbIByS5ILGgAxC
         UQ72vxzr4e3hUU9op7Ao9jRP4T53f+fVt/iEAciHyPtAXu6Kw5734Y/kvgb+rZV3Kx8/
         zon+66ObivpZYkswPfMdEjVjlELBTvH2vyL2YLaLKM3PmETT395VNxmZB6EXGDZuRCvG
         o+eFdj/ZwhQLbaI6IGoCN0Gs03BI2KQpJS6SFvZH/fN2ZDRq+NdpRr4phRHMhhfdssVm
         8ErH6TDqBev0lsd2JJDrRErnI01C5e6tXIsU57xpSqzGXUSou+5UCCATKoZ/q6Rv8Akf
         NJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv9pS+I2nuOKyDIMkZsa3ESREyAejgCdxYvmOIMHuLCoCCnVeabJ4uza4aKz0dty1BlkutR8whJXFyJrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFV3Zxx6ZtWVIambiHS67cOQYYDdfszLk4wr3VNonpC1KXURU1
	+De5DsSvf7oPBZuHkJNwJrhrLNFePKFsX1EI55oece5sBpIQIe1WJa7cQS/ro7k=
X-Gm-Gg: ASbGncv5XDtkAwLDUEgPAAYAZupZn85URSuNgjBwg1AMnHfmbIdxmcBVO1YTzKr2A2U
	4qy7tZ79WdQ4lH8NSWOVy05JvfFqfMEvIWoFbxJ74zKzPp72p6w4Kpxzt+qhPs6wlkvhPKe3PmL
	CvOb9wIn3SRDKRyk1pXH5Ayvhy0TcDp/HHtZNxXbo4zHbW9dYqfvBIT5ApVrCna6687Wg7jcnSP
	QGew2d4OAHUNvhIV/ucb+uLtY6ynLq70i9FWw6PK1RayggqLKjx0EMRh40LUQyrcE51aVLCM6YS
	/hg24YyduLxmCZzM5zaPGRYwKENO4CUxcOpFuQPjwz20xM3jCYM=
X-Google-Smtp-Source: AGHT+IFh3WGBACndewk4cZtkcC6191QkBbQBb9kKJQqhhi0DpqegJ/d+by7PNLwd/DZjTq7NFYBTiw==
X-Received: by 2002:a05:6602:4749:b0:861:c4cf:cae8 with SMTP id ca18e2360f4ac-86497f4455emr317771939f.2.1746028632896;
        Wed, 30 Apr 2025 08:57:12 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f863149b3dsm795000173.107.2025.04.30.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:57:12 -0700 (PDT)
Message-ID: <e08635f3-bfca-462b-90e3-4c3d23e0640e@linuxfoundation.org>
Date: Wed, 30 Apr 2025 09:57:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/280] 6.12.26-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250429161115.008747050@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250429161115.008747050@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 10:39, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.26 release.
> There are 280 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.26-rc1.gz
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
