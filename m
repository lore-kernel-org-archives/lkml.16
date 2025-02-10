Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2722F143
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196383; cv=none; b=dz746+42/ZsGUCpjJUscX4+3bKmXGQc5IOau4OREFYZZm6vIbuI/dK85KMszJP5WtGLMKoao5im1COFobdJZFruACPgT1uEtlPeb97Ko4YOqJeTg5+EE7XVhTutFNSe+UelNwRKAEobXlMfD8oza4mNG+mgvs9BHqeHz4+VJmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196383; c=relaxed/simple;
	bh=jQXdsAM70gjnQnwuRxxLgbXuXJ0RXrC8eEqPycA/l1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3BKhcKCXMBvtU7txKG3O+cFMnGTrpqcrjjmQeYkTt0XP3Z5xpvznYZOGh1+Lm269sT5+jah7sm+N8APpKvzpz+RCxUrU3otwkD+mVNmXpK7qW9ZmKRKzV9v6Ah4RQoqzTNqLziMOuVXEhtgm6J2ZHv+2tKPS6Xx31LsguUPpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=djao1pWG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="djao1pWG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso2011503f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739196380; x=1739801180; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IrKg/+BbMX221XE9ME81BjtPrEG6eZ+0UQKPsDeAQvI=;
        b=djao1pWGPdXsIWRYzcMDgNh3K9/00/Q7GmvRh0crKrdE6l6kYWQcBXWSojraBUwXey
         qZ0f1LBN7kMV1laSJ2U1ZMwdEwJvDETvVXRww9qfUz6TQekqMAy43u5/vOvt3zRJEnjN
         m47W3+DgmmMvQXwoZTdcBND/7GQxeOlh8eADwbr5GoLA12VpZ9T8FKxogCNT9oqXib2w
         ED+1RGDKz0iT01v4M3ml0P+Mb3M2tEeCCF5FMr0I70/s+/lq6Wd/pBp+28bIqGqVtSxs
         lpqqaAJrSaQcIp3FwRvZC8turbj3ppmtsqNFQ3Idvs/lRzU6sYMpeGAl/s3w+yJaYbDW
         2slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196380; x=1739801180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IrKg/+BbMX221XE9ME81BjtPrEG6eZ+0UQKPsDeAQvI=;
        b=ac428I26bwibItyruZE0dOUUshDtrI1RAJno/fVmHpyOGrgteI/HSIzRpWF5Q0hrlA
         ydUJ7j/6Dcf1QcPwzpPYzfbQYzpNew22/GYRNmDfMwseM+2nC5sljhXZAN0JJUJt4C8e
         2HE3wrUsrTcYfSumtm0ebQakkPQ0pXF2zo4N//GYedh9subsan6UWgqvUoV9aS0LkCnc
         TCUFck5Q+nTiNeOfOaoZfzwY9fdoVskZQyOc7KeBXSjtGynTovvEJYaCVSQOf3R4s7ky
         o6C2TH1pb4Tc19ZJpyj5KAjAX22cbf+Ms56Riavz8N1Ql/03BK6b4x/cuTsyIgYiDDEQ
         zGtg==
X-Forwarded-Encrypted: i=1; AJvYcCUpcdhAhfVgHzXxQhRom4ebmfh63LP5DQc5q5wBRE7bQWhiegTepB2emE3L0tqo0JTNd7LktmGZmgmYm1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMrLCoFt3AzDfFm1Js68jAzQAnwKJYb1GiskU8eqRe3kSv8MW
	4n6th+pTHc2orieW/q3qcZiAZUN7rIz2RJA9JUlGlCYmcsbnU6pIAc8Aumf18N0=
X-Gm-Gg: ASbGncum0XU6DKSH3R8l5x46VLVBrYMtM+OVoABgWsyynGX7LqvdFiIZfjPUfrkGuD7
	fQ2QFhgqio2/Fj3oAE0IZ2EHmkXdLcaSoNdi9p5W16tlzeKY0TfxTnqWvKXGNO7YKnBXEP+PSf5
	s2FFgwOGp+Kga+FQp5fMjAf3GbObRmhlbWn0d8F4kGx0iyrpgUrK/JsgGT5yUy0pJsGCS9Ts+H0
	2iVpdatIQFoIZvbsFrOm9PU7kF21Jlay7q2HLdSnyFa4bycKSy/8CHrxV+eX2j3Rig3I85jjae2
	KQ4=
X-Google-Smtp-Source: AGHT+IH37wNkEhz3Kh3Sg+JvAHzqc4n3gX2HNxkJEROvKoGeOgsvuEujhAparcHpL/6WFVp/9Yf81w==
X-Received: by 2002:a5d:6d0e:0:b0:38d:b12f:60d1 with SMTP id ffacd0b85a97d-38dc9ba41e1mr8530261f8f.26.1739196379198;
        Mon, 10 Feb 2025 06:06:19 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd511e626sm6694401f8f.74.2025.02.10.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:06:18 -0800 (PST)
Date: Mon, 10 Feb 2025 15:06:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>

On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
> 
> 
> On 10/02/2025 11:16, Anup Patel wrote:
> > On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >>
> >> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> >>> Probing unaligned accesses on boot is time consuming. Provide a
> >>> function which will be used to look up the access type in a table
> >>> by id registers. Vendors which provide table entries can then skip
> >>> the probing.
> >>
> >> The access checker in my experience is only time consuming on slow
> >> hardware. Hardware that supports fast unaligned accesses isn't really
> >> impacted by this? Avoiding a list of hardware that has slow/fast
> >> unaligned accesses in the kernel was the main reason for dynamically
> >> checking. We did introduce the config option to compile the kernel with
> >> assumed slow/fast accesses, which of course has the downside of
> >> recompiling the kernel and I assume that you already considered that.
> > 
> > The kconfig option does not align with the vision of running the same
> > kernel image across platforms.
> 
> I'd would be advocating to remove compile time options as well and use
> another way to skip the probe (see below).
> 
> > 
> >>
> >> Instead of having a table in the kernel, something that would be more
> >> platform agnostic would be to have an extension that signals this
> >> information. That seems like it would accomplish the same goal and
> >> leverage the existing infrastructure in the kernel, albeit with the need
> >> to make a new extension.
> >>
> > 
> > IMO, expecting an ISA extension to be defined for all possible
> > microarchitectural choices is not going to scale so it is better
> > to have infrastructure in kernel itself to infer microarchitectural
> > choices based on RISC-V implementation ID.
> 
> Since adding an extension seems quite unlikely, and that a device-tree
> property is likely DT centric and not applicable to ACPI as well, was a
> command line argument considered ?
>

I did consider adding a command line option in addition to the table,
allowing platforms which neither have a table entry [yet] nor want to do
the speed test, to set whatever they like. In the end, I dropped it, since
I don't have a use case at this time. However, if we really don't want a
table, then I can look into the command line option instead.

Thanks,
drew
