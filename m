Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656E1798F;
	Tue, 15 Apr 2025 00:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744678479; cv=none; b=BgwQKjwJCz+a5UMSqNHkl1YRZEFAs763UB3AEkSFus/UPOOZISSEbM46CrgqVKiWU8QdlN+q6Bh63jZry3W/9dG6xvldPdNyFHs7RH+X2SsWjwmn3e7uIpTBWbb9OFTm9IbAHtfo4KDKCpUfOBs/9hsl0Msza8b7f1PsNgkiKHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744678479; c=relaxed/simple;
	bh=oEEe+Vlyh8duApf1eRzAoSMI6LUSSwNRyi7o8cZw1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTFJ8v57eG6Z3jS6R9z7Aoq4QR5j79zbMwEpR4CFF6LyuPeK5cIR7XFLvwjNIW2IfbHkmn0hUf+otwZtUj/txz5RhW+rnGh2d/v5Po5AZXelFIz/RsNEt2uSmAm5Ws08vpZbfVmDwj+/d84RHNPDk4lp7GNH5dH3owRDm98OaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNPI7d46; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNPI7d46"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c559b3eb0bso219951685a.1;
        Mon, 14 Apr 2025 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744678477; x=1745283277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YEdjQ1o+VNN956ebuUdrdZKlZGMV3rwstW2yOoX5VUI=;
        b=bNPI7d46+9xYp5ZXB0SEcSMvjsrhsK1PDi5Uwic6Z9wECBHRSqR3sjiV5kmCpI6iI5
         kj59YgxVAllW1CSS8zmxFa2AUk36wiyDzDa1e9vO6I19Q3rxDwYNNuwN86sD0qvcMXPy
         9rj4Rui3IfmndAM7lZ7tqc6KrtPW9wXySBFCnpUkFr48VrdrtmHN6i+O9C/rPS3jcHcd
         wKR4ne05aLWrFJQ5HFnsyVxGirOSSe2qaVPva2wgljbVoRtHgrFHuGP6mi9mW8IfXgOJ
         TAivccX6jld+EHmlr3hZsRhOLxogzYTbVfynQCyjug3Y8U3+KIoDks7d9XLy8zixMpPq
         uYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744678477; x=1745283277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEdjQ1o+VNN956ebuUdrdZKlZGMV3rwstW2yOoX5VUI=;
        b=eSjY8DlXK95ORwkFO9063YOcxm/u3SCvzwzJE0K567if7aV4daT++584uAz7gRR4Aw
         91zNbitvXj5fj4uKHp9OfCcL/jrEi4xyWtKLmZ+E263bn63onwTWLLERYzOeDYSkBzOA
         lqvsUynAkhjgm3C8yo0Ujn6exineboAY4+usG/tyIx6WHgegetrM//OmDsBrlq+mwOHY
         CwbEfqZ4AZFrRU3RQCY95w0rGZYLyHi97kO4qrerpRHcgr0M21s48McidPwXF4HxDmGu
         9LXMeI60DUcZ6qOgJ4oOmt7vXS4Ltha4x2e/7aKoHFOHBLCZV2MtOtkOwYZdiW3Ypx14
         UO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLTG+GbJq+VKmt8PGxUERIIFiagS4QJwUnoKOrCtAmBuWOWUQADSYhblKg9wYigjN2nULicJntnJQf@vger.kernel.org, AJvYcCX5WK73wyxLyv3QNynC94P3SWnE4AiJQzDmdNPKC0XgDOiQ3dIjB58Qy1X7U17Sv9W/6Vc2MLi9VDdOxgyK@vger.kernel.org, AJvYcCXy92rvp6Cd0ACgV6rCVjo9RcOepQDDrS8IfKNDlT1p+mZVVDTrjqkcPlDdjRyDi7TNnrui7SCcvgzD@vger.kernel.org
X-Gm-Message-State: AOJu0YySMqWDwimt5iVa9cTx1dD6x0c1kJEeKxq8+kiqypqCAYkBCgdc
	HsnQfxU1BKDDeMXJC/jgUQF+Kuw+xhaIZU/zMgirRTcDr/pnr4Xk
X-Gm-Gg: ASbGncvP6nsaCKD5ZMwoO4lbmDh5pUd0SJCIRW66p7CjgC5ZZTx/yghgZU/ybPKwWbr
	HtJ8T0y+yo6yQqfp+lTabI5Ko1mPAygKL4y1hmZew0GLdx3H+n1VGKWn6R1GaJlWQRg/dY3B9fc
	mi+IcMQ2zGN/d5YO0QQkal/HL649fv2cv3hQ5DP7DFxbbvV6/4RG4clBGtA5B7FMNkx+1QMZXQd
	jfkQydjiR3zhr0+0q1Wbn7Xw5Wu+7dSL5Y3fgMNmYV+KpL/pCJIHqWIvGHgFkDwD8zKNE2/uDBP
	yVMky5sF1aEDYvoY
X-Google-Smtp-Source: AGHT+IEcFMzFgzOuAefnSoezpAomkQ7g6BkNkYnHYntZ7e4If6A8R5STXqAMatQY2FwcPEjpF4L2qw==
X-Received: by 2002:a05:620a:4055:b0:7c5:4be5:b0b1 with SMTP id af79cd13be357-7c7af1133b7mr2147815585a.35.1744678476628;
        Mon, 14 Apr 2025 17:54:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9938sm816112785a.69.2025.04.14.17.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 17:54:36 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:53:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock
 controller driver for SpacemiT K1
Message-ID: <f2gpmtaxfbt3ltgrz26uyu2gzffrp6gstov22qvguiz4md33lw@y26mzzc4wnnd>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-8-heylenay@4d2.org>
 <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>

On Mon, Apr 14, 2025 at 01:12:32PM -0500, Alex Elder wrote:
> On 4/12/25 2:44 AM, Haylen Chu wrote:
> > Clock controller unit, or CCU, generates various clocks frequency for
> > peripherals integrated in SpacemiT K1 SoC and is essential for normal
> > operation. Let's enable it as built-in driver in defconfig.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 

> I know Inochi wanted this to be "m", but you can see that
> SOPHGO sets it to "y".  Meanwhile SIFIVE uses a default
> value for its CLK_SIFIVE and CLK_SIFIVE_PRCI config options.
> 
> I'm not going to solve this, so I'll just say this looks good.
> 

The clock and pinctrl are exceptions for me, It is OK for me to set
"y" for these two device in defconfig. The thing I only asked for is 
a tristate entry in the kconfig, so we can go with a module if 
necessary.

Regards,
Inochi
