Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4D2F2E;
	Mon, 10 Feb 2025 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163359; cv=none; b=lHmH/hoHtx/LiDaF63VEyoTAgMrPcdTCLrkBl34NqRVfazqnmbvPWRGU3AbWPG51c/FQJGWDJNul5Ype3LoQmzyZ2xclMQG9ceymJmEU49/OjqBVA+PV1v21zqVLujKW+Rw80LWO7h012VeHJ0HlbrA+dFY4jC75X8H31u3npSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163359; c=relaxed/simple;
	bh=PLJ0DNHjgRCkB2NFzoQGo4oXHLsU8KG69oYXYHNQoOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBPC++bkF+mSjroBELy1OylNV7BRjZK/NDpw48YUuHW/HXw8d3oeA2qFBGMveIiui1AhA4fMy+D3LAR1oZPgeAG3/Jkc//xSLhHS6MPlyJeCDJQpycBaCr8u5wsy5pG1j35NX2zy40Dgw9ZSweP3QJPiFyMYgPWg3SmqGgMlblQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP0Mc1Zq; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP0Mc1Zq"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6df83fd01cbso17922166d6.2;
        Sun, 09 Feb 2025 20:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163357; x=1739768157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDqppX0WdOexQIXVE4p9PqEM+RUAIpyKK3l1fEy0G68=;
        b=IP0Mc1Zq/i+0c/tmUShPbnfZid0PcsMRjFKB3zx0ALFg3XZLIqynx9W+HbA4x47Kjf
         ec0HRhSJK7Xx8V3JILlNi8n3msGEvNX9RJ8zXVedAND8gQHFHyh/xZ//cu1YfKsd8X+D
         a8yoGeCQZW6bW6vsMbCHZDD6ASmoI3MyeYR5c53J/8QXFl3foQHcsO3spueK7fjaP19C
         nrEfbLy3LotwDDnzqXbeGVdoXHS57KzE/LTDLbHKrjWZXjbtBn1yOY1EuaONWuIwuXYi
         tay/hd2x4HPCbFywunHLGs1hu7QfhLARlzepyxJHEu6U8kFod5+vSVRa3PXMHvf9+q/o
         SqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163357; x=1739768157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDqppX0WdOexQIXVE4p9PqEM+RUAIpyKK3l1fEy0G68=;
        b=RqUSlP35vBlLafPe1iJyhV3sCf35sg7SXAwvyvXw8KNg+Sugqy3HSRbLNN4ZPVgFbh
         fGU5lpAjhk9TkQ6CiK/sRUPZNn/IXBPX5S1Jn1K9uEQkVzR8ip8gArBNE1kWkTfqg93I
         lBROrGtET3D9WqVc4MlJvoaTFY7c8wP83oPzFCxgpHTg9IOnQtnzk+szJ5rYqphZ5bBv
         nrvRPJk8xu/dMLWsCGu8Qt2uM1Ez0YJY08jvm8vRp/O1amY7viQgQvql3wMUm2fqKRXB
         eKM8Qf0BPAzeQS8b8na7lPr/tGPSGPsjNKdzasAJVE3G/u0lYU7xExDtAUj5gdjw6kcB
         Na4w==
X-Forwarded-Encrypted: i=1; AJvYcCViwVhkzBPix0pvMo6lk8J9v9xo+n34HPhabfytSI6uefisYDfsNuAXvkmsx4mjAJaLH1RsjwUW0YsoQHUo@vger.kernel.org, AJvYcCX50jicQugve9qO6PRhlNK0SwQ7nIBr2mCYuV1EYqpCLiJFAF4KtkIA7qMokuSf5TbbeR2kbgKsnus5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8jNMbyrhtEXWINPUYx3X9F7sauAWj/f+KFhR5d8ac1d21lMCk
	Fbp2zqgQmI98DW1Ra1aOMb7TSRPfeIL3ST2p8B2yBBblZ3WbiZPV
X-Gm-Gg: ASbGncuMUzcn4aFQC6RS4oKmhGDW2JNZsnNP166KDtsQvu1KWjJ+qQY658KgQJrHqzw
	mYi3b7gyL/xYeq2VDHmV/y/jU7gdEHDC4UdukG4E3yYP44KcKr9VJmESqckYJAMezTM3wzvUowX
	hkCiKRi8l9dUJhOdf0ggPrT2uSXMumLwub/4mYhQNn8lNuOO4SMizqjM6NXyLH+ApQzL3h4L1nY
	bbkRo6BeVC27ese/yarJEkOSqgDLGNtH3BeD+vFYDC1Qc1Ej8W6QNhHEZMBReddMYI=
X-Google-Smtp-Source: AGHT+IEIadHV40GVefNw2rbObinrS4tE0/sQtQW/EKwZZz31+a8oP5ZZG675MIKZoWi0JoEYW0EhQg==
X-Received: by 2002:ad4:5bc4:0:b0:6e4:2d8e:5cce with SMTP id 6a1803df08f44-6e4456dd4edmr206717086d6.36.1739163356985;
        Sun, 09 Feb 2025 20:55:56 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e453819913sm21646086d6.16.2025.02.09.20.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:55:56 -0800 (PST)
Date: Mon, 10 Feb 2025 12:55:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
Message-ID: <bzmczqhop3dok5h3qk4b6hx7kyotshvunoorjmbps67kmjdglo@bbzqrvxuohwl>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
 <20250210012045-GYA12775@gentoo>
 <BMXPR01MB2440FA4006BA4E3EDC0CD11AFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BMXPR01MB2440FA4006BA4E3EDC0CD11AFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Feb 10, 2025 at 10:56:30AM +0800, Chen Wang wrote:
> 
> On 2025/2/10 9:20, Yixun Lan wrote:
> > Hi Chen:
> > 
> > On 08:55 Mon 10 Feb     , Chen Wang wrote:
> > > On 2025/2/9 20:29, Inochi Amaoto wrote:
> > > > Add reset generator node for all CV18XX series SoC.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >    arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> > > Why it's not include/dt-bindings/reset/sophgo,cv18xx-reset.h?
> > > 
> > then first need to answer if it's really a binding, there are some disucssions
> > I personally favor Inochi's way here
> > 
> > https://lore.kernel.org/linux-devicetree/c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org
> > https://lore.kernel.org/linux-devicetree/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> 
> Well, it's fine if you don't want to define it as binding just because the
> ids are not continuous. In fact, for simple-reset, I think there is no big
> problem to define it as bindings.
> 

I add this as a dts header because it is a device abi, not a binding one.

> Actually, in the first link upon, I see Krzysztof also said "simple-reset is
> an exception."
> 
> I recall we ever discussed this when Jisheng submitted the first version of
> reset driver for cv18xx. FYI. See https://lore.kernel.org/linux-riscv/42ad3f60-2755-4d3b-a766-8e4404f76a7c@linaro.org/.
> 

Yeah, I have seen this. But due to the previous reason, I will hold this and
see whether there are any new discussions.

Regards,
Inochi
