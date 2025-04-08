Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4F9198A08;
	Tue,  8 Apr 2025 05:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088711; cv=none; b=ltQcplMiW0ADWaZx5Db7AdmMXwAqKgfHAow+yZOGY2jP1hldoF1Bn/HPUHiiur/Vk0htH+uaJ/qgIWziSTrZiLxYo2R/g2S2q+EN+JOS6Ztfm48Eit3+nakZpIfg6DbDgTguJB8AxupikTmC4qDrs3CftSiq0IZnw9E4zlJGAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088711; c=relaxed/simple;
	bh=r4sYCI3eGCFomhagjqBsfMEbGtkD0EgGMYSVpN8jcZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AENc9gpI0WBATXhrjtaXidX1/70u3eHLYnYqE0yEqRNyAKf/1y2TTPGy2HeH0VeZeAKzzgMSLomrYecB4RNcNCarSoWChfEsHQf7jthwd20V8IJT6xUZ/qhM0Ux6uN1Xw2mUAZmDE3jl0fwp9r4yB/fBy+D2wZNNG0K04/NtYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDGBrsaw; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDGBrsaw"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ed16ce246bso25207296d6.3;
        Mon, 07 Apr 2025 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088709; x=1744693509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkLeiApJavmt3vffoFAIEtIa4orwTPaDg96MLZ0acMY=;
        b=BDGBrsaw4izFJ8066V2w+ALxhNrNhnPM6tdNC2mhSVHuc+WGcYQfOydgW6PDXKv9a5
         nB/qLzVdfkSklinFQFmIN6j/oWLrYhFlHVMtBynGxbFKrZD6It7LIDPfDDP+VOm89VKw
         YMwpCdkhkEITYuxDC9b4N3gdwm1ZKrmNWrfTHQm3AJxeUcbXaUIJO60nYJL9dIW1JSVd
         yP32lkAaYo5LfHdkc+bB8zbFzPLuEtogSg9Nw+G3JcUP4L9IMvcXV1lo5kpWNFDi8lHC
         02Sw8zVpfs1N1jgrj6NmEaAsb0LMRwsO54aRr+nv5Wyogvz8iD2/6W6SVVc66rpVgBOv
         UDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088709; x=1744693509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkLeiApJavmt3vffoFAIEtIa4orwTPaDg96MLZ0acMY=;
        b=GqkcxHAKwYhWMzXpcxc3zhmqSWLEebt0+ChhxqUUPSXEumkAcvu/Cz5KtumHZF4Gyj
         fHcBtqct79fPjsNBPfAfOtSwGVAJdvx9p1B1rf8HIxzEkRubwBu3Q2dq0J7fhnGWIoUp
         Sk9Ap7KcDO7c9Zt8hML3I30Ukseoar3SaHtTU7Qi+TYQ5lmudjeiupi+7lwhxtnB0uN1
         ggzFbhvydI3M58FyGahokMpSluRIH4DxfTwLlnlzzLW4bRcsAQ0avWBzCgFzOOae3gBN
         ymdJh1wIDIOSEyiZUMYCK+a4cEntNj2wIYS87ZoR2Aqx5zVlcMuyA9BEMXe3pUu1Qquu
         QYEw==
X-Forwarded-Encrypted: i=1; AJvYcCUt0SJfSex4+a0KEsT15gOPTuVlnysvWg6DUUAhuA3IBWPc4AjyyCbGx0uyCobiin/bbLXmx0YWad2S@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQ1lXunkFls0ApXJJ7ihYCAd82+NxUu5uFRLTHG2zmEQ1CUmS
	sudmrB1Z3ME3xz4JyusKKKKf2gkjC+CEdRv/FrHBaan45Q+VbABi0mlBzg==
X-Gm-Gg: ASbGncsxGPXUrPpHZ7bGrl7+C5gYvPn5DsAavPvXIWf8TQ6Sp+qCKaiMJQtkQ3oBsL0
	FaVBF3UBFIg6oZ0mehtxygrhp3VEOGaw5y2p8+doHglO3dYkBtglZuZGOLbRMFDqeeoVp/BsIm0
	PbWGKevXcgY1xfvaT8xrXYl0SyPvj4GjALzquSWYrHiZotzsJ5EGGj2xILPXxInBo/M8Sz9OUgJ
	GiJAo46YrhYyl9z/XO3a061buwI70fv2jFkMvGMFALcERQRT5myvPx3IYTuYKHqETBZLuYQO0DO
	j19iLG9LA9hTv5w0mHiN
X-Google-Smtp-Source: AGHT+IE/P5hOkSt+2na7U2vn2DvilUGNVGTLQZ4nZrqEyG305OPEIPkhMI2Sm9DlOvWaiHcJ6f2Gpw==
X-Received: by 2002:a05:6214:2404:b0:6e6:630c:71e8 with SMTP id 6a1803df08f44-6f0584a4671mr273573796d6.7.1744088709430;
        Mon, 07 Apr 2025 22:05:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f165350sm69164716d6.124.2025.04.07.22.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:05:08 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:04:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <53p3hkwof2kyd2wujz5phvyeu7g6z6gb67hjthmdo74jn3fghi@cgbxxrisuw5y>
References: <20250408050147.774987-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408050147.774987-1-inochiama@gmail.com>

On Tue, Apr 08, 2025 at 01:01:41PM +0800, Inochi Amaoto wrote:
> Like Sophgo SG2042, SG2044 also uses an external interrupt controller
> to handle MSI/MSI-X. It supports more interrupt and has a different
> msi message address mapping.
> 
> Changed from v2:
> 1. patch 1: separate from patch 2 of v2 for better reviewing
> 2. patch 2: separate from patch 2 of v2 for better reviewing
> 3. patch 3: apply Chen'tag
> 

This should be patch 2,3,4. I forgot the first is the binding.
Sorry for the misleading.

Thanks,
Inochi
