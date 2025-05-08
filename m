Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B188189F5C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715652; cv=none; b=F25TnapULyAnlfKz1+fhWDiHIkerF5Gv+orhErA3KoCtHd3LIYpUQqnOa9EeWfJ/93RQDpYFm/xrt1qRRNC6beyjOfaOXdF+SHusVPKPNWuOKx4WOZUBI29grhDUJmVhOY4UhTeGdAqGITKXzqxhJ+Qj0O4GmovP+iWmgGHu3bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715652; c=relaxed/simple;
	bh=luUJyA3uAaGs/PyaYYxxJvQIzj2lSb8XygjS9Rd72wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCooEgqG1+YX6hLRz/+N3Yi2+gHt/Dkm2HnlEGGrPQbgmuEhRxvjC/n9/kQqLOliVMJEcNn7WOcws9kqoG3k5xcret646ypRkISiYSuDut7Ck0r2rqC2d9AWdRxabl1pIae2c5hllUe4eRMupOaINJX/65JY/KKiHCIl5kDWDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CWjR8rVv; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CWjR8rVv"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-86135af1045so110565939f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746715649; x=1747320449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrqpCdSBggVj7dmGh50mibgH8h/HbWjldXII+uWa/Ng=;
        b=CWjR8rVvIHl1SIC04usauXWnvyBmFePWwzG34bzk4MxItz7a4x6+m5ilQjR1qysaWj
         Ff8P3xgNzPzPigmofMBHEzg5Sb/mdW6qzSvVvJfXQW+DjnVaGa2SDpgkZDbJFz7686k8
         +GJFMO/1NYt4koKXasHuSl/F49WHb2eYLnEL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715649; x=1747320449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrqpCdSBggVj7dmGh50mibgH8h/HbWjldXII+uWa/Ng=;
        b=iThoQBMYJhw3PTpr92wrgD1c8AkvPWQVdxJzwd3f5vnTJj4ZIEQOBIRUJXX4Axj0rz
         BGFPwCIPxncIv4RG1olQaat/H8AdTngITerqLEQvhUf2PujUHP8fiBtpPvHvjWCUk5+p
         R9naiMwRgSobX+bvlOVM8xw8zhrMzMCeJfvASz3p6dUUFNOOqw+TlU6eYFMVGVpKz3xl
         QGw+SCSlDjvr+DYSJuN4Ua8m8eLqKFWWq/ZqIkrL3gUpu6CacQ268Thl2YC6A/qiLpl0
         IIRy7xquxVwsxAh1GTiYlkrKIWvWyhP9zgF09CFeXcZQo/dZfF2cfX21VURgnYMvQIzo
         JZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfEoAgdHU2wtPKobBGML2GGxorXjHCQgx8oFJQ2r1jIgcaKhyIxgCJdywmDoFbb4rpXhNx0OPTRzZ8luA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzUY5xDBjHnOyGUHGz3tFgCYeUQl20WDvh9YofSIr6gWztSxf
	/KEu+cWgxLRROdCXPm19j+IRFTWGfLOu2cTeC1iZ0Eqm/1nWyFqwm3KyUfJz224=
X-Gm-Gg: ASbGnctX56+gig/7gsPvNNN+F1lUv50WxCYHNufYQDJOXV9/Fwny+KnRD3qGCi1dypI
	zBbWNNHNEBUeIzEfLMDTdzjG2IAPghe01bLhxPves7Xbx5DwwhoG2vtR4jK9eZNRb1FblTVsiD9
	g5bFpf1Y3xO7oTRNJ41xUypgcfS2EF45aquioyoFZTNmspVdqDDLf50A5R1ScN4bOQw15V9Riox
	BVaT8cYN1l1iwn6bIPelzpKA9bSmSUny4UWvKAKHGnUfZtYXKERhzW3l8WJbQ0UazoHNw+m68RG
	JhbXGS7X/2O7XZV8r7a80IrNEQWoQ4Lt67QqkZa89WuJlgljvBI=
X-Google-Smtp-Source: AGHT+IGxYglVOnzP6wSYH0JFEU/1vIQ7nILmgdTbPRyB1ivX5F+qBWHF0YJIRlfVAST6F9A35ixJlw==
X-Received: by 2002:a05:6602:1609:b0:864:4aa2:d796 with SMTP id ca18e2360f4ac-86755073684mr422835339f.8.1746715649197;
        Thu, 08 May 2025 07:47:29 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864aa43a361sm308633939f.38.2025.05.08.07.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:47:28 -0700 (PDT)
Message-ID: <c2d56742-8156-4069-8843-9e004cb1472a@linuxfoundation.org>
Date: Thu, 8 May 2025 08:47:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/183] 6.14.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250507183824.682671926@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507183824.682671926@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 12:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.6 release.
> There are 183 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.6-rc1.gz
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
