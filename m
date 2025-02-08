Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B943D68
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738975604; cv=none; b=a+R5rpaXODcw93SHw2/tY9VFylid7Oo9ck95n48cU/4Wqck35pHEsdC00a9xt42jNQYh2a9E2PEnBDtzTKZwODSEh0fqqlk5el7hEUbzIbv5Z6WD4K2aZsdUFt7AFil3FBN+a9PCbDubXNTwAB7AuB58Ub25iVqfKuoaIGGGJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738975604; c=relaxed/simple;
	bh=U/iM/vgIBzMXSjVgFVisrL8eEI/4m5uzt1ogA3r6Dv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKNUHK50Wk0+mLq7M2UEWHvet3I7y1baaPxHVJ5PT0ISrnMjqGXaSr9NdRjxqIXk2tCSajXrvQ2sgAVrJAgaqzDzWdqyVv58QkCGn3JZQECYnDhLWbNmmVGlKcy4eB/WC0eLXbAY2mWliAQ6SNv5NpIW0jfZY9wKdDuWDshOG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=tNFwbnFM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="tNFwbnFM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so4824050a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 16:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1738975600; x=1739580400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFPCDRWfiwY548OE9KMzZcnx5u4rg+rWVCQ/qhPvDMI=;
        b=tNFwbnFMzZ5SXTUUx111kpRtDMm8uL8xgbCB/AXrbNrlaYmYAAk+64Hd1xnxgGBYeq
         CK309McJHwXQUc7Q3LVXlHlyej9scEDIWxZgmJbu6KhJmBV9T97SCeloPNZvFQ5VxVGa
         LBueyJu7czD3My/RnabQ4zJIXeZ9WcDG1r/rJroiIawSnvpfC2IS99Wwed17FKfal+NT
         P56MmYdJzOTfa7l7d8mY9QaOqm6uugoQ8rWdqOQEqEkL1EbSxN9b57oBU7UnqE7fM6ij
         gBfnrWxDCf/jUmdex178rzXLBc5PcaLABKQMJzgL/+XTXo1pAsMwh/SyAVju2CXfRh0v
         4SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738975600; x=1739580400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFPCDRWfiwY548OE9KMzZcnx5u4rg+rWVCQ/qhPvDMI=;
        b=pnZys1lBVn6swCX5v0M0JIrgRt+zikhtzbZPtunFdpIkDWoTvIbkKuOH67BkfaZiep
         ECu9IZIiEKJ1JH8tMtMRnfUKiiFAtxwUYBEvhNl2buqgMCpgpuEh9nc4WmNrGZKetKME
         Ltj9NJYQHNj2RN03z5R7M6Pi9jvuigBna0sR6rESE2+impr0EDybvJuALQJEZlZqFnrn
         6EbSqSizHfeSGHz1gCOCRlZFPDaoqQ2dOXuV6IByClyoXzWLutGsMixRgf3R+v5n/ed/
         CMrc9I6G1/mhxf3lBT51qoaNe6H+h1+Re63OIbIxLPzc5IdIhfYc1D7lmtn5c3OTfIsZ
         DKcg==
X-Forwarded-Encrypted: i=1; AJvYcCUdo9o3DBbnBBzs2L7s8gV4iTbzJw8cDjz95g4l9b6BcGL5SEpnvnep6XIayN3JnzuQG8L9hcuxHAB6sN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWOu6ysz/qIy3j9gDcvN2LR2G9sBMeg4tm+3W/qIWtc5DBx+rw
	NfdzOfmLvzfA5HknfZmjGM4vg1LWrZ6uoOPhhR89xJvmKI2pIoFiSvHL3Zh7JY4icymqJSJC+0p
	VvJKZ3qhBaHOf1x9aHOcml4MPiqWPP1OkKE/TiQ==
X-Gm-Gg: ASbGnctR5vp7Rp1LjWoQDWyoTNspvbxTZzvW3C7KrKKeYeb1ZtAthwDN21nkqv6vMDX
	myQY0vgswEXlGwVcaBOq1ZfaMcHuscbt2jWhmCeh/rgC6sgqSpLjGarhsGsAXG3dzVz9S1w==
X-Google-Smtp-Source: AGHT+IHyBjiDGf7wVgGsBkQDcCSh2TnPY3jPly9PKqaRjONHXxOEA+eane4+FYFN84Y/5Lfu3fPhuquGmIGMz0S+vWE=
X-Received: by 2002:a17:90b:3c81:b0:2ee:9e06:7db0 with SMTP id
 98e67ed59e1d1-2fa240641ddmr7792502a91.11.1738975600350; Fri, 07 Feb 2025
 16:46:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206160718.019272260@linuxfoundation.org>
In-Reply-To: <20250206160718.019272260@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sat, 8 Feb 2025 09:46:29 +0900
X-Gm-Features: AWEUYZm2SmSRtoIkVsU74yZBb6bTd0d29OHynz4X7U95eHdh1KsMA5_M1BW02hM
Message-ID: <CAKL4bV7a5r0JL-RixXNyDmywvfyPWrsyL0QuNudxzfBcqOo7Tg@mail.gmail.com>
Subject: Re: [PATCH 6.13 000/619] 6.13.2-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Fri, Feb 7, 2025 at 1:11=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.13.2 release.
> There are 619 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 08 Feb 2025 16:05:17 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.13.2-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.13.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.13.2-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.13.2-rc2rv
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250128, GNU ld (GNU
Binutils) 2.43.1) #1 SMP PREEMPT_DYNAMIC Sat Feb  8 09:14:31 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
