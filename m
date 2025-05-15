Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A032222CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312347; cv=none; b=GyokG+7IaHsLQubZnJ7ySlMmL2LzpOgA9euxAvz7gWk3eSCnEV1/RZ8ET8UaOln884gaa+RtyD1m7ox76RXQhZQeCKVqmwfo522Ih6Z7MILa1b+MP+HUnHxmnF/6NcHt1jyO8J+ev/+atbPQaWuhX0zECkiCydyO4R5dFc1FLUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312347; c=relaxed/simple;
	bh=mXtV/p3tpIeC0QGepjYirCNduEcmDED53SaEZc2lIx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU3mdX6yG5g8UCUpOs+fDrNaymNhqeCzu7CnJ93fifZPtpEFDt9lpAExRXW86n4MnRYQKZetPAyWwMFvr9pm/l2aa+3k8VgisXAL21Ta4ITCW6I9ThejVGP6xePBUZuFK3WrNuuSppsWeApKwwYtqE7KuW1AUf0FUV5mYal0d1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kry93nno; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kry93nno"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a0ac853894so683283f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747312343; x=1747917143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DHCqe2ELkkc+UlPf3xD1LiX/49qcNMEoSzXRssIhGY=;
        b=Kry93nno4cNjegdD1Ah0R1ebJSyCgJWauQI/4MQD0177MAnoQlb2T6LW0L9487q5Sh
         0sYDPrIn/o8w5FB3/GNkuCXdWEGkqnJoRcPEHQ5NXXnclZegmHhYlHs06iG0jN3DV/Ay
         QGc5g7DMYUqub/Q7pTWHjyLYCOpeJ0+7oDtEyA9p9cO1ViiDCr7Q3rdhjT3dzWs21vAK
         95FLgETC+MzslgF+Si47HFu8f5zXeML72y2qhWYk4pLnEiBAvNJ8m/zVhkfDEkoElHI2
         LZ/xWSgaY7n2dVeg6FebRJLyxsOI0L+QnaAbvBnAUesb+ck6jAsP//6oqaOWSXLVe5eI
         AKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747312343; x=1747917143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DHCqe2ELkkc+UlPf3xD1LiX/49qcNMEoSzXRssIhGY=;
        b=c0nsP6YEwdYfv9MP/Oyrul20UWhSSc39rJpEwyncKe4M/no5aP8OB3glORkQHrp0uK
         rx8kQY4dKyYY+MEIZ9nym9Q+pahPW0RvfZDJYUT1Wj7ndlPjIwvXIYyjnzeAZAfc7Qai
         gc0Sj2uNxEdableDY8znzQkHq/C6iGr1yE72Y9eZaG0dtGLtUoMcN1AAGq941wOsbsiv
         WYJUMSrakxZ5YjhIdvoL4qFLt8pup4873ESao4DTLSpNndsLkuKCdgTTWPedLNngN6he
         y/flXZpfE+ubBjmbJIrOxYU65ZvaUPDnjUqFwZWMf/JFT9eMsFgrR0LBTd0VuML9Q9zN
         i9rA==
X-Forwarded-Encrypted: i=1; AJvYcCXGKCOcToCT1g93acHb3dkHdyynJ0mORbv/LlnplPDMs3+vfEzJLwiY+xc4DCWRv1BHFf4rU/4fu4ayhJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgKAJInJpv3X6P/DEUZk/+M7JLzadhF6fLpQAlwmUonTt5dN1e
	0fMxLMNw4SYldLVJL+PY+sT0VIg628YI/P2RoIVRfOunWzQPoKDLOJmJDpWTq40=
X-Gm-Gg: ASbGnct7hhAXueltn899rAI/dGnDzt2/bTwT4PvdAyzFrT+R+PWjKFDHZMtAVpMTv1h
	tw4kcVjbzM4L4MAe14A1u1cT8uoYaj1a//DfulmoAReuIZnxVh3p17SKDSo2Pn3qlqzDHPjHGYW
	ijeFVIMhzklSDfAZgFNIZfHSKIzhA6KZX23RZkSLnI2GbP0HiudTsEa0KlHnxba/y8mFHIhfIJR
	6KfdN6lyx+Pxd5VA1e9DqizFujm2Dxy7qvg4/o833akDE/LLemKHVnGZ5ZBspD0fXdb5y9pviYE
	DEB3OlPBuGEi/vQJP81I3uMy24d7L2BBXfAp+mRPtggZiqTm2x9/h3p+KUBkG2T4Se5J+855JNJ
	ooo/HeIH8vw==
X-Google-Smtp-Source: AGHT+IHsBfMKfF7WyoADO+426AhNanVPeH/8DogvNYGecOtbesvKzwVwHUFljsLKdXD2rqKBnqJh+g==
X-Received: by 2002:a05:6000:250d:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a34994ef3dmr6026464f8f.55.1747312343270;
        Thu, 15 May 2025 05:32:23 -0700 (PDT)
Received: from u94a (1-174-3-124.dynamic-ip.hinet.net. [1.174.3.124])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa297ee11sm195636137.12.2025.05.15.05.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:32:22 -0700 (PDT)
Date: Thu, 15 May 2025 20:32:08 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, 
	hargar@microsoft.com, broonie@kernel.org, kees@kernel.org
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc2 review
Message-ID: <2rlf4aoqeekjwcupepf6zkdkthhfwneeobiqeb3ujyz7ami5zb@eg5litfe4a7n>
References: <20250514125625.496402993@linuxfoundation.org>
 <vrvefaimjqkseuoyuhgg6omt2ypgp5v6xwwuxihj2t5jidizyr@ir5w67k4kl36>
 <2025051529-mulled-cubicle-b1cd@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025051529-mulled-cubicle-b1cd@gregkh>

On Thu, May 15, 2025 at 02:25:50PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 15, 2025 at 08:15:32PM +0800, Shung-Hsi Yu wrote:
> > On Wed, May 14, 2025 at 03:04:16PM +0200, Greg Kroah-Hartman wrote:
> > > This is the start of the stable review cycle for the 6.14.7 release.
> > > There are 197 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > ...
> > > Kees Cook <kees@kernel.org>
> > >     mm: vmalloc: support more granular vrealloc() sizing
> > 
> > The above is causing a slow down in BPF verifier[1]. Assuming BPF
> > selftests are somewhat representing of real world BPF programs, the slow
> > down would be around 2x on average, but for an unrealistic worth-case it
> > could go as high as 40x[2].
> > 
> > 1: https://lore.kernel.org/stable/20250515041659.smhllyarxdwp7cav@desk/
> > 2: https://lore.kernel.org/stable/g4fpslyse2s6hnprgkbp23ykxn67q5wabbkpivuc3rro5bivo4@sj2o3nd5vwwm/
> 
> Is this slowdown also in 6.15-rc right now?

Yes

> If so, let's work on fixing
> it there first.

Okay, will send out a regression report shortly.

Shung-Hsi

> thanks,
> 
> greg k-h
