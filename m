Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDC215785
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688298; cv=none; b=BSDvdKDKrcFllHHD1obj+IaiiUDLHl6SLNQF/2qOaoVyRTXU1LP1Gc9T7nY1u6SzMpYoftSlGNvXPFVnZZLT95UFlAabGASqnBy/vLiRlK31EWs+Y3xQJXR8LW7uTPflmZ3uW8nX3v7bEIwKeAueJECitpoDaz0t8nx1Hlc7AJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688298; c=relaxed/simple;
	bh=i8RsDQsHeAslGjYrHeMWqMCw59W/EPLvwnmHdBmCEzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mM83hocccvxbowFniuqgEEH4zBR5IfeG+ZdprWCkLLiZ/NRZ1FQbIFof+L4l0QWax35FCwFiJ+tv0GL2aVB/CgJOhfjRX8dQsdcIfTQR47qAOQYOf5Ef3GodDn5RBm7i3QwtabBjVSHIfXzNU1mgJQdq35ZCqD4inS6bY7yvnl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EX2Lvt6P; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EX2Lvt6P"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21619108a6bso98983125ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738688296; x=1739293096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwLeQKf0vtUui74lT12wFv843Oi1b36R7jDrobGeWGo=;
        b=EX2Lvt6PH4v1K5/Ca+5fgwHWSJoaaXnrBti1qOMPIDdNol/DeZKC1ej05FGA28Xvuk
         IGpPt7kmseUnpOa1ufrg3sA+e4qvwzteUoAobigp2z8oFJpH1GJuwYCt2UB6vWKzUFxt
         GZdyUhk4Q6tKUbTqYDHwxdbAO10rDYKqgFeicmQ2UehREY66Tg2cyZ9IP2J4mDzF0wvS
         2oQoGDUsZsW5eOlC/AvWhQdQc4kkt/OrU21Gzi8uEeVivJU+mwi4G+7cCl6oNq1vrW+q
         Ne0LlxsxcIZlmqqgVGZftRC29hSIb/o3hdObdRIeXHO41VLCPQTUcP6Fn1/RQlMNIpDd
         9egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688296; x=1739293096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwLeQKf0vtUui74lT12wFv843Oi1b36R7jDrobGeWGo=;
        b=GAsp/dIvkUeJMkkfrhkSSh6dSELXLvm2pd6fekUwjqlLpUBFPVXBjOL/YrakPV3ulL
         cuPIwAe2pHDOUvjDrto9IssaPxI2XlNeX8myeBPJ6T23kdeP6J1rdVIqV4A3hJPNgY+w
         A7fxbheUFPqba9szwnotfGYfttY7lov4N+mQhWbA8NwnrcvP9Tu+2tPDqTfseYJGNsfe
         g9UHBh6dBZbd9ZLFcUAfumJSkTQIRkcSoU2hLWDz73S4kkec2aSX6V8+xgdPjHf1u9lv
         RVDBXmVke1uGzRc4QuLMxtwfbWXG4ctC1y7lb9thjcc5OY/qEv4kJQ+59aNGn8sCcqyI
         VGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA+da35w46Qb8G+JVBiT8/oSmpUhkp+0nBLjWkG0n3iDgxvvcy6GlG1lbDXtHDm30nH0pURSTLe1oe6yM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+3rkt0J2KCZYa8PzIZh5dKgKpiNbCpNh9Axot2sd6Egl5gIw
	KIZVAsnj6cVo+Mgoi8aRIFFN0ylWPsSSV7wz47ZNYHFCNtOw3pCvu64OYAY4d48=
X-Gm-Gg: ASbGncudsBjQt7vlF5XiZMqn3rFUE7WYjFpBrFnQrPV/3zzX28Q/yDyqKN910gmGhd6
	CBNYzhVhvBC/ZRJU9F8dKqSGRWv74GaxJNyLPUJNOGfjdfV0r15ToNu6/zfYfjmgksyjM3LA0yu
	FQQonpITMrMu63f29WPC0uv/muvZXpT7wXCRQWdHw0NihL115MpiXkTNVmZ6XU/Gte4YsxU2pNq
	dUQiLhFiVHL5h6C2qyuHuT8ab4PLtG2USTUOYF6XMhf+uP1OYkbw/y5FDt5Cghefo9ss2A8OKVP
	a3lDl+s2tZIRByiv9/8OM3M=
X-Google-Smtp-Source: AGHT+IH1Yx22xVxfTcYpwaH4xx/e93Sx3gcR5IYL+etceVupvjY9dDNCANrsvumn1lQdWQaHc/HUqg==
X-Received: by 2002:a17:902:d4c3:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-21dd7de213cmr392230845ad.42.1738688296579;
        Tue, 04 Feb 2025 08:58:16 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eb34esm98292765ad.149.2025.02.04.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:58:15 -0800 (PST)
Date: Tue, 4 Feb 2025 22:28:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6JHG-nqFWDv-jpE@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
 <Z6DJ9kmNx4JoqRg-@sunil-laptop>
 <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
 <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>

On Mon, Feb 03, 2025 at 04:41:35PM +0200, Andy Shevchenko wrote:
> > Ah, interesting. The original change that introduces this 3e3119d3088f ("device
> > property: Introduce fwnode_property_get_reference_args") hadn't been reviewed
> > by Mika or me, that's probably why we are not familiar with.
> > 
> > Since interface is already established, I would recommend to fix
> > this as proposed, i.e. with a new API. This is the way to match
> > how OF seems to be doing.
> 
> For the reference see implementation of of_fwnode_get_reference_args()
> 
> 	if (nargs_prop)
> 		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
> 						 nargs_prop, index, &of_args);
> 	else
> 		ret = of_parse_phandle_with_fixed_args(to_of_node(fwnode), prop,
> 						       nargs, index, &of_args);
> 
> 
Thanks!. I can do similar. But the change in
__acpi_node_get_property_reference() will be still required since that
is the place where the actual decoding of AML object is done. That would
be similar to __of_parse_phandle_with_args() as well. Hope that is fine.

Thanks,
Sunil
