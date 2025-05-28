Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9426AEC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437302; cv=none; b=tf1+F90ZhMxlhTughpSFqtIDm5g36i/Rlnij5JvEJWmzDB9wAGTo58VFJMwjntx+DP2XraxeKVqUnMRZdQSqOTj8aikckNFzyTOqidEyc2ms1SDjws4Q6BWHsfrEtAOlkyOuWWchFfZbq9iqNFiUi0qbiutMtXu7sluvu7AIAEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437302; c=relaxed/simple;
	bh=IDUpsfHZ2AH+U1rKwA/IQTqNl27rntnPiEG0JxCqPMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRVzXYU0tRLzeWe85VGc4Se4leAaORIkqa0fRoZ0ucnvKngT4CkZyzsNWk9KIlOwiwhHty2h03PP1yl36yvw7LGSM8sYndJKq1Z++XaZ3prl1S594E/OX5y7b0HPXAjbmK2NSg03A/s4ZORpWOV1AFhtr3Y1f2/CPmd8KR0whjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b=hh3VhMnG; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b="hh3VhMnG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47690a4ec97so41006591cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1748437298; x=1749042098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdTBfL4v5yjVyTe4ji2bqNzULXH9IrkaNLBy8k+ftBw=;
        b=hh3VhMnGPlCTz1gzMd370EtwUETu+YexgFvsP0VXAQ4X9miH/5WohfEb4iyWuRsEOV
         89MEqHYyydywQbr0ds2YxGWoE/npFBP4Qlcfsa8WdvUYWay2YkBhALEV6qabzXnytrQn
         seXAKNiYQl1IDbGmIFaGnjnTxqGXsBDM38QvSERAOMXKxd1Xm22XXTsKTkHNbwyWZ7E9
         WZvFCY3zBlgwXAWIMz38lXi8xyBhCGgFRLBbzTBVaTVNxRPNiDGy597OZzQuGFFdLJ/X
         0LquhmP7l+9WVnrs6JJ8i0c9zzS5olgOwn4LkUB/taXglTllVgS0u0E5V0ldC5AYiA33
         z/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437298; x=1749042098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdTBfL4v5yjVyTe4ji2bqNzULXH9IrkaNLBy8k+ftBw=;
        b=KjUdF9FU5iEYYUduT0Bj9yLZ1k39VAVrQPSCQiLy/QZTwq9lIB92fWzdAqC3EJHfmz
         cIEEcwg8BxJdIoEHSAWuXS2RlpP1otQAQ1hgHALNKBdMM7jZqp5bm90CmX4AMa88Wj9e
         M2bBnq266iOQUquE+TZioo2TIm14I/IGG28yIPkTbPUeu8uCZQpCQP/7v9ICVs8Zp5jS
         XQHuFIC/zAavjGA7ncU5y+fpb6DoDUcs4IOpoFP/JOR5bE5n3aFSi/aRTONApSfwishM
         pAUyvDOf5DcwlykeOu4oS9SphjS9f2mUVxlxSujeRzJh/o7fHmpw4l/8pOlvE68WF3b8
         3ieA==
X-Forwarded-Encrypted: i=1; AJvYcCV1znTpNoA9PP5Vy9UnoE4QpDdDiQDEQmOahsxt67clQpxQ1mkxeNF/fGHAwxBwVgkIMw/IaoUOcE/J0TY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbcw846/poJCIGHsw499RDvyeJJb9q/7rPgGkVZzWpeTgAwlAR
	9VBZPL5AKp3QeDnQpJ41kxTIQEKxxN0Z+AVFl+huotYKS6vJIfy4HKWFaaL/QLCKSazNEFfPO5K
	owHw/u01GooEcCiE93YNS+MrqhpE39bpflvCRZNtBCw==
X-Gm-Gg: ASbGncuWsZKNaUzFvI5ZADQ6dMJCApu1rxdwaxLBpamurcZ23xrQjtEExuagbU0PXEH
	Yewxl8ExsF3V/KWIg2HgQQpzs1CnOHM10LdpCmbFldtrPYzGSDpd4hg40HFKDEP8caqwEduGesd
	aEwEXcLzEjxYs5iyY7FPKe9lLglb59SE+w
X-Google-Smtp-Source: AGHT+IFU9HRd8Z2NHXDUti6Rzo2QxfPYr9ibpOVOYfcSdksMHy6ckLo7YTZaTUCa9+aafWQRbLsvRBJms4rHDxY/5NA=
X-Received: by 2002:a05:622a:1146:b0:494:a099:daee with SMTP id
 d75a77b69052e-4a3800e6784mr35251551cf.19.1748437297821; Wed, 28 May 2025
 06:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527162445.028718347@linuxfoundation.org>
In-Reply-To: <20250527162445.028718347@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Wed, 28 May 2025 09:01:26 -0400
X-Gm-Features: AX0GCFsWHcrqN1_NeXTzUkCpGXT3fVMnMV6OhgqOX67GdQ4WyBq7Uin5PrObcX4
Message-ID: <CAOBMUvgRZmc=Q-dCS7X=9QzFgUHzgkXkqAtNcncLZUi+Fu0Zxg@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/626] 6.12.31-rc1 review
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

On Tue, May 27, 2025 at 12:45=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.31 release.
> There are 626 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 29 May 2025 16:22:51 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.31-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Builds successfully.  Boots and works on qemu and Dell XPS 15 9520 w/
Intel Core i7-12600H

Tested-by: Brett Mastbergen <bmastbergen@ciq.com>

Thanks,
Brett
