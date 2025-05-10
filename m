Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4AB182B7;
	Sat, 10 May 2025 00:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746836182; cv=none; b=ScYs5H6TRPCD5FqlsMWxCljNQhjf86svRDHB57+XhZ7R1ONy5ggGDdzvx0qs/Icv53nsbo4p6oDysMWdOmpoFM2hphsVkMT8/+wP7vUNi4Rnv7Ss+MXt3jHuZjmqPn0WRs9hoqHYvIgKUF8Elq6V8/FEfnslBIG2RwuHIjL0CAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746836182; c=relaxed/simple;
	bh=bRwM6L/RuneoVyutP2ZTSahmcEY98vH+q1jNXKgCS2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx0oRCDH9Tlyn/qbWCIR0Bzgi/eudWfbkmBvu2ZGaDWAaR2Bo5u+IJ43B+TlQjjn9sdloN/PLCirp+eLDOYk1z41p85iJxi6cmmlhyex07o4O+mteFMdDDAOMhTsN23iKvsa+58CM2tQvheMla7BhjJaX+cjztlX3vdszeVxhX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaUwcrAd; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaUwcrAd"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7cadd46eb07so289971585a.3;
        Fri, 09 May 2025 17:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746836180; x=1747440980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SFtVXCVSeg1kTdZcyNbfJ4jRT+3FPuL4xzH9FGtq7M=;
        b=DaUwcrAdlVAE6yCY0P0CQy6NacVy4cXmCgoS97iNvCgJL4Zg/pdXxtA8K4/vQNTXtc
         KLBVfcsnH7OzotPJDEwjV0xkbg7pyjMQzD9Fq6u8XXTOxhlCkUa/La/O4JLOREYj9uKX
         WQHIB3O9Ijo2gAun0fdMC0Uuv0uCmyJFx1kKKzDLY68JHvNkkbRQPcEGZCqraWMTXLd4
         o2okRoNV9j6LAnMk/eIo0oenBA2T+SOMKy8upHEzReeUWWNM/o0TLSPuBMcXP08cRtTF
         u7ZcqlIfR/N9dOySBXAjkg2iTnNIww+r6afDz6XwtYQyp6u0Lup1wyw4xM+i+GeNqQ2i
         eXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746836180; x=1747440980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SFtVXCVSeg1kTdZcyNbfJ4jRT+3FPuL4xzH9FGtq7M=;
        b=fCqassyXo/ozrehYNtT1tWpJ8GQmoU+wTlUzLRDmGbbkWU4fIB9hnko928tayNbX9M
         E9hXH6rsZu0a+FqIhhlEjdrftw5djtbgncsa9BN8uuOENNsWpZRzSkL+9fixZBpvTNYV
         HIhE7MBUB0aY7XnPeJNoQgx9jJHlNH5g+NZ4hlkcje/WKlAKIjPqLUIMV1QGGFiGAMQn
         b1dMpsQh8EpawWMi184LI9XuiR3uAwz4F1ZaSL9QJCOebPLlhx8O57XDNG1ZG1FakcQ2
         xgS6WROdznvRQvtag4Z91u/0WAY00FPiY0xgIA0suxZJEIA9iZCVj0feyqf7nL9H+iIK
         MKww==
X-Forwarded-Encrypted: i=1; AJvYcCWbrvV8u80oBWOVNyRjkBPIuJN1ssLZ0Kwfl3Y1hnH18qHBVF8ew8zenNRjNhfNTfHQNkL5gcIxOCO8lac2@vger.kernel.org, AJvYcCXjaugLtYljAG5HKWy0xTWLXwP/o0w4jBEqki70H1JXThOJHf0wUL6UcuFu3wySwNNgMjcHJOcC13zh@vger.kernel.org
X-Gm-Message-State: AOJu0YwMu4OSq8fZvSRk+3lk/MlSwBHxvuUq6hDfn1TeWTYC79/VnufE
	aP1SHclKEIv52GEnu0zQi5AssDVFVhgpVzGpwN5qD8PPRQeaat78
X-Gm-Gg: ASbGncvkyOrLpcL0doLpxXJb6NQse8Ty31luQIyogIwLRdltuL44vRWJyZa7WLB1jX+
	eKK3O78P86lZ7K+OBw6/ByDNsWwm6k52BiwaypZxx+yYHc1GM3F0JQITDFq7xh0toK7RYDmx5Vy
	uydSxdUq2wGzOmILirF36MfLTvqQQ3Kp7MvO0huKZ2OnymNVMg/g3Mxz+X/0L0fEX0GpIBS7O44
	iKvfiyg31kDFDBwwT746mrTkCyD+F156pwpoko7gO6nxxSsfX46zwHTtHBKYkMNn00sgIEyK9up
	YNlTcEBh4sG/3ZByGltafbIWNcE=
X-Google-Smtp-Source: AGHT+IGsj1/7ro2DBatzM79BSJawe4AwdDgbJzQySrStNjoHX1NPEW35OR2pnN03ieEV/qqsQHjKNg==
X-Received: by 2002:a05:620a:2443:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7cd011053e0mr885707785a.22.1746836179840;
        Fri, 09 May 2025 17:16:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe75fasm204706685a.93.2025.05.09.17.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 17:16:19 -0700 (PDT)
Date: Sat, 10 May 2025 08:15:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Message-ID: <clgoceu52ecsdnb3motp6eciiisalwjxgi4msdisgtdy3rxsvn@5hh4lzd4mh7q>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
 <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>

On Sat, May 10, 2025 at 06:42:02AM +0800, Inochi Amaoto wrote:
> On Sat, May 10, 2025 at 06:11:23AM +0800, Han Gao wrote:
> > sg2042 support Ziccrse ISA extension [1].
> > 
> > Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]
> > 
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
> >  1 file changed, 64 insertions(+), 64 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > index 927e0260acbd..04a6875574bb 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > @@ -259,7 +259,7 @@ cpu0: cpu@0 {
> >  			riscv,isa = "rv64imafdc";
> >  			riscv,isa-base = "rv64i";
> >  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> > -					       "zicntr", "zicsr", "zifencei",
> > +					       "ziccrse", "zicntr", "zicsr", "zifencei",
> >  					       "zihpm", "xtheadvector";
> >  			thead,vlenb = <128>;
> >  			reg = <0>;
> 
> I prefer to keep the maximum 74 chars per line. I suggest wrapping
> the string. This apply to all the change of this file.
> 

So, I mistake something, please wrap the line with max 80 chars.

Regards,
Inochi
