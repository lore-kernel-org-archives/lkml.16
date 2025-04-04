Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069E214230
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743802722; cv=none; b=q85iQIzu+JlKMILle2k9OcQnFcXASJrHrMvZvC+RdK5mdkCg2pGUn3yILr5ZpTH8w29kkUXNnCACBoNto4wtro9yQ6LPjpO1HCXrZUoV+HarlV3B4CM8xXqnHF5xFrCiABIgXHch32j5ASvARo9j42oWo7uYcfZ4Hlfv5pFUm10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743802722; c=relaxed/simple;
	bh=oeXi/OWda2xxmVGM4W74nFEsM/hWSjUkr3LPxXiu/Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qxcve9vvSDhxd7DPmYZzeO6382srDCUcmkZKEQDnp+66WCCzJDxXenQBlXx+Fyo+y2lP+kU9tP4Luv4NV+Cv7sZ4KrbHPURwamQIGXq6h8X4tFGoVxsn0PCe7mQbzb08/vQqpPk7VImbS7zeraqdaWWsN9r1oC0yO4gM0gIcUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=A5WYs1qO; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="A5WYs1qO"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d6d162e516so19983065ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1743802719; x=1744407519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MvC/cEhqDtGi3cYQt3IC4fUmaaxTciOdN9PYiIFKME=;
        b=A5WYs1qO4tQzOHX3i/eZCHPv1GpEYRC4IMVDMIq/CjczPOtJ9OP2vg1m+5P+8U5hKh
         0ggVWWNih63b6KTH82TLLg/1Kp+elQmaK48+iQhwAKAhzo2PASL48AFSB0mX1d67Djxk
         ZvSxmB1gLLHtlloA0+OqyDFb6h3EzhfgXZvQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743802719; x=1744407519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MvC/cEhqDtGi3cYQt3IC4fUmaaxTciOdN9PYiIFKME=;
        b=Vwym8zfbFhp6iu0nD2GSUjRIZ+fJ/ELMjnTXjcGcRQFxeNll612HA86zGDwrGpOma3
         eXCf2jeDKTKJGdLxN7rYxIo+ZBcm2x7Fds0VTVHl2SUmPITLQPSJY6H4P5x+eWB82jOH
         sS5DFy2y2whlYaS1CW9el34kqKu/FEZwv7jBkFaSrtgdy5hKBffaHrORszG2veq7kT8t
         5n+ujq8dYVKEtocYKDDQ74kU38x9c1iYD4YUUJLjif52Ohf93WPIP9dE2kFEoGdhtpue
         37S0M53gvwBU2QE43PkRv7oBt15dAPcjsEZGOl3tGsZVHmaSb3f5Ybtd6iRtNIHHYMO3
         D2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUVlUpgv5WfyHm0kHP+fHsdx8ZxFGwP5C+k/s+ziL+uxOPj9z6njeXEDXb9bsK8P+xF5P1fu6kMPXnvKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzldI1uPG9Jbv7aQ8fRD3qVnOS8wBADphmGKAG7MyitwAolOW5q
	nzOUi+UpbiOjkNJ/FYXFldFdhYgklV3hQZviQwLS59VISSbrRojaIJlKGLopnw==
X-Gm-Gg: ASbGncuesx1hr1MK8Q/FJXMJrorimadHGXf2viWCKxZaDKBfsXjigpdP6Bkg+XdLg5u
	umNwo0GPAes+dzTv7O9YU5uUP5iOWpWUp/Fj6wsgm47aBs+CBe1xx9Jcd/V1zlWKKfuDP/8Lt4U
	JMyo+NYJ0hQJqEls8Z9G83QhMTBDKKFN0JXt7CQiu1n+7FYkePn8RVu7MvF5yYFtWInFXt4NutC
	NqDN5zYF3+nC5b8wUF18YrZKvn6YL5cFUU6/PRkOFJ8sU6CFmeO6CUPbeDTz5mirMQwBQ8L33t0
	Ik0khyOQmfQU3GVkfUlGUkTWqCjhF6kxd84LYSwMK5Id97Mdjm1YNPXer7C7Rg==
X-Google-Smtp-Source: AGHT+IGB/Y1HSkOpJ2q0nvYfvc7mtN57agU2hn090g/NK0jiNIWgsZVZqVAQkC06/3IHoq7MmS2hCA==
X-Received: by 2002:a05:6e02:3389:b0:3d3:d4f0:271d with SMTP id e9e14a558f8ab-3d6ec5446bamr13709135ab.12.1743802719037;
        Fri, 04 Apr 2025 14:38:39 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d6de7b8828sm9984355ab.18.2025.04.04.14.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 14:38:38 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 4 Apr 2025 15:38:36 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.14 00/21] 6.14.1-rc1 review
Message-ID: <Z_BRXGxg6McB2M_c@fedora64.linuxtx.org>
References: <20250403151621.130541515@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403151621.130541515@linuxfoundation.org>

On Thu, Apr 03, 2025 at 04:20:04PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.1 release.
> There are 21 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.1-rc1.gz
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
