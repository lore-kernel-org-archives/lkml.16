Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673171DF26B;
	Fri,  4 Jul 2025 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751604349; cv=none; b=bq7aEbiUvOtt7kZzSUGzIE+5k0JI6tdmDYi1UOEbbxUQYFfoB1tlkJLE2vGHTrbF58fAJp3B7u/OyC4uDe6dZFIqqHc3j2tqZv3G8G10e0ghMBjMgbOidSyg+5Z1BPhgkxv4/+MZDc/ZdwQ/SSgTSs7MQzfL7fLKchbHp8o/nP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751604349; c=relaxed/simple;
	bh=CKP5uRYNVSYBRlVHhDqtjsaI9DEjKWDdEjiU0/9YFGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mj26sRuiQLpoHqoO30SlVUUu03rJ06kT221rTAMmuV0nQo0Gk/gT5YxZCO/SbgPS9v0zMUc9j50xnSP8ZwFgfxRMA49Kjy9E4to2yg4YcPU4Dq2pVvLzW0YUK0SBmyUuPz7mOm1vfPJuV06qo1Yr/SrVzojx//fUXzsH61Da6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvcUe5pI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvcUe5pI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2353a2bc210so6078995ad.2;
        Thu, 03 Jul 2025 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751604348; x=1752209148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cG3nGFKHy1r5C+lPIaBzR6QdGIwuCZhkFG9bY42b6Jw=;
        b=FvcUe5pIEOZejOMCEenvkrUWpbOkZ6p5g3D87RJiwUvGy2nPVn9E/vsd/G104gdV9u
         GzPyO3VWcg+6nxhpmVCP7NaypsLf8xOgEVSQUb1UqgxKqrAgribcs6t8XxUkwkdPrwHg
         kLXgWFGQ6rs5EKpA2RR/xtz+wB9p/bZXfsHw1bNlPor1zn1rvnDttUHBk15/HDOkQWIn
         nvrwOevoClbe3FgJEznJNw9dg7TME17brdjHBE4/4c9y4oPzqj5JBok/Y9l3iq0QAWAq
         s6+Fw89e885EEKTmgg3bXhfG4srFdeLQC7cSyhgfQZis93JphvIwImVUUjL7qbLNXVd5
         WgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751604348; x=1752209148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cG3nGFKHy1r5C+lPIaBzR6QdGIwuCZhkFG9bY42b6Jw=;
        b=OOFfy5X7Dqvu73lEJ+1asddJzbRnqYaosP1s8a/uzLlHejWl60vSAFg5GoAKS+dfvU
         A7XWl2J/nt4cvcxiDPm41qHA1v8Q1b74td/j0tEr+im87b5gCJ6tESy+c4gJI/mVrTQu
         dKIN/lgGSjEmsiCrtqLAHYKidVbKdVTRVmx++l/QK0CyVXfAx33FfU8urnaxi/4ePTbh
         4RKW5xByGSSjkjeosP9+pNZF7Zcpv8KmlWJpmHbiSNfZ9QFKPrAsTlJdHObg4DqQKGYY
         gHPW0sa/kBeSL6taUh1wgzO0CgzldhUKTr+vmSFsLyz16U0OELc1nY0RkP34SzC+VzSh
         ZDYw==
X-Forwarded-Encrypted: i=1; AJvYcCWrbcK+j5VglFQ7w+Qt7qV4ZslKvY47Ml/IW4eGMd2Y3kFwATLTxpNym1aqDKr5M3CH3x/3uUE22VjOB8Tt@vger.kernel.org, AJvYcCXfzB9R0vk5Xp2zbB+/MOrab8x1SvA/vHOjGRC5s9gT3Wroz24SoiNKHJtEIA+jeEWWmEPdg8sZmaee@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXbHc/hPwtYBy3f2o7F6bnqKQ4zet05chgS8uitHihiZlE7zh
	PMRFqXsS+yuy0MxDsz76Vj460/o7Zv62JRh3KdHkq8kvIJTdGzjOpV2K
X-Gm-Gg: ASbGncvTbFskoSOTlKiRWZ5n2ZAojzG+ammNLzVX56EMOO0Fb8XYhyySmss7Vnzpr3E
	a2Y58vOqHGuWSpS7sLzcb9r9DptwM4OLWj2XfwPhVZLC3pDeyIeCS7rJf3imtzJknr50wWxcnvj
	XfYfFFd9GP8bOTABCPEf8EwbyWvXAS2GNpDR3Nf2RKAooQ4p0qDCXj0kFPiPb9MWkzS7qoZCy1z
	7M8JGXw69R6XH0bNvZgEqkPkkx4TkvTjDn/UmKrfbTeSw4t5eKu2+2mVHTv4+Khhr9TaAfPDGeB
	yasTvBcO1E6TD+pSk8A7brtlfUrbNyLOkWd0Pn8mHlvsI+BHxsEM6vlpoxhMMc2pzqSGA87zAhZ
	XutKd9enneM2OFyLSNtYAmFytJ//A55NqumYmH24=
X-Google-Smtp-Source: AGHT+IF0o3ITf8BCpP5P9I2hnMwefUgNCwsqn4QO6uhOxBG7wPoKctcKA38mvJ7HISgAzRZvMAgLmA==
X-Received: by 2002:a17:902:c404:b0:234:a139:1203 with SMTP id d9443c01a7336-23c85e7459amr19740725ad.32.1751604347591;
        Thu, 03 Jul 2025 21:45:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455ba98sm9751345ad.135.2025.07.03.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 21:45:47 -0700 (PDT)
Date: Thu, 3 Jul 2025 21:45:44 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 1/5] ARM: dts: aspeed: Expand data0 partition in
 facebook-bmc-flash-layout-128.dtsi
Message-ID: <aGdceHVCEaWxo5QG@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-2-rentao.bupt@gmail.com>
 <78f9fcbc58261064f248e95eb7740549e338bc78.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78f9fcbc58261064f248e95eb7740549e338bc78.camel@codeconstruct.com.au>

On Fri, Jul 04, 2025 at 09:36:29AM +0930, Andrew Jeffery wrote:
> On Tue, 2025-07-01 at 22:04 -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Expand data0 partition to 64MB in facebook-bmc-flash-layout-128.dtsi for
> > larger persistent storage.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  .../boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
> > index 7f3652dea550..efd92232cda2 100644
> > --- a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
> > +++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
> > @@ -32,19 +32,19 @@ image-meta@f0000 {
> >         };
> >  
> >         /*
> > -        * FIT image: 119 MB.
> > +        * FIT image: 63 MB.
> >          */
> >         fit@100000 {
> > -               reg = <0x100000 0x7700000>;
> > +               reg = <0x100000 0x3f00000>;
> >                 label = "fit";
> >         };
> >  
> >         /*
> > -        * "data0" partition (8MB) is used by Facebook BMC platforms as
> > +        * "data0" partition (64MB) is used by Facebook BMC platforms as
> >          * persistent data store.
> >          */
> > -       data0@7800000 {
> > -               reg = <0x7800000 0x800000>;
> > +       data0@4000000 {
> > +               reg = <0x4000000 0x4000000>;
> >                 label = "data0";
> >         };
> >  
> 
> Two existing systems use this dtsi:
> 
>    > git grep facebook-bmc-flash-layout-128.dtsi
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts:#include "facebook-bmc-flash-layout-128.dtsi"
>    arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi:#include "facebook-bmc-flash-layout-128.dtsi"
> 
> This change requires a full reflash of those devices, which is pretty
> disruptive.
> 
> It seems more appropriate to me to create a separate dtsi for the new
> flash layout to use in new systems.
> 
> Andrew

Hi Andrew,

I agree it's better to create a new layout, and I will take care of it
in v2. The migration is already done for all the network BMC platforms
except elbert/darwin, and having separate layouts will make my life
easier :)

Any suggestions about the file name of the new layout?


Thanks,

Tao
