Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF18A48
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749775776; cv=none; b=dtpt2JEY6ctGAwb28Bu0sw/64vyBA4JGeGMDoej6nxrtfeIfylWhwe3dDREnpsn55QZNiuG/YZHTa5Y8vZtT4+TU5I2Cm++KHmgdieClD1zHBIMMkJuLunHBLQMYJ27jBWUrAHhDMfB+ilh0l/nxzXCytBOI+F64Ec4IbnzbTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749775776; c=relaxed/simple;
	bh=DAqvbA0hS+o5KtM7opWCVp6MBsUfRtbBNRaWQZd+uVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BVu6OSBDDnUhhXxr5UXQj2RrjEVBjYuequ+z4TaLtgcvQnIOMc3YdHDlm+E/pQP1MgIyvhH0Kgv5uc8xZ6PWHa9HHsInYsQMHdTDm6R253a4Gs4TpMFt1ds6LRsTUQkq0L03Ucr8AKffFhWSpJBZHFyl+DcXUVXQ6f2lDr80rYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x6W/DK1P; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x6W/DK1P"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso995244a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749775774; x=1750380574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FvmDiCBlAa5zfliAxjVzhpZvlPI0T0u5Y5VHGSwwmo=;
        b=x6W/DK1PYQlPxFNP9mCpMVQWy+G2qIonCWtLQwQD8Snq3FEfJd4BYYXCjd0kLYz1fQ
         Uqoz7KA9JnXXcJTGW1EMNuYAAnGl7GVkZM1SvgIWTsnbryFAKxG75ppoTSKC1CMq4Lzt
         RutGWX6Sz3jaxeAAmW6uZ9N8c0M67coCZ1brVpkBnxbBFZv/tnEpoqENULlJvQ3/+D4g
         xWwRqaQMD4fO1XbHnB7BN1KaIbZZje/DgFaMNnlCfxOOkkKppxsm3VukY8taO4RGgkTI
         ecWEo4lLvJOnv0FxDhGhhsK3AUkuJS9Ckz8lApk5GXeLgE3gHKC+SB3yWf4dBlXclpIp
         UKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749775774; x=1750380574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FvmDiCBlAa5zfliAxjVzhpZvlPI0T0u5Y5VHGSwwmo=;
        b=JKxU7YccM0FyDjAaTQYYEa0+p5sZr7bUsHulav7YIBGqPZdpHxLK3bai54oJbFNbIu
         nGQvdoVHvGnjd4i141LXtG1DadtWLcqHNYU077SD3TnSirmkikF7KwNqwy9eotZxFsTl
         4+PEPAGVYIh1DSsu8CNI+GxRmQ8YWAhUOnv2xn9eAqJ28Ii2CgstzMQKKzKicaIAjEgH
         1lORWOrYVxwTJ59xYwl7bLFSnzH9ctWSMWgXMKmEpZ3C68YoGoNqYLYtNPkLk1jUMTmr
         lRWcis76geGq7kgrd4JeW0rApmwLZ+wEaifrKa8hNy98bVTbzfwMY4ibaTG0aDEM0dtR
         Zp0g==
X-Forwarded-Encrypted: i=1; AJvYcCWUDPh18aZD3tRyz+MagfOAfViQurYgyLtB+PaxZ2MYO3Kml1FArRv7/MzE2jnijZxf1ec+0gAXoA6vCL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySyVfswCj/cUmzJiABz/ZKRmdgJZ9FxoqRLyhsl4Bdf9SjYokR
	NaCcNQrruggE2C3Eyrc+nRuttofU/8R1FEtc3VzS0qI/TTEP0SDZEngjMtb6USTSIBs/2B9+Z8o
	q50uStA==
X-Google-Smtp-Source: AGHT+IGCP/N0twmUMa5/oxWlMNDiWLm2BmTdK3OLsZcM14ETDa111hrsNNaEPSG7f+8WEkfL1n5NXpqhx2Q=
X-Received: from pgbda5.prod.google.com ([2002:a05:6a02:2385:b0:b2e:c3bd:cf90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c781:b0:1f5:8cc8:9cbe
 with SMTP id adf61e73a8af0-21facbaed3amr1149706637.5.1749775774647; Thu, 12
 Jun 2025 17:49:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:49:33 -0700
In-Reply-To: <c90e3ceba8a47b2139e3393c44e582c5a7b7d151.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com> <20250611213557.294358-6-seanjc@google.com>
 <c90e3ceba8a47b2139e3393c44e582c5a7b7d151.camel@intel.com>
Message-ID: <aEt1nbNvQrL4xrkn@google.com>
Subject: Re: [PATCH v2 05/18] KVM: x86: Move PIT ioctl helpers to i8254.c
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 12, 2025, Kai Huang wrote:
> On Wed, 2025-06-11 at 14:35 -0700, Sean Christopherson wrote:
> > Move the PIT ioctl helpers to i8254.c, i.e. to the file that implements
> > PIT emulation.  Eliminating PIT code in x86.c will allow adding a Kconfig
> > to control support for in-kernel I/O APIC, PIC, and PIT emulation with
> > minimal #ifdefs.
> 
> And it matches the other (existing) ioctl helpers which are under
> CONFIG_KVM_HYPERV [*] and CONFIG_KVM_XEN too.
> 
> [*]:  The kvm_ioctl_get_supported_hv_cpuid() seems to be the only one that
> still remains in kvm/x86.c but not in kvm/hyperv.c.

Ooh, yeah, that'd be a good one to move out of x86.c.
