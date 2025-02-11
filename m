Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13651D63E1;
	Tue, 11 Feb 2025 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257129; cv=none; b=WKwm2HlS8PBZCS06mVL/3iwFqLlHZeVKPzMIpE1TaDY40DkBuDJ3AyfVwZKJUNgZrRaXHgO9LktN5QYYOMWHyQ/bP79WtXlFCOyaN4gJt+qmvFLSeDWvVLCPhf36xL3cYmiTZEi0jj3wWV+dgSbUWd2izL4hyBRYeRwxDQlVvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257129; c=relaxed/simple;
	bh=y95fGU1MM4LPX/GdpJQ+n4qKaswP/rgFqTDMBehwQwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxvwFZNuVnj2+KV3dV5Zz2K4cLWLEVIoIDtGptmg4ENtuokSVN6qnXehxnA5ybpyjD+W7bX3xRrpYlrMOtOc85BxV/gj/aZQBUoYFF4+P/cXpD6Ibpow4xT25c5ej0UghytNJg6TDEpQz1zqtDjenJfurH2iT0GoQATM+gZr4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6XK7hTt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6XK7hTt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f48ab13d5so84452545ad.0;
        Mon, 10 Feb 2025 22:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739257125; x=1739861925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbbHUiRCm1HRMSRoMw9y9z9V16wOdtH431mNWX2Wxkk=;
        b=Q6XK7hTtOmi22PVikScQrm2ovExSK14zqArHqqPvK2x9jJwQ+kpSosadwddQzJ15Ty
         s370pbP0d4iRwDBPjysre9vecxzvV02h8Zj7JBGf5EDwZ+v1sg9Ilo2UpKNziaNWCv6R
         aBPlwGW6zViRtHPCmecMHaM3UNfxH+thGCS40dN/5FfQUOl0mlkEkfNU4pnCfbUdIz6L
         5WpOc4tffYKBUGvXPCUKwyK2Ucj2fKN5meMJ6uwRHwboOX0PrRPCaNFsSa+ENf4VxSYc
         6OI24kNjcu4xpImSOe/QxFZbMUI0TkejTV3joR6yldfCzvHNwdAg/3ZosySrFdI1PEgZ
         Wvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739257125; x=1739861925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbbHUiRCm1HRMSRoMw9y9z9V16wOdtH431mNWX2Wxkk=;
        b=JzHTwmAsSlX3yosbGhE8/J70YHRegnQKxZ27bMWV+o7pJPwponu9fW0cW/tyQl1TYr
         n5ZGyNhfS5XRRhYY9uZF8/EKmrVNoRI2w6c7ix2y4OlnSebtZ/sz4kuls8ujVQdkBPii
         o8CimYC93atMDVXAFIHEDReoZUKxcAi44KVpOADiYBwfjXZxBwep9YM/elKnh2CijefZ
         mBHHNTniBSOen474lmELCPw8WZiybE/WMouCh248nmgdGUF6NJFdFP6HQzsOQaVS+c/4
         kO3HjjQQWqT1g56YO6H7HBisDS69cblevx0Wa4Iwv5yjT3m0olvDkBlLQT2gSIoi6VIB
         CqRw==
X-Forwarded-Encrypted: i=1; AJvYcCUmmNtapueEIM5SNqIS5yoHH/eZIbXSvyX/nmDKHCOWkZFSQIU+HP2/gFmIs3NR1UxJtn59C4sU3tjurTZL@vger.kernel.org, AJvYcCVkhDbsh+kGlKYP9Jhx7klLoFYP8ZLerCxCZxxF2R+IIER3KX5cSqBYGuYjMWkUzix5z/dtvurOp+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5jUhbxSIRu6SzUrFTWHhsb/z6OekICqag7kJSS2WkyvOKnUh4
	pNxbQLNPtJcVYLWed22H6bzhAZSy2RqJKLIpQlJRouuagafglpyB
X-Gm-Gg: ASbGncvfg7HFCad50UC6VGJD2tBzRlpm3FsJm1EASkWKwwpD+B/GCl/At4h0/NwwmSZ
	0k8OKPcATEKGvJr6gg8wkIwrGI1XhOqF/n5Md9StvJWmBq9DKdRapufX9KR2TdJDDABkWZSSoAw
	tp/nxHSRTN5ufSx4bpIfA9rzH3nGvbrm46Mi3ecoEycraeCdXOBIhRLWk2Ym7FevAe7vV0eQeJd
	kIqgnSoIeX8oZIxYO51UC7J+LZsxUvOZyCqSJZUEVXEb9ieukTFlYb56bsOoIJPIgAJrY/W/yxW
	9feBvocwn7xp4N49qQ5K2anCi5/o0y97
X-Google-Smtp-Source: AGHT+IGGYypNjNwNWDfoiOb8NXySt3jh2IW0/2tkps6gTHppURLbDKRPahotbtiFs00rCt6CJbO61w==
X-Received: by 2002:a17:903:2f91:b0:21f:90ae:bf83 with SMTP id d9443c01a7336-21f90aec1bcmr150010335ad.44.1739257124773;
        Mon, 10 Feb 2025 22:58:44 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:fb40:c00e:5259:b412])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b5d0b6sm10215220a91.46.2025.02.10.22.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:58:44 -0800 (PST)
Date: Tue, 11 Feb 2025 14:58:39 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Brian Ochoa <brianeochoa@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs: arch/x86/sva: Fix two grammar errors under
 Background and FAQ
Message-ID: <Z6r1H5V-m_xuEu0q@vaxr-BM6660-BM6360>
References: <20250211025054.4062-1-brianeochoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211025054.4062-1-brianeochoa@gmail.com>

On Mon, Feb 10, 2025 at 09:50:54PM -0500, Brian Ochoa wrote:
> - Insert missing "to" to a sentence under Background
> - Insert missing "an" to a sentence under FAQ
> 
> Signed-off-by: Brian Ochoa <brianeochoa@gmail.com>
> ---
>  Documentation/arch/x86/sva.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/sva.rst b/Documentation/arch/x86/sva.rst
> index 33cb05005982..6a759984d471 100644
> --- a/Documentation/arch/x86/sva.rst
> +++ b/Documentation/arch/x86/sva.rst
> @@ -25,7 +25,7 @@ to cache translations for virtual addresses. The IOMMU driver uses the
>  mmu_notifier() support to keep the device TLB cache and the CPU cache in
>  sync. When an ATS lookup fails for a virtual address, the device should
>  use the PRI in order to request the virtual address to be paged into the
> -CPU page tables. The device must use ATS again in order the fetch the
> +CPU page tables. The device must use ATS again in order to fetch the
>  translation before use.
>  
>  Shared Hardware Workqueues
> @@ -216,7 +216,7 @@ submitting work and processing completions.
>  
>  Single Root I/O Virtualization (SR-IOV) focuses on providing independent
>  hardware interfaces for virtualizing hardware. Hence, it's required to be
> -almost fully functional interface to software supporting the traditional
> +an almost fully functional interface to software supporting the traditional
>  BARs, space for interrupts via MSI-X, its own register layout.
>  Virtual Functions (VFs) are assisted by the Physical Function (PF)
>  driver.
> -- 
> 2.34.1
> 
>

Hello Brian,

It looks good to me, though the commit message is kinda redundant and
confusing.

> - Insert missing "to" to a sentence under Background
> - Insert missing "an" to a sentence under FAQ

"a sentence" doesn't really help us understand which sentence you are
refering to, use "insert" here is kind of weird to me, too. Maybe
something like the following will be more direct

- Correct "in order" to "in order to"
- Append missing quantifier

What do you think?

Best regards,
I Hsin Cheng
