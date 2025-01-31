Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D9F1487F6
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334853; cv=none; b=j2vc7ZJNLL5uQ1+y5T/JSEXeVMawozy+uei2l+g46KFPbfbLjdo9BFiOCfVoTc3d1icFmerZyIdUkszmJhiDz0zcuKjtmO1a6eTEX4BFTznvMizAywXF/wpCILUIOE5igue0i/WZDdNOBEtgN6dHGp8IbBEMdfCAQKJJPF1pwQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334853; c=relaxed/simple;
	bh=3OkWV1e6WZQ/dF5Yn5YAx99NLIo/IUO/RUBaemGuqFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMXVtAQbCZgKTIvd+aKtwDlYaHa8Y7EdEISRSSOhIBrSA6wcQmYSpUBn7svCfQYa85n/1/+ps7xwa3TMyAlR3vIfsb5M21H3oSPkseV24h0y1lPw1LCY3c5MQSN62Bfeg7aD96vQdYJN5ceD9gHk4lnmmJqW9h3lOmJyM+7Nizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Bpwtm482; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Bpwtm482"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso141702639f.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1738334850; x=1738939650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0i8jARHM9o2vH9POVudqrpVADfjg+0Wl6rXBt3YUB4=;
        b=Bpwtm482IQoMIrZQpnRwieu+SnUVL9t5aQjahUcr1cXz+dDUGtr8CwvZAlQ7O4wixC
         rB53EVCnz/QSrT3Do3I3qXXKKFLmAv3583lN9EC6c+kA5JGM3Ksbj+tuireEVaue9/yk
         uPx2UI5CpRv1lK0GWysV3N61UE/wly+9X/stI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334850; x=1738939650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0i8jARHM9o2vH9POVudqrpVADfjg+0Wl6rXBt3YUB4=;
        b=ELlALRvMLuEosucz6L88BkPADA/peQ7R/yi8fvFDA4qkhMmEigYfIhIKFzBYw/j9gO
         GgkbAK3nvM+dhhOfAQg8VbmEU6WBysoFhG3AZPNnZ3X4rzVGQUXZk2sW5YvD4SAK3ZzC
         imHpeAFnbiqJg3wgRbPx+BJJMF8cTCiflesqkU1TOrh5ERfV5roKYSqpbgBNZGuBbAOE
         QqbdGQ4mc/UNfuSPtO5ZCOin/UZrKMdm97HN4/XA/0hDYrubzBEYtEI4/Vrh6mfJVhPm
         HiqyipuRnQW/IEXV+1ybHq1hndcPUVQjueZwc+JyusGGy6Vl544hFbZ8RpZ6VpAwwqiH
         X2fg==
X-Forwarded-Encrypted: i=1; AJvYcCVz13w+u+zBZ5rNCMk49eNMuG3wO8gryL3CmJ4TXauNK/LIB8N0zVB1M3iTXPlDROveCsA5BY4hzSNNDIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrhqQfK5NQCIjtQ5C2hve1Yk0tsly4Jzn1oqsecRpnkWfQ0Egv
	9Tg4/7DvUHJVqLTSIbdquCeteU7vXUHNhqt2ANv3AdWHd88lfOj0STRfqrw+ww==
X-Gm-Gg: ASbGnct2B9fCsPDGgALD04UzcQcFs+qLdE6ouae5hYZP3sNjT2WG3FVJUVPERu/Cq/O
	d+XE4JfQnn9LSeSQVpn+8nWGak+rQbryTOqjAq8Nib9nNNihaCRHoiDT7MIZ41nR/vqBexTWEAj
	lZvxX18bJHmoZ45bIv5nEX4OIIaWL5FrB7XK+nHIqelFlQ+ILMIMNM9cSf2X/0kql6fudQCtIr6
	HQKh13jgD+eJXBz8ELcSQzpwNQuzQ8vxaGY1T1zTV07EJ8odtIrpYEGhT5EYG8QvoruGY/pGAvd
	tLGOodtpSEFTeAaXK8K1Br7+gf7x9q+p
X-Google-Smtp-Source: AGHT+IH6BGQGzWRpGFP2/mx32I7TRFgh3qostrn98Keogfw3HieRqTGh4nJPUiH2IEzE1d6C0ug7kQ==
X-Received: by 2002:a05:6602:36cc:b0:83e:418c:8a28 with SMTP id ca18e2360f4ac-85427d799cfmr1096773139f.7.1738334850633;
        Fri, 31 Jan 2025 06:47:30 -0800 (PST)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458ee70sm841402173.18.2025.01.31.06.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:47:30 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 31 Jan 2025 07:47:28 -0700
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.12 00/41] 6.12.12-rc2 review
Message-ID: <Z5zigMpU7NyKYGyh@fedora64.linuxtx.org>
References: <20250130144136.126780286@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130144136.126780286@linuxfoundation.org>

On Thu, Jan 30, 2025 at 03:41:57PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.12 release.
> There are 41 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 01 Feb 2025 14:41:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.12-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc2 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
