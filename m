Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227519067C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743802756; cv=none; b=JN9jJbZ1bxoT8428/1YKzx2E0cn+u/tzJuL8V30eynQ9XmtKrfnYXdKFtkltgWD/WNECSyMSLZs5UOcsyOmf3XG50Gt1iH1DuXzXmd87vZBoB+q6vwWweksxT3ocmzLp6/mh0CxTmby1ppdjsKtjWSxLjOGLVjdgPBkDJqqcLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743802756; c=relaxed/simple;
	bh=QABGtXWp+PTfrHwfQTr0E/H0tw1hzN30Yy/M1wIGo/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcbcjmdTg5p219dLmYDLBj05JCP7UrUIEJsm9Ggx50JshzA/4aErp98z4n5qgVc0UBKs4EHzFuvL2JNwYK9MmTURwU50pdFZWZpGPn0D63PT7sG1bBmZKNZ0LYR/RnQqd2F4GLsuDLtIS8F3nZ3CxNFab7JEPKoc93GUMrq7ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=HRmLs/pc; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="HRmLs/pc"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85ea482e3adso108915639f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1743802753; x=1744407553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENJyUpYAa//xspw6u0+Ksfea+gHqJHq1I/Onh0TI3hk=;
        b=HRmLs/pcPxX8s8c4WpG0MAsDYZPDkC+MtEFt760cgWVB4kc0RR6Vyhye5y0xjyeslk
         viB+xD1W7P4ZTJPTrK1iRC6ZPouOt1+oMA1NJpGbHjNTBB+qOAaefEFnnGV7fIbzB45a
         +KkzOcDXAFzwo2OG+0ANI1Gj3KjEq78lx8PuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743802753; x=1744407553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENJyUpYAa//xspw6u0+Ksfea+gHqJHq1I/Onh0TI3hk=;
        b=bmw4bylDuCB/xeTGaUtcRqx7ik0SqjxomGwUtdwL2XjTCiKWqgUeCaA6LBjR4ahkm/
         Wnxq5o/SeMAF3AnPkmZL0kpNAsc07ke8Nos70v7dGnAnUKePNiDazvgpLkZ4uDtB4/fP
         fXEuE/gsrVvFO/ubZJ10VcWtL+GtErcMgjCoEFF+TCheHpQp+NIhk9qY1jjerL34NmT4
         3ysu2NzMw+qZDfneGTCg3pSJumWETgC3kVOOcEO5R2rd+v+uXGkj9wBChrwXufQQ8O5A
         K4/Wxk+4DK8rd7qSx+K5z+lDdeJdNQudud+GiOn+0HnRVYLxgZjLwXGaq/ce/kA5pJsl
         mlYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgFQz35HcHnlcEvkyjRe6TV+O7T0vC2CoDYGFwcApum5gJOCwVupYHL7YsRxlIXKO11pRNtbLjWXsR07w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZcfiV4rCI7T4PJBUIBxrRTB19LElTaLkObwIROiPPVK/KY92D
	Jhs1ZNtmAj6BIizLwRp2gghebeqWr7ssQViDDiUtgBCtPl5zdh6KMQFaefNgSQ==
X-Gm-Gg: ASbGncvs0jyvyN3rXstgwvYvM0BiMgV2blV6A6FrUBs9kXstRwu8jpyzLFI3qcHAj9R
	CdfZMGv1+jdHrqugvWbTVwvnE7qwonJmpfJ/lA/aDMtA7tusb5zZpOgd4+WIznOco7GPCtnlSTo
	BmqOZsyWoekCDqXjdO4whNOuNidnB6BjHQgMXutHZ88+mNveheuMmOXMXrqt0jeC2A4k0B6xhVQ
	vCHpVn5gHu8RZ7i251ek61AKtqFmvnewtt4n8nxunT9+PLpLPAGf9DuIzlxNTyEhB3VSdW3DJYD
	7waUQDgZ6YmLwm/y7DATJoYaskf/cXUi8x9k8kyKBuXHTmOW3quy59UMIFxesQ==
X-Google-Smtp-Source: AGHT+IGbcf6tz83rGLyBLgsZksMjls6nLeRdxxAHiAxj22AgIjPSRs4Lq7yykuQU6PSnh2BoV0s99g==
X-Received: by 2002:a05:6602:3fd5:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-860ef3c3fe5mr1303615639f.7.1743802752986;
        Fri, 04 Apr 2025 14:39:12 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4b5d3f057sm990829173.113.2025.04.04.14.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 14:39:12 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 4 Apr 2025 15:39:10 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.13 00/23] 6.13.10-rc1 review
Message-ID: <Z_BRfgnJ_6gzLlCI@fedora64.linuxtx.org>
References: <20250403151622.273788569@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403151622.273788569@linuxfoundation.org>

On Thu, Apr 03, 2025 at 04:20:17PM +0100, Greg Kroah-Hartman wrote:
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

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
