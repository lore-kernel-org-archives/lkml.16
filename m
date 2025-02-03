Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CEF25A630
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551001; cv=none; b=OOLkahkB6ls8e9zT5ZQe8sFBhGJHqWUYhct4vUvMutEVvH72+TDmd1OaGUEj92HtZo+2QQ+cwQrcnyemAU672WF1tCLr2qb67qwa8N87uLTsYauPn+9UYZpO4CnZG+8+BQHAxsz4qt/J7bcmumrO4NVFVgCTnrX4a0steRi3GfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551001; c=relaxed/simple;
	bh=qzCf6w0kWR1848H5E9nYadnxcuCIu+NDN2mKGbf5Y+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxUqLTg0eW3UQhWykNsBHAJrHay/28ubKzxMZzn3KElj0y73RIpLafU0zQA8fJGN88ySTdJA5viuBgN4rwZAjMH1a1qZddJeAockXTDhRp5l6YgYMERmYmju/BlW+TUuY/jgX3dtsDZ9e4ayt2upsVFWYWgt8LvB2Qd+UZWhJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=SuisEVK9; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="SuisEVK9"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D67BB3F29D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738550508;
	bh=xZvdSBE+LgaOYmmFBhKsCXeW+YkHJkSKnanfbLe89eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=SuisEVK98z0yD2f47s+sMlopW77h0oIdkmdj7k1Uh1+nwZsR/C/cDOA3mfZwQvggq
	 pzR7IEt2F0387FEK8Y/hKUKkz9srm3IxZuoAwPGNqADS7pSkNO69N6zJD7W8LWaDXN
	 SBK/rtTAXfKr8FLR+6Yd4qDAS8Dtstz8ORv93sXy+pCgHwa18CJ4i80lG5q5JYnvdX
	 YQv+3pn0PWLiHt+zt4/UgSxGR24dLovc0BYv+ZtoLMPtYeiwO/TiDmui9qy/5N977n
	 EOmYB2SbSTIUADwnw+Nx9XRUN7tRJcAWONoMHArBLxyDhs3o+1/MFia7Qt8dR1NMFS
	 9Q4BSNIV4vrwQ==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso11244918a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 18:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738550507; x=1739155307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZvdSBE+LgaOYmmFBhKsCXeW+YkHJkSKnanfbLe89eo=;
        b=F51+j1nTwaej4G4C9hrngEiuD6/mfB2j46IeZzz8vRjJAIkyx491/UyPli/mBxDPC4
         1S6/xOp1G1oR2gIQ8Cuuu9IqVR0pZdmxTAn3XM+TJInnHGxTe6N8IiM4qoyuMKhOcb72
         UDezTBPTAxOksWnPVa6Q71DRleiFLiGDvgOVb248l34arWY69aoEy8NRU7+Isk3ggc7C
         jjUlXy09uG478NiNoN801uoonpL1sLJ7e9RbHqkE9qX3LupCwauqVyvr7USB0nz7PfZw
         kcauagZ+JoU2aLFSzKypyOSu+aMyMeol75sd/OfSGN9Q8xelUYVNS7K8euGBZoP5XyXn
         VHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdij4IIa/9yZBgnuQHwcpuNaeCjXdgPhJhhd5AbV7ZfDgrLPNzbpxHGE1yhmDB18rCIWzvVZDAp3oGDB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6I9caIJwtui0zl8gVQISHarjeGjVqpJs6SfwPkcPuCjelfY4m
	Ghy9ISxgEMA+ZoUgeUrNbhCamii3fYN+Mq1Uv5VkQ0cquAUhE2XTQDy0ZrP9czh4oJLF9nldYSM
	mX3HIgSNWhnwf3jcJLong0Q8cvdyE6QAC6HzY6bpzk0kT2+Nspt6o3dDFaeAYwJoAKd2jg+TM9T
	kjGQ==
X-Gm-Gg: ASbGnct5sAVIw+4MtKV65oPYWd1affMxv5PpKXXUg1RFvlKw0DWXMmdx/FPVEsag7oe
	MGZNemtJ5kn7Ikxf15AayyeQA5So5AgdUgtboRcmKdSceKKuNBIgF4HQB7EmHWkRFMkE1JugYi8
	Tuxr8l0blbINUBGaLiBL3Xpntgkpv5nxWgPzO0Nrumu14m5dwko5z2qPfprpxGzIDOnzf3Z3pFH
	EZd5JKtARElhb3aSfoweGhI0/uBko8vBSQvstg8HYpd8skXcJLTwBwHUel7eHplwSie4+q/OFJL
	69f/jQ==
X-Received: by 2002:a17:90b:288c:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f83ac17f80mr28520531a91.21.1738550507051;
        Sun, 02 Feb 2025 18:41:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6i84l0H8/NyTIQEDPCj+dTbpJBMzycl508u2oFUGlYYYue6YCfB1i+fgYjqkSujkuoyg7OA==
X-Received: by 2002:a17:90b:288c:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f83ac17f80mr28520510a91.21.1738550506665;
        Sun, 02 Feb 2025 18:41:46 -0800 (PST)
Received: from localhost ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330025esm65084985ad.166.2025.02.02.18.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 18:41:46 -0800 (PST)
Date: Mon, 3 Feb 2025 11:41:43 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <vscpr2piax6vgbrkbrfi5iboszymcuotflqjnk2jufannsgmvn@s6dyfs4ftbk3>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
 <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
 <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com>
 <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
 <CAMRc=Mf6FZgTNBGUSsm3H2nSBLbp+DpamzbZiHZ67Xc62F3QnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf6FZgTNBGUSsm3H2nSBLbp+DpamzbZiHZ67Xc62F3QnQ@mail.gmail.com>

On Sat, Feb 01, 2025 at 05:10:07PM GMT, Bartosz Golaszewski wrote:
> On Sat, Feb 1, 2025 at 1:26 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Fri, Jan 31, 2025 at 06:22:50PM GMT, Bartosz Golaszewski wrote:
> > >
> > > I too think a-1 is the best option. However, I'd go for line0, line1
> > > etc. convention as for computers it doesn't make any difference while
> > > for humans it's more readable.
> >
> > Thank you for the comments. I’ll address your feedbacks and send "v2"
> > later, Since we seem to agree on the overall approach, I’ll send it as
> > [PATCH v1] (i.e., without the "RFC").
> >
> 
> No, please don't. It'll be confusing. The RFC WAS the v1. Next
> iteration must be v2 with a changelog.

Ok, I'll send it as v2. Thanks!

-Koichiro

> 
> Bartosz
