Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9F86338
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746668823; cv=none; b=uwekEZY0sY8lbBiIjhH+4DbJrUfPBtB3HKBasRuZknzONW6Jz5gMtmF5MjInOzKkmK3vgAcwOlGW1zqbsnzBFJmQTqrYdUgsGA/FU+qZsgQHTsCfsMQQ37aqZ6Pcw9XdSODsCvntHQHW9HNaZUnjoX7ZyjSSgBj7l+sgsEWpbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746668823; c=relaxed/simple;
	bh=wPYQA0chDUAYTp1nRzQozQgezsU3Dw/AxpYicdDi2C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjVpmo5krsIyawZXegax0QInPrcOYGg6XG8w1NktjS9UwGi3WArmE8dBB/TPTqzvQar1P2Y7z07gxyGaJ7t36In7UXmdAgLbGqd4L2cwfyBR0xGZDCkTqQYLJpaFlCj5zaMG7C8bPjOOIDSWvsSop158QBsiQ1elNqzm3dmZ8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=aqAWagU+; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="aqAWagU+"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so1781925ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 18:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1746668820; x=1747273620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K30ImzdgaQIMhkVLspdKyTD1ilP48uNTiegnW+raJhY=;
        b=aqAWagU+nXyxPUh6A4A/iPf63NJ49HnSu5Jgz9xqdfx7siIxFq+8Indtod7nRw4BuC
         qdmaVpyYw1g5zVgMSN3neyEY7DfpJ1UGZbB+a5Qdz42zAwlEeZJ0zY2qHnFehNi7HnsE
         p3vistPhEwzpVGc0aoqAOzvVUPdIP6Z174yTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746668820; x=1747273620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K30ImzdgaQIMhkVLspdKyTD1ilP48uNTiegnW+raJhY=;
        b=GsUi60P4M5QRV6CnSL+STyRZ2FP8+qc8691iGVLMIMlM30LHOUFCOiht4enHaSkZlk
         4TVMqR0DIRAvvbg6Tazn09ucjJne/SVgrAoDVSsqMgry9RqDplu9U483K/6rkhN85wLG
         AtY650bSPzoYgGpy2TBV7gsGMOjHtWV7HHWh+Pb88hA2Gy74OkK0KneofG4T10mig4Zt
         jj9w4At/nLwSNhjxgKIspjplUPLIV8/azg37vlwxRPMjK9xwik5SKGQ52vm5jDT9rp5H
         F/Hm8lZvzljvyuw1Mm14qqt4KfUCWHdbxiald/L5ZsnwZIGn0+5Ko+06HiiESFWm4ESo
         77vw==
X-Forwarded-Encrypted: i=1; AJvYcCUtzFnhIwD/QV9fD6YELZFWeZkWpEgfkblx+F0iml1XpArQt7VRFnjuUiaBQplV5W+PDDcVOA5z5BuAcHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YGLN7yu370XdI5C3sGHa+XxX6BhuS7yEuYGz8b2pKIYFVFtW
	FMIR2fI8lGGw4+P7wCFmfVUR2LjOCO7RriQz5sB7+HLR5ExE3QfHaa7WZ+dSJw==
X-Gm-Gg: ASbGncvxn7uwl4vOWHXgoPIWJTbkCEjEJHvn7FMF6Zgho6MJZvHEawOmcUZTXZ7bMe+
	sjl3ptQXYiw/bwfEvR+mHtiNRwDioDSRUQbUwjZOwCmMw8S0YGsG0EYllDd5PsX3JeIItF0QO/4
	2bD8YAKGNE+RvVKWob2xMuE7Qr7KCRp7qCEABpUEkqR0SiHM0xFZgpp9FgAYrKx+MQOqp8G3w1w
	ZS8EMv6rqDlT2yPlshsBn+3JpfIJRh6yjgnCuWZFpg54Wfg7JLesShPLXptgLqp8lm4+ysRzQK+
	LAlxsOthLUnE4m4XH4QVmnmmCcqjRiixFehgqzusCDTrGkfLVKeimPhVwQ==
X-Google-Smtp-Source: AGHT+IH4Lz1o04N5HigShgyvfxqljFYcADGJXBDAPQu5Ym4eae8BcvvU/ic296T5K1SMw6L5LWvptQ==
X-Received: by 2002:a05:6e02:3f02:b0:3d8:18f8:fae9 with SMTP id e9e14a558f8ab-3da738e3bf4mr67925185ab.6.1746668820373;
        Wed, 07 May 2025 18:47:00 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da76a9c49dsm4777715ab.3.2025.05.07.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 18:46:59 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 7 May 2025 19:46:58 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.14 000/183] 6.14.6-rc1 review
Message-ID: <aBwNElYzao3SIHYc@fedora64.linuxtx.org>
References: <20250507183824.682671926@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507183824.682671926@linuxfoundation.org>

On Wed, May 07, 2025 at 08:37:25PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.6 release.
> There are 183 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
