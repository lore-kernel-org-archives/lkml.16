Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C009261573
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858174; cv=none; b=RqCzbudY9H7F0w/LVBuBDA7Vw62XVhJr9nE+9ANvRv7k4S2sWzikIkWBQYzqY+Y75w9LGuR3tost4cF46dojQjyd+/CHd7PCQVHmbUlth6EG/Pi9G0isc7R7y4jqcug9EvrSl7kFQkpMtWOxMtfephUOOkdzF/rPMtoH5hsMrdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858174; c=relaxed/simple;
	bh=HI9la2QsxuOizkMwcoaS1bXXDpyUXSLfDzTpd/RFD+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHJVkaPvEmVnd6SWJp98/WPY2FNu67rst1Tfe3Q1hkpxzC3vK58kOW2Pn8r1sTDaZFxacafAum76OSXn3+N1CgLjVnQGBA/IXNpu+t2HCs/L2zzHkXMwst1JuJzT1tFQ3Fr8zRNHa8lCOyc1eU2znlI6kDbTfU6NN64TCNxHpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=WN+eRMrG; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="WN+eRMrG"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40a4de175a3so4444000b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1750858171; x=1751462971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeGY/v5lQOSYimAG1TJEUl7+krFvp4WYJspcjdIjkl8=;
        b=WN+eRMrGwwCcIAydMuFPIFjXEl9mkWdRzyB31DIdtiZNHiFVHS36+Z5Tx659Bz/Vaf
         qlOKXtU8O3U0sD0dMCBSGGVo9QdsB1B69PSGfvNB2G03f+A3aWnoyGJxzYd3q/MQEcmR
         hH3/QIB5ShkRQ81mA4ZSEXWcDxLXAOabee0Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750858171; x=1751462971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeGY/v5lQOSYimAG1TJEUl7+krFvp4WYJspcjdIjkl8=;
        b=a8bABOYeDe1ocLIHdfuYluM0vLSRuF4+klQWpC/+UFKbNGF109Ycd0F6LJjPPuLUV4
         HijQCpPSWIGuWS4+3ZX4kgurtwtpf/GbfE0hXPwSbqP4ihNRa32df4ch95KMNNCF415r
         EdAr67v5lT2NTzmvmo4ScfjXSbaX4NIi9xJfHLAw33Du+M1F5xs8oqSzVxW3ROrhspDE
         VAH1jkNmlo3a8gHDo/KnrjcVjYmUSwTkkp48il8cFw6WuHBzZjkxtHXTKeBNxsGgHRVQ
         mzf+Y92e/75q6lmJMloIgJUKp4XUOLHBT31PLAYRp7aeFdIDdX8H4b5oionI2VFOKovD
         C4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUmosJTKHhcfVMSXQMHs5xhdIJXxZja1oJAkI1ebdoypUPv6nJ8aEje6DhIIWcyMIbxQJahkJR9ITHf8hM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MPhQbZrGNb7umOiflUFJYUGX4UuADMcLXTCYi3swvxI7oLVL
	zHvyuHLWi1j2C4ECgK27JaFqUfmL1E0vKMxg3v56sz8P4uWhRfZzMPnqOVvRk+khdA==
X-Gm-Gg: ASbGncsO2B5kYAbX7LJf6GOwJHJBLI+pDCYvsFDAjkGvxAw2qQ80db7aQW06uqC6Mmq
	qOfYlSBCx3sbJNGnghWBNqsMztLEGCYDIsvYarvde91hTrno916xBMmSIZFTPK1qgMb276Ny41i
	fPz29sITK1xXD47f5BYqXVhvulB8Lei8X73JX6P2AVTYSLHoGzJrIFUATy13bXx/MLsY7XxMlnV
	8o5lQsN9oYxJ8xJ3zgvCfNDOruXgPG+A9YLLMMa68907D2mv8HyBuRKv8yvDCAv5+zfD9fbhuU3
	zN088uqwOHrsFoXDdAzJB9XKsKqvzsQLNl08mvXVLJG/NNOyHU3snsLOCotDE8sPJCPwhAwk065
	SG+o=
X-Google-Smtp-Source: AGHT+IG2FI1jDRFQ8TbABRF9Bhv3qaEH5qecJjomLNpJZJ+9FLbz0XOtMMk41w+LNPolSsQ/Q935Kg==
X-Received: by 2002:a05:6808:640f:b0:401:e8b5:4e4a with SMTP id 5614622812f47-40b0572241cmr2882440b6e.1.1750858171060;
        Wed, 25 Jun 2025 06:29:31 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c13330sm2150599b6e.4.2025.06.25.06.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:29:30 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 25 Jun 2025 07:29:28 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.15 000/588] 6.15.4-rc2 review
Message-ID: <aFv5uPHCceTAbx9I@fedora64.linuxtx.org>
References: <20250624121449.136416081@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624121449.136416081@linuxfoundation.org>

On Tue, Jun 24, 2025 at 01:30:06PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.15.4 release.
> There are 588 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 26 Jun 2025 12:13:28 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.4-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc2 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
