Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C723B1F4186
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777969; cv=none; b=Dbegwn1CDx0im2rKBpfc/TXqmRS3PaRhXXS0n42r6ugd0H9v+yy3dEWxxugExMHbtQfQDWiZ1j9pXLZneFOmfjmMVu/v1Tv79zATjVhO1fEAOetyErylUGTQgMFP2TLR2zhOTKw9oD1I90LlWTzY1HmgRysABXS65saZHgrBg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777969; c=relaxed/simple;
	bh=e8o8BmTI9LJ5Xp7bpW29EBBSU6s6C6evw9WYpy625cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdjfooVqA09yLgK45vCAVBgwg13OoZT+t4XX5GkxJ2GFDU6e2THeFb7+zWQLiy9eF4EWGs7WgRYXoVtj/TEWBuUtxBW0ofyTPGbcZ7OiXkhdQfliFaizv4P/FN3mcFO59NFgMmBHk4OUSLdqXfiX+9BBd59l+PCLqaFuQJyw4hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H4ieiCyq; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H4ieiCyq"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so6219885ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743777966; x=1744382766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=If8+GB0jSdfPLP3IvZq/oz7j7TFWAF4rJnIO0c2k6PM=;
        b=H4ieiCyqWVQ3c+6aLbh84R/mwfmums4yeWOyi2XS10XJBYHbA7vTEJcydor8Lkua6y
         32dapT2jo5psjK9W5jhgnHWKLWK8Dv/+M0SIuAjMApZ9YDiXYIivo5suYnXnk+oIS2uc
         wFgShCuN/HB6OSxNKZp2LQ299pkwvipGhZL94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777966; x=1744382766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=If8+GB0jSdfPLP3IvZq/oz7j7TFWAF4rJnIO0c2k6PM=;
        b=R5NhnYzWaN4YlOzH3Iwp6JO5mbqLC3ASpjub+ezDVWWbmhGQtITIgSr8GFRPmfwPCJ
         gDXRIKVHJTn+m0/Xc01tsi0tx/L/JYkhPY4w0A6KSUTBd+5IIhsTKBrh+9xq6fopZXaM
         Rq9NGuj+2ZVefmgnQE9xK4fVgZ89IHWNkbKjppIFQeEujMofVtga0dLOc7o1+2DxBZZ3
         8597kJIkpXejqNEl4nu9ihJz0HTfAwMriMaUqXgfwuNyie2dzlVXEGWMFQhVzYX+wW9N
         TISftIyb3tO78KQfazWmsepY53Jpfh3wO1ala4Uxrsbpz03ZKWLP83jEIr2+MYyHyXlK
         KMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCViG3RAq9JSfem7KVF1U87PPp1JDOgyDtAei8uOgrRM6qx61u4F5zMLZHCfU9Agka8eOyw0X+ivbC6KjR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFzg/EKX4sFryk3AcRU8hTPbc2ygYdtQw/oIUZC6CR9fvlpVb
	bbGTMHd5LmhJZgNkXk6R8BZZ1vFlD5MakhdPCQJgYgQ/hX3+nzcRkcK9s5NBuFo=
X-Gm-Gg: ASbGncuh5pubm0HUGqaogtaXsL1pglK93YvTBUY39pqzJx1XTeniFbT/oMS4121SV4+
	0kGEcKvt+iQTl+3JHTQ5Z66qUe2SMjp+MmwypM85KT4KgRNik+XgsfF4AWKtvt1f/gK3p+LtZxV
	hUG/dgdUFFp/Oq9WgfhvOPj4Tthp0lyJ1h2oU+Hp4IGKvX/M0mHAHZJ+KxJhCx5hNEu2nc+4Yxj
	jG4DZ/Ovl6udvUN7mcws0ThaybBhw0NQMpSf617UoJZOzk7XHjwmEfIeLoNwk4fFeVjVXo1P0Lj
	1AXXW/NbRb8juxfXPNyIdYa2umc0zpfUmkYcilus/hruqL5RFP53G5c=
X-Google-Smtp-Source: AGHT+IHC49zN3kIaY1D2eId/TedJ/qgZbOEFiirHmdO66xfiFOnnnkBBWZEK4pO0xJtY1CuuGzjsKA==
X-Received: by 2002:a05:6e02:260e:b0:3d4:28c0:1692 with SMTP id e9e14a558f8ab-3d6e3ee198amr42916255ab.5.1743777965689;
        Fri, 04 Apr 2025 07:46:05 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4b5d243f5sm836895173.91.2025.04.04.07.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:46:05 -0700 (PDT)
Message-ID: <c0c9ac27-efc6-4eac-a386-daa89130eec2@linuxfoundation.org>
Date: Fri, 4 Apr 2025 08:46:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.13 00/23] 6.13.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250403151622.273788569@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250403151622.273788569@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 09:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.13.10 release.
> There are 23 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.13.10-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.13.y
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
