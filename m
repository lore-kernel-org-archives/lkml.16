Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA292F2E;
	Mon, 10 Feb 2025 04:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163033; cv=none; b=A8GS5No6VISoSVZna2IC0uj/hDAqGqCtrLuzDvVxYyIlAXwrsgL3udJY7oukK2BHmdta7Kx+e1fl5NYiPh4/g4ZDsXmd7U8rhbYpUInNSIc69bHRTf2eBxZxO6r12u32HCnsXn5LLIBwrHbQ8hPhlHjVPa5jujSDcmx2xXXuuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163033; c=relaxed/simple;
	bh=1fbZSSvv0iQEPMu7zMVcOo0w6g0J/GEmqbcf/HenC9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2XrX0r9dnmCdq89B8Dd6Yp8NCPvQA01W7ohlJ+uPXDHYAjBVMZfU5qvR59qRjTw00zkFxm+u5JyfSGo52sN/k7daxMqGmTmx7yr0J3Rlt29iNYDxDGy8wZ6W/gUhCaksxJ2pyzNx1CP+s41NemQoyRI0OQ6kHzxrmyN8bTWTqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw2oIpYv; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw2oIpYv"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8e8445219so32180666d6.0;
        Sun, 09 Feb 2025 20:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163030; x=1739767830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QkuLbjixmlTDNvcJ8QUfk7khmf2etpBL4zZ81Ms9yQ=;
        b=mw2oIpYvWvRxrmTHAk0U9ANEb2Q67kDVrmn0GyJyT3A4NYY9ZUcM8tHHZBI1e0CPbM
         wwxnwE5SxOD92Pwy89V9fq7JD5hUrJmsgb1dI8BE27XFhpCJRAiPU2dX1NT8VYLuv7eM
         Zd6xJcQ44tZTBoG3ojwgxg2MJLwYD+HfC8yQOG/wnjigT4P5mmedX/bhotuAK+4PXJHT
         u59s0C0GtRJCYu96rIsSWbY/QG713LnWN0A7ydNhJ/zszlgcyF2DO3d2+SEj2I0tnGKT
         CWeFZuWxqqxXM1DCBNoc0Bd6gvGUqm4A2+d++ts323iK6+w64Taa053DnqoUEnENzNcX
         PCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163030; x=1739767830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QkuLbjixmlTDNvcJ8QUfk7khmf2etpBL4zZ81Ms9yQ=;
        b=jZfCS/BlyD+7lGgCtzxJgYlDQwhgYbC9BaTqlHUFpwQJy+V6gLINq8BbmOYH2K0Evh
         1u8BZ52NPZYTKTtEicsUJFyVyjAz4w0sA8X4VILfBMZXqF/RgfpqhzK0rAWxW9+nu9eb
         VYNH46hKsTR4dgWv/HdbpypHHN2lGbzSQphg7vHQgOeaqn0ldSWEB47lFzkd/6pBbpao
         mLXyO41GKfnr7Aa6/lftvGgXb95Lb321G9riAqGs2ELGr3A6VfrnrtHuNZp2PQSJqoPE
         adenEmbbtZkz//Tsibp62U7Oe9g288wYJSHPKHFl0ilcyNDcxry/1fHRukMy0vaGPs69
         D/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOutTCmA5AZXIbvHvpDhos9zhhsd7R+5dqJZpgirRQqfXTH3EfEcn3IN+6V4Esbmm94ztVgu4e0YVo@vger.kernel.org, AJvYcCXIRtz2WHP9rJKKkvZGYrW48+ANitv9jPN2PGag+NkoM/mueHt7kAHAxbHG2b6ULgAa/DZLtygbp8JKg1dB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjqz+snZpzcyuP/k+B68xGUc8KxqAcBBuH0enM5roWIaAjAc4D
	af4hVIEr2g/M0kD77vAT0aOn6Zm2AHs6kVQE+36vrKVIZfVJYSF1
X-Gm-Gg: ASbGncsOS7PJzxN3UOevQscc6+33r4RAKtS2Y5j7jw5oj0jLvgxPI2rZ80VlQM4hrnW
	sgH3QboUp6k4541CmXm4U/fF1hZZZGMyJKlPR3Ie0/IPnBDhj7FUkHL0N3LRirHauiOWeF+VGpc
	jj+RtjRPbyJ8K4AaS/mXXrRHU4BZZ2gv9TIodNNAZ7NqCqeTb16kxfHzHZQf/DG63aWKkmFiRIY
	K1rfitVckgr+bp+bG20U1PxsdSHYEn3Pb8gdm+oacZc5KkMwyjPZHsOTSyzCvWQJvY=
X-Google-Smtp-Source: AGHT+IH1kJnbMj5b5cjXwM6GZ9H8p8AzdRjfokuSH6ZklUmCCOVvU8/5lE7VxXYgt1k/9sNJz2+Ttw==
X-Received: by 2002:a05:6214:76f:b0:6e2:2dd7:1404 with SMTP id 6a1803df08f44-6e4455bafc7mr173916006d6.3.1739163030073;
        Sun, 09 Feb 2025 20:50:30 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e43ba2c115sm43446666d6.20.2025.02.09.20.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:50:29 -0800 (PST)
Date: Mon, 10 Feb 2025 12:50:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/4] reset: simple: add support for Sophgo CV1800B
Message-ID: <w2d5ooepxjxz3dy6hliwmffftevvrvnihqlethhatrlo6svuep@roevwwl3ydgo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-3-inochiama@gmail.com>
 <20250209134652-GYA11750@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209134652-GYA11750@gentoo>

On Sun, Feb 09, 2025 at 01:46:52PM +0000, Yixun Lan wrote:
> Hi
> 
> On 20:29 Sun 09 Feb     , Inochi Amaoto wrote:
> > Reuse reset-simple driver for the Sophgo CV1800B reset generator.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/reset/reset-simple.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> > index 276067839830..79e94ecfe4f5 100644
> > --- a/drivers/reset/reset-simple.c
> > +++ b/drivers/reset/reset-simple.c
> > @@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
> >  	{ .compatible = "snps,dw-high-reset" },
> >  	{ .compatible = "snps,dw-low-reset",
> >  		.data = &reset_simple_active_low },
> > +	{ .compatible = "sophgo,cv1800b-reset",
> > +		.data = &reset_simple_active_low },
> I think this isn't really a problem, but..
> 
> quite a lot SoCs use the "simple active low" IP,
> can we introduce a generic compatible? so can set as fallback..
> intead of growing this compatible data each time for new SoC
> 

I have already considered this idea and design something like
"reset-simple-high" and "reset-simple-low" to cover these
generic scenarios. But adding something like this is too hard
for me to migrate existing devices. So finally I drop this and
added the device id, as I am not sure whether is better.

Regards,
Inochi
