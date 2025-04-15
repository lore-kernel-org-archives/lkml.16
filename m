Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9165A927;
	Tue, 15 Apr 2025 01:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744678871; cv=none; b=Lv/EciC7mUfyCPJbQFiT+tm5DFCKzxRwISmPlB1AYgpVhEYXVVOiKGa6H60KbpSEtkaBuolO+lxM28YcFVEnyfjjWI0h1NCWm8dliHHv9SfFzhJsqBgmHhWEOh+xiIwN6KQe07n823I6LA+EMj9lXqlEnYQeAZRCrOoNLMzJxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744678871; c=relaxed/simple;
	bh=v4w5DfE/sYNT5ehoSrvg4/ugdIQziaDkEkahrOSBX+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjzYw70uiuPN5H0v/1AWG5UKxAHDVomSLUn4CFtFYzOnzOtaoRES65KwBS+xzUOHiu/DZ63BnrHkacljkzqFL8t9mDApsQI6/ah10c1jWHvIJUhJt0b2JtARkbkCI2Nnlg2xyGp0xY6ry3DboI7w2OAL61272ibtq0A206lgBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsiQEVla; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsiQEVla"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1829632241.3;
        Mon, 14 Apr 2025 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744678867; x=1745283667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uy7YAJZKOai1D7ABZjjN+bQn5zDwS2Ij5HcVijKw7Bs=;
        b=NsiQEVlarlggrztHhxjByXNwNK2nHTq/k1cvNk5bWSinxehFyY38lgw5iwJEV3JoJm
         pEnSiSV/TtgH8ZfYeNuSSACmRiG+GJr/yugCdr/nLDc4tBsS65FLYfgwKKsjoeavTmYa
         GaI0sDJ9yZMVrt6m6lqEG0TTT8W5kHmUPTAgrFD013hwfLBcbLs1PuEjWM7oXPAlACHu
         7qKhOug4QO1bK6Dh8gHlM5Q688Rs73z7wdsC6RLaobOoTKFrM99E5cMDk497843l6+l+
         8GapjYJXFXX4pCQKsDTSuqPAF3f/cW3QrJpO6PCMfI+++O4kIPqfOIUVwFuy0dvKtDTA
         Sghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744678867; x=1745283667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uy7YAJZKOai1D7ABZjjN+bQn5zDwS2Ij5HcVijKw7Bs=;
        b=QQ7yaYNBxfS6FpnN/WvMJaqloFyEFEX8ti6GffOQKg6JlPXc6mThbfCvbFhGlzfv99
         H/6Fzize50VqkMKj+3ICYxe6wr5NavtYyg2AQQAbvuACEaLuGOk/gwA5F59k6ubkUs5t
         fFdwe2joTWIZg8dOPq4lqmDUv9PjhiVJlMBa0GTme0tk4tMoXPHC/YdGSfqCDF7VTZ9k
         w9CiimlK51651WZJ3zD5ZB4pfwIskIH1G+T3orajzStjemI6bUqKs972GC4hYuFW4xXC
         yKB4XizLE+2E9gVVL6r5/XZClCALjfxFWSdrlvEsz6dMdvqheyoThSACAh0xST4nAefb
         yc1A==
X-Forwarded-Encrypted: i=1; AJvYcCUOHHsEU8AgNwV3NcnrdQ/6uNoS7rdr5o0/uAIMJHLguNSoKo8E+WYnwLlWPE0c0S+/Q5wkCodNaqfb@vger.kernel.org, AJvYcCX0J0NAjNEboUl/pIhYIFNotK0aY7vcAlkgKrDrhZtpxgt3SyQXGIzfHOCmjExT7eyGTSd85pp9Hz9G1GEM@vger.kernel.org, AJvYcCXTaMZtcxuronaHt719o3xufSPJ8dnX9sv4zKWQPHGDSnIVnUHVDy4fR9pnsH0j5oIMBbTxbjnxJzie@vger.kernel.org
X-Gm-Message-State: AOJu0YylD7DWC7QfK0iZoBp+HvUigm9Vqj1NG7MXSVa+u2yYafoJwzY6
	QrZYSBFtzfQH1S5T4xt7FWMG1kmfq4LH8asocaltkuI3KsIGwlNW
X-Gm-Gg: ASbGncuklF7ZDVjJPbyyvblZDCfENwcQEunyC0YjMDA5VO+ZvoDSg6gHo35VI5hcV4M
	6sImfG57E7sdJFMngsbRyCsbT5CeyUhy4WEAIkrMesEvpfflKpU4lBlflsB2XIHax7pfZ0+0s0c
	RKueAYWfCd52+NORxCP/4S2g3kOVGxnsQr9Lzemvwq37kpVq6etjUXDEg6OA8Cl4M+jCDmUXhzz
	PJqNemPLWec7W5A5hd8nxxHo1lwTM779+VYE8WLKcWqYk/mfAKusIePvx/HnwSdZ5ovxXJ8gwsV
	bLuhyGHUsyvBgen/
X-Google-Smtp-Source: AGHT+IEg5WHo6qDq3mTM3+gnVU2hOs9hdPqiMDeyWKuT5X6RpeIxFCETbXntue45FyG12HX43MWGmQ==
X-Received: by 2002:a05:6102:5489:b0:4c1:924e:1a2a with SMTP id ada2fe7eead31-4c9e504c3aemr10457091137.25.1744678866709;
        Mon, 14 Apr 2025 18:01:06 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de970badsm92754026d6.26.2025.04.14.18.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:01:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:00:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <smgd2dymwnxkuvi4nevukt2fxcz3b5vuqt6wnuc2cf2bqaxisf@vtj7qnd5ws4t>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>

On Sat, Apr 12, 2025 at 07:44:21AM +0000, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy
> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  drivers/clk/Kconfig               |    1 +
>  drivers/clk/Makefile              |    1 +
>  drivers/clk/spacemit/Kconfig      |   18 +
>  drivers/clk/spacemit/Makefile     |    5 +
>  drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.h |   48 ++
>  drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>  drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>  drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>  drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>  drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>  drivers/clk/spacemit/ccu_pll.h    |   86 +++
>  12 files changed, 2086 insertions(+)
>  create mode 100644 drivers/clk/spacemit/Kconfig
>  create mode 100644 drivers/clk/spacemit/Makefile
>  create mode 100644 drivers/clk/spacemit/ccu-k1.c
>  create mode 100644 drivers/clk/spacemit/ccu_common.h
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>  create mode 100644 drivers/clk/spacemit/ccu_mix.c
>  create mode 100644 drivers/clk/spacemit/ccu_mix.h
>  create mode 100644 drivers/clk/spacemit/ccu_pll.c
>  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> 

If possible, split the patch into multiple one by the compatible
so others can review easily. Otherwise, it is LGTM.

Reviewed-by: Inochi Amaoto <inochiama@outlook.com>
