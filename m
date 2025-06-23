Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540FA4C6E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686461; cv=none; b=rIGJHCFCKEbzxZGQMCl2E3xT9DzWOZwDjMhS+9QZphZwlZ2xD5jCAFDoWEiPHg0pwvCfujPj4oSDYYGd9DkNTzG6pBwpA1jWBzaWMcbnPBi9ZWoHpV+IdwsUV9Dl0Zr059rwJpiMMgGgk8OTDar6lkSVQnUrrLIUz9XbqM2f8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686461; c=relaxed/simple;
	bh=6QG/D21DWcjOQYxGonDbjOelPtM/bctlfJV7R++B3kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5IsOoxIOQSU1JdjDFRfhQTTTlZdj4G0myY19ZmqvlYIKJr677A5a4H1uFvcxFG+NSPqeuI7CL6/lo6foFBGBIqdcDCYJ0kOYqkDBfRM04HzTo6tVkCV0+FuTev2qp/txz+Gzba6eYNAjEcNl7UkzSxEuvq5WCuZmgdLUukvX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4ByTU1C; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4ByTU1C"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4863897b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750686458; x=1751291258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iSiWNP79jsWKYVVGp93m4pQNGc4ktsWJLbJauVsTcw=;
        b=S4ByTU1CuSqVConQsRWpCfCDH2eIH26r3j7vtfX/V49H3A979cuFg6r0QzPqWvd3da
         1wBkc2s8dsZM2FzbGhs1eybvXLTClbffucmrxJ9HepkO/lHLBR7VyUWLgMyTtx4NmkMd
         BDKeRdvryOQsDofnKEGp0kLiLT9SSjipIq/LcM3lTXBQYrs5T46W4fks87d5LULBuEx5
         Hl0AEOvtRko3yRY5fysaLR1ak55gYkSmqC/b2SnrSDxadroQ1d5CgRE3ZwQZ++geRrJg
         lqycbtOZsFCjyrksNSfDVHL13JkuzeIutjPyKnBXw3bdX1xzXNVEXtx92eZDA8YAnTox
         Vc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686458; x=1751291258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iSiWNP79jsWKYVVGp93m4pQNGc4ktsWJLbJauVsTcw=;
        b=SqXVfPhdr6kcHtUfCND3j3SNLlYiQV8OQhwP13hDEgVZppXdMAntV3np2IJuaYEwf3
         3Mu8bsoyQro/9z6X/UZkRntRhGimAjBBXUeFNyUEt9fAL2D2+mvqL6MiMavpT73Fs298
         1dIQzxdSUqiGH3Mfm6MTaVjhsceXNc+GdoR+Qfks+0k8VQhmnp/zuLLtxSatXTaV3Oco
         7Xp6o6Quf4gLsE3cMQQIbPLifPN5T5zejUaQMnjXclnatVUthuqCQlIDl5BTGNAHFX5M
         RaTNBXTgcPK2vdMPiG5yU+HgJtvF2j2tcdbl1dIMg+6lBp9w3RqadkrZC6NjhMtLLPGy
         lK5w==
X-Forwarded-Encrypted: i=1; AJvYcCVbSIpjsYQmJHcpTEbeWEj6psPMl8JaOemScN1+sRfSNA6VkUoSA4EClHxFPhccRE1ZYDBJ4it75betiLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP5o8sSZLRYGhLp9rkh+mZljcuOM7PoZ4QV1OalWVivnbV+qAv
	4rMMuakndknYoN9MHxTzSAlJ7/WImxzfjDN6kXphRLxcoq3VYipM0Th1
X-Gm-Gg: ASbGncswFmo+NJpWkO5vgCSp5v0fOuBOYmvAUGPvX1Jv4yEexHoRWUoe+kUE785sgRA
	4vjXvK30gwqIS0jYTvNcn/X8cH2Ut2ES8z0OxYN2Z/FhthRNG733AtfxZk+8+C3ZGkteTZkNZK7
	BwW7JE5M/3vUeTIa3HnqNO2n4b9AdlkhcRAY3r0xsHhJEuDunp57v2R1hMhDmeEaHNtXl7gP9ac
	k/Gq+EdevcyOBwkyuFAiSO/jJoCwGJ2hiYZz5v3bDKpgY0t9Fr4R0ZeemXX8hQ10155SbBTg/Rj
	ZSqPT6fAICxtS7fEHNWWjR1dclyKIvEcR60ODCUpQhptXGH/lGjXS5laXF2vlFqA30wxESH/8dj
	gSj4ZLuqYhg==
X-Google-Smtp-Source: AGHT+IECE9l0LpBkCdbtwFtNvVnAOM8o483A7naXUWgnO1e9M+SllSGTBloT7Va4onF4Z861blytjQ==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id adf61e73a8af0-22026e3fc69mr18608961637.9.1750686458537;
        Mon, 23 Jun 2025 06:47:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b772sm8422933b3a.32.2025.06.23.06.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:47:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 23 Jun 2025 06:47:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Linux 6.16-rc1
Message-ID: <f5a9f126-6412-4c95-9070-1af1265311db@roeck-us.net>
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
 <241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
 <CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
 <mafs08qlluuvj.fsf@kernel.org>
 <CAHk-=wjYB7tvFoqsL3aED9YZ2eusi9dMc=ckPzF-dnrRsERBUA@mail.gmail.com>
 <2e7b74ad-b308-46af-9edb-59c0ce416d89@roeck-us.net>
 <mafs0wm92u2pk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0wm92u2pk.fsf@kernel.org>

On Mon, Jun 23, 2025 at 01:17:27PM +0200, Pratyush Yadav wrote:
> On Sun, Jun 22 2025, Guenter Roeck wrote:
> 
> > On Sat, Jun 21, 2025 at 08:59:46AM -0700, Linus Torvalds wrote:
> >> On Sat, 21 Jun 2025 at 05:44, Pratyush Yadav <pratyush@kernel.org> wrote:
> >> >
> >> > I don't have much idea of how people use qemu for testing, but since you
> >> > say this is important for testing workloads, I can take a deeper dive
> >> > next week and have an answer by -rc4.
> >> 
> >> Thanks. I'm not sure *how* important this is, but if it affects
> >> Guenter's test coverage, I assume it affects others too.
> >> 
> >> But it's not entirely clear how much it *does* affect Guenter. He says
> >> five failed tests, but those are all accounted for by the master
> >> device thing.
> >> 
> >> Guenter, maybe you can clarify?
> >> 
> >
> > Sorry for the delay; I was travelling.
> >
> > I modified qemu to make the flash type configurable, so it is not a problem
> > for me. However, anyone using upstream qemu will see the problem. My qemu patch
> > adding the option to configure the flash type was rejected, so those affected
> > will have to wait for a proper qemu fix.
> >
> > I would suggest to not make any changes in the kernel: The qemu problems should be
> > fixed in qemu. I only brought this up to raise awareness that there is a qemu related
> > problem, not to ask for a change in the Linux kernel.
> 
> In case you missed it, see my reply in [0]. For me the flash works fine
> with qemu v10.0.0. Which version do you have?
> 
10.0.2. I didn't try with other versions.

> Anyway, I agree with you. Without further evidence, I think the kernel
> side is fine and no fixes should be needed.
> 
Correct.

Thanks,
Guenter

> [0] https://lore.kernel.org/linux-mtd/mafs01prbvbjm.fsf@kernel.org/
> 
> -- 
> Regards,
> Pratyush Yadav
