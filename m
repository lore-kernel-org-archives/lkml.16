Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B81E4AE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854954; cv=none; b=fzLe5bcvuq5ogy7Ijv2kHFie0uG5t8jWEgis2UM7qi5ieDZBIuEnocNYOffs1vUET4bhCi7k4pKEoZI6UNqZitZrHl3QpVyUdiEgnGc1+dqMwhC9HtWtaTqGcFUx94kCXmg9lzhm7XXaLwl6Bqlx1NdMGPtdKzG7CLEXX/D6+N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854954; c=relaxed/simple;
	bh=SLebeACRWk6qkca7RgE5fIsKlUh7V/TWthkOW1zhXWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXdys17IL3i1Tnnnf4Bq3SnTRgkyFqyJTY4kEX9+4Wnhwx9YMklkMDByAW4qnxuA0oB0of/c34w30oa/ORPGNj74D7poEE6KLpKPtDyift6nVYpDq7K5wI4CV3r8emqD6nXmbRziIAaW24syJjQ7kl1NvoGCbeheCmX51IlFZJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYsfV+vB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYsfV+vB"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso1004815166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854951; x=1751459751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2q90HEwNHGnz4Upnp0RKX2HlMlf/DYcXUBx0PZgzyaI=;
        b=GYsfV+vBdq2r/fCfRNo6xqUgbZWjHpoC67wkOZGQz8HFEGXQbaJGy4tL3j2hKe1qxq
         17kZKj91GWEVG06h0X8V5Djk7L4DjEWU2xd2xkPWEHqRM7BsN/pktt3nUJ8b/xRNMlgd
         GHkKAnoY9ilXLdql1LcSUF/T3fbb5zGlsXbmpgbQ+IETtYIHer51dFFyXCfIknavxKwA
         8qkSD6a8n3sFfoeDPWpkKzBbaZmI6NzdEabK08tLxmSQnleEkOp78KUcxdaIucS2KKJm
         cT52RjPEFT89TRG+yrle8SQJnlZYZbTB5w+UY2jz9Ctl1UhKehRwPEb14mRHAYBlB0OU
         aFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854951; x=1751459751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q90HEwNHGnz4Upnp0RKX2HlMlf/DYcXUBx0PZgzyaI=;
        b=Oe3mnybJLUnUHH6Bo7geM7RCW3Yx5UZ0Rokljs2tXL2WtiETb6Y3q9aqz7DnHLdBSJ
         /Aags/xX44mDo1aVFPVZDGHx7v8OIKwio5qqYZmQ8H0tPbCxuyrAkIDa9DJ0ztgTDWmQ
         BROkDmdlTS4ddmljD1HfYrV8JGO+gl5wFzPDbi0cXiOgk9aoPOBkHtGqwxk4W8EKsV41
         77qmy2z8Y/PVR4geauoH/2/ACrVaXdKle+v3CoE5U1mBxAG/FK/qxh6AIDi4Mt0RqRdO
         KTDDZsnwQYg20KwfVhKDTns7rrDtkcheXalEMn+h13V6khdWa24Sc1ghli2mi7qZqtH/
         O0BA==
X-Gm-Message-State: AOJu0YySmR0jR5FNOFdhuSGb7FDC6W1YIRSGFZxZMU6CyWQucA/HCbbR
	m6+Cm4KjSURapoWTN5j43LzqdYucglRDvo/CdkySbNvQmJ/UTqAdY1FhPfroj/zgke5vY86mxUL
	0uNKEvKRU
X-Gm-Gg: ASbGncuUKmmwuQ7wbpUd6ocSQJMhtm3NvaWoe1loY2gGaQ49ulkcp9mRxgIUk1bxT97
	0hA4qpdwP5o6GAZ6G6h6vB4s8gCOGvKCANL1J1exETOYf7CuCtjT8PfUUCZnGhcdFrfHzWA80bx
	t7EVapDrTiVmxufdj09zZ0jDmyQPKe+C4+heo5EL+oJj7kHeQfQed0MWl3A+esR6Udd6mj3MBxm
	Q5MIVPaIBVp5pRoaM9s5vTpG7Bd+Y6pJTCkzI9FvLLOPAg3m7DR4bOXCcf4C9xVFKp8kLenA5lD
	nVyjJ56pEDKykPL7DAdmhbvi5ghnD01viAh9fCxFxL92vbvO+FXErJz3Wpig5n/RfJCD1ivnCvh
	pxu2IeuIfABNVqsaCU3+p/zbdquNFuUY=
X-Google-Smtp-Source: AGHT+IGeu1vPbCuiY2js0cAMuyaqjySismzGJ98ewnju3a81TdzXuUCosTL/BoTdvitPihCLhN4tkg==
X-Received: by 2002:a17:907:7254:b0:ae0:c5a6:80e7 with SMTP id a640c23a62f3a-ae0c5a6ad05mr220312566b.16.1750854950527;
        Wed, 25 Jun 2025 05:35:50 -0700 (PDT)
Received: from google.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae085beb7e8sm604860966b.41.2025.06.25.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:35:49 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:35:46 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Fix error path in init_hyp_mode()
Message-ID: <aFvtIn5SuoAmlvvD@google.com>
References: <20250625123058.875179-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625123058.875179-1-smostafa@google.com>

On Wednesday 25 Jun 2025 at 12:30:58 (+0000), Mostafa Saleh wrote:
> In the unlikely case pKVM failed to allocate carveout, the error path
> tries to access NULL ptr when it de-reference the SVE state from the
> uninitialized nVHE per-cpu base.
> 
> [    1.575420] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    1.576010] pc : teardown_hyp_mode+0xe4/0x180
> [    1.576920] lr : teardown_hyp_mode+0xd0/0x180
> [    1.577308] sp : ffff8000826fb9d0
> [    1.577600] x29: ffff8000826fb9d0 x28: 0000000000000000 x27: ffff80008209b000
> [    1.578383] x26: ffff800081dde000 x25: ffff8000820493c0 x24: ffff80008209eb00
> [    1.579180] x23: 0000000000000040 x22: 0000000000000001 x21: 0000000000000000
> [    1.579881] x20: 0000000000000002 x19: ffff800081d540b8 x18: 0000000000000000
> [    1.580544] x17: ffff800081205230 x16: 0000000000000152 x15: 00000000fffffff8
> [    1.581183] x14: 0000000000000008 x13: fff00000ff7f6880 x12: 000000000000003e
> [    1.581813] x11: 0000000000000002 x10: 00000000000000ff x9 : 0000000000000000
> [    1.582503] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : 43485e525851ff30
> [    1.583140] x5 : fff00000ff6e9030 x4 : fff00000ff6e8f80 x3 : 0000000000000000
> [    1.583780] x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
> [    1.584526] Call trace:
> [    1.584945]  teardown_hyp_mode+0xe4/0x180 (P)
> [    1.585578]  init_hyp_mode+0x920/0x994
> [    1.586005]  kvm_arm_init+0xb4/0x25c
> [    1.586387]  do_one_initcall+0xe0/0x258
> [    1.586819]  do_initcall_level+0xa0/0xd4
> [    1.587224]  do_initcalls+0x54/0x94
> [    1.587606]  do_basic_setup+0x1c/0x28
> [    1.587998]  kernel_init_freeable+0xc8/0x130
> [    1.588409]  kernel_init+0x20/0x1a4
> [    1.588768]  ret_from_fork+0x10/0x20
> [    1.589568] Code: f875db48 8b1c0109 f100011f 9a8903e8 (f9463100)
> [    1.590332] ---[ end trace 0000000000000000 ]---
> 
> As Quentin pointed, the order of free is also wrong, we need to free
> SVE state first before freeing the per CPU ptrs.
> 
> I initially observed this on 6.12, but I could also repro in master.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Probably worth adding:

  Fixes: 66d5b53e20a6 ("KVM: arm64: Allocate memory mapped at hyp for host sve state in pKVM")

With that:

  Reviewed-by: Quentin Perret <qperret@google.com>

Thanks,
Quentin
