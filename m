Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501111713
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750815939; cv=none; b=K/gau3igAh7eAFmy4w6ojHJ9al22sXp3GLEwKKewHcPPwWdkhced1VrDobJyK8mYqIjE00JoCT+DaNfEcQoEhqVp/3wWfOVqKuxsNu0cU1KbvkvNJXjPZZVovADJT+IQDJdKYwDOFLb2SoLLGPnlNLGXczZfX1JvT/DzTLIB3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750815939; c=relaxed/simple;
	bh=2zBoULgm03Dwl2J+U7HJ4pssYFLjwhSqOKEIgLREwF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cinBn38ChvpSsU5iQ2odh+6mEsVCNfauUqz7FibTpmzUXNyRDdPKK+y1fI0yLs++BOtBvJA/a3nG0WvoIPeCG5NSN4hlEwkeo7k9w1Um2b5U67xpP8WGBM83djuTXpCH/dnHL8n5haLVpENytCQbtJqZ1M4xE3O+s7ccNzxkE8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6h6W/T6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6h6W/T6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso4932370a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750815937; x=1751420737; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n32Ce14vCqr9g7FIDP6NZp2SFABeqo2yehV//w/3vO8=;
        b=P6h6W/T69DXyWlzD+7eCOysWcfED/TU3007xxBtLjeTcC/bW99eQzhpNXuGkUu3yq7
         o5kV3PmxP07lZGZJMoBTyNsMwdMovDcq7GKq7EpehZDb6dskhBXKq+zB62MK5n76dPtb
         5x1SAz4xbGKD1owKgHgCOG7fdTnCF2OfTjscLly4t8OR1XI1+1zKAnQ1zAjeFZFsUibw
         CDgxzfH7y0hzwwVeLbxf7H0cqAEc9On/PZRqNy+cQQJCwBZ2FfRo7kDyKcJYpGnVMuF6
         le8gkbyEdpzFNz3NSs3h+GFmahEkv4Kvw5yNIpfvANAoLo1lgxPayhBaJ+G2Co4/pLqy
         ak6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750815937; x=1751420737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n32Ce14vCqr9g7FIDP6NZp2SFABeqo2yehV//w/3vO8=;
        b=o9Ax7flwmPIY3j7CkMYJSHwAnM6+7IVRwNVrClBCKfptv0M6VYmY+PIEchp36tPBdL
         jj9bGfs+7LpBw2rM1lMEXljiuP3AV5W+vSXLNz7nFZ/5azNvM9gUUsHAlNRMFzKgsP36
         3pJnxYsDvO+hhl8tUfckbnSTfuGE9J99mUC768Pqd8vwZNsF9fMLogB19xmgyHR+cRwC
         WmkkzgUQO9KRfEbe+6oDqHl7uScsj1mp2e3NmZkhrWOc+fae1zb8pgBB0h1MsT/29Kxv
         KJ5D0ikGmGeGvZxYc+98knf2XHJjoYBHa77cQf4ij0QVbgjcsgYGNd+giBiNnDr28mkf
         TaRw==
X-Forwarded-Encrypted: i=1; AJvYcCV6upuk8kMJCwx8WkzyPJkV0XuviKfp/t8utZtPn/3ofzyE9LzGgGVTTqrert2JBH5peMg2vJ9r9mIeu3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxcnpA5d/OM+L+k6l7Kb0njuZ8btGBHOOdbQS/vlmjtlGBYDP
	MOoY2q+r06sNpzqFL5eSqUmfQk9mg7/U/sXbjqD4yjJP3TXXTQOUya7juSg3PCRBmLqNBYafh4W
	wYLmNz+yeGBeugGA3gqvBdiHw0yJ7EcHEN5Hx/3KtTQ==
X-Gm-Gg: ASbGncsGp92/UIoekfg32TqPAIQUfMYUnbhXQWl0XAdByqcV9RLRahzjM4iQL4FTEDD
	0UmMGJ7+eaZVXBPmIniJLmMVHiiRPaB7lMNSsX9BgbUdduRbHgDPWU4zQR2kd+bB8i+In0/g6Pm
	SxCxFARePxugPvgX8VPJsyYScXU4lg+u5lfU/xe+2YYHEvuEI4Nh90FG3bgiv1SplLqo3A7oNDn
	RX4
X-Google-Smtp-Source: AGHT+IEZZrjLJfPFgFgffQ9aiYWL3xtkwNj6XtyL+U8CZwF0zuyVUsKj+smjdUpouvDzUZibEu7iucvZo4MMreOA8eU=
X-Received: by 2002:a17:90b:4a0e:b0:313:287c:74bd with SMTP id
 98e67ed59e1d1-315f26b8a00mr1754310a91.33.1750815936613; Tue, 24 Jun 2025
 18:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623130632.993849527@linuxfoundation.org> <CA+G9fYuU5uSG1MKdYPoaC6O=-w5z6BtLtwd=+QBzrtZ1uQ8VXg@mail.gmail.com>
 <2025062439-tamer-diner-68e9@gregkh>
In-Reply-To: <2025062439-tamer-diner-68e9@gregkh>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 25 Jun 2025 07:15:24 +0530
X-Gm-Features: Ac12FXwfYJX4c32g79VHYXDiATL5pbXpMHEnfwCL6cyaQQoQ60FwmMr-U4O_s64
Message-ID: <CA+G9fYvUG9=yGCp1W9-9+dhA6xLRo7mrL=7x9kBNJmzg7TCn7w@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/411] 5.15.186-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 15:48, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 24, 2025 at 02:12:05AM +0530, Naresh Kamboju wrote:
> > On Mon, 23 Jun 2025 at 18:39, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > This is the start of the stable review cycle for the 5.15.186 release.
> > > There are 411 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > >
> > > Responses should be made by Wed, 25 Jun 2025 13:05:51 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.186-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Regressions on arm64 allyesconfig builds with gcc-12 and clang failed on
> > the Linux stable-rc 5.15.186-rc1.
> >
> > Regressions found on arm64
> > * arm64, build
> >   - gcc-12-allyesconfig
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Build regression: stable-rc 5.15.186-rc1 arm64
> > drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization
> > of field in 'struct' declared with 'designated_init' attribute
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Build errors
> > drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization
> > of field in 'struct' declared with 'designated_init' attribute
> > [-Werror=designated-init]
> >   702 |         {
> >       |         ^
> > drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for
> > 'qedf_cb_ops')
> > cc1: all warnings being treated as errors
>
> I saw this locally, at times, it's random, not always showing up.  Turn
> off the gcc randconfig build option and it goes away, which explains the
> randomness I guess.
>
> If you can bisect this to a real change that causes it, please let me
> know, I couldn't figure it out and so just gave up as I doubt anyone is
> really using that gcc plugin for that kernel version.

You are right !
The reported arm64 allyesconfig build failures are due to,

  randstruct: gcc-plugin: Remove bogus void member
  [ Upstream commit e136a4062174a9a8d1c1447ca040ea81accfa6a8 ]

- Naresh

>
> thanks,
>
> greg k-h
