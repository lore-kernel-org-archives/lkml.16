Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F31F417E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778097; cv=none; b=I3fQDejdROxHC8Q54uS3BpF62OC4dY9L3n7JtKl7V2FsLegUFXm2eWkC7Spr76aAOALjBnp9pDykIxHa0bH3wLYNx9DjQ8R14benx1nPKLGWpTRm6IPwynnkLFk5z0bBi/gMd/X9ISEkrA6gmLwN6+98MHTsbjJKmRidnDyfXAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778097; c=relaxed/simple;
	bh=xR8q7hzgA9FXRoG+sY9ISOiAyQMLmpe6nTbBK8Ue+CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJwr4uJEi+ywr4lKrUpsQcGshdj2aTAY1Wi5IO8OsFQKhKBtrCbL+3Nt1IDDYe/+AkZ8sZb2HAGgWmad7XMkyRiX1c+MYmzejBg+c+9Vrs2wN6bm96Um1Fx/S4ibUN1FsFOc5ByXBYnbG9Zh5uZfYZsbeNpTm3f5erabwSuBjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hYmJ77d2; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hYmJ77d2"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so7173415ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743778094; x=1744382894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7uwFeew0VDqMArV6F/glKB7hcKD1UfxHTGRSpLzJvE=;
        b=hYmJ77d2T8g8V0r7eXCGgkC3m5R7mP8EJAX6VI7vPJudhELBKvZ8nPWIsiBQJbj0DZ
         ywMEOd23VDoLjjICRlD12KzNTA33e+48J3ef67DPxF0U4HzmtB9AHmSytCp3DKiVjD3r
         GtzHVr3EKig54q1mOLV09dKkKuh/M1+bZ707g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743778094; x=1744382894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7uwFeew0VDqMArV6F/glKB7hcKD1UfxHTGRSpLzJvE=;
        b=j0cX5NX+fA69Xeml1jhj8NMjjg5aCMHf4W0bRX+P2owcNUlVzgdomyu2p26ck+IVsb
         gErV0JiD4c+A1yLB+XNqxcUL93sNL1+fq0rx7MdH63iq/r6PJXLWBGJTAbjFKT4zcJmc
         xm9RB95wVrnP9pK3VA8b/RyX0r9e8bpwOkJ2nT5qyBo/ERPjeOWWY7cWzOMZ5uN8bXBM
         tjKU5Dz8cH7pdZuAFjIrDh7uZBiEHXeQy1IIsxJp6mftIW9F0xZgCVkE4TQmbOEdng9N
         3OXid6cyGeIl+bda84CRky3jqVYVHjMqvGRjrB09yV7ouCPZuFc3bL3lO66EsST49Z81
         rdxg==
X-Forwarded-Encrypted: i=1; AJvYcCUyFJ6+nZnsImhYTlJvPXVPcYDQuEFgeuXH+5TA74NIVDLZZ1kZx9sS2lx2bOySw+XmDMF6Cd+ply3iZP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QEL2S7KUPXNQ9r2C6DGtww9+QVDud/afaujAXc2pNG1MoZHJ
	StLXCwXtujvF8atLmxqKW3N93//p9F5LZ9zZ20Rw7GI+NH9rU2DG0Ku7Sz0IaCQ=
X-Gm-Gg: ASbGnctak/pypVCZllDFyxssvmeEz0rlQLU93sCI7QnpioSSUcP0qxvM1gpHtuGJqHA
	96kL4/nfbfiduPKSIvTmQ/DBRGR5qbsatMxt29khv1mBSjkpVEMLiJ4rNFQ9kwc68qD96fR4ubY
	4ntgGgqGkft4YCJ7UDpwg2BDkhzaLBjhUl4ZygrUJrI+5P/+GM4ooIBRkpqEwtrPEhP5bh4LXWl
	1ovM9gqoBIE03EjyBUHdt2qdpc9MRLVBavXSEAjnokx2pibPXtpANuVp+joXV+Luszz9hagdNOo
	2oDod/2jJW4yziW0cPxQfACt0bhlyZ3jTX57mBdt+itBdSR1WJaigNs=
X-Google-Smtp-Source: AGHT+IHmeVMxstvkkG/8A080OyDr0AsQTJp/ULWOhj+O2+I727qqrla8YXBKLW9XgqtGvSIgC8PYmg==
X-Received: by 2002:a05:6e02:1fe1:b0:3d1:78f1:8a9e with SMTP id e9e14a558f8ab-3d6e3f7f864mr42089095ab.20.1743778094195;
        Fri, 04 Apr 2025 07:48:14 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4b5c4b32bsm816259173.56.2025.04.04.07.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:48:13 -0700 (PDT)
Message-ID: <d36bda59-3198-4eaf-9da7-a28c5dfdc3de@linuxfoundation.org>
Date: Fri, 4 Apr 2025 08:48:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 00/26] 6.6.86-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250403151622.415201055@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250403151622.415201055@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 09:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.86 release.
> There are 26 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.86-rc1.gz
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
