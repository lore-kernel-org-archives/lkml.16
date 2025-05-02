Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3384423C50E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182155; cv=none; b=XPf9hla3j7mqCIt0FThf0lnWSXdjDK9aR+AJQqirMGtl5/BXeFsff3ovsStjjAClZzq7i5eGNl8CLLBolnN3KuIuwPXAy4HEdhWRV6GBHA4+uSywbYXPKiLs5vVXZZtO/JDLHpX6d5Ex0VZYn1YP1+6+8TWZFGKFSmPjTcelAKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182155; c=relaxed/simple;
	bh=YMQVxwaVMwAxpI4MOStKXhl9OZJMpJXac6MsJyy1J3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cm+//6Y/r/kBlSeuS8iKgJXGUzDmoZqyTgpxCUXiR2/kDTxHAq88SUFlDc8jzMUbPOl8jqLba0bPQuUJ8gctoaKPXi3N3r6ZpRygWVOdNOM88oUb6Fny9jnwxyi0kn3VbEDaHrGn6GPINod+ZSTdITTeu/FatacxT9l0leEVD6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cuVaQN/Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cuVaQN/Z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso33535e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746182152; x=1746786952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtsSgTJXGapsZiIyWX9A+s/wE2QFs3U8FxXWY4U190Q=;
        b=cuVaQN/ZyIKpcc0wGMKAMMVlk1BQnYKmut8vlOYmvPq5trK2WMchffaMheR6JWn3bp
         WLdxFSfPK1cT0P3UHd6ODHAnQhXOpuqiqoHZj0feg24oEXefNYYxDTpeXppq+aBvTaKl
         svU3LXvQxXIIzqHcNhGOv8HjXrAbOhyjv5y5+dmy/xFJPpYrkkBprVX926xm0ZpAm7vY
         12fD5KffIu+Yyd+/oEBHCLWhRzNh/qYqXtbxbNl9nGwrfda2Q/f3g0Wz8Clz9qguknFA
         mZ/cbg/FfGsKB5foB9wyZPdcmognynfosorT9/Ls64dI+6937Lqklu4/46h99grk/WYq
         /cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182152; x=1746786952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtsSgTJXGapsZiIyWX9A+s/wE2QFs3U8FxXWY4U190Q=;
        b=WcR9rhYTma/P/GZRbXALkQDTRhAe4D+z1+YcOZCzZDX6qH0NOh8fEOGvzw/XhenfCa
         i1O4YftiaTfBdiFLgU3Cesy3Kiz9w01f6DAW0QLjwOr61TpTjC2mS4LlGHic5poX7TNL
         kLYfT1aNFRyXg8dtY9KIX7hbCRWtMiameceZy2QdzArusBuQEjEImSaNYC1hlbXAnbr7
         upDTNdrU0ZBnA/ophImEvH1Vurj2dW42svPJr1VEW8WbHealXG3cnyieCQbCuUIaB/LL
         XucNxj4qR6mlPTivgVNIEY6mrQbXRIZXau8Joa5vJnxCAykjN1t/PWbInwXGSuwZuwkl
         Ld9g==
X-Gm-Message-State: AOJu0Yz0c6pz+WI89DRtS3syHpPsgybHOQXkdBKCW8JHRt95QnCPffMr
	vrj52Qo+d2eilXzRbrAQjIdaNT0YhHNaSmls6UqMRA2Ekw9g0LyWSMTjerzX5g==
X-Gm-Gg: ASbGncuLFqFaXZUUl+QSwpV+Q8tBZOamlcaraFQvNrUmeUR+KKDTgDrOjsXcQaQIyn8
	I3HbFhY8tZTeglDFYB51VxfHgZaJPa4wIIlBUR2sEc2K42aj4UxgNQRhPaUdLBryMLNeU5bVICo
	CGOPfVikUEPWYbJdMaqBwjO647Qaxc87WO6qKqlvFSNz6gV9mWcTePnngIYbm52y7HftYiviXEd
	GcmTRxYwUiKhV2f/d4P5SzT+99DedfBwOlTMmowaXxZNUHHX4GTeadpujqj3MfXHpTFDq+toZNr
	eahHEjy1rfKEFeHEHsTQ3zyEKVN7QFzg/QEbUiTzbeju6vBqwFysIX73XZLJoA7TG02Yto81Epx
	5RYK0Ly5cscnOYNPy
X-Google-Smtp-Source: AGHT+IHBpu5+Cieu3gqJ8jXxnE8iNjMiOB9PP9JbLSiZk2YmB4uIxV8AkyqehbOtRxJxY1xSoUA/kQ==
X-Received: by 2002:a7b:cd08:0:b0:43d:5b3a:18cc with SMTP id 5b1f17b1804b1-441b641d324mr1930065e9.2.1746182152313;
        Fri, 02 May 2025 03:35:52 -0700 (PDT)
Received: from google.com (207.57.78.34.bc.googleusercontent.com. [34.78.57.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a0csm85602295e9.18.2025.05.02.03.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:35:51 -0700 (PDT)
Date: Fri, 2 May 2025 10:35:45 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Per Larsen <perl@immunant.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	james.morse@arm.com, jean-philippe@linaro.org,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	qwandor@google.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com,
	armellel@google.com, arve@android.com, ahomescu@google.com
Subject: Re: [PATCH 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
Message-ID: <aBSgAScZUp9qIspT@google.com>
References: <20250502092108.3224341-1-perl@immunant.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>

On Fri, May 02, 2025 at 02:21:05AM -0700, Per Larsen wrote:
> Hi,
> 
> The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
> allows registers x4-x17 to be used for the message payload. This patch
> set prevents the host from using a lower FF-A version than what has
> already been negotiated with the hypervisor. This is necessary because
> the hypervisor does not have the necessary compatibility paths to
> translate from the hypervisor FF-A version to a previous version.
> 
> Support for FF-A 1.2 in the hypervisor is added as a precursor to the
> addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. The bulk
> of this change has to do with the upgrade to SMCCC 1.2 required by
> FF-A 1.2. Additionally, unimplemented FF-A 1.2 interfaces are added to
> the list of unsupported functions.
> 
> Tested by booting Android under QEMU and loading Trusty as the guest
> VM and observing the SEND_DIRECT2 ABI being used successfully during
> guest boot.
> 
> (This is my second attempt at sending out these patches; sorry about
> my broken first try and the resulting duplicate messages.)

Please tag this series with v2 if this is the second one and include a
changelog.

> 
> Thanks,
> Per Larsen
> 
> Per Larsen (3):
>   KVM: arm64: Restrict FF-A host version renegotiation
>   KVM: arm64: Bump the supported version of FF-A to 1.2
>   KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
> 
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 235 ++++++++++++++++++++++++++++---
>  include/linux/arm_ffa.h          |   2 +
>  3 files changed, 221 insertions(+), 17 deletions(-)
> 
> --
> 2.49.0
>

Thanks,
Seb
