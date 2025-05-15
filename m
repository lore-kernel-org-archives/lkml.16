Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B392298C0E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311343; cv=none; b=NAFJSJ8qBuswiNiUjAqvQEAeAJk5xqJxeU6Szj62G6OpH+VUr0Wu3MQ9184nr3ss2bKe50Rwcr3T4BULshBFfMN9QrR3xbK2R6Dc22fgilAVPGLCf15UWInTOFp+DoniZRLf8POw+N29xLDkzWISL6yqvBSjVOjRUPBFk78QxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311343; c=relaxed/simple;
	bh=xSdV6ElSngf/vG72YPll51aXchF4HcqQwTl808G2t4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBj0wJWRtSTfXqBCSCRuqN9aXIKrjqC0BR2sV5NaI+4r5Rlj1OGLuJ4fYbv7kBxazFeiZitoAmelJy1tGdp0yRqsPUV/zrjfzOY0c3jWbnK95Vw/BnP94Er1w+si3+t7zWFDQYoaCXxc6ekwgBRxmLJpwozMNNT+qDM1zpRBDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ADdBRD9A; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ADdBRD9A"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so534211f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747311339; x=1747916139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uH0GAaSc7W4vyN6o8zkocK26uhT3TpN4oC3foWYOu0s=;
        b=ADdBRD9AcbnKshz/eD2TFVWwb2POcIt5HT6uUGFZ9U36qmMch2tq7Mi4DPWARrAum6
         u94eglNkOoebzboAOTkGycG/1StEHSGusu8BGitMs5GKxNpEE9SaXju7xuzJh/jXZMcH
         QRqVtz8AV28MKXQbeuxm5cacaM5njc2ZYU6A/DKWh70aojo4rV9ueHMyvalQoIgB7Hau
         mJyJErP2M3uEpN3aauoW5Pe1Qdba9ILjkOi5tqHEujrjSlzo6JTy/ltWfOX3G6QGe1D+
         pHYw+eo5cs6ymkHlhVcB8cso5+rRhsmFa8Rse3vGuLoJhs+41FxSFEryc1fhqDm1edkK
         bNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311339; x=1747916139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH0GAaSc7W4vyN6o8zkocK26uhT3TpN4oC3foWYOu0s=;
        b=IUHOgC2QhBSwxFRbA2yz/CXYsLv+38cIpXxlo9jt9WeoW5MPF8IOkk1R9vW/rW2GqU
         IOMMgEK724u66/7SFoqCB9hINelC7ZM4gmxlZdiaSLTtQA4J+IFyQbdv6F+cIkH/sDno
         /5nUjxlVA1QkkH1W8ghfvAMqS3VRjyr/bUmP6RoJwqjUMjvkbQPLjhlUP9FRbsUzFsg7
         BJa9k612mFpHLefAFEVJCgLRHoqFVZxLJHrhUvieDC2Yvy7DD5aYXMe6UDGWkp6qw43u
         t1E4t9FC33VWAjOm0VdSn/LVtb8MR7hBJl7GYZ8XEHe/s8WtOoOIAEo+Tzz7IjeucVQi
         QaEw==
X-Forwarded-Encrypted: i=1; AJvYcCWMvBpir4cnvdz+QnnnLl+MZrZcRt4fNgENTKeATak02y/A41SUHBU8uC6s0+ZGFp2K/SzFMuOzQcDuGwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5M9MjxBke7rD61D8gBYw59Rvm2WCydQAMkTXm3lpbqmk2ABT
	b19GCI5L0TK8+G/yqK2aRR4zEM6lHNA3tiYPaR0GX7i9NgjzPbgSFnH6LYA4gaQ=
X-Gm-Gg: ASbGnctcL7oT0deFfphIeC74fjdWMuBnV/3Owa/cO/+3CpqxZ3yMp/6vK8RmzspeMWA
	RgmpAU3+WX1GDuEJjvD6pAtSV01k+K0p7EYKxzEhH/cpvF7wppetttCM9qEl0U3AmUIAF1huMBP
	i2R4H7hvnXZm3Rswwignstp4oA13Ia4VZGLTWN63RF0QezTfWPG+pf7zVXFKGp9Lr9EqK8GraB0
	RMkAtdka46jRVF0U0D+ii1c1ZsBdJbGmQpDRihR7D8POmzsl944x8dj6QP/g74cz+UzMO22ukKR
	TmUPdaL+pAW9nDmFqK2dH8qq4g8ewl1SAmPB7BsLLBagnQuOpFwEbKb9PoU0vJo/NuMnZSNUYbC
	e+NoWaf1FacR0Jd+erDeP1V2D3RcgEjgXjOOkAUPt5Uqu
X-Google-Smtp-Source: AGHT+IGvHF0ghUmj2Kk8tVmCLsRiUBezE1BL4S2vxUPaMXUrfbDHNuKJGNldtJMeEAHQa/avJuPj0w==
X-Received: by 2002:a05:6000:1789:b0:3a3:4a30:9286 with SMTP id ffacd0b85a97d-3a3537a8fdamr2085268f8f.42.1747311339495;
        Thu, 15 May 2025 05:15:39 -0700 (PDT)
Received: from u94a (2001-b011-fa04-b2d3-b2dc-efff-fee8-7e7a.dynamic-ip6.hinet.net. [2001:b011:fa04:b2d3:b2dc:efff:fee8:7e7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237761f23sm11153625b3a.77.2025.05.15.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:15:39 -0700 (PDT)
Date: Thu, 15 May 2025 20:15:32 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, 
	hargar@microsoft.com, broonie@kernel.org, kees@kernel.org
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc2 review
Message-ID: <vrvefaimjqkseuoyuhgg6omt2ypgp5v6xwwuxihj2t5jidizyr@ir5w67k4kl36>
References: <20250514125625.496402993@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514125625.496402993@linuxfoundation.org>

On Wed, May 14, 2025 at 03:04:16PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.7 release.
> There are 197 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
...
> Kees Cook <kees@kernel.org>
>     mm: vmalloc: support more granular vrealloc() sizing

The above is causing a slow down in BPF verifier[1]. Assuming BPF
selftests are somewhat representing of real world BPF programs, the slow
down would be around 2x on average, but for an unrealistic worth-case it
could go as high as 40x[2].

1: https://lore.kernel.org/stable/20250515041659.smhllyarxdwp7cav@desk/
2: https://lore.kernel.org/stable/g4fpslyse2s6hnprgkbp23ykxn67q5wabbkpivuc3rro5bivo4@sj2o3nd5vwwm/
