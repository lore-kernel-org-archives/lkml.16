Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914071BCA1C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970613; cv=none; b=dvRguv93IsD1N7+hrTUuJV8i5dnB33wLmc1QeLvsjtt+EAKZdDZgaJI/8urR9+eu74k8MBo3r8Fa78iw+U81ybFdy794NlFqDXjeYfAdro5UnwuE4WnGdoISuehfNG0M76jyCvjYQFJGicieeeagJpzHjWPaycAOFyXKZT+An+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970613; c=relaxed/simple;
	bh=hOOfI2Dug98p149l++sUktgtwoAOQeQAHNLd9hV4PXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1KbuwVI5XlByVM3LSvSM12rNuFLxVy7qiCaTfFOioMWDHFCBZem4BmKFLFd4ivoWD1dq6JZZujyWRhTF4CQ/Q/+c86hwmo9vhehSstF3VWZ5qIDNeZqK/JAvLgQMeSh3VKGxVmijskCmRFmhmVKeZi+GQhJVyTbaiSqRXdzKjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NrneMZlq; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NrneMZlq"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddb5f6f008so11929665ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748970610; x=1749575410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+PTJ84mgFgcvQUel6fKqwS+aPNdc2Y0X4akYmU/33Y=;
        b=NrneMZlqdYZYQLFK7DWtdWfvtED9eB+5ei+lO6tsQfOb/ATzJt2xMz8nXIsaLQoR8o
         dllgQF62YoZKARrJsn4i3U1nszM/ZGzQNuXLzBc9b71C2iu2++5iJ50mQCumtGrT5Fws
         KNdtE0xzyXpcVMJ3gdEnBByZAyye3+RLSkcsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970610; x=1749575410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+PTJ84mgFgcvQUel6fKqwS+aPNdc2Y0X4akYmU/33Y=;
        b=wFqmvg3DQiQt876JEVOvJZhGuBbnyciW8Oq52oMGdR1w5E/H+xN/YgxIG/+p4aCatE
         /QfyTMqzoniRpy/5MKbwcQrrTNSkzoV5LToO9+Y0WTs9WYappsu3Jgdcs9AfmevJ6ucP
         rbDdTyOmfC3ipfvi7hGMfPuvEdFLVvME/powZE061bShu0HRKfqEU/Psves6FKpxpci8
         cKh77dEQdT6L5L5/Ps+G5wLCa82r9PMWNyAnnc3p5LAibsNBFzVu0S2PAASCyAvSNIjZ
         34NEwdCeFC0vcblK2ZnWfhHbz0bPk8TjDGr2FRq+sorHQPSDGpLWB8tNeGvmbKwYpzec
         BAXg==
X-Forwarded-Encrypted: i=1; AJvYcCVXkvvXT3FQSoCt6hGV3OplmGCOKpA4gtxvmoH3eyhUOzPDWWwzz1ef6ZRETu9Z1TbwMZPF+d2ti8dGl3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKYqLOAbKCvju8WzkLIu2ZBUi7p2rANDGZRA2Vg6muuD5atBb
	iMuUSG80+ub8cD91/cOTgt4aTLbluAfsUeCqcMaB17ucaVJewwWlhkisT3r1jcIl8ng=
X-Gm-Gg: ASbGnctyrpk3Z3MS4PVH1jNML2xWXMXkGzk1zHLfKYu+nJzjCCuuhotD7BtCpAPsYn1
	/J/Qmbf6mxlGlSuZsfr7bSocGJGPs0BPZMLB3ioqduR5YEWljhIDWvOopOoObXaN8HNu7fgv38v
	DZeD3I913JD6cPzTGxI5/vYWDXiMpA/crRZqHlpZK+TcPaKhmcBR6i1OPy+REoNPTUpyJ8pYe6e
	DBShkVQ/6vTRPxeTPZBxmgTAoVo3iOnvBaI9Yu2+KJrw+VwJd8j7YYH9tYtI62oJfmt1/1SwNp2
	mYbFOMYV3T1/nfRD6qCTHOxoI0R3743yR70H8IYsGTLoAtZeUFIFTt8BZK3PletTFnWQsTSa
X-Google-Smtp-Source: AGHT+IG2BbeVXOuf9sjTCAwtxddMMI9tpH0ti7rh05AzQMoKV5AwNcYiGuPTbl2svFjfDk98wBdrpQ==
X-Received: by 2002:a05:6e02:258e:b0:3dc:8b68:8b10 with SMTP id e9e14a558f8ab-3dd9c9887aamr196505085ab.2.1748970610548;
        Tue, 03 Jun 2025 10:10:10 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7f22536sm2407800173.134.2025.06.03.10.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:10:10 -0700 (PDT)
Message-ID: <a6b019ed-a143-43b9-9ca4-7cda56f35568@linuxfoundation.org>
Date: Tue, 3 Jun 2025 11:10:08 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.15 00/49] 6.15.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250602134237.940995114@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602134237.940995114@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 07:46, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.15.1 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.1-rc1.gz
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
