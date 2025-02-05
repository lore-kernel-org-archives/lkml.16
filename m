Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC494215F64
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 22:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738795345; cv=none; b=TcJWAsM3Q3JLOo+yFk7ITIsie+9x/vk3uCJXxum9nTJvXVQfxZ1/NNJOu1196znrFcVbBlT3xfYUDH0NZLmnHUi6BNdZtson920KG7WTh9j2wlvhbIKLWzzKW9eFV5iy30e5NUPgQbK4fGrOV0yfJNA6Th/GbtdWHRbfmNmTXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738795345; c=relaxed/simple;
	bh=/ISQMuy8TJweFhV9wi+G3bCohIloJCiIhAsDlnXTEiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jshv0MnAmFeypFmxm7Rd97dV1VUYM6wijIYNuwXbwKYt19BbPgQj4ksIWA0LINUtVx8QMWSDq9ukztdkIouoXRSLgNGyrwNzSww0RYuJgkvd9gKEF8MVHBiBG9d4vvepolUkyzdiRCEmSQplZ0jp8Qb8xswba7z2dwIyreu3F4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=XEdx/qXy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="XEdx/qXy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so301218a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1738795343; x=1739400143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozsWjdqVYNU0uRL31d8089cfXtCPdIVCrl4HE0WQ7Es=;
        b=XEdx/qXyvMraByIWYuAxMkpvVUfxEYNXkujMqk9Jtg2+qGXnTc0RGt3VUQfLD0k1w5
         RK2Ta/5Wb8pXU3y1/WrnqzVvNzj9/mHTfnbIH9NVMUFPn+wwxwx3k4aqFOHrlx2ITPlS
         fPK8NMmRqT+N2/yIpOXlwA0PHTm+vRbS868rXaA10XrKRqq9gGZynVjhGjD69Rt2hYMv
         0EOttnZB0jhnyEohbelmSx16sPVSlek5cjWs/HVA6b/28C1ipnzYWAM7/4Hnmo+UghNJ
         +K3ODqFQyM4Aiqge+0TuZ5kaLZcXK0P9sE8cMzb+o23k5gqRErnMG3XkmXneVSKKrmp0
         +R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738795343; x=1739400143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozsWjdqVYNU0uRL31d8089cfXtCPdIVCrl4HE0WQ7Es=;
        b=k1/hZYCyFr4bG4+mxjf/qtZhHVsy6QhH6qkHzCEk2qP3E0jZHFYdR0ve+U4wDmXjqD
         arJ6aTKq/H5D8WRrBIiSuGw6vXi/4wA7O0AJyq0KUvZoVfbg1NKIope2/CeDd2TT6pIX
         sotMf2xvIQOXKm6fFmo9c2fXwzksOADPBGElixjYopAzTwRNVkh9BK7GZtla77V5d6n3
         1glaYkU0chh6Xh5rifwwLrgmfxfpJEniQeehC8aMluQC6JOFwHHQOb+VvTGironDldkn
         LPvRSvbuSh6hFwNpdzV2PEXzjVNo7eeS6B9RUJavd0sW+cerbv4fiepaejC0gkyKcDiW
         jp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9a6cZJIDjoBro1FP9sadLyB4m1euZWWZ6niX8xsEqSbta5VO9ePV2VeWSXWk7sgb5UfZ/iKD8Jxhfrdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvIjCA+MSX8x8uAE2ngRGVaPGRnzc+eZu2mHCdjFLIaK++r9rL
	qz/ZyEHUzI0XVZ2Z+MKZ69iOMjZstjBD2g5sevLFG90wq97Fgr1U9bp4Ah5C7/BH8NWz/2Z6SpD
	UYTgU73dwe5kpm7FntoFyiZjGT25IsJOccRACQA==
X-Gm-Gg: ASbGnctzQPcdHAxu01X166OFK2umFR7tOM4icUcMA5LiPXRZnBAJdr0PwoJGSdWs5v8
	uwcCQy2nLZ78OrzX5BOatnYwlrw8UscdjjGbbVNRA7Tv9W76x8c/OPXKQRkKkx+8Lzy34Hg==
X-Google-Smtp-Source: AGHT+IF+5Y+LoIrO4YuSxbGFrnDo5RLIcaFRLcMBgHRINZAU5p3dn/ssnoapM9nTRlQd+7IHrseRlLHy/LjeE2HNVbo=
X-Received: by 2002:a17:90b:190c:b0:2ee:d433:7c50 with SMTP id
 98e67ed59e1d1-2f9e0834385mr5968269a91.23.1738795342921; Wed, 05 Feb 2025
 14:42:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205134455.220373560@linuxfoundation.org>
In-Reply-To: <20250205134455.220373560@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 6 Feb 2025 07:42:11 +0900
X-Gm-Features: AWEUYZk7lKOEl0-nGgXhekrrvXEexlCIVMEr93PPJnNE3QhYX6lEmgtZbFPwaEE
Message-ID: <CAKL4bV7oXvwBXF877=40CfdvaCTnBot-YSp+H9wrPcTVki0AEQ@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/590] 6.12.13-rc1 review
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

On Wed, Feb 5, 2025 at 10:46=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.13 release.
> There are 590 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 07 Feb 2025 13:43:01 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.13-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.12.13-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.12.13-rc1rv
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250128, GNU ld (GNU
Binutils) 2.43.1) #1 SMP PREEMPT_DYNAMIC Thu Feb  6 07:11:23 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
