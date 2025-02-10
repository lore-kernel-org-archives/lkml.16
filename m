Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D704A1C5799
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180603; cv=none; b=h9q461JX71yWmvxC3WQhSLneJ9Bm9bAIYuneR7+LTj1UAE/9gcnGN9bpkVdpQmH6Opcxw0urvOd/2+C0mENuyyWlHlsUhq2a4Po6304a0nv8mvPUWxU4MBV+lBnuejUlqx3r+EO6ttdP2gIvfFh4v16x4a5Y4bkE0H+94n9aqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180603; c=relaxed/simple;
	bh=q+/xWeTvqFDTDGzKL1zJt7xuXQ+Ij+55uwwTyAnzcGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzbiQeN+EmBEQq6Leaa8pn3Lh0Lmrrteie6h/uX2hD0o87ePO08rBAfNtkbIqIKeuUnT7ZaZw+NkUO/0tnNIQFulPBCT2p6J1odOCj2LcU0S+tOa3UUJRq0HdF6461Np5j7RIR85g0zoiqaMSHLq4FTAvSokcR9DW63TijZycAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MA5hcvFf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MA5hcvFf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so41294975e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739180600; x=1739785400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vd6QRU+2E32PqUfzpGGLWnF0mLRXE9e/IUHXmZWK/vA=;
        b=MA5hcvFfz/ziQd3j9FTxwsdN0a6z8aPdt37jpELoIIH4jjeA/BZzLQpjh9xT04otwj
         Vnfzu2B0ZHhTWcAmYt77ghGe2v+8RBHPl4hO9MQ/bpGlmsDQwv3hJeShESoFR0xec3Yz
         IuF5eWRQTodYZQEnqQnWKh/VwMQJqqYwZzcUMGH9vbPb/y7nX6MJ5+f2MkDujYlOOn/7
         CuXe1uruQwSGAQ7EzFmBt0Fp76VfdqIY7mLtB8549eiwSay2Y5nNxEHjS7WWKe/hgoVP
         vpvuz7lB2zceSvX57zhsDL5xL8hnFYZj8gxOcCTRzLkDMNux2fGaauEvrRtKKMwVG7lC
         M+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180600; x=1739785400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd6QRU+2E32PqUfzpGGLWnF0mLRXE9e/IUHXmZWK/vA=;
        b=bmiic/r81UD9obPHS7kVnoaxBIakL9MqB39JOv6vWU7ljWANO6haC0lhfNTeZy/RTR
         pSPafVBJwQ85Kj7xZAOabvm5iIf+BOxGpFZ9ved2sEtzaIp69RCKcEP7KNTRuOu4WLwm
         riapIQATVhLTjzBubLqAGcfzWxRGnTdLuG1kFnp5DFrr2OdShgkAanwE2IXGBN/fmtPJ
         f4j+F8ToNCjNQHAkw9WY/p+zFCcTFvBO43uFDZ/11W/t8YrQ1p5sWJY9p8pFcEwjb7Fb
         Dg+TcOViq6cG4ny0x0btQPgz62pLyasKVWO+8lrccjjrZs2kLe9Rw8ogXM566llq35IQ
         G/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV0uTDu1HDEEINIO/i0oMM5R+jkZ6sWjNfStiMHciIa4ZYIj3j/eQVustQDOBOK9N08hAmZJkou0PsL4wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaY3Nx6wPISHJGEvaOXVH9BpIkSDG08XAbqKKeqMPfnBP/WT0k
	lBYcPB+180mEFPKVwbSyQ6MywSSRS1J3NXwF1JZt0WYK4dtCEhNIfLjjtmZrAms=
X-Gm-Gg: ASbGncuyNZEYYiueQcXCFu2Ho4YoiGwIAO+pEqsD75VF2klCba4bvA6asdJPcxeMFq3
	BashrDTqqM5JVJUa0wDCZl22RaQwXPSR1Juj9un2/gHeleDFwBx+NzLsVJgNQ14MVYu758Dz12v
	SoHpJyjaLP/z4yaj39lvxN7M8qTyyo7/0uUzn4+kX3FKvzgjQEvNyQJ4mCSvcNz40AbV40TR4gM
	iG9ng+mnB140GBIRdlGm8y1rLgeRJTIPLyb5xaksoWNMdyY67OKgPRXWJTo91Ev5iBCGR9dXQxX
	Nek=
X-Google-Smtp-Source: AGHT+IFRLkjybFieOXOH5tV7bOv0UazibB2LYsvwMDsRR1+KIdtj2nHV6LDRet17gWhnLJNyEaXexA==
X-Received: by 2002:a05:600c:34ce:b0:439:3254:4bf1 with SMTP id 5b1f17b1804b1-43932544f7cmr57004835e9.8.1739180600051;
        Mon, 10 Feb 2025 01:43:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae5c7sm139032785e9.18.2025.02.10.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:43:19 -0800 (PST)
Date: Mon, 10 Feb 2025 10:43:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <20250210-51cedc94f4cba8c96516adc5@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ax7B45OsGerjfA@ghost>

On Fri, Feb 07, 2025 at 05:22:52PM -0800, Charlie Jenkins wrote:
> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> > Probing unaligned accesses on boot is time consuming. Provide a
> > function which will be used to look up the access type in a table
> > by id registers. Vendors which provide table entries can then skip
> > the probing.
> 
> The access checker in my experience is only time consuming on slow
> hardware. Hardware that supports fast unaligned accesses isn't really
> impacted by this?

That's true, but...

> Avoiding a list of hardware that has slow/fast
> unaligned accesses in the kernel was the main reason for dynamically
> checking.

...I'm not sure why we should try to avoid determining hardware support
by its description when a description can be provided.

> We did introduce the config option to compile the kernel with
> assumed slow/fast accesses, which of course has the downside of
> recompiling the kernel and I assume that you already considered that.

yup

> 
> Instead of having a table in the kernel, something that would be more
> platform agnostic would be to have an extension that signals this
> information. That seems like it would accomplish the same goal and
> leverage the existing infrastructure in the kernel, albeit with the need
> to make a new extension.

Yes, I agree that another profile "named feature" may be the best
approach. I'll consider proposing one, but [1] implies there may be
some resistance to creating something like that.

[1] https://github.com/riscv/riscv-isa-manual/issues/1611

Thanks,
drew
