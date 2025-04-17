Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED619ABC6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744866558; cv=none; b=idnxr4sOcP5bKdiks9c/p6cCulOiZyiEFYEBvFNObYNWrnCrctjSgalFfLWAGclL68dGLrVRCGXQ+2fQQ+pHiWWa9B+MK90BO9cuYdojjSctpKcP0GVR1wccWg59Nl3/mXZZI7ngaAVmNUY1piQrlyQZaolELrQbjRXIolqt88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744866558; c=relaxed/simple;
	bh=5w4FOljkzJbGGIXWHxTmPupRaWvAl7cIsRzK2TOG83g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAhJoFTEiDzkHXWXAvsDKnCPieuFKkg5UYGffENIpy7MbPFPam3LkgCwHa4ubwBYS77em4harN7Cm4/Os6bzov+r5AoG2Cgndxsequ3Im8NsMe9vWNVklVfORHBO5WHwBxO3qUYHoi3XM+83iK2/Xmu3QFSLWHJeZSJLyuC8V5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IYT3clgR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYT3clgR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso4317345ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744866554; x=1745471354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvmisUd6UaTKf/W6iowSm0gUPOkMDXnF7C2h8jm0b2g=;
        b=IYT3clgRZsawKluTsvmI6Iq4FMzVrkOIB1CBTU3Ec834M0/t5w3NLHJUz5lfH5wnSK
         asQrvY6nVYyazaSFD4HaP76Ey2fkjiD7eEB7t4mduU5HDTWRDZdPo830sAvYZlXyppZC
         dqimxp9Hck/x94BkbLHvrd/qBt5IAIrjtT4GCu0gepMEZfFUz4wz5KFVGEEWBtMOewU4
         NK0MT0QRUBWzU5yfDCicpjO9fS6gfrXug3whAm5jjPBZR9LAztWlou4FpUlIJZO0G6Y4
         rPrCL79yijjvP8Lx1Ec+ugnaL9uEBnD++bx0uL+o8/YBbtU2fO/05j4Ynf4Ky5+PXs/0
         cpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744866554; x=1745471354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvmisUd6UaTKf/W6iowSm0gUPOkMDXnF7C2h8jm0b2g=;
        b=dV6/IVN7smF4KFFI9uA8VyhdANq4Gx2JJ2Jdwop5X3SfccX1ske9LE5P95jhqeVlvx
         FOOopblkd++ZBT9deghEaO4++Y8QVqIM6CHHcoqNE8KPhbvpVvaH8Q0GZ8qNB6JED2N2
         MCqsKGOibZjfcfrB0MWbirzBFmY2AXZcP3SDBNwPFshsh6wvn7AfHFI+JSlaouyCQcP1
         XsgbPvpyOMGsBLBHEJZKX+AeNKPDlvLGymEwrhfo3hPG34yVqteJYb7Df5ul+F9Sbgmw
         4Y6FOZxg1ULY+ZW6QXVV+ClMaoemdZTYJrurtMNDO9FGKX/HKdpJrI4h2jpu7wtbbsCz
         HZtQ==
X-Gm-Message-State: AOJu0Yyby2tmjgjn7mLfmvRfF42mSURbXPInbRoPHYcEPjkfNtJj6e3P
	S0s4NftV86XaepG3Vwf01htqJMTOuNFEVI+Y9elcR31oHrL54uoXdM5Z8WFRA5M=
X-Gm-Gg: ASbGncuPdzd5/hbYWmoyaY2Z5pfaS3VW4rxupaKayV6BkSdvicTXb/d09K8Tnl85nGB
	zhE/d36sDXXGoYeX8nbfuz8BFXO5St7uG+0rJSqo5Nl8XlsjxeBAV4ljBJPeHPPIWoq3IOW+zbZ
	WqHSnEi8EVs8/tX3NT1mL2p03LNJpZSiyllmIxPg9I67HYUXBDrE5UxNWRYo1zKix3nSkyD4G4c
	9vKLI2dDnnQiEI5qagvVlacH1k0Xx7B0veBsp4tQbailPh8OGAsikYq8XUADiuauKqBLzIFxPzH
	J1HyzIIryXcSJrwa5W9H1WtH/JTq5tQFuYkm7O1exg==
X-Google-Smtp-Source: AGHT+IGMA5MKbOii+J+XmRiRHvR+u7zUVn/vas+G2cyV8a5scK4dReH5B1deiIw76a5aPJ0OUXCMww==
X-Received: by 2002:a17:903:2344:b0:224:76f:9e59 with SMTP id d9443c01a7336-22c358c42c3mr73689985ad.10.1744866554088;
        Wed, 16 Apr 2025 22:09:14 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef10c3sm24138845ad.30.2025.04.16.22.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:09:13 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:39:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nicholas Chin <nic.c3.14@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	rafael.j.wysocki@intel.com, rafael@kernel.org,
	vincent.guittot@linaro.org, zhenglifeng1@huawei.com
Subject: Re: [PATCH] cpufreq: acpi: Don't enable boost on policy exit
Message-ID: <20250417050911.xycjkalehqsg3i6x@vireshk-i7>
References: <2c788c2ca0cab09a8ef4e384f272af928a880b0e.1744781329.git.viresh.kumar@linaro.org>
 <20250417015424.36487-1-nic.c3.14@gmail.com>
 <20250417050226.c6kdp2s5du3y3a3j@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417050226.c6kdp2s5du3y3a3j@vireshk-i7>

Copying more information from Bugzilla here (Nicholas, it would be
faster if you can put all your observations here first, more people
are looking at emails than bugzilla).

> Nicholas Chin wrote:
> I did some more testing and debugging and it seems like when
> cpufreq_online() runs after waking the system, policy->boost_enabled
> and cpufreq_boost_enabled() are both 0, so the set_boost() at the end
> of that function is never run.

Right, this is what I wanted to do with the $Subject patch. Don't
update boost anymore in suspend/resume

> cpufreq_boost_enabled() being 0 indicates that the MSR has boosting
> disabled, but when I read out that MSR using rdmsr the bit seems to
> indicate that it is actually enabled (I am aware of the inverted logic
> of that bit). set_boost() seems to be the only place in the kernel
> that causes that MSR to be modified, and I didn't see any extra calls
> to it in my debug logs, so it seems like something else (outside the
> kernel?) is setting that MSR.

And this is what I feel too, something else in kernel or outside of it
is doing something tricky.

-- 
viresh
