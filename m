Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1071FFC4B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792477; cv=none; b=sYwXRt0+SC/LZLKFChkwBYT1DbPdBTlstITKqRus4Pib4Z4cvbr5POkaTHkQNQZytJpOJCH8zXtIU3EIMagX7WDooGCHKfJEBnIInBiwPGirK7uG5hFYTaWm91TynDEAEQ3VNSAVm2DH3FjcrODkivalODNiye4FLaVSo+W4A2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792477; c=relaxed/simple;
	bh=7hYv5dIku61xxB4YYzq3uEp5CTiTbBzQk/a/gUrOKVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXhQvSMFTJbai/cYxfLy2zKR+ipwXPd13SvPn9JrBMXToxLxUwAUh0X17WaA+SDtVs5VCPHtCU/hgWc41r6Bzn0uLpA5tK8YyrSexncKzykjfpEs0FiXhsQEnBos6oFn1c5nAtgcY16fuwnwlaqxYXyjyIsND8wrg6cftbm4or4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Q4pFByCU; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Q4pFByCU"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d053d2e39dso846965ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 13:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1738792475; x=1739397275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P496XEFyd48SqnxWvUc186zaYO6NAXCLlCQfz4QFBQ=;
        b=Q4pFByCULU1fxkpMZJNWNmBREH/VMgyDCRjR1QUT7bqO8I/dveP2cVs317ggreSIwa
         Xqy48/6KgPkeZABwZ+cq/0M4SsLZUnlHN32CqsTgbeBBRXke7kmdp6bNAHD4OvX2FQfZ
         QOu39zPW8fTGjXbj6tjUPKhkGsfGy6oV8RbJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792475; x=1739397275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P496XEFyd48SqnxWvUc186zaYO6NAXCLlCQfz4QFBQ=;
        b=Q2Qrd7JKaEnh1dAlxn91s1TIKnPq2wxtSFsroCS3O3/H9KxEdaTwag7yy7fKlv/Hqn
         FM69LimjcC5SanVCRt1EQSKNa9mva+/asS35SSvu9zQkoEvdKqjL+4NUzvzHXmV2DyCT
         WuyaKLStHIq9bsMylyEj4hEQZPNFd4LDC4vPQsccBCe96wQklq8wh1egrgE2YWNxVxjF
         HIDoU98w5tC3Wk8p2pIHFYKpQ+whZ96Tde9505nTgDY2Ge7gIsboS/7qJlodDdFZIyOY
         mlyqo/0LNMJKLkvWdLAIUOoHE58l365RMmS6aNozLApGF9NArJBr1Hxy1v+BDVenrnBS
         yazg==
X-Forwarded-Encrypted: i=1; AJvYcCUqmvCBlppFNvpNzvtNYmI0LeIIngsiqRTGdOJWdH775y28eJkIV0VOHaxq88wWYrXp0gaTqvLmD4LxUSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFFkmaQlH1NE6cjEurG+mUb4SoaHXxY+vcADBT96SPtm2d+qr
	XU4oaXqQl3L22gGZt35MUT06n4sbOM6bqefexZVAgzujRtKSw1i1piu7YS3mHsPeq47XqVy+vJs
	HkQ==
X-Gm-Gg: ASbGncsXydfVpAmhWKFIbTAptd+T2mXUJZOtsrqjPuq0+H+ici9aZYKRLWCCcK8/m9l
	tTx2aAhNUsYc9TkgyNc2UCmDKA40Pr0gXa7jiEHWNMg84m9RLvRxumhnIQzTZEOa+Wqkf4Divcg
	d3QqjcPZu0hkA58C+IhjTp3D31uqj/foTsTUXsSEo5tQ6XkobmqPQVfc1MCPURHJorSWkPsjVJZ
	hZy0OSyrs4LZWyneVq6/4MrT9jtsQpb5Ycts1QOe8iwzcYrZa5qDu8kc3q7WNYXI3d50ZTrNJ/S
	PM65qMh4w6vuSkneMEAEOTn+gO+QzCr+
X-Google-Smtp-Source: AGHT+IETeY6aK5dolIEu79iP3omSgxyhTR84StQvlNAIr8vYtLnLrdK4f/+SZ2p9/owFtG6WQwhh1w==
X-Received: by 2002:a05:6e02:1542:b0:3d0:235b:4810 with SMTP id e9e14a558f8ab-3d04f403570mr46060005ab.2.1738792475025;
        Wed, 05 Feb 2025 13:54:35 -0800 (PST)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d0505dec79sm5502915ab.13.2025.02.05.13.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:54:34 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 5 Feb 2025 14:54:32 -0700
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.12 000/590] 6.12.13-rc1 review
Message-ID: <Z6PeGEp__6A2D4DJ@fedora64.linuxtx.org>
References: <20250205134455.220373560@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205134455.220373560@linuxfoundation.org>

On Wed, Feb 05, 2025 at 02:35:55PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.13 release.
> There are 590 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 07 Feb 2025 13:43:01 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.13-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
