Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D1621FF4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425511; cv=none; b=AG1hku2sckflBFN8SXJ4gvWJm5fvPcOYhKMb+rvzIkEN+AhZkOrGctB/PAI7Cz5uArtOHsQR1KOoc4SU+6mFf7FAltiWKx6x68puJ8s5hw+pN9b0ceglArl9u7YxecpA84NyLFksRsKKHKH1C25rXCYeCudYtrSs87XNhEu5/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425511; c=relaxed/simple;
	bh=tedIXk8bb0yxV88Rnqlfz50TgIiAdxS9t9MREk4odcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM5zCOGeTpUQwNhr5wH1FDwYLbG+30cKVdRyPKEmmcvw7vaErZJUk7hssrP2FIoPLaemkYPf8Wx9hMjT1fVbNHmwqCRLDgCHcMauaa93CNKsupKDnvCcOCTQM1JmE7jCRmR0ZMUVugDJiPQLSJUmaFy31uoX0rFbxsCG/dOLVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggkrp4w8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggkrp4w8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso207195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745425508; x=1746030308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pxmDMKOOQSkjvBbrQiXuCfs046JsELxxcbIwMBu3M5c=;
        b=ggkrp4w81ij6kYoYSZevES5Yf24ue+0/x1DEe/w2DcN86hEOcXaBE3ZLUeTHx1LCyH
         LAvhoP+jG3AXtRLZY4uuOZfVcxjXbUFClIXNlnMWQ4lWbEAYsBCeUy9bJIhwr0gMIBJN
         bl1OQetkKU0UH/LEfT8NumnOa3ntrHr0xf8lgKVRZ7vppq4XrmA22qYv74i/RBqcPPox
         02b7nG+GGNZlLTHn7+G2g44WzHoy9+evybovHfXMCtXaMYe8bn9IwV863uMO4m11Go0c
         /tWSHMuYLu/ZHzikGoYMvqEFFC9LblnM6bG+8LwM1182jToffKD/LfBwvyluBsPD4V0t
         WK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425508; x=1746030308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxmDMKOOQSkjvBbrQiXuCfs046JsELxxcbIwMBu3M5c=;
        b=Vl/bcdns/sMhT3bxiNp3qc8HfUxu5gHsO+x4Tae9uibdabtLhUtTKE79kdSLFOB5W7
         fCrEztNebRiod2pLZ/LRulcIAMyi3el6Sa6NTmKlfQlLjRJ4jX12IWqe5Dmjr+F+dCMr
         p/PnmtzNZ8Nj65gU/tSgdqXbfDDj+8beBE/p4FqpwZAxwhfPTs7CK0k6y1ZJsz4a4jG4
         zXc0gAbfmuRrsB2oLJ6SnLjWBXVigZ4dOS9xTkTuchCy/SIcYt4Oag0ZocvkIP7lEfCG
         dyN52zjTjMOIjPV4fYtJjhf80prAYssvSWoDh4c+iWM90jssL0P1GpugYHh+CNl3dud/
         k/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVyaauCp3cifcoj3Ryocm/iO5/yX8LZx8A5Wj9/X+SeAH9QNYA5R3Eoky0cXKxas+ZsgRK4v7X25DwWxZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPXUHnRmMQe7wXCBjViUG2+Pgp9H1NToigFXynVBKKj9ABq5Kx
	MzLtdkBaYBY8hXTe4IwmZSr5JV6Z2X5SsZxUb9wl2T8KEjWFlDZS6hZblu2JP4g=
X-Gm-Gg: ASbGncsh/xvSe+5lF+YZ/EN6rvmsnjRWIWfnRRpHUnakHt596SWjmM5bgNsuzg6NcLS
	yPv7BJKmOb8XrUYmStIQsjW+ZB3FZyMB7/rW+oHtLgt3U+QLij8yAQrfdm1B/5kdFfGn9XJ5Jzc
	1nFfY+d9IkW/RWcR19Hiojebc0MziJd26xinU6ozsfjRThQS2SXvSHxgIGLm/YQA5mR5G9lyczE
	/fMp34emX8rcrNf/B1afOoXwtpC4urJL8R4feLNh6oE6B7ydRhyYdTMu1RuvZbwa1L56oDmUJID
	Y1MdoEUtsAbnz5K6xolM5+DFd1DuVNDW7Pzr/naDfs2qbkZUxxFpOLVK
X-Google-Smtp-Source: AGHT+IH1v4zsC+6gJjm9Lh1Zrbv1yab+lROk/R+Ug0Zk6T0j3Oxd8je3p51EYd2lzc1XmgqtahKJUA==
X-Received: by 2002:a05:600c:154d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-4409a1c5857mr1008615e9.27.1745425507913;
        Wed, 23 Apr 2025 09:25:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092dc2009sm31978365e9.39.2025.04.23.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:25:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 19:25:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 6.14 000/449] 6.14.3-rc1 review
Message-ID: <0969ac26-3716-4979-bcf7-0322445c4c91@stanley.mountain>
References: <20250417175117.964400335@linuxfoundation.org>
 <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>

On Fri, Apr 18, 2025 at 01:23:27PM +0530, Naresh Kamboju wrote:
> On Thu, 17 Apr 2025 at 23:23, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.14.3 release.
> > There are 449 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sat, 19 Apr 2025 17:49:48 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.3-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> Regressions on arm64 dragonboard 410c boot failed with lkftconfig on
> the stable rc
> 6.14.3-rc1. While booting, the following kernel warnings were noticed
> and boot failed.
> 
> First seen on the 6.14.3-rc1
> Good: v6.14.2
> Bad:  v6.14.2-450-g0e7f2bba84c1
> 
> Regressions found on arm64 dragonboard 410c:
> - Boot/clang-20-lkftconfig
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> Boot regression: arm64 dragonboard 410c WARNING regulator core.c regulator_put
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot log arm64 dragonboard 410c
> [    3.924339]  remoteproc:smd-edge: failed to parse smd edge
> [    4.051490] msm_hsusb 78d9000.usb: Failed to create device link
> (0x180) with supplier remoteproc for /soc@0/usb@78d9000/ulpi/phy
> [    4.055155] qcom-clk-smd-rpm
> remoteproc:smd-edge:rpm-requests:clock-controller: Error registering
> SMD clock driver (-1431655766)
> [    4.062274] qcom-clk-smd-rpm
> remoteproc:smd-edge:rpm-requests:clock-controller: probe with driver
> qcom-clk-smd-rpm failed with error -1431655766
                                     ^^^^^^^^^^^
This is 0xaaaaaaaa which is very suspicious.

We recently changed out test configs to use
CONFIG_INIT_STACK_ALL_PATTERN=y (my fault) and the documentation says
that 0xaaaaaaaa is the default uninitialized variable pattern for
Clang 64bit.  So it's possible that this is not a regression but an
older bug which is only detected with that config change.  Could
you try again with CONFIG_INIT_STACK_ALL_ZERO=y instead?

However, I don't see how this can be stack data.

This error code is from qcom_rpm_smd_write() and I'm pretty sure
it's from the ret = rpm->ack_status; assignment and it's supposed
to be zero.

regards,
dan carpenter

