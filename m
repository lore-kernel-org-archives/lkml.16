Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EBB36124
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750581081; cv=none; b=GTpVgvmGeprHX+DsXFCE2j/LXIHbOeSHPajOcmgox2DEI+ukRodwoRlhqpZB0vur2LVo+O/a5dzhWg1GhRbM2W39w/gcfVjl6tJmIyvPaiHeiAMac6yFKvJm7IwOR//9ByK2iGoqVQeU7Q4xXLcSbbLDdU7IIv4v2DpiCdP4n30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750581081; c=relaxed/simple;
	bh=EU8TGzBywjtlF5+Y85zUPRkRo3SFXeaZMlSCvkIqnm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCy1XsIIBkwHvGLx3huOPKG9XquYGEUdaybMLNoEjaQN1250Yo6xUS6CCi3Kt78jnPqwEXN4A6TSA5jYFrF1JHhKv/a4qTBCwCehR/AzIyQk5DSh/JAdRlUOZxN5CFogZIQDrE3+GYrDl+8Slm2MLei/CWRnM+F/JSvyRY1q2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXeckWk8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXeckWk8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb79177so15943805e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750581077; x=1751185877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPldOG1Bzc8WL3Z0YGlfMcNARm20zqpGMY+YUO0H/Kc=;
        b=UXeckWk8HjTY4lncsfDZjG5ylaYbnJzM4Gg2XEOxn6xT2XCfeskWxzCVBfpPAvL3j5
         gorb1fWe0IcDMF2OPW0tQ+JKORkkE9DKgegvj8NeXPrSAF81YeHbvfReCEo+DiYUKlCc
         XiLnvIat+9oVugtCSF1agSpuRjQEBj3lZ+fxde0byjXB/yxrJ7d9A23Nae8NAo7AL8Ng
         sx018ne2NnXQh/P7UZhJMLVBUT1Zb/slksnMwI5ULXJa+fHtWoHrcjdV32dNTim7H8Bc
         vtERCANRp+VxyJUiFQibucp6wqyhldOH3i5w3E+PzFMZGN0s4R1uy6NzZtwuS2cX8af5
         D9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750581077; x=1751185877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPldOG1Bzc8WL3Z0YGlfMcNARm20zqpGMY+YUO0H/Kc=;
        b=q2uhV/JrMdiKj91b5zXtPPsrai9eHsopwWKIlsciwbkXTz4macc+/GCDdhoFx7aw47
         tbFmfhIrAps7ux+5SaGbvcYrb9FhQRQalFRNGljzu2M1xx0a09UoMud1pTy12wYDkO3T
         4B8XxQGe68rWV95uvPkLFv0x73OMA1i0Y5vLUkNzEmlSBE+Oenu+HF+eDgjikJaPQvQ9
         Qb4DRE+ddtJzngCk+JiT02wve4ChgvWdieSwOtE7kXWsaMBWsZLak/6qy9VcTRhwYbb7
         xYsLuAValJFEX77QJDbbpmHywP+4jhXuqFh+EJk35z3ap+s/kTlWqtjXbKvv6BC9PLtC
         P0PA==
X-Forwarded-Encrypted: i=1; AJvYcCX0TTvP1wwl8xcolk0sMMVH7sGpZ42PRDgUuyxUfMnERHKhK67SowLlyLof44OdzWLSLrMhuHkCvjfEp1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbD1MoBqPiTDx/aw0sAvFD0oPIZc8wa0WTGBJa4WTzaYYbFCC
	lY0AtyQWExV6HSsZJ1fG997/x5v93tmRRFFv2GdifZZpZi4ZJnMgOxT2
X-Gm-Gg: ASbGncs18Fd+pb6QOhRzDPSAA4RlbTWnpPNLUKae6GgxnbnQB2M4h9FNlcPNQTU3K1U
	iq2FI3Xn5CmxXq4KI6G6DPdZmqh8IUxtpznhf/b2hQx8cJ31/nfeDP2mpzAvQ341vQkOKP9YL8p
	t7uEpo546/eNFaKJ1XMwt1igkJto0/jRke+vgsL3WgQad4pSHZWCsjNMTGEGx5bFtbyHkkuvEta
	liiKPpZvuQfqvaaElLYcz76goVs63sf5aDXkv6XC6hfDrlH6jINvINiXbFFzhri4hkhzodXTNtI
	/6SvuqJMu6J+v/kB3VgJ5zFylgi2Mfi3iuZ+lIopdnRBAFtS57DH0njNua+SIo717KbzcPKUKlC
	zDG01tbP0Snc=
X-Google-Smtp-Source: AGHT+IHQs5acA6zjKZ8lH0avLduGPS64M3j/5dlm9zJID3GUEhZp54uYM9dXMxOIUg1lXOc1KSWdTQ==
X-Received: by 2002:a5d:5e88:0:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a6d12d909bmr7896433f8f.34.1750581076851;
        Sun, 22 Jun 2025 01:31:16 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12d0:5a01:b4d7:fc8d:4cb4:dd35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187e5fsm6471224f8f.70.2025.06.22.01.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 01:31:16 -0700 (PDT)
Date: Sun, 22 Jun 2025 10:31:14 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <ngtav2drgruaqyuwhhwdlsaex3c7fz5hbex47nzflabcwst2ln@6bmr73eqfzri>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
 <aFXPXTUSvgj-a2zC@shikoro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFXPXTUSvgj-a2zC@shikoro>

On Fri, Jun 20, 2025 at 11:15:09PM +0200, Wolfram Sang wrote:
> On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> > The i3c abstraction excepts u8 buffers, but some controllers have a bus
> > width of 32-bits and don't support flagging valid bytes, so it is
> > required to read/write long words and to use memcpy on the remainder of
> > the number of bytes by 32-bits to not write/read outside the buffer
> > bounds.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> 
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> > + * i3c_master_writesl- Write bytes to long memory region from byte array
> 
Hi Wolfram,
> Frank proposed the name 'i3c_writel_fifo' which I like a tad better.
> Opinions?
>
I don't oppose the change and I'll rename, as well moving the method to
internals.h

  i3c_master_writesl -> i3c_writel_fifo
  i3c_master_readsl -> i3c_readl_fifo

Best Regards,
Jorge
