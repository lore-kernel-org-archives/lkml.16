Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94FF1FC8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745021647; cv=none; b=Dq7SMc5FMvxRhYtZV06N32sRIjJsivZGo3I6juaQq/oBkgVHy7aAFdVutm6su6thc3mh0KAogNHeAk5DT21/1loQsm9FbI8jwN8xV1riQ5Bk2wJXy8sOKVqb6hBm8KriHwlPIuJuXYYYPB8oSel0Ng3B29J6/rv/jk0rSX49jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745021647; c=relaxed/simple;
	bh=yJgu/Dhzu0IBN3vhc2eYs63bBunMr5TNjKKesXcVz50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xzv0qqJb4sIBMTwC42zpPhv02UzlaftBvohiwO40WpdY1eQAkSfAvn4266VGLlfurwSPSNZqQ2PA28nP0Lxrbqn21lVn/WAS2AE1pPkzCAHMvCx1ifD29oFIimnd0bJIiPHvb/y1RwUXrVu1/pKNUhc6bDPoF1Mhhb8hVuTdv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Z9GjjmTJ; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Z9GjjmTJ"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d90208e922so605865ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1745021644; x=1745626444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOeVBHov7VKB5DDUBSqDYO930hNH61XeY5sxFZIOsKI=;
        b=Z9GjjmTJnxco1t8HWS0jfbLwB81fuxCvphOSpvd58udelglWrIKfIY1H1LvR5dhJNj
         Opo7JiOXdF+KcEH2uImJ6AF9VspdXrLlSeuJ3VZEU4vXbUDWcHMsDdnmOSciHitzo7d3
         shHxoHpd5xns4MtaMFCyMT4uAIw3cKr7PaGL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745021644; x=1745626444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOeVBHov7VKB5DDUBSqDYO930hNH61XeY5sxFZIOsKI=;
        b=FBGD3T14P5LMCIXc7hTZBPIYqXySEhQpIaOzECooSZ93hqV7QD1su2EtoQrDkLJyr+
         Lvu943cst+egl5CRm8y/KZITsmkSVfUh+axSdOP+qO0w3/fOezp5uivJ0wzNHQqYMrdA
         xYzB/EM6hjllonxV/8XprfaU23kgKJPq35NpUQmt9B6w8k7mWuP478lClio8eq4WArmY
         If7Xm6ZZUXqemgjOBn7Dvuuae9r5S33o4GTqSSySy6dPLgrHjnMEFVVQtTVg6mN3NCl2
         wjHANWoMSZurytHJnSGwDX/IIKdRdMC7H7xwTYKo0WOLS9jWmFA+4/ktVKg30WV2Jl5e
         nrFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU79fVJGUsK36De6qxZJme38fIGxdljGcZrI2eOlckkPwl5pl7U0hpL1yihOkvZUwKt8HVHljpygXEWnQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxppufT6oDzM/MYA2DlQ770eivEMGF/E/bqmcnclE7rhlGa85/s
	8qd/xgtYsGwDtlghi14R11MXnJQlihPpmwpmnHx9Zf3PD0KUxta9d4Q2Ql2E4A==
X-Gm-Gg: ASbGncsPZ4Tw8KdU+plXXwdwBfG48ckYUvg7AYmgxBhEKt5rrjPtw+pgq4inEg3gTJ4
	O7f9DQp5Gp95x3v4ZjOskKj+nkNZ5z7bgbscEHwXKLg3J7kpvsn3mQlXc4z14N5Yg89l/ec+9T2
	kdSEASZce0ct59bwIYPzLY23WmZ2KgaRu6MIcpSh7vrhpY7Aj3zz6LnKCHwI6qNTVVj7pGMv3L0
	ZcIwKnkTX3zML6yOTIUiL3hHB5aVd4giL+iNWwbGmu4S8wdUO5wnC9ZMgf3kzSLWvxxBNdefELv
	wj8PMidQUZbrnVuDjpB05Uc4ZVrCujAet4mRwp9H4x3zHiQTjL6Y7g73PA==
X-Google-Smtp-Source: AGHT+IFOJCeVjmoBLR8EM84DP/SEvCgRXJtSxJ6KIQXOM7wzlmTfsBHJKFO0ZpklJTM30Nv0Ca+1YQ==
X-Received: by 2002:a05:6e02:1fc9:b0:3d3:eeec:89f3 with SMTP id e9e14a558f8ab-3d88edc338cmr41184805ab.13.1745021643992;
        Fri, 18 Apr 2025 17:14:03 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a37f934csm682098173.49.2025.04.18.17.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 17:14:03 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 18 Apr 2025 18:14:01 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.14 000/447] 6.14.3-rc2 review
Message-ID: <aALqyf-hy4-_K8f5@fedora64.linuxtx.org>
References: <20250418110423.925580973@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418110423.925580973@linuxfoundation.org>

On Fri, Apr 18, 2025 at 01:05:27PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.3 release.
> There are 447 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 20 Apr 2025 11:02:55 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.3-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc2 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
