Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0A1F4628
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207994; cv=none; b=ow4vndjhiYxg33zEhQc8bncat7TSbIZAPi2HQGoelX87Gg0rSQQq6F+3lLmisP01VB3QyYLJfQuUeRRs+c8zzmhaOvVFQTyBoKAp0no88IMV6pH91016+Ty7fpc3cURGuevCAYTXZ4I6bqLdk562jRfJi5JkQJxhKTI/ahbNoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207994; c=relaxed/simple;
	bh=OHixFZCT1b7JLSDmkCKOfll4XlSUVf4AghxWP+qBVEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyJBE8H/my1u42NTFFOsXzDERN50npFRFhZGK9uq3YMakDXB7w76hTnt5yym5HTfsvfBPWbVj56BmpL4FRKzSGUmxY8qsBND9iObHZW3c9WgNTVibY60GztHq3SHWuP2fCfQcP6khLBAJle04O/ugCyBQNS3vuo/wYDrF7+4UWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zQfGY2wD; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zQfGY2wD"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so3560813276.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739207991; x=1739812791; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2MsrOQ6Dr1fnZ/rPykBJzkvfxRD2BZBc8FtmXsWoPMU=;
        b=zQfGY2wD91NHICIWJZRvwf+pS93ULqOZ3Cx5Y0hHOjkdMLbQDEnd8nAr2lzYeCWQLm
         +px5eI0hNwbHRAqpvuckgIMy7UjzHqEi5aS2u8NmU9uEu9GYCZIPnnfkip2ILj6EtCWF
         YbhCe/KJu6+g6jk1aHpZ+DbrMlhW4xj+xU7bT3bLTHpy2sMgsbdhR3Qg02VnotX2Odxr
         kpe0UdWpYgGb/HcN9x1blDBFZFcYT1QlLCqFn5vtTQem7dpNIeOKSj+aZGFW1PjvCHZj
         /7j8herWOLjdwJkvEUNSARHjZzFWFNd3nOQHYHsU3LRb1coTRJTUGd30ZCES4hfYC6en
         Pswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207991; x=1739812791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MsrOQ6Dr1fnZ/rPykBJzkvfxRD2BZBc8FtmXsWoPMU=;
        b=DSs1Ip2YcwytcEiWvRTasDcXA4Yb24VFcKw5JtLei6UsOF2WkuS2zaY7UWYDx9AiVd
         0ZZHSxT2u5zPOhicvWLYc77bDYcdz12Tnd+o/tGv6f19HpEtK3DIroUGCBp1gsw3UmFr
         43vu6Jyyo/ZL/BUuhIGf562LEe6tigDVCZStugBoeRQUlUuIWjkhu/J9BeEZX7RbC14Y
         l0VN9Om6kpdOx3Z+cNtJBOGYAdG+bndygsUZrMfO0h0JQHiNOlImD1Q/pfvvhVgzzKV7
         0o0LMtKoxSB573dYmjhalBcHG+ccwASH9Fc3OcqQIwHhHjYag1hD01Ya7rDo4KBCJ89s
         BwbA==
X-Forwarded-Encrypted: i=1; AJvYcCV8yQOqrJVp8Ft77c1MMxrAEp386FuVUgHIaz/syCfn5M8xE/jJSDiM8J5AaqjPlCVL8yARHYS13ck21sw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4EHkFQ0K95M/7P1f6Yjjx9blWO2YihASv1OQTb+WiIHXyUGxp
	4NeJrHWboHHidGIjM7tJFwRQnG8i5noaxAQk2IHRdK06M4uDZxVP34trLTitoJU=
X-Gm-Gg: ASbGncvK5XhQog5JBGVI7Af4OJsijG/PNkSZQ3znv/uiZxisGE/dc3bq9ckE+snhiVB
	F2t6MyXBua4AT6Zs5ScmJv+qmWmG1YdIcnlAf4ZnIvwlqAIuZHn7/0OyT2opnwoilEd5tmY8Hmn
	mXPSrazSTFUVmKsntHv07hoH5o6BGysW2IjKeLnOQceecEouBSG48ZzF2QCS/54pMchelBGz0ln
	tOREFaKjU8iX6YnwNKBGDcfy/0bBGjgt9o7K40Yp5MjjYxBIK/gXivIcwwpDnDKPMyv42RpBmVR
	fMg=
X-Google-Smtp-Source: AGHT+IHwdRZwKWakhS069PFZbgTvL8cjcTlAHidctczPzqsJ2LcDz7rXPXjmWjC3qOa29UIA7m5tFQ==
X-Received: by 2002:a05:690c:6890:b0:6f9:afa2:acbd with SMTP id 00721157ae682-6f9b2a49ca7mr120602077b3.38.1739207990039;
        Mon, 10 Feb 2025 09:19:50 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fcf9be9sm17680707b3.25.2025.02.10.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:19:49 -0800 (PST)
Date: Mon, 10 Feb 2025 09:19:48 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6o1NCo5nLPwBsUT@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>

On Mon, Feb 10, 2025 at 03:46:46PM +0530, Anup Patel wrote:
> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> > > Probing unaligned accesses on boot is time consuming. Provide a
> > > function which will be used to look up the access type in a table
> > > by id registers. Vendors which provide table entries can then skip
> > > the probing.
> >
> > The access checker in my experience is only time consuming on slow
> > hardware. Hardware that supports fast unaligned accesses isn't really
> > impacted by this? Avoiding a list of hardware that has slow/fast
> > unaligned accesses in the kernel was the main reason for dynamically
> > checking. We did introduce the config option to compile the kernel with
> > assumed slow/fast accesses, which of course has the downside of
> > recompiling the kernel and I assume that you already considered that.
> 
> The kconfig option does not align with the vision of running the same
> kernel image across platforms.

I just don't think that vision is realistic.

I am a proponent for compile time defines because ri ght now we are
catering the kernel to both microcontrollers and for high performance
platforms. I am in favor of having a set of configur ations that are
ideal for these microcontrollers and a different set for high
performance platforms. This is where the RVI profile s would ideally
come in, having different configs for different profiles that target low
performance/high performance.

Compiler optimizations for extensions are not possib le to do by just
having these different methods of selecting at runti me. By enabling
extra extensions like the bitmanip extensions during compilation via a
config flag we can optimize the entire kernel. It is not possible to
push all optimizations off to runtime detection.

> 
> >
> > Instead of having a table in the kernel, something that would be more
> > platform agnostic would be to have an extension that signals this
> > information. That seems like it would accomplish the same goal and
> > leverage the existing infrastructure in the kernel, albeit with the need
> > to make a new extension.
> >
> 
> IMO, expecting an ISA extension to be defined for all possible
> microarchitectural choices is not going to scale so it is better
> to have infrastructure in kernel itself to infer microarchitectural
> choices based on RISC-V implementation ID.

How is keeping tables in the kernel for all microarchitectural details
any more scalable than having extensions that do the same thing? I would
argue that having it in the kernel is less scalable since it needs to be
described for all implementation IDs, and all changes require going
through the kernel review process. Dynamic probing avoids these issues.
Having an extension has the one-time process of getting the extension
into something like a profile, but then anybody could use it without
needing a kernel patch.

- Charlie

> 
> Regards,
> Anup
