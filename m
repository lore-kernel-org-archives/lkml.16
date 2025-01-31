Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3A1487F6
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334879; cv=none; b=p0Zp5wYCpGLZ5m09nzEsHiW1vpb7YSB0tuZQZYM5mZyBfxArc6Z5RGwaKRecaxKCGHZPL5FT2p6kERzLxXSOyXWEo9j/gqDlGzYxjkbGkFbdilbirtqaCLVX74CD5jlXhOahAsDK02VG4LlTQ9qEEINcKUETnhhz6kSp3VUYqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334879; c=relaxed/simple;
	bh=139fh3fcoJ+jnV8azA9f7I0ohKYboEntB3GaFVohabA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljCWAIOMvVR/YiQ6Ytdc/hnDDYGiVRIVQk1mfet04JJCiLPGUNb0kDWy8tj33M4uL44pi+lXycAvjlcXu9GbjKXetXCusqmfCSAO0+sCtclDs5/frShBsVVg55fnPaj7X+4rvfJPJwXK6dJ6sYBYgh41/vuRNp3NLGj0sXnt8xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=FGf/FBAO; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="FGf/FBAO"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844dfe4b136so50627739f.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1738334877; x=1738939677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVsJW1ToeozcfsJdJXyb0ho5kmAeY8ktfdPcDsZN22g=;
        b=FGf/FBAOjNeju58M3IliN9PepKTOPegFn6/tHHL9JWyTqk+6ltbF+EPoCtNEiydThC
         tJ5WRRwz0zu96Q1ipKoKKLQ+IKxUBp+oB/y5Du9EmHi+2Nwrg6uMwL5NHybfrxDFXtPA
         hGy8AB9pzvzZZlMrZFXJuLLrmNew3wIzo8UKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334877; x=1738939677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVsJW1ToeozcfsJdJXyb0ho5kmAeY8ktfdPcDsZN22g=;
        b=DT+2PUSvIZAOi24xCeNCZ49O4hgf17MRfGvrx4L0OcB+qVxVDAwTMrArwUlZoFjpLy
         29MzoZ7RWAVLKvgsPMnz8Y+qTn5v4r/omPESBiy+v2UbzYDgo6QTcEa9NBEN3+6b/KlV
         3WcDHHOAPHLxZjPGYJ2CfdYHnziQAlTQG2w+C3dxAWuKVb0iCUSb0wTarKLwaxb/UeXH
         eQ9keuH02IYkfe41qcz2HCJy5urk2aKLhT85goupaBIKD/MoXhcPjKymBAD8yMGVqTlo
         MglUroFw7BYq40VnKu2N6VEiyAFEwfOXer0sp6QjOJJVtE/UK9kQHFkQRH1pmjYM8dDF
         G8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUMS+v4r8sz8bAiRaAzEU784DX8LKIDEyJxRd69zu+HDmmb0jT1Pfb2plsUjfGAklCyiU26L40e7jWqSIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZp46GbHaiJdnPmxjvr8WdSVCLlmAvQ5yBV+IA38BlQwKj57w
	/BW7LYjYCJ5hMJQ7dmv+Uw8ieYKh2wJf5Nnoohh6+1UJEKGsJIUJGFjx38Fbkw==
X-Gm-Gg: ASbGncvnLIcZIwc1Lr0auCBNYuH3jBsM073sFuUfrgK+MKZct+QNhOqTvCdCwlOMZAU
	lBQF6FJSEhLI414oM2RlrBltY3whe8DvDU+nF4Tq7cNZHYhDLRzXoeO8apxzRN45ef2k77ATPcS
	FdXkkXj6pqOKV3NudVum69UtgixzdXaaYeaoqjvL84k8sm4SZ/HrTXjmJ0uttcGZ+67mjosacC1
	BOBd6nGkmtl2CXUhbb+mgt/4vgEyrF6zZu6dSRPJdwEveVpNDMJoDTQrFSzOESqOBivubEBq7PS
	RbiV1fn030o8IM0CyJ+c9CacD0T/pzks
X-Google-Smtp-Source: AGHT+IGZaDTT9EUvo1v8tlEIqj3aBpmJegYAnz4Ao4RasNP2H8e6kOMiE68F/LLfpFppWu0l0DzaOQ==
X-Received: by 2002:a05:6e02:1707:b0:3ce:6aa7:fe96 with SMTP id e9e14a558f8ab-3cffe4bf3c1mr114496615ab.22.1738334876856;
        Fri, 31 Jan 2025 06:47:56 -0800 (PST)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d00a5968f5sm8540025ab.49.2025.01.31.06.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:47:56 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 31 Jan 2025 07:47:54 -0700
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.13 00/25] 6.13.1-rc1 review
Message-ID: <Z5zimkDt3Y9ntRMZ@fedora64.linuxtx.org>
References: <20250130133456.914329400@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130133456.914329400@linuxfoundation.org>

On Thu, Jan 30, 2025 at 02:58:46PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.13.1 release.
> There are 25 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 01 Feb 2025 13:34:42 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.13.1-rc1.gz
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
