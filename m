Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD91215F4C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792621; cv=none; b=nviGsASycjBww4f6QXMYVjJbbw1nW2myeRc8UH9770WUYeUwxI9ziuJvaH2sMnkzdelh0bi2EojoUCJPkQgGWvwmy7LanWud6zTNZcqHmYCzvekTeWP2XUkPGDuwdl5nTgrsW22BCdMHZ2GLvd2NDcZPH2HCiFffv9WoLD43Lc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792621; c=relaxed/simple;
	bh=+ozLHxhArw7MVnLnODmfn31z73WbsqHrsJgwqe4g1D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoIxzZFjnBqjdYEl5+f5CeqgV4BY0aL1+0u4eBCoLS4hOuzkLyYQITq26xdkpMWOzKr/7R4egyUagVLC4FvgxP7t6QoyZ4eKYvP8Mjl8pVf4/ibszLaE0OUo7dRD49MTAihJU0UAtnXJ1MVC+YNW0KaXkUtYxQ9Kh1aieQU1WLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Me7r6H5x; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Me7r6H5x"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844df397754so9329239f.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1738792618; x=1739397418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+RqOTSnSPXG1MBUyv0qD+rReSmeSDZ6Q4z10LKFiFE=;
        b=Me7r6H5xKo6A9lk2prsnDneiin0O04ZKQoU5d1kmhwNVvsCXZ2vCihdrMLtoJJd3A8
         xwzrYRgxdeWnnwVN78gnD8CTy5+tZCjdHzKCJsQlS7BjQt8KUlDHMXOcCeAHA6+kB2W0
         V2P9j+z5zeSqAGuECxCFEXpbedT8aGyBr4K38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792618; x=1739397418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+RqOTSnSPXG1MBUyv0qD+rReSmeSDZ6Q4z10LKFiFE=;
        b=pCKLUAj1pmPQBQE8WTj91E/FnbM1n8ZGO/fgMilsXLRE8l7503aEs5gbsYd2iK5miE
         UCup774YQRaCOjviLsmbhj5VKjeyiifxWmyNhD5/6GA1YiTCUjGeKWdT9qIatQUOqPib
         RnYGMfFrj5PpN9f31ITQqGUlClAZPU9/U7/ScYUfGudL2v7Fg/tmsYi+SVwNssUhfnrj
         fO0TnZHSOzmvRJmy7agF0OuK1Dq8IgZ+TOeNR/Ici9+50Iv6snNS7Bap9mpuJ8q5vml6
         TfQA7Z3GnAiS/BqF2pvO7+/WL3bDji9EfaXgnKHEZ6rlporSPWv5GEBD/DbFxV+bvL+D
         7oZw==
X-Forwarded-Encrypted: i=1; AJvYcCUgmwIGgFF+B7bxReJK1P8+nBaHTiPOz1LzqghtVF9hqxw+p0vGfdoPMNc8pFaBWYj5iJ32mJzCEct+oT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6ysz9sPq9XtAsVc5w0lHvSbXr/QelOLrrS1qzlqb0K9jvEw0
	zuNyvrbRMgAxJFSkAbEG9jjpbmGIZ86gExIvdSgdrXz2ss46uJaa+ifpO0UlSg==
X-Gm-Gg: ASbGncs8JLcLHxBElyQygsa1TVHy3pXZiyRfeEeDPwVE22zC7+Xtl0ysgKyoeVhekfM
	a+41Y3RDmemm+kWrzM2xIWPt5wyiPFvUsG8cEm0n27ARJQDszWgKKc1sFfBJ5Aa0xH5PDTUXrJb
	V8TBdvxcnstUvVMx+t0K+6PIE0h9+rQsFGJNMcydRn5IzwgBLLlP2Iwirm3A3qHdKS9BBFbJNR4
	2N6TE7UuBjxCPqiO+0Cz4tdRAZCFqjj7k5y2gyC9ZnlVHXXuslouYLNELqXQcy25SPM4c1BPaJD
	uxepPbarHhLDfad5qjFI8N5yFnM6dL/F
X-Google-Smtp-Source: AGHT+IEWlXmXQnDihwBVnSYlw2n6wPB+KmNglO3Os1wffGg3OKOkA12y/hS3Nmj7qmF2gTqtJ9Wcjw==
X-Received: by 2002:a05:6602:388f:b0:84f:54df:dde4 with SMTP id ca18e2360f4ac-854ea43465dmr545587639f.6.1738792618515;
        Wed, 05 Feb 2025 13:56:58 -0800 (PST)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458ecf8sm3421542173.6.2025.02.05.13.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:56:57 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 5 Feb 2025 14:56:55 -0700
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.13 000/623] 6.13.2-rc1 review
Message-ID: <Z6Pep0H4X7Nty9tu@fedora64.linuxtx.org>
References: <20250205134456.221272033@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205134456.221272033@linuxfoundation.org>

On Wed, Feb 05, 2025 at 02:35:42PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.13.2 release.
> There are 623 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 07 Feb 2025 13:42:57 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.13.2-rc1.gz
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
