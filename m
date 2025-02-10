Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1C24394C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207435; cv=none; b=ivH5zTCp7SLHgxGnFYLkpJZdmsJBHaTgGR08dZqFzdnhmZ9ap3kt5nJoMIefre+K1KlkKR2CZWjOo+cnFFVZzzIck3+HiPA3HHvlKwuSWRPVHQDa1cEZmG2tbl/YMNozRCsWSie4zqjr5j6xYoUfd+DWgozjyyfixqocOedQFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207435; c=relaxed/simple;
	bh=I4f9LjEoqx7t/00Ki9BJQWCcYoVNANkuEBdoUlbIggQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gagFZswMVoWwrAz9K5Zr2iXsGishPRyAIGV2xK+DxxyCVkCnfgt/TdWrx2t2paG9G5bewkiLVwuQT1SkRz2OJ/B3M8wwrmd/1mHh/i8Ly12xBH40SpX3xrXmtPgxnWCUCkqUclmSGXulsudDqX4h1BWpBMvzZngcpHv3MJIcXKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KPYLjH/o; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KPYLjH/o"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-6f7031ea11cso43985967b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739207432; x=1739812232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJMRwPZx3iU33VFjfO3EAQ5wMZ8xyLmg7gDRe7Q3+/s=;
        b=KPYLjH/o95DZvWRsk07JtykUyGZJ+WxD99BaVBgQzdUv1Ow0KbYuQOQFKrdX+fp8ov
         HZFFSR44oHP+h95NL05DwKxOcd2y4BlcBUYri6jXj2eFASByOlMvRL3ngpbD/PQHK4J1
         uGnS4dzxVYzBBe61+U56kTiNigc+E8Vqj6+vNsM5PcPklFpmAgJDTJ4Z96KDdVY0hFE5
         28d4wP9wDY2NsxqqNrFqXyiHprRdjgOob4zC+jYs2/rgRwnFA6ASbF34fhfe7vR6Ifr2
         H/e8qnwwTf4koTGJf5qhUaiWIhxDM+9+iIRoRzi9wPK3g88Ykh90cQDE3lfu0wO/hb3i
         m8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207432; x=1739812232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJMRwPZx3iU33VFjfO3EAQ5wMZ8xyLmg7gDRe7Q3+/s=;
        b=i8goch3uUPISgMHeLK0sZSDvL9j1yLvaskA4JSkU1An6PoO8FM7IWdL7oJQEMorDh4
         tIte1+6SoDjVnCDRj4ex7yn9Fa2MMOsFWRomHjPN0fjYNnP6ihNanQwmDnM6hMWdSAuL
         pCaGFQMmhpCgCn+bIOxmnSiH4aTj3FDPEbme2nAjl58NFO4ju5rSdwarhvyBVgf2LXWw
         cYZJMquIazaZHTFN1T/pP0uKLbkhE+p9UbMGmfhf/jgAQws1FP+WgwXa3wNKUz/QnM0h
         0mxF68QNuGRP4VgyaMVVyp8rq4K9iesB0WjEwu6DfZKf7txiveuHvT8cbHRY+qG+Uytx
         MKZg==
X-Forwarded-Encrypted: i=1; AJvYcCW3dHawvS3K1Zupmj5rOsc9DatlGnBjLl6OqOmsNe1Q7N3I7C295NL4mN0JRAlT+ZgBcWXqNV95hDu48kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxazeRHSMf/P70DVG0sHqDyX6DUx0x2Xf2jgmdPI6UMFy7a9/yV
	tBBvyppmZHiVnbsZUC2FP4imldamNz4ctK0rRrmKNbi1p3m2evoy0yHfCviKC4Y=
X-Gm-Gg: ASbGnctuUvQJLLysryEJSG/URA6JC09nh5ULxE+s83+z+eDMrQIZvEkISOMqNih2Jl6
	Yg52edevwTBsJSq90q1LirS4RAeSeAYF9GS6AcXfCQ6Q40NIg6wUfaRm/3MDGfwVKssHPg8gB7K
	Rt8rrCq0gMM4vDzeo3sFKv/8+AWBHI8hn/xsXtFM5QSlPhaSaUY/8RVa4kjUC/Sj6C9gg8E196r
	/IDlG3gdzsYUEMsT8ydjLmItid9+zTbJiWDu31jiPWR8ir2cPVIErxlcIbdwX9/wJbfsyls5ECY
	ESg=
X-Google-Smtp-Source: AGHT+IF7lKxvTgaEV/I4an/VqlLCpMFOtwQL5q2GuuLjaCF02RBe/SO5iWJjxKW9CNbSttB801OpuQ==
X-Received: by 2002:a05:690c:6f8c:b0:6ef:e390:1d4a with SMTP id 00721157ae682-6f9b2876ac4mr138897167b3.11.1739207432175;
        Mon, 10 Feb 2025 09:10:32 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd557absm17268277b3.56.2025.02.10.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:10:31 -0800 (PST)
Date: Mon, 10 Feb 2025 09:10:30 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6ozBlumaaAReM7l@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <20250210-51cedc94f4cba8c96516adc5@orel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-51cedc94f4cba8c96516adc5@orel>

On Mon, Feb 10, 2025 at 10:43:18AM +0100, Andrew Jones wrote:
> On Fri, Feb 07, 2025 at 05:22:52PM -0800, Charlie Jenkins wrote:
> > On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> > > Probing unaligned accesses on boot is time consuming. Provide a
> > > function which will be used to look up the access type in a table
> > > by id registers. Vendors which provide table entries can then skip
> > > the probing.
> > 
> > The access checker in my experience is only time consuming on slow
> > hardware. Hardware that supports fast unaligned accesses isn't really
> > impacted by this?
> 
> That's true, but...
> 
> > Avoiding a list of hardware that has slow/fast
> > unaligned accesses in the kernel was the main reason for dynamically
> > checking.
> 
> ...I'm not sure why we should try to avoid determining hardware support
> by its description when a description can be provided.

I worry about scalability of this. This to me seems like a slippery
slope of hardcoding performance tables into the kernel. There are a lot
of riscv vendors and allowing anybody to add a table to the kernel to
dynamically change behavior specifically for their hardware could become
a maintainability nightmare. Avoiding this maintainability issue was the
motivation for the runtime checker.

> 
> > We did introduce the config option to compile the kernel with
> > assumed slow/fast accesses, which of course has the downside of
> > recompiling the kernel and I assume that you already considered that.
> 
> yup
> 
> > 
> > Instead of having a table in the kernel, something that would be more
> > platform agnostic would be to have an extension that signals this
> > information. That seems like it would accomplish the same goal and
> > leverage the existing infrastructure in the kernel, albeit with the need
> > to make a new extension.
> 
> Yes, I agree that another profile "named feature" may be the best
> approach. I'll consider proposing one, but [1] implies there may be

Yeah that thread does highlight the unfortunate way that riscv has
evolved, but I hope that wouldn't be a prohibiting factor here.

- Charlie

> some resistance to creating something like that.
> 
> [1] https://github.com/riscv/riscv-isa-manual/issues/1611
> 
> Thanks,
> drew
