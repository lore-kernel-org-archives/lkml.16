Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73731C7006;
	Thu, 10 Apr 2025 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248074; cv=none; b=lt1YnYBgOZ+aNOBNg0Li42q7Q2YnR6Iw8IzUDGixwbcXvKbmgzzObtS93Db9FG1rOW1h+j8rBa0PximKLMCj8Odd/RoKtR9b+SaQGKsk/P8H29/lDa6pMgdo45hbUwh0cf8b9WUPSJan+TpIqTt43WlPUWalzZAkjNtC9UvuQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248074; c=relaxed/simple;
	bh=vvwNWBQOV68UD1wQ5GAz54lrRLCKIA0ppmjhWwL5XhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eomg0+6/RSuIzoR+vZA/av7h0wWkYeSAOe0rIxKHoYBvZoyV50V6dlXcTDOxHNjJVSZ7Ogu18Bst9xB4PyXYhenLxOrh0d6dYD8tiyDAmPOihUQExUo4WrcvI8MiRxe6+WwOAO/mDlx169SGgQGkOrnI9mwPIUJ4ZK15UAL1bgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgwgjHFY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgwgjHFY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476b89782c3so2727701cf.1;
        Wed, 09 Apr 2025 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744248071; x=1744852871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pS6d3AN8lttz2UBagEPNT7oB3nkS/KEu1Jsz1U5vt+0=;
        b=QgwgjHFYOvso3+V7r0xmH5bucvvhDoQN2LQQhtCvoyEGDCEqvLkr6x4l97pTz1oL1g
         hQmP184sXZNif2Bo/KkJCPDKsPsuzc4MwfBetKqxjNln6q8XrRkaHgSweaIat1StKvRN
         GatGfwJn9KdVOv6tOb4/9nxxSjRDWz8vSRTocGwFQOz94TBHYzz3re4J4QIuQOVESjAd
         RsvX7GtfdrfHGeezsaB3zt0I9Gsc2xe0LyNYCd5Z9GiVxTXNgVqug1kokh12bWtvNUss
         bWoZQzJVBZFgOv52OeBxwUJ/aquEdgAgXxHMvif8AD4HxT5fmqMkXKhYbUb7PfsnW1qw
         E1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248071; x=1744852871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS6d3AN8lttz2UBagEPNT7oB3nkS/KEu1Jsz1U5vt+0=;
        b=awOFepf5anycW23ZHFeQDKb7GTR+shiBnjIQpkmtjOQkNHEHryXVUKS1oAbd6SxQb2
         mIX2hfZ9r7VfPTKm9HRZd2YvOHLZIhMVjD0c4vddZkCpfvilOtMgYX1+jBB7hBOMPBrw
         5Qf3ExOpr1SrbVj5tFHU2/Wu84j95k48zPGsKb9ytPpSbDbA0ILMz3aQGa80Izj6pnzp
         YshNUu7jVY999uDGJzVJmQoIuwRKRcwZlStJJhT5l9Mbqn0w34wuHuY74x7DuzD+pGNr
         Z9T4vtj+z9WhYG5kgdy5OWvdE9uDTGJeNUKS3k8Cy8wu5KFpnN5EXbV8pAY+7/Fuf1b/
         vp9w==
X-Forwarded-Encrypted: i=1; AJvYcCUdWLjctDNRDeldUnnlXyIE11W1jLMFFl8f+Toj7H5prBC4YDjyJt6zgs+UGaif+ZK8Mc4lkfd8RqGL@vger.kernel.org, AJvYcCWx4xOf5X+5RWrcx3uMMmSCHkEtp7NCBKltU9BrkG+l46vAR2YoTKt5gsHh8yBG9p66s0gJ98RIGRtnTK0l@vger.kernel.org, AJvYcCXWub/xkhCw4kRqq+q1ynhnEsTFKgTw45GoVaU6reaHQZGjI57dbvRiDXyc8v6ZJZ9hSevNWzChatef@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrydtlIdO3mdTH3TC7xQVDljVyp6XyWE9EpMAjtZQM/LyDEQm
	3jiHlh33vatNKq+pnFBh7yp+CLUN6zGoEbVfYeMmXZ/ng37WtjP2
X-Gm-Gg: ASbGnct7euJskEOzcylCue+jlUgq2+KNbg2snjFUTF1xez4Ud6HtEAp8PDsnJxMtfmY
	SgkOL8M+lIEt8+u1c1XurVsuG2oa9qEARPKZYAkw8sCHWVZ5r3rSYusFsIgsaDWvDKbTUxU04kZ
	LaKy9y9aslGl2m5W0x7wm/KMYE+BGsPC7IhSZ45EWVytpljjIemNVRLjqpbh3SdorenZdBX5lCJ
	ZfqKQ1c5lf8B5z7I7wGm6umlrzAFhf4t6EJHvHLEIOF6HynQPSg7BbW2+KBFTIyrjUOfN9grrnn
	egqY+4OLu82aXV1oNwldUATzqHs=
X-Google-Smtp-Source: AGHT+IG8syti+yUH9KMAV4gl0fZ6aSPAfqkjK2G+9Pu2agDv4XCz3CIBPgGk+tD7029TOWlX0vLivA==
X-Received: by 2002:ac8:5e4e:0:b0:476:80ce:a614 with SMTP id d75a77b69052e-4796cbb6131mr12911801cf.19.1744248071267;
        Wed, 09 Apr 2025 18:21:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ed9ccd0sm1065881cf.57.2025.04.09.18.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:21:10 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:20:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>

On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > new file mode 100644
> > > > > > index 000000000000..4c4df845b3cb
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > @@ -0,0 +1,18 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > +
> > > > > > +config SPACEMIT_CCU
> > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > clock driver built in to the kernel?
> > > > > 
> > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > without clock built in as it's such critical..
> > > > 
> > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > Sorry for a mistake, this first "only" should be "not".
> 
> This is a general problem.  You can't make a bootable
> SpacemiT kernel unless you define this as built-in (at
> least, that's what Yixun is saying). 

Why not putting the module in the initramfs? I have tested
this in quite a lot of boards (Allwinner, rockchip, sophgo,
starfive and etc.), all of them work well.

> But we'd really rather *only* build it in to the kernel
> for SpacemiT builds. You clearly want to minimize what
> must be built in, but what if this is indeed required?
> What goes in defconfig?
> 

As defconfig is more like for a minimum example system. It
is OK to put a y in the defconfig. But for a custom system,
you do give a choice for the builder to remove your module
in non spacemit system.

Regards,
Inochi
