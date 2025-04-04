Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35033CFC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778131; cv=none; b=MEHP9Kt160UaETH9ddvYM1VtYrSvaNTiYozS/Oz99RS7PHCthQBoNCjZ1aQ5relXLHwq8TzJprcyAfNUujWkybCnkYKzNZeKmhx6eytHBn85/53GMK0Eiu3WOlrv3YxJgN96fv/0FbbzJZtCtPDHLGYhWmkS1MKJSbNCko+L+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778131; c=relaxed/simple;
	bh=N8xr3gZnvBzoAFFMIbubqfbIqdfrBwHBym9C7LusSuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECtD+TPce2RudVJp7IVsephlSWsswIvwo5+iHzkA6HOc8TN7305qgpVqdhyZMLOkC5In2YdSyeYynjfdMMiVbkWwUN041hDguhxDOZZ5j+yzgInoDXqk82Qd1eagcfsg475tV2gAoR2HXM3jmEYsTEDdPzcvHI9QfNhvWi75v9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RR6ce+oZ; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RR6ce+oZ"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d45503af24so18950595ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743778129; x=1744382929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtHOMalSobmJxdbzjcuw4y+jApPaBkGJD3B8y9lwgGU=;
        b=RR6ce+oZblxRJat4JWEYQPHpN79/xlFdt3AUFYxGiN5tbEOLycPTs5F+nu2YmIZmaw
         0wGLZaoZ5W1tna2y0eZu8YwIRJL5Mfje+5FLwKX2Seg7/iQcUKc/gerkNyX0fr35fqVp
         6uIUoHc1w/H2HDrnaRpaRn0gfQFdxupBRMDCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743778129; x=1744382929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtHOMalSobmJxdbzjcuw4y+jApPaBkGJD3B8y9lwgGU=;
        b=IGFWxzJFUDbr3bFGBFyWYRQK62mCBqTN7W6CTFkKuheZZowFOSygbu6xLZh7fnxNJW
         7yVmj0ja1AgezZ04yl2cLPB9Wh9jqvLImorSBxjO69pZP0S+KHJ9wbzl1s8/Y5UCidhk
         nGa8mf24whXzvmpvTUKFH+mNtO66SVKEBCneJOMRG5P3HeYetzlY6Foc9/m8XZ8XJpG7
         UvCeciqADUouG2yXJnGZmPep0FxMavBT8NvI7FKVCNjh2Q2cAeZTskVlbGrDBd/QRZBn
         nsf0j6DYUdlfdYKWEoxwWd9/5isI+qd5POFWaFdvsfjDBztEN2N50i3/AZlfIPZVB/+9
         jNsg==
X-Forwarded-Encrypted: i=1; AJvYcCXgAWv4G+yu5oIuHJ0qbweXHzuQlRcjHTGseqbTg+2eH16VWJXSGGzB3GjIP8pAMTJVPwufYs1TyY4ahsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEGfwO67XCKuSEQe132hSl5/OBm1wetB/jSIQpmhICtoa9Q9T
	RQI7lrOD4Qn5O0Y0jVcQL3IMpGBHGaGi5f0b56LmnGdAa95n5L7drZ0/sEKpTM0=
X-Gm-Gg: ASbGncvBcEwo+QvhR8Fski4JG0dPx9t7Zkn+VdEzEgY7r/WmZWv8cnfo/3GjXb1M2EZ
	ihOdCWii2xqN7hjqkqdwmhvokaJmtMkZJon7g/SqRqtlL3Fk7LqkdttcWtBDVAdtPYdMCimCXtv
	mdDjn7RGDSOhFdk6Ju9XtvqHmjdS1fIw5WHyjFuN5QZtnGmPgWahfK9cJc9ZXHCo1ilNiFRmJRx
	fXXbHk1pF6usIWztTlcwP/Yk6OqVd7QhnpGzW2t4WhyZ1g/NL3oBv/7OXh6/ua58Kh+Nan80Hqe
	HA4uMcp0y+6pXZMiSsgQ2WXiplcJSa+DucODOTnIEbZ0Sbm6otVcDN4=
X-Google-Smtp-Source: AGHT+IGJgS5dZigzPp1PfoohVD7rTW7eiqP49p94pLE+ryqtZy9qsHkuogejD5wKg72S1cjf28aMZA==
X-Received: by 2002:a05:6e02:1b0d:b0:3d5:eb10:1c3b with SMTP id e9e14a558f8ab-3d6e3eea7dcmr38875265ab.5.1743778129170;
        Fri, 04 Apr 2025 07:48:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d6de972c54sm8479945ab.65.2025.04.04.07.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:48:48 -0700 (PDT)
Message-ID: <148cdbaa-09f6-4c66-8a2a-1f55b596a00e@linuxfoundation.org>
Date: Fri, 4 Apr 2025 08:48:48 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/22] 6.1.133-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250403151620.960551909@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250403151620.960551909@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 09:19, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.133 release.
> There are 22 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.133-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
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
