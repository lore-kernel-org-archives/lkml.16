Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD601FFC46
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580837; cv=none; b=orgpz3vsYpfr7zlSDEjXWWzJhXiLRhszcxQu9GUySnf5/dFVOj287EsPYmhpX8GRCngCRJtYRpUQ7cA3o+I+8PI5gDPbgjmfruKMYAVxxIU6GUQ5f4uzsSTz1esa+mi6NDHasm8sOGqsDwQcvxCJgQWMtq0PvzEOrLEkJYXy6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580837; c=relaxed/simple;
	bh=XBUgrUQQS2IqwX0+wTG19jVJ5Ci3HRHkOkCqjlNfFLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nl5WOX/cNwF2+dVNptiyWJ5O0Zr9pYSJ1Hk9ts0lfhui+aQTo6rKlGuZ507/YOWKgSzIrOBoeE7hkVcDXtd29rMOuaMOEIUFfctQQLrqiuljYV/7oyY0EabSxvJKuqKgp+UWeEExSxxgYTkgVqIb4RFNJbPZ4P7KmqD1gkTdfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=baYYdORJ; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="baYYdORJ"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso3646435ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751580835; x=1752185635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unR9qVJeTgB9WSoA50q1O1NQAOhKvwtm6keiADO3aKE=;
        b=baYYdORJngNNUyYwVPZXf+oOOaWc5Xz5mkkVdzQvoIME03jNjtv/5TC3BFnAnlfmhu
         DhrocKQxbYuNP6M9ZTP3jpHMSu9B5f6p4XNCxxRxYF+T3NosrkPLxAcXOCZP3RrkWBmn
         JXEo53IxybllvZ8W7nyKphCgz4u5xo+WStur0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580835; x=1752185635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unR9qVJeTgB9WSoA50q1O1NQAOhKvwtm6keiADO3aKE=;
        b=Z0+tZUu4U5Ti/dCjqQaZcCddpgXvQNOb/zbeQlv6mgR3wh8YKedOFvotXYskw5Ku2V
         vy60szYcox9sEQ/e59YX0D8XPTNeRmin2tw6LhEeZEp2gv03uTZXw053ZvclMoD1KvSP
         G0YBA3LQF3rr8s0M49hza7h4n7RJfT7ZRKBQYoT6cl9S/jB1GSv16lbX4GFqAepGHCj9
         f0/T10NbrfFYyeKM/sRCgttvjXuCwqOb48a/5fUPrbAYFFwJUXBKQi7+U6KniuZe0pts
         g/4PN+cKnQKqJxHLt42m9w6KhkIXYkeh9J0VFVq4ih4h5tFppASXnBzIZlWxW8HlP7h8
         rTTA==
X-Forwarded-Encrypted: i=1; AJvYcCVTRzFv6tP2HpVIxbbt87I/G6PmdQrxRxUuhoApYhc+ax798LlyaUd9sQfnwyZ5dSXQd7/7QERxIgqZtoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2igAvvmdDVRt3EmUDi76m0hcoqMlkbVsvFxje93TCmU+gSEA
	mLtORo4Om97POzugjKuwFTW8RrK0xs+c97B4Qk4XCtQcM+r0bR+Cl/CiDcV5Qnko1Kc=
X-Gm-Gg: ASbGncsurcA2aUvnOFmC2mTlQ+0LQo3dTu4jEeExECMbUh5UPhoq1Y/wYukhaUEs+j9
	QGLXc1NTYT74Vi7fbBdL/mAS1032GwocSaIFL77n3kUli0DDTXE+GP8KcUYZr/VZ/+xj2vjXdx1
	8Ntx1gIzQKOgxk/IUGr+jufvpYOoXHiQkgicC23VOEucGx6fyIs6elFX4Gw3DqV6576rqOEp3gn
	Oxicn6z9y1UKCmMe83C8s9y1oXqIiqypOXB2J3Z/eq2tBkM4qlspzlg0xytSmV57Agh5cvl/pWr
	UW0MWZgNYhKALgFUHR6p3/r0tBeXxD6Nt2wafrYfRSzpTH4hBOzkAVyL9dnkXs7Aqi9aFne10B4
	3xraBjhY+
X-Google-Smtp-Source: AGHT+IFTLPGUsvktoYg6kHPD6nYNhc4LkDTbKKI3SWfHrM/XXrmfE9LouQSm0Mhp4hyUgtiuBB0RcQ==
X-Received: by 2002:a05:6e02:12c3:b0:3e0:4f66:3106 with SMTP id e9e14a558f8ab-3e13547ddf5mr2083225ab.2.1751580834710;
        Thu, 03 Jul 2025 15:13:54 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b59c7860sm152582173.39.2025.07.03.15.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:13:54 -0700 (PDT)
Message-ID: <55497fa2-f6f3-4c6a-9869-625e5edfd777@linuxfoundation.org>
Date: Thu, 3 Jul 2025 16:13:53 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.15 000/263] 6.15.5-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250703144004.276210867@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250703144004.276210867@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 08:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.15.5 release.
> There are 263 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.5-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
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
