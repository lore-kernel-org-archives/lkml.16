Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB91494CC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296970; cv=none; b=K0Rzvs4QqZHVBbAPesabzTjVU+50MDxNKyY9dvo1O+EpFTyz7OHPcnZJLsFk/3KtbMi0vFEj5GRCnkx0ngjfOVocemzkHLHH5QQj6n1BqhzmHMsnyd8SgPNG9+dzEKeBF2LQqV/1obONCLXuoBz5LB1xBU0eC4jrdbPXnm/7hug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296970; c=relaxed/simple;
	bh=a7LKI9yVxE3ykJg1bgsYmWUbSOo/xy/ycf6LqSydAZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6S2YOck24dXi3n/QfWYK3ijNq6SDK9U3mPEXEoqP1FAWPRiSEn6Yzm0MjQ3zNNqMpMdk+TpWjckym+bimH+5DX1sSXSkBteWmn/3udn+yznLOPNKjQBo/BRt/ppHs54oL6ipyMfT1+mKzBQB5orzzKVe7f02ZynP9tnuHisShA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=bNHlXLUx; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="bNHlXLUx"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6065251725bso220107eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1750296967; x=1750901767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYxzGeW3SeKobvt5hVr2NPD7d0ZSxse5WH45fraPlic=;
        b=bNHlXLUx3Glu9X3rIaCgz2i927+V9mYpu5RfTW89nYyKjYFrNeC99HImFkV4+bzZgI
         M2L0s5FIB10ZEc/bNMcaiGt1UxCRtvpKLFpaQ+uL7w187ptoRVG+heg0aAe84whvT55f
         F/BOSZUnFLYH9440c8TZe3MVrNCK+KFAJv4Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750296967; x=1750901767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYxzGeW3SeKobvt5hVr2NPD7d0ZSxse5WH45fraPlic=;
        b=CSFyMLt8p4UCiDhqB1g/59R7QKgesA9HHbPn9RES4wXmK8xxZe5EbTNUZR+RY8uTnM
         sJ7Y5tGtk1+/l74OueJSSRhFiBI604gjUSdPpmKVRdkLikTx+MH8OMenwENsGhsHOZBF
         B+63pdikyRnePWyOxK6ZR63xxf+DBKVIvdKQQFbrJjt68dFCYMKDyoHipmtMAP4RXlSH
         mYwi5cT2YXzJoYREjKTYldw2JBhVLQpCwazULOIV/L+xSION30tHvgdb5VVwvf+Qkf4b
         o2eq7HwiyM5dOmThFJSc2Y0koG0fBPHtrFF2lK51807YR9Un67kYJp5YwjQjY9SRyAKo
         xZBw==
X-Forwarded-Encrypted: i=1; AJvYcCWtoPQMNr8NIPGAROWrTnhtMoFsbc1XmvtAIlWOOGdJqh21culu/Py6tbnB9z6w/xQyopTtmUtQMrGvi7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRjCPUb10jc/bJNzXYwWehN3neqjROa0gKZvx993H9XuGF13v
	oG7vl30BABJ7UGNW8MELHQylfaIu+s4b+2oCdFhR81Gsc6tes0q//zWM7Tob+Lz6+Q==
X-Gm-Gg: ASbGncvBuu3EbtDZpjKU8fJp97kqpmonuKvIA+tbE7gSwasA6KvDZcm05Y0cdlT+wwg
	HO0Yhlar3akAMvNBDHtLQ2N5ezDqe9pe1NV9wGxLvPOcYHQbvSzUtJCooUY0Ux4wbNSYSuhsGym
	LsDzXwrI8934cP5sI2WHEHXZY5bEYh0pWi43y6qqHfckLWrc6/iw3IVeBvx84NkOlAdx16k9NyO
	rvRTTcdpT9ZfWWPbcIgkHsyrow/0brQcg4pCtL9caWX30Hw/a+ua4QFa6YBjLGegNFhFfok1JPQ
	NoSgYztvovh7N2TFdZGgz69y8z8perT1NJ16K+SHgkN4SfsoeSTGtTR9Ogpiy3Q8GXgQCey3FCT
	TjoE=
X-Google-Smtp-Source: AGHT+IFEailJ6g9LRTn3NG+4TGjZYtEMqCWW4yTLocUVb0EB4IywFCgdkoef2GnudjaCn24BHwV0KQ==
X-Received: by 2002:a05:6820:1628:b0:609:dd17:795 with SMTP id 006d021491bc7-61110ee3dccmr12281943eaf.6.1750296966909;
        Wed, 18 Jun 2025 18:36:06 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a4fa8a054sm1285463a34.51.2025.06.18.18.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:36:06 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Wed, 18 Jun 2025 19:36:04 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.15 000/780] 6.15.3-rc1 review
Message-ID: <aFNphCnmG57JMriZ@fedora64.linuxtx.org>
References: <20250617152451.485330293@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617152451.485330293@linuxfoundation.org>

On Tue, Jun 17, 2025 at 05:15:08PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.15.3 release.
> There are 780 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 19 Jun 2025 15:22:30 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.3-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

After dropping
revert-mm-execmem-unify-early-execmem_cache-behaviour.patch:

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
