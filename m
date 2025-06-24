Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639D3074AE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803898; cv=none; b=jhPipGoJlNVH6Ub1qO14LVYb+dgkzDdBnJgmgnR8pr8tStzE7mhcgjSnycMgMPLWXk7ajEE4uIfrDENWQu0sPL3A9AfF+9NyOzAHDlNqmZM/otrmrCrjWHHm9uanuDmsoxdGJzg+1DF6I5wlW2E6oMHCXPxDNvlFd//mpdt32sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803898; c=relaxed/simple;
	bh=M8tRp22/sMyuUqR+0IZG348DKuT3gZaLvfRP63Puse4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qazC718VkTbljv8Oq/gtz9CU48juZ9LIwfCMpaAJx2MD+ncgN4bNzKmxyJnahOEBdYYT+OH6knXua5yE+U37f4wJtXNYxD5CuxmCOlpLSyaIIg/WC3+C4hIXhwgIlKRsdKQ2vle20l6qb+yTmBfBJgNFupSLZRdocUWfuIEVfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=buv57NB9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="buv57NB9"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235dd77d11fso55867255ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750803896; x=1751408696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+RRmxw0vNc+MjGHudRfd1EOnvQItAaBcR+Qj3ylW1A=;
        b=buv57NB99U4s0OTkxIRgGzq924OyhZCCxlUdP7Ez35ULEf2sdM14UnnHJxAHNtTVu0
         HAoIycv7Fh3a4zwXTwadOakNKWIUSkD7PylQ3XrVr0njV58AxPrL9+pG/yM3VUoaBlOU
         dPiySEFy6ZMPXDWuiuPFhBsGGupRxaVU+kvW7tFFSfBBL4rMiBRkMVlRo8dmCTP0T+wJ
         95Z9SjG/cqjAWa0Z0/DGWXrNLJ3Hod7UY39d1GwRbU1q+D2lwmJoabrD9dFDs2R+9how
         ENYmUOyk0oAfKRvdAGwd4epfPQ67DTFQddWqqkxotx61Y4/IouzFQSBdBea5I6XxQ/Je
         J8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803896; x=1751408696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+RRmxw0vNc+MjGHudRfd1EOnvQItAaBcR+Qj3ylW1A=;
        b=jBuecp7FTLJVynPhCWzDt6MQQcqIeAaKav0hZSjq9zZgjmc0zIk+bAYZIP+w+Ejgs/
         SDX2FPmXbeQ9mkUa57+9I4CwHzcz2vYgWydrCC6tGnEJVZZRidGJUEyFPvmTFF0L93zj
         /TAY/ZBa+bRk6yNypzxKwuDlXKy3edYwvYegU1izO6xna62TfxubNag008NM6ff/8ndm
         Y8Yn/3BIR4wAF61PXXFALk3MFmcvOQirwcIsI3hI1/1GvGSwJVWQpGR3Hbyj6xsbBeM1
         i7L6yTdEp1sfGRr0HxHFmjQOzRAuJ5jbjNjWUvJIaK4vvkJaXzRw86ITfweqMpIhsdj3
         vo7g==
X-Gm-Message-State: AOJu0YykVgCII967j2G74O1XC369gS2JMMLaFObZcrt+2R2JoDaL+4xk
	vcpPnVZT3sQkq2GgcB8EEl7DyDscVoKJxKji98rO5S8yFW+nJrpt3/BG2PJKDh7TUGBs7IgE4dz
	Zq8jXFA==
X-Google-Smtp-Source: AGHT+IGBeu5ngyY1yhhSotJLBYldYv9GqeNgeeCIEhnaSUDNylXnlWXHbMuRvZbrjLbKWwSscRNgfealq/k=
X-Received: from plbix22.prod.google.com ([2002:a17:902:f816:b0:234:46ed:43f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:244d:b0:237:c8de:f289
 with SMTP id d9443c01a7336-2382404744cmr16704635ad.36.1750803896230; Tue, 24
 Jun 2025 15:24:56 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:24:54 -0700
In-Reply-To: <20250530185239.2335185-4-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-4-jmattson@google.com>
Message-ID: <aFsltm1Ce24OA0nd@google.com>
Subject: Re: [PATCH v4 3/3] KVM: selftests: Test behavior of KVM_X86_DISABLE_EXITS_APERFMPERF
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 30, 2025, Jim Mattson wrote:
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 5649cf2f40e8..b6c707ab92d7 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -10,6 +10,7 @@
>  #include "ucall_common.h"
>  
>  #include <assert.h>
> +#include <pthread.h>
>  #include <sched.h>
>  #include <sys/mman.h>
>  #include <sys/resource.h>
> @@ -2321,3 +2322,19 @@ bool vm_is_gpa_protected(struct kvm_vm *vm, vm_paddr_t paddr)
>  	pg = paddr >> vm->page_shift;
>  	return sparsebit_is_set(region->protected_phy_pages, pg);
>  }
> +
> +int pin_task_to_one_cpu(void)
> +{
> +	int cpu = sched_getcpu();
> +	cpu_set_t cpuset;
> +	int rc;
> +
> +	CPU_ZERO(&cpuset);
> +	CPU_SET(cpu, &cpuset);
> +
> +	rc = pthread_setaffinity_np(pthread_self(), sizeof(cpuset), &cpuset);
> +	TEST_ASSERT(rc == 0, "%s: Can't set thread affinity", __func__);
> +
> +	return cpu;
> +}

There's already kvm_pin_this_task_to_pcpu(), which is *almost* what is needed
here.  I'll slot in a patch in v5 to expand that into a set of APIs, along with
a patch to convert the low hanging fruit (arch_timer tests).
