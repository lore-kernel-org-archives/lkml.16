Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9A28C2DE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926629; cv=none; b=UJ4aQgD7wh453aMkqawXqoG6x0mJ0+tFLUGWxUMH6arQ0QnGyo/gFCIb9btf1WPHJGc4G77moZbt45EKIFSS8LfufelDi2qpxd4gxcRL+PNcW8LU8rvtQIFGagStYDC8CAWNn2RtPEqkcnfcxypsJ0Nyq6hQJ0PrtVafsf6ADxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926629; c=relaxed/simple;
	bh=YYhrOE1cK+L81lVnUGA6LqsneHvzz45zuQOEB0EhEjY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=los3twaa/L/6D9h1W4Muf9ft8NiiQv2dv7oCD391OR92vMeh+q4G4J20FDwHy3OPNAHq7ukyP9KuqSgC9uJVJ2eoZA44YP017+PL7NaBr6vfAUIv4vlSlwcWcC7yLq8E5wjrz9KIF9aX2No57zlM6sm1yNj1gPySNmuxWL/wI1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pQZWRqNz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pQZWRqNz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso1106252a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747926627; x=1748531427; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MYLNSxvlV/2+XNrO4U7Ev/b8Mi/FTtmMOlrIf+bWP4=;
        b=pQZWRqNz8pwpMmKGPM+c3++Whbtn3wyI4PuyF6E51My7hWAnZSKBp2qOuvn4SPVsXa
         W/eiWoQMXESAREJgNiWUV8kAjHvyzGR3He+M2HPMPbW3AeWDFZnCTTilK6SArfrAXt4f
         vdqFE7aBC5ipEtNnX4IojY7W1Iw9JeQTeiKFY+n30t6l0EMZOZvbDmHL2EAaX9qsbfBO
         fQwkxPtUIfw7xUsNzHSlgYj9Pk2q+JUY0lGO7jbuT0371oPWlRABhJlsuemzqkPblQAz
         l/tG/owIaXDC6kuD8kL/cP7goPsN468L43tmJkb9SMkl3uF87EwlODTA0nyq+IxeaoZV
         5YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926627; x=1748531427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MYLNSxvlV/2+XNrO4U7Ev/b8Mi/FTtmMOlrIf+bWP4=;
        b=RCK5hPoziSHt3tZ0MPNkwJftAZ67CE7Rtfys/3cqvLbLaZvGLEI4PaPiq6MXp/fnI7
         ThYUEFL4FKsLZEQjzfkw3bJEehy0CI/f86YFRXUj2QFIxuZF4R0SwkDUznvXe3gkZ7Se
         Ujnl0xDMQGrewniV4URAK3jbCRZmsiOinY+gh/4JbtcxSO4M2foMc0xwNqYaKL7I44os
         U8DPz/eIQvp3gLd8hXk8KwcayYN3d9mF+BePbFprPfF7Tn7gg1+wWY4zxo3W8nK7CCDb
         ZUNsuGYQ8nj8lH2mowLCQlrVdb+/KSaua/0aYFnO8HmHsvW9hVsJI2m2gp0eRs3fYH0F
         TVTA==
X-Gm-Message-State: AOJu0YyDxcTE4a9bKD2jDEZRJ2MH3214xdQtTRggD68tgNnjW0XNniu/
	g/wXWFepdXx3L42A4kWrgFNK57yulPeyfi2Pu3hJ0hYC8PzY2fSfYDJGzVwlj3btSvfP0HCa6Ks
	Sh1G9UA==
X-Google-Smtp-Source: AGHT+IGyNus3uPamyzA/fzloTmnqZDo6TIV08eJiG5wgx8Ug60jO9xsyHNoV300qiYR//Na4Yg4/B2E98Pk=
X-Received: from pjbsw15.prod.google.com ([2002:a17:90b:2c8f:b0:301:4260:4d23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cc:b0:30c:4f95:e0c
 with SMTP id 98e67ed59e1d1-30e830ec32emr43593450a91.9.1747926626934; Thu, 22
 May 2025 08:10:26 -0700 (PDT)
Date: Thu, 22 May 2025 08:10:25 -0700
In-Reply-To: <20250520010350.1740223-2-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520010350.1740223-1-riel@surriel.com> <20250520010350.1740223-2-riel@surriel.com>
Message-ID: <aC8-YaH3eNhtKnnS@google.com>
Subject: Re: [RFC v2 1/9] x86/mm: Introduce MSR_IA32_CORE_CAPABILITIES
From: Sean Christopherson <seanjc@google.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	hpa@zytor.com, nadav.amit@gmail.com, Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 19, 2025, Rik van Riel wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> MSR_IA32_CORE_CAPABILITIES indicates the existence of other MSRs.
> Bit[1] indicates Remote Action Request (RAR) TLB registers.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/include/asm/msr-index.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index b7dded3c8113..c848dd4bfceb 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -220,6 +220,12 @@
>  						     * their affected status.
>  						     */
>  
> +#define MSR_IA32_CORE_CAPABILITIES	0x000000cf
> +#define CORE_CAP_RAR			BIT(1)	/*
> +						 * Remote Action Request. Used to directly
> +						 * flush the TLB on remote CPUs.
> +						 */

CORE_CAPABILITIES is already supported and enumerated, it's just abbreviated:

/* Abbreviated from Intel SDM name IA32_CORE_CAPABILITIES */
#define MSR_IA32_CORE_CAPS			  0x000000cf
#define MSR_IA32_CORE_CAPS_INTEGRITY_CAPS_BIT	  2
#define MSR_IA32_CORE_CAPS_INTEGRITY_CAPS	  BIT(MSR_IA32_CORE_CAPS_INTEGRITY_CAPS_BIT)
#define MSR_IA32_CORE_CAPS_SPLIT_LOCK_DETECT_BIT  5
#define MSR_IA32_CORE_CAPS_SPLIT_LOCK_DETECT	  BIT(MSR_IA32_CORE_CAPS_SPLIT_LOCK_DETECT_BIT)
