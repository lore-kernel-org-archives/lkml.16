Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC926FDA5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744979772; cv=none; b=tB2gMkzamaNp5k8Czcn6k+hWvVo3lt/gI61XvdteQzfb+K6DqPjqNa2NuBkiJQZAQVCv8KlDUDlbeDpi/zzkFw/NrNGjXln/p9L++jorWyff3nbURoQ+ji7BPXtG7NXrd35jJLHXHPeFrboVk8iylaoqlaCfH70MpoHl80znwlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744979772; c=relaxed/simple;
	bh=yppx947aOCtoq1dHWktl3B19vaVLJpdo0/Uy/7OPq9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5k+iqlCFiX0QGojuiXVjahKfGaUiRRIxWgfxNIkabJoqP5l2hHy4AfOCat2NBtdNiM941NHvqQA+ui/yHjsg+5CezwqkyA7mTJcwdY3z1KIyH7pRHwy+Hc7S7bSmdmtuhAcy9mRI6ADQrccP0/LrURA+QKBb2ERjGtvGrFdSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iDypLIFu; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iDypLIFu"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso1894416a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744979769; x=1745584569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFja90LLg5cxMzrJjxyPi5JXyTpOjAeRhcfRkW8j0fU=;
        b=iDypLIFukpdzmeCZBarHHuFuquFdCvcJuof/Jx9qmi8zJLSDZrNJmCkrvDrAcs9zlG
         DCwd7IbNO115rGgmD5FDuQx5jE2XC192xvYYD9ETqodTjPzXUPCrB2gzzr40mYWPKlbZ
         ssqu58qNptYfksDXZd/BCuUemwpLi6u7aWn74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744979769; x=1745584569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFja90LLg5cxMzrJjxyPi5JXyTpOjAeRhcfRkW8j0fU=;
        b=pvifkg0zkMgUWs3w7+d0o6EkgeyUQElInefudWebBffX6PMSQV7SrXNd1KVZk+bmXL
         iYm9FVumfeTJsPH/vlihYtWgZtUn+I3vLb8ETkb4FcpLmr8yhjLeavRm2sT9I1H25tpe
         zGwchrY8jrrPGjuOSSVnZc/VZTOVG7QwGAjKx0XcNoBwmHbIAwNPqxFaRAneM8fOmE+v
         X8soJQDzxMsHcfrOoak2NPvWCPowWnMVCg/zBIOoQiRUmOuIXH5CnnbftPMBw1QoYoFP
         EmPiyojtdhX9chgbfPGLt9uDqM+MdA40fe38NJS7Qqe73HLo1sWcaHBAPJ2IzRJGG2Ch
         7iqA==
X-Forwarded-Encrypted: i=1; AJvYcCXDu2dAXO1dWxzmYE55U3r3yrtcWzjJ8Kh5Vkr0AMTf1CyiSinFqI0Kbl1cDQWmF8uj+4J+n+0XEBhA9/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbV9NGqnNsj36apfnA4E2/45JVF0hy9jBihkRqXZteJ32LDBey
	YbHXV0r2cqlFLxiiZqJNPIh9beP/4iyLDTwh52nqKjN2KFRBiDwCwAR9bHwXr92TVO7NxzwArjE
	JWQ==
X-Gm-Gg: ASbGncup5wpy6FRU6X2wpxX6zpMfRKKvDfN2seTE8u+vMOCbmbC7pokNWQvXy1jCT91
	7jQHIkEyRygB+YlEDQmiKcv0zSjTQDqR69uxizXBVtzhiAmpv13bvC/fFx8LhGsmLzIiXkPta7k
	mlY05jjCuLRh5+pi5LfIJagO5Z5uKfxHFdOTK6gpYtD+pyDSxcqk9TlRQXNvLUNWjVZUg3/p8es
	VdcR5nYRIotY6/LBEhQUdOvZQMXENIcN0fensPOOpeC8yCFHQ7sMdbgtiAlZSloZ/J9f9sD/ePE
	r7Oe5jBlGfHPcPdt1Xcb
X-Google-Smtp-Source: AGHT+IEh/RifjKmepzUzKRapKg6QUojKJqxZXO72HJfS1eeKGEZPDtb9bPbBR6V+GSNchFeH2bwn5A==
X-Received: by 2002:a17:907:fd8a:b0:ac8:16fb:a291 with SMTP id a640c23a62f3a-acb74b2d299mr259276266b.18.1744979768913;
        Fri, 18 Apr 2025 05:36:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:a:200:de:8c89:4042:cc8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efadd44sm115288266b.171.2025.04.18.05.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:36:08 -0700 (PDT)
Date: Fri, 18 Apr 2025 14:36:02 +0200
From: Dmytro Maluka <dmaluka@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/extable: include asm/processor.h for cpu_relax()
Message-ID: <aAJHMnQPl5iRO5wy@google.com>
References: <20250418115710.4154311-1-dmaluka@chromium.org>
 <20250418121203.GBaAJBk9bOo7ad1d4L@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418121203.GBaAJBk9bOo7ad1d4L@fat_crate.local>

On Fri, Apr 18, 2025 at 02:12:03PM +0200, Borislav Petkov wrote:
> On Fri, Apr 18, 2025 at 11:57:00AM +0000, Dmytro Maluka wrote:
> > Include asm/processor.h to prevents compilation failures due to implicit
> > declaration of cpu_relax() in ex_handler_msr_mce() when compiling with
> > CONFIG_X86_MCE disabled.
> 
> Builds fine here:
> 
> $ grep X86_MCE .config
> # CONFIG_X86_MCE is not set
> 
> $ make -j...
> ...
> 
>   OBJCOPY arch/x86/boot/setup.bin
>   BUILD   arch/x86/boot/bzImage
> Kernel: arch/x86/boot/bzImage is ready  (#1)
> $

Yeah, I meant precisely: when compiling with CONFIG_X86_MCE disabled and
some code enabled that includes asm/extable.h without prior including
asm/processor.h.

I encountered that with the out-of-tree-yet code [1] (which is a part of
a prototype implementation of pKVM on x86) which includes asm/sections.h
which includes asm/extable.h.

[1] https://github.com/intel-staging/pKVM-IA/blob/pvVMCS-POC-v6.12/arch/x86/kvm/pkvm/smp.c
