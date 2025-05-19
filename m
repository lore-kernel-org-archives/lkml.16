Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0813528368E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672483; cv=none; b=c4p+bDlI2gshp9eVUe3VDF03VTD15B6Lk6mSirpdHsnqvz0u+7nRQn0ykTTFRIjgr8Pv+ZKPoPyLB7Oo+bB/n5O1ZrgdN5UA38KLXSQEKsrOsXyBMaJABZdsXTutQT2faZTs1RENVwZAo5bA3qrk6K2RgHLDamorgiKit+KkGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672483; c=relaxed/simple;
	bh=HiNonMtdaAz5TQIcX+lq1jeBQ2cEztMYiD+glrCqktA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nTSzcSO+J5X3iuZt4KLZ+2dh0m2bxK0+rjerfuB3jMP2L+zhdaZQVOqnCls4uW0v8nH3OXQAK6fCf75p9QYCw/KiwCPbbs54xCsmThvkfaLNQuLnxUfw73/o+APcArbFNUk1pOMH3Kf4NHl9g1ZDM6vPv03Ck/VgPQrMffUk0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FZW72mIb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FZW72mIb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a39fa0765so7052009a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747672480; x=1748277280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zv3GTZ1OQoWAPfijjQY1dYYsvZlBkqwnY1otuI5HeM=;
        b=FZW72mIbIQuzp36nN3i/VvCuZ/uZReNsePRa+yoChufQN2OobUEXwnWxLlHtOXsYWj
         0dOBiEFAGYbQeIezPSzlj9uWNztmVCJbQxVrUOacd6/xbheIZRenJeBAmQfmTFQRDeUl
         SluEkv6MptjrWNbRUoAiG0CEz2/iya9oK1LE6Ei5vTUyLPJoDAh/ct60Sv7snbASPGq2
         bqIa1Jg99kCKM3PhApDBv6aIWTGN/UtzgoDaVf6spI8FBVyo/KggJjGLcGj2Av0t/kRn
         DDC1vLz/flTPhRk9HHD8NyHQfP9acLrBJ8YII3ZMraqEHdJo3V4GyAH33efrrNkAx5cn
         hSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747672480; x=1748277280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zv3GTZ1OQoWAPfijjQY1dYYsvZlBkqwnY1otuI5HeM=;
        b=HeaP786yhhpFy363PUj1h5hHr5hNs8N/R2hS1+L4gpJSsCRtd3duKDziPucuKraW2f
         iqRmWbX+q9F35dACFkt1oKWmLiZdQYHZzPEQafxTaLgDfQiuj/9cW8JNjU2OaXPwNX7K
         ScU+BbBzss98VRs2Yt+wVWXFEIoCH247ygYb81FrpEB+EJeJ/jbjE3b+et03hcKXrYZg
         U7ONdOkU4P4CbRdM88zzMz/TjHf38Sn5MoKkL5aOmBJdVI6D6grpO95q3Vk7r99sb5Tn
         pC+bqqNL6C2SJD406TGbJX8WGHMLFp/BzRKjgnppFuU+SjMHehTgZ6oqrszGbT1KGR3b
         m9ug==
X-Forwarded-Encrypted: i=1; AJvYcCW14d2ij3S37rXeuZfAg74tEeWXqgjw18pO80OwA6HtDmRVYJif3rpaCcF88xBdIdgXQjD7+eKSfH1SUiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFOpYBSVTPB0FrPBx6xXhvvUAahi7QH95XLNRdoCSuNLXxhEs
	oEip7UxRHoNrj1y5CQoAnSOJMJUmb1WMi14ZgZuY6KHBHQz+ubkNTK6rgK50uCbj2D2mygMPwKb
	olVhDlw==
X-Google-Smtp-Source: AGHT+IF7Pp0SGv2aGgzlEI/adpem8+WPZlHOMtK6iV/1Zu8WqJx6oDl5Gz/qVNTkZFz9jTihYXpZXJvKkyk=
X-Received: from pjbsw16.prod.google.com ([2002:a17:90b:2c90:b0:2ff:84e6:b2bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d4c:b0:301:1c11:aa74
 with SMTP id 98e67ed59e1d1-30e7d5a84a3mr22376515a91.28.1747672480225; Mon, 19
 May 2025 09:34:40 -0700 (PDT)
Date: Mon, 19 May 2025 09:34:38 -0700
In-Reply-To: <aCg0Xc9fEB2Qn5Th@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com> <20250516212833.2544737-8-seanjc@google.com>
 <aCg0Xc9fEB2Qn5Th@gmail.com>
Message-ID: <aCtdnqqvIbHr-ed5@google.com>
Subject: Re: [PATCH v2 7/8] x86, lib: Add wbinvd and wbnoinvd helpers to
 target multiple CPUs
From: Sean Christopherson <seanjc@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Zheyun Shen <szy0127@sjtu.edu.cn>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Kevin Loughlin <kevinloughlin@google.com>, Kai Huang <kai.huang@intel.com>, 
	Mingwei Zhang <mizhang@google.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, May 17, 2025, Ingo Molnar wrote:
> 
> * Sean Christopherson <seanjc@google.com> wrote:
> 
> > From: Zheyun Shen <szy0127@sjtu.edu.cn>
> > 
> > Extract KVM's open-coded calls to do writeback caches on multiple CPUs to
> > common library helpers for both WBINVD and WBNOINVD (KVM will use both).
> > Put the onus on the caller to check for a non-empty mask to simplify the
> > SMP=n implementation, e.g. so that it doesn't need to check that the one
> > and only CPU in the system is present in the mask.
> > 
> > Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Link: https://lore.kernel.org/r/20250128015345.7929-2-szy0127@sjtu.edu.cn
> > [sean: move to lib, add SMP=n helpers, clarify usage]
> > Acked-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/smp.h | 12 ++++++++++++
> >  arch/x86/kvm/x86.c         |  8 +-------
> >  arch/x86/lib/cache-smp.c   | 12 ++++++++++++
> >  3 files changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > index e08f1ae25401..fe98e021f7f8 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -113,7 +113,9 @@ void native_play_dead(void);
> >  void play_dead_common(void);
> >  void wbinvd_on_cpu(int cpu);
> >  void wbinvd_on_all_cpus(void);
> > +void wbinvd_on_many_cpus(struct cpumask *cpus);
> >  void wbnoinvd_on_all_cpus(void);
> > +void wbnoinvd_on_many_cpus(struct cpumask *cpus);
> 
> Let's go with the _on_cpumask() suffix:
> 
>     void wbinvd_on_cpu(int cpu);
>    +void wbinvd_on_cpumask(struct cpumask *cpus);
>     void wbinvd_on_all_cpus(void);

How about wbinvd_on_cpus_mask(), to make it more obvious that it operates on
multiple CPUs?  At a glance, wbinvd_on_cpumask() could be mistaken for a masked
version of wbinvd_on_cpu().
