Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95DE217F56
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748458863; cv=none; b=NNaBdNaVM8J2WeO21Rz2CR65SWIcvyfBbBPaGey4ioWvsM3CVCKEbARsOQmLCPA9P1JCdR63HjUFwX3FVP/MVvRam05G1+dIdSnLgczq5kg9zaWnGMk4Wuqkqr9txkNYXz04QQhZvJTY1cwXU1JNVIpgIct+VIQQQ+mOI715ve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748458863; c=relaxed/simple;
	bh=99lZxN5vhS9pT7XjyafkDptBxd868nvYUBqPecl/XbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJKS5XPCt45pq0T5+eQ4P+etK1ofLrTHoV6lDAea3NtH5pwtrVuGUhfVYtLmMBeHZMU4tlfa09ISLsiEpvzGWy8jXbNxMysoY+sRKSwVjXtK/Dl3PM3Tq1evW4+vqdjiruw6pE8RhIZyjilMxJ6/ZOtGhWToMbV0pZRLgaFKMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=V+waCASj; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="V+waCASj"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso990705ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1748458860; x=1749063660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6uMWV3+sb1xZHl//TOe7Sv20/rDXHWApZwSoImEOEg=;
        b=V+waCASjWLzl/GEBRfbNUVhOL83uvHoAfOinIr53OEXjAYzr2pQeLXf2+XrXKHX8Kj
         ZJXlbd2MpPmud9yls9r+AMhVwhkHNjzhJa0DOb5Vw9Tp6JfeYiNg0m3fw7eH/oUIEZpq
         inUBEBw/u9CV/hRPrSVx+038rHT1SfDgKqCrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748458860; x=1749063660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6uMWV3+sb1xZHl//TOe7Sv20/rDXHWApZwSoImEOEg=;
        b=hsB0OGaLBX/VMsB1FqUks3bzGmp5qjIG0/A8uxAV09BfZNBRqWq875vIqV7mucQg8A
         TYvO1cFQCtHy22itlSnmgf0FrJWfpfv5Ih+NhSChyNOpSKqMZGFQRGtW4m/AIFx/R6wJ
         N6iiE5UJakCC9ZTMj2b7E4dRfEfFMDaJXYneOSPx8ulpfGMCzwJKYrS061DuruWCYk4y
         gL7nbHWsNgO3oY/Ez+PvdH1GCi9WR3VEKL40IQRBQ89gvfoqRPZBq9NsPg6tFXUslh/y
         IP51R78S4302e45zd4ES7Pwmny9x7eBgpEtUkon2+F1fFZuPkIynVYhv3mG94HZ7aHrc
         vd4g==
X-Forwarded-Encrypted: i=1; AJvYcCUd5OPlD62/o9LgnQgKHIqPyAbwVEQndBPdE1U204JHyh0knCOLuB6k2qDtQhghH8/jp5DnHnPxOd1UbKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaG89XjNpnitlgfWYoWxVIb7vsMObKQkJJ6MitRzzexqu5AKPJ
	vReFJawfY6RwOPrNacyM+0i/by7d12jgP2K+xWCm3wQbXqynP+bAVAlacxRkL+ak3A==
X-Gm-Gg: ASbGncsBuZwaplb6nsPxvu98u8jvG/dkImTxo+mCPOwV6m4gyTfj81WRexnlYr5Xu9w
	PqrI77rPZD0r7DRfJl52GTEXa4Vt5yOr5sP80sm/HKHLwmUBtZ1Lv3Otr/KZYvSFpuUJy0eVIdN
	cT+CfM24F+m+RsPNesWAMqvSw7ssHe8X3QpgDVtkQGWEmzS8lJyJQ2DjFDbLK4sVqgHkRJTpFuK
	rKyPzsmmVn8aXKfmQIlytfvVpozCxJfSvl4N3DvTf/IGiKJGE7I+VOmzJVRcpGYNXJV18IMhLXK
	ox8N2DzvAD+kg89qJPg9bmBIQNdHDvJ966Yr1IC1u6aS5L7C5xfgAvKb93lkZ7SbwqTRsx1S/v8
	exa0=
X-Google-Smtp-Source: AGHT+IGO2PTzIAqkK41ccV62UVml+KrtjC/CCurWR884MEq1rueZvDmtfrOp5qmDL+URey90IDvSbQ==
X-Received: by 2002:a05:6e02:1786:b0:3dc:8423:543e with SMTP id e9e14a558f8ab-3dd8b044b9bmr36739375ab.17.1748458859626;
        Wed, 28 May 2025 12:00:59 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd58790asm341459173.95.2025.05.28.12.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:00:59 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 28 May 2025 13:00:57 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.14 000/783] 6.14.9-rc1 review
Message-ID: <aDddaQGen1YUVCYz@fedora64.linuxtx.org>
References: <20250527162513.035720581@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527162513.035720581@linuxfoundation.org>

On Tue, May 27, 2025 at 06:16:37PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.9 release.
> There are 783 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 29 May 2025 16:22:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.9-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc1 minus the broken "s390/crash: Use note name macros" patch against
the Fedora build system (aarch64, ppc64le, s390x, x86_64), and boot tested
x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
