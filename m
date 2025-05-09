Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C9262FFE;
	Fri,  9 May 2025 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830554; cv=none; b=nNHK+Of9oIEPyzWjkEs2vpDBVO78k0bTZLGn7LeXDAgWtWPe/yKEuXRCAhMZgRbSCrBI93s7Dl6iMCQfdWV/Yyjr0fHh3t+a14TePGKwGzCHNWMaXihwN4MNhwL3zQz4GPhwaOcYe27d8zeVZX/8j+UJGAJm0KHA481U3UaI9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830554; c=relaxed/simple;
	bh=UJZQUK8D1H3zEiED8f40de5LqEEQaL3RXIbV8jJICRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSCa4cf8c6tBZ/NJHhLWFmXpU2ZL2tw+HMRnqV0WWauDxnIk4EndjdVpXzuZ2j7H43Ffd4OAUQcBpqlb4B3CXqeF3dsUBokzglYNNkl7F+2JfpVMGYRd07TDA8GtbOUQu/0CjnwaTmNoeKJsGnAPzXqSwE7IFCp4naVVdDDwKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejFZvLQK; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejFZvLQK"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e1b40f68so315248485a.1;
        Fri, 09 May 2025 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746830549; x=1747435349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=msHOztbjyq9yqEIUeoH3IVEEQXo53ZrXdjUyNVKV2Yg=;
        b=ejFZvLQKmufilBY1dr81h6NDfvV9spmODBue+z9T7Z+89IhWKdQY+DSGHOUf7hnQ64
         /lLRnGs7zEiu74pvubzDyATVmDRt2YxS78nh/6B53KvR1ulHG2BVYtodS0DyBjnkSSX0
         F65IzRHs5iYoFLlP2Z0/Spyem8yzcO/6rqzTCNJCoGgrj/Qv2D/MfD0HrWQFsFaLXX+L
         PBY2HyKqNCo5vqTTbhgADZ7+yoZPgnP3l6HI9o3erE9L7CDjPsnzs/zBueLe5LUQp+M+
         fHLef3ZFGlg0QwTvW1dbt31HBt6x2tYOjaONG81+RULQ0CmNeQgG8cgRj4t2RyO5i+Ku
         SU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830549; x=1747435349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msHOztbjyq9yqEIUeoH3IVEEQXo53ZrXdjUyNVKV2Yg=;
        b=YQggrQyhlKJCwzB38AJ1tNjtk0JZ3+2Df/TSgtgOXoL6I05jbl3zvLeU1EU07hnkHZ
         +8otOzdrR1CYTWJhuFOK3pzrsH1RV+vGcEv3imBX25iYZx9EpFY7Gybmn6t3Z8D4sRks
         74CmeJPxlbIoKkvrIyiRn3ypzJ4xbQMB2jU4eDgSfay+VT24KVJZ9L0b3RHh4pMOt1y4
         e7d5Z6HrkSufUHlmTvkoqZRCD3XFOXSw2j820lYauVPmM3i8UcaNPLLpuMENgTzTNIT6
         fTXOs/YURslptrd5Ty4uBYvvMsv3V82dBMut8uXk3GGpFO/h/rjUfcicJXhxxmqki31W
         d4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoCWhGJOHGtLOSsqlDDFOn0DSjLzGsXopZrAWw3M8gY1DyQu9QPznTwi8ckeiHfO25Ipjkg1lzBYog01Ib@vger.kernel.org, AJvYcCXfD0uAXyf0i9uTmDH5FnWX1baZ2FFVxF0az/z5uhrdiXsFvBuH7f0hG5eTwa3FDTeER+3cb22veEGB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tdxI1hnP1YLJrwGOzKVuNHNYTkWVC4ULKDrJS7h7hRAG3MjY
	nn62SmX8ewT/X5dMlMV5ulSotR8l0dxw2jaGFKS/UrMVy1vBmbG3
X-Gm-Gg: ASbGncv6UmI8Rqk/m4AilzhY6QyFCF6dTQu49jAnOtZ0UqPI/OFaUUTL+1iWeaCn0cp
	w6FArME8sqSUdc8rPLTYWIFh0R1eAqhYp9usTkNT3S2cKJBUD03n9KQOFcHfeXpJVn3567h4UeC
	171t6e01qUeVPLFaA27mMEgTxXl+lcXolZYSImk9Jm2lCHkGcQhXL17dgTemo7L1m22aSOAlaPr
	HwZd7PiUNrcui7GlSEQi0UBYXldSNOHfHjq6ZXSq5HGudV1ejnkG6wxAZ/crr8HFP5VtMEFmWKe
	FqDMCoSim3X4LoYNuyjO304LIPw=
X-Google-Smtp-Source: AGHT+IF2nmpQrGYnNJ3kGt9vg2TNZfXedBd1efP8m/k0Dzwcc27Blqyf+tRDQHXu1l4xl93RzqHNeA==
X-Received: by 2002:a05:620a:4549:b0:7ca:d9e8:d722 with SMTP id af79cd13be357-7cd010f7058mr657732585a.17.1746830549496;
        Fri, 09 May 2025 15:42:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f98a89sm196704185a.53.2025.05.09.15.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:42:29 -0700 (PDT)
Date: Sat, 10 May 2025 06:42:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Message-ID: <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>

On Sat, May 10, 2025 at 06:11:23AM +0800, Han Gao wrote:
> sg2042 support Ziccrse ISA extension [1].
> 
> Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
>  1 file changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index 927e0260acbd..04a6875574bb 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -259,7 +259,7 @@ cpu0: cpu@0 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <0>;

I prefer to keep the maximum 74 chars per line. I suggest wrapping
the string. This apply to all the change of this file.

Regards,
Inochi

> @@ -285,7 +285,7 @@ cpu1: cpu@1 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <1>;
> @@ -311,7 +311,7 @@ cpu2: cpu@2 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <2>;
> @@ -337,7 +337,7 @@ cpu3: cpu@3 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <3>;
> @@ -363,7 +363,7 @@ cpu4: cpu@4 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <4>;
> @@ -389,7 +389,7 @@ cpu5: cpu@5 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <5>;
> @@ -415,7 +415,7 @@ cpu6: cpu@6 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <6>;
> @@ -441,7 +441,7 @@ cpu7: cpu@7 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <7>;
> @@ -467,7 +467,7 @@ cpu8: cpu@8 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <8>;
> @@ -493,7 +493,7 @@ cpu9: cpu@9 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <9>;
> @@ -519,7 +519,7 @@ cpu10: cpu@10 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <10>;
> @@ -545,7 +545,7 @@ cpu11: cpu@11 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <11>;
> @@ -571,7 +571,7 @@ cpu12: cpu@12 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <12>;
> @@ -597,7 +597,7 @@ cpu13: cpu@13 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <13>;
> @@ -623,7 +623,7 @@ cpu14: cpu@14 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <14>;
> @@ -649,7 +649,7 @@ cpu15: cpu@15 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <15>;
> @@ -675,7 +675,7 @@ cpu16: cpu@16 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <16>;
> @@ -701,7 +701,7 @@ cpu17: cpu@17 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <17>;
> @@ -727,7 +727,7 @@ cpu18: cpu@18 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <18>;
> @@ -753,7 +753,7 @@ cpu19: cpu@19 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <19>;
> @@ -779,7 +779,7 @@ cpu20: cpu@20 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <20>;
> @@ -805,7 +805,7 @@ cpu21: cpu@21 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <21>;
> @@ -831,7 +831,7 @@ cpu22: cpu@22 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <22>;
> @@ -857,7 +857,7 @@ cpu23: cpu@23 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <23>;
> @@ -883,7 +883,7 @@ cpu24: cpu@24 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <24>;
> @@ -909,7 +909,7 @@ cpu25: cpu@25 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <25>;
> @@ -935,7 +935,7 @@ cpu26: cpu@26 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <26>;
> @@ -961,7 +961,7 @@ cpu27: cpu@27 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <27>;
> @@ -987,7 +987,7 @@ cpu28: cpu@28 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <28>;
> @@ -1013,7 +1013,7 @@ cpu29: cpu@29 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <29>;
> @@ -1039,7 +1039,7 @@ cpu30: cpu@30 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <30>;
> @@ -1065,7 +1065,7 @@ cpu31: cpu@31 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <31>;
> @@ -1091,7 +1091,7 @@ cpu32: cpu@32 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <32>;
> @@ -1117,7 +1117,7 @@ cpu33: cpu@33 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <33>;
> @@ -1143,7 +1143,7 @@ cpu34: cpu@34 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <34>;
> @@ -1169,7 +1169,7 @@ cpu35: cpu@35 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <35>;
> @@ -1195,7 +1195,7 @@ cpu36: cpu@36 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <36>;
> @@ -1221,7 +1221,7 @@ cpu37: cpu@37 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <37>;
> @@ -1247,7 +1247,7 @@ cpu38: cpu@38 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <38>;
> @@ -1273,7 +1273,7 @@ cpu39: cpu@39 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <39>;
> @@ -1299,7 +1299,7 @@ cpu40: cpu@40 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <40>;
> @@ -1325,7 +1325,7 @@ cpu41: cpu@41 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <41>;
> @@ -1351,7 +1351,7 @@ cpu42: cpu@42 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <42>;
> @@ -1377,7 +1377,7 @@ cpu43: cpu@43 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <43>;
> @@ -1403,7 +1403,7 @@ cpu44: cpu@44 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <44>;
> @@ -1429,7 +1429,7 @@ cpu45: cpu@45 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <45>;
> @@ -1455,7 +1455,7 @@ cpu46: cpu@46 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <46>;
> @@ -1481,7 +1481,7 @@ cpu47: cpu@47 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <47>;
> @@ -1507,7 +1507,7 @@ cpu48: cpu@48 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <48>;
> @@ -1533,7 +1533,7 @@ cpu49: cpu@49 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <49>;
> @@ -1559,7 +1559,7 @@ cpu50: cpu@50 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <50>;
> @@ -1585,7 +1585,7 @@ cpu51: cpu@51 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <51>;
> @@ -1611,7 +1611,7 @@ cpu52: cpu@52 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <52>;
> @@ -1637,7 +1637,7 @@ cpu53: cpu@53 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <53>;
> @@ -1663,7 +1663,7 @@ cpu54: cpu@54 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <54>;
> @@ -1689,7 +1689,7 @@ cpu55: cpu@55 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <55>;
> @@ -1715,7 +1715,7 @@ cpu56: cpu@56 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <56>;
> @@ -1741,7 +1741,7 @@ cpu57: cpu@57 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <57>;
> @@ -1767,7 +1767,7 @@ cpu58: cpu@58 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <58>;
> @@ -1793,7 +1793,7 @@ cpu59: cpu@59 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <59>;
> @@ -1819,7 +1819,7 @@ cpu60: cpu@60 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <60>;
> @@ -1845,7 +1845,7 @@ cpu61: cpu@61 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <61>;
> @@ -1871,7 +1871,7 @@ cpu62: cpu@62 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <62>;
> @@ -1897,7 +1897,7 @@ cpu63: cpu@63 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <63>;
> -- 
> 2.47.2
> 
