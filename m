Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83254B1E78
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698474; cv=none; b=d+Hn0/9NiosHCW1r7aWFXR1GgGpKfRlD18NM5+3K3OzBO+XjhW2muNubbPxG5zbiLfh0mJs9RpB0Z90Qz0Y/2+5otz1JMjHNhdCrrxh7kWSaEtkicfwJFlHQCtUjthNNbJe1VB6guGg6wq3nIwtYe8bYPTxgtAlUA+BwIHh6Ov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698474; c=relaxed/simple;
	bh=yCmPbavZasXyZK2LzAOfmhkicxEWdieO3xsj3pII0v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXNCZq04mSvmn18CXYXHRsrB2mB5EP4BZV47xphn0ClBT3wsjrULEamI3a48j+2SD9Xo3l+lETbRpq1G14yxRu4kNCjEV4I25MGgM0xLdZDU+HmbhiuMJR25sk/YWnruijmns7pMDtu9QwJ1DeD7OLEjlZ/wI5qKkaIrAU86xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tH7SxnWE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tH7SxnWE"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3104ddb8051so7951541fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746698471; x=1747303271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKuIs4bD7hmTmBBuWS0gS4IWCByDc925DpPRPOTwVhk=;
        b=tH7SxnWEsKdFK19bIvq/rjG38oXvNuzxNwTsFAK7G1nCCoLp8SZgqLUIr1KM4U9WSj
         Wh/vxAPbfAw5in9PVHx5KFZgacVwKyFTlOR/vPHrVXSqKx7e/pSWmLd555vxTHMBps/N
         IcAzZlFc1geRLCi82WACPXiW+awlqpJIIxZrpsNtQvTRp5kx5SDz3VCF5yzL7qWMzr40
         tJvevSnTlz6f3ebmCE8HUbP9Rv/LTFKExdoSAPHRSCb8pMdGBmUhbhdY0RvEdUHxebh6
         NyHmEg6Bt24tzv4u3PGps25sc7rjig+6SXD/DZouK7qPXIXnmNhWBJWhAo7YjSthWw2D
         62LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698471; x=1747303271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKuIs4bD7hmTmBBuWS0gS4IWCByDc925DpPRPOTwVhk=;
        b=ZAXT3Ia67lcJ0xdE9GxpHru1UunIgu2OONgTpHX9xKL2H9RkAyWDR6TNnN/JRUHcyi
         053fIqWbQaFEXvX0H67CD+TwnJG5rPCceNVNHNWvC8aY1av2zA+1udtFkrjaZ1lXYfPV
         IKk3ouL7n7UoymNKr4kL+9qafGxZfDrYS7SyLCJ+zX7HyqEIX9siln6sneJ3eWehbCXb
         2Ns1OSya5TZI7Iijoh0qRSBt8zVATNOz8dEhU1E54e7YxfhnVWO2hjHrfqwE7XQbJx+e
         ejloGbFP+FV/OFqM9OqTWQvqLaKWCRY2jr5Thi6EQ8UJmk2iWXByC5bgmLx1zaefpfGX
         UnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Sy6V96Kd98k30yFkXKMtvhDlLbgM1qqf4D7HTKlxgtzuabkSqTr92J7X/6MkS0nrPfLcxcjHAKOGY6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLG+LVqCAJmIWFLxWrIXrYKj4b42wHZavHpxiJh4qhymn77Pm
	o5EmQvnpvuGT8kkQ8vWqw5yLfAzkaI1bus06mxZiQOXvz0eyH6t3m1IeggkC2AP+icBiIq8g9ux
	+q5DZ
X-Gm-Gg: ASbGncsPsdKGfraYMrFe6bRfwg6j3Bm3Mgmj+9HL0dFENhkHV7b4x2rKDIfOfD0WB1v
	bKaeW7pfuO3RlhPU16bkSLNzqG1I1O5gs11gB9WHuCyw977ts+1bM83FdrOgW2I7nRCOXkxOMw4
	1o/+xVC8jolWcSuTEh/dcNCoiSuSa8q4iNbeVl0TmqLW7h0XrXKKr2zPcX2x7zx/L6i5zZgDEPN
	BXw913wg1GDz/l0j19X2aCtUIG0eHi6FDFB3e6kEA31BhJ6kZXR7Zh+XgU2emMiuC226kaHhQ4w
	rp2c/Cq9TXV+9dQ6d5aRFrjFKYqnJ54S9E3izp9fNdMXqC11FNmABJ03/pXbpijaF8lbi6IuHnQ
	xIx72NkczqrLxdEev8A==
X-Google-Smtp-Source: AGHT+IE/s7lPN5vUCzksRaYR2B7bj4kJTFfHdhYwtVVBT+3QBxGeiK2BZt3LablW7b/dF67NnuKtHg==
X-Received: by 2002:a17:907:7249:b0:ad1:fd0f:a0b5 with SMTP id a640c23a62f3a-ad1fe6fd715mr244883266b.30.1746698459943;
        Thu, 08 May 2025 03:00:59 -0700 (PDT)
Received: from google.com (201.31.90.34.bc.googleusercontent.com. [34.90.31.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895095d7sm1054555166b.151.2025.05.08.03.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:00:59 -0700 (PDT)
Date: Thu, 8 May 2025 10:00:55 +0000
From: Matt Bobrowski <mattbobrowski@google.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v4 2/4] uaccess: Define pagefault lock guard
Message-ID: <aByA1wael6H4tMo8@google.com>
References: <cover.1746598898.git.vmalik@redhat.com>
 <39416cac1d011661601caffc6ac38195c82ede86.1746598898.git.vmalik@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39416cac1d011661601caffc6ac38195c82ede86.1746598898.git.vmalik@redhat.com>

On Wed, May 07, 2025 at 08:40:37AM +0200, Viktor Malik wrote:
> Define a pagefault lock guard which allows to simplify functions that
> need to disable page faults.
> 
> Signed-off-by: Viktor Malik <vmalik@redhat.com>
> ---
>  include/linux/uaccess.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 7c06f4795670..1beb5b395d81 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -296,6 +296,8 @@ static inline bool pagefault_disabled(void)
>   */
>  #define faulthandler_disabled() (pagefault_disabled() || in_atomic())
>  
> +DEFINE_LOCK_GUARD_0(pagefault, pagefault_disable(), pagefault_enable())

I can't help but mention that naming this scope-based cleanup helper
`pagefault` just seems overly ambiguous. That's just me though...
