Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38B3225408
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833445; cv=none; b=rETPC/8XJXDMf0FUAuqmnBpfhtySyNaaBG31pX0+Vrdh/lEwMqLUR3Y2tOE9UrMhVicSO7PynEDCeLvY9KuoZIohMJb6syzPRcuLXVokhxLCjQvcJu+Ns8GRRiiX0w1l9xZPIWY67SRKCRvA8f0nI45kF6BXWd/cbxYXxeaCwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833445; c=relaxed/simple;
	bh=SPW1MpibPJJPCFn9tndl6Uq+3fkjI2amojgThKHlRQ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m5Y8712g0TdUb4MmmavaHUtIZWFiGGyCXiCMWVRc6Nahiz4n1P2nzQYjw4xYhTzmf5+QWCXQucepKQmOJMK6dLak7KaGr0JftIByEmA9ezSa1nKb0VmxvO9yD6x/WDx1xvj8Mib+lJ3WbsUsmLq+OoLjqyYCTbrE5KMrTE9rrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=splbi0Ic; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="splbi0Ic"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224191d9228so861725ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744833442; x=1745438242; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsr3Sym5EnVlObQ9ms+4mTSeWcKm0cqjA7Xbtohjbg8=;
        b=splbi0IcfmO8izXhyyQw2FwhMrwJhxw+gBGa2dE/vwZUvlrlsCH8B2s8XrnWo1TaiD
         NBHQyTiUfAchzvnCC0LQYvK2v4bQSPveJ30WPjo3dqEs7sx5YaKnKm2h/B3Uho9WP7Go
         bP6DWJ/gQm4n44rfwMi2n6iQz680uxp6eJY5jplI/xjfPKec1+Nnp2/n7D8H0RlJJ3nk
         Sn5maUDpR26YfBkXNC48vcSVBujPB4Hr8pQEVa3V08yqLBHZIz7yQ4jSCGB7zHxnzRn6
         CumEE5mjEPxjYSD0zqIcRtH7ewDA54skOhnmEBVGYeaQ6mCWnIjP67P/Pu//ITiv0teA
         5biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744833442; x=1745438242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsr3Sym5EnVlObQ9ms+4mTSeWcKm0cqjA7Xbtohjbg8=;
        b=S5BBf6nvUpZw3Wqa0OImwVh3DnZHYTnjluF1icjO4zNij8dWMZMz489wUzuK1SNz0Q
         LTJqaxmJeZJWRC6lTNpDz9NSRgsApOeLsulrOW8Wwv2Kc+VMEuion4l4wjBh9c0XoShU
         RhjUem9nJqs0f/3piX3I4n1xxRrbn66xoALKewi0NjVREUnI8wIlZlR/wi9Enyb7eC2O
         n7KBx95WTHmcyIor2A1h9eprYiJtz0zDeqViQ+6rLu5HU+Af93pti69CM2kQarB2r1Bc
         tQnhbH94V/PGygKbFT00sUVtMsVxXjqVdVR7MMDuw4yEC6E3hGfAEb4n7VlmzZs9flmU
         32nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHRRsGUjmsLolcSh2v1TfB/USdB8yOfiHfN7rt96cswztpvD2AWNChgNEZxTyNpLJlQbnwFextg6KE9Qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjR/L9Vy4A48s0Azeykr8FzjbU5LUUzVkUe1SUox9queOIBFQ
	rRo2raXIBe5WJ9cN0dvssLLRYruUvmNFrAEpLnZdVLAwD2RoLdqvf1my6XvGrgMb627TRNySISf
	wPQ==
X-Google-Smtp-Source: AGHT+IHCGL/TAH+EuKJMST94asqDjCByRtbTL9XrPSBTMvVf0ZDUGZaBF+DRAIr0VkkNGS+oY16r+elfqIg=
X-Received: from plsc18.prod.google.com ([2002:a17:902:b692:b0:224:cc7:127f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d05:b0:223:52fc:a15a
 with SMTP id d9443c01a7336-22c35974379mr47512325ad.33.1744833442066; Wed, 16
 Apr 2025 12:57:22 -0700 (PDT)
Date: Wed, 16 Apr 2025 12:57:20 -0700
In-Reply-To: <20250416190630.GA1037529.vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401155714.838398-1-seanjc@google.com> <20250401155714.838398-3-seanjc@google.com>
 <20250416182437.GA963080.vipinsh@google.com> <20250416190630.GA1037529.vipinsh@google.com>
Message-ID: <aAALoMbz0IZcKZk4@google.com>
Subject: Re: [PATCH v2 2/3] KVM: x86: Allocate kvm_vmx/kvm_svm structures
 using kzalloc()
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 16, 2025, Vipin Sharma wrote:
> On 2025-04-16 11:24:37, Vipin Sharma wrote:
> > On 2025-04-01 08:57:13, Sean Christopherson wrote:
> > >  
> > > +	BUILD_BUG_ON(get_order(sizeof(struct kvm_svm) != 0));
> > 
> > There is a typo here. It is checking sizeof(struct kvm_svm) != 0, instead
> > of checking get_order(...) != 0.
> > 
> > >  	return 0;
> > >  
> > >  err_kvm_init:
> > > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > > index b70ed72c1783..01264842bf45 100644
> > > --- a/arch/x86/kvm/vmx/vmx.c
> > > +++ b/arch/x86/kvm/vmx/vmx.c
> > > @@ -8755,6 +8755,7 @@ static int __init vmx_init(void)
> > >  	if (r)
> > >  		goto err_kvm_init;
> > >  
> > > +	BUILD_BUG_ON(get_order(sizeof(struct kvm_vmx) != 0));
> > 
> > Same as above.

Ugh.  That's what I get for violating the kernel's "don't check for '0'" rule
(I thought it would make the code more understandable).  Bad me.

> After fixing the typo build is failing.
> 
> Checked via pahole, sizes of struct have reduced but still not under 4k.
> After applying the patch:
> 
> struct kvm{} - 4104
> struct kvm_svm{} - 4320
> struct kvm_vmx{} - 4128
> 
> Also, this BUILD_BUG_ON() might not be reliable unless all of the ifdefs
> under kvm_[vmx|svm] and its children are enabled. Won't that be an
> issue?

That's what build bots (and to a lesser extent, maintainers) are for.  An individual
developer might miss a particular config, but the build bots that run allyesconfig
will very quickly detect the issue, and then we fix it.

I also build what is effectively an "allkvmconfig" before officially applying
anything, so in general things like this shouldn't even make it to the bots.
