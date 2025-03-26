Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F961F55FB
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028924; cv=none; b=bYE/Eq52dUow9r+l0xGFclYPb3fVi3kR+Xbq8CVI7PtEBZAQLMJo9M0eXsc/OT8eX7Wsl9NcdYdL2HQHxTMAUGBOg5LT3Q3BTyge8QvS2z7CzG3EVG51EfE9/H6Cmap+3cCGSjmJni4tc8ImJhoIq3XecqTAeJnoMYgr92o01Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028924; c=relaxed/simple;
	bh=AbWkigPd0QkLkTgXoysYAH5asAePIGZGp7Nv9IKt5Tg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H6ij1EJVKAXk5l7NnjXPh8kslbzJyQeVEbow7isg3Hr7IdqNHguDdic2TAITIzMCECMpLwPW17VYZd/Fmq9NRUzs4onjTx7zSN2/nxfs7LscD8ayb6Rg246Xvd0ViSIg+gvI95kAbHG6sZMnzOioFtdKcr+lM4cZZ9fTQ1FsQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ka/SXI/x; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ka/SXI/x"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241ae15dcbso7539515ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743028922; x=1743633722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KqH3Q2jgpouZEVkOO8Bb1Ojl5Go4pZMng8lP/lx7p2Y=;
        b=Ka/SXI/xn/viMb8FWyvig0p5njgN6FQz+ke7I0cm67nSBfUOcMXXhv6M/KfM7dQb/s
         UCKAdjvG/PxCOKyV6YTJooiuiOIPdv+34wh3T0hLeg8J4u9tHz/8UlYQIzFSYqJH7h6B
         v/TYJAyswFUn1rQXopgeljjkR4ViqcExpLnJ/WJjJ1yjqyNTJr8Qoi2W/SnRYni0huU8
         ylm9MWnV2A0VBWoRsWg4X9SPAPEwArvtvo63EcrQt3dkBUyAG31+1ZD5/vJ/8OPPPSRc
         vghMygky2grJthgjg4VIsz8wx795UI9MGndxEdhv+8fjNtSifE0E1P3+GT9uIA5t9/sG
         hNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743028922; x=1743633722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqH3Q2jgpouZEVkOO8Bb1Ojl5Go4pZMng8lP/lx7p2Y=;
        b=ScnZh4o9B2AOIEy3i7fy0Zivq33nB5U4sOI9f1gtv3r2brGokdUT+WZcIDd8Ti5iFi
         7MMXmWGk6pTC2sCD3FAzoz6d6E1qXDvbO1aDAQIz3qrMHeqOuDZrrWg7X5oNuDEY9Mcp
         xCbzH0s0pAqoRa9Lo59NTwh6or9McZHsNGr5fi+ZT0LOfFwV6jNYKIa9pu+9ZviZFPlA
         +lnbQtfIaPWhiMJ0ElDp/+V9ZD9lXII7OUzl608TZWeuBVVL+fYZhZKmeQlJdJfPaxrG
         vwArsf3ru+mvswaQZrPr1xCHtXcoKIith2Fy1MX1VsXyHfB3q7qm4g8SmAi/sc9mpDQU
         UyGg==
X-Forwarded-Encrypted: i=1; AJvYcCUdpFhEZ42iC2b6msCoClpgZUBg3sQp5/KHRvbi01Lkweo7kBIH76KllYONtE1cFbGIEBCjYD0uxJ21T60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyboQpkZqJTWIsNFIL+deie6utJ5dYSGqi3rvXotlwWVQRo9fnG
	h7qa9zmWAmZr/9XUyH/2j7AalU/oLRl0EOMgtznL79b2rQ0ipXKQc736c7X+xOPY43xZQIVbta+
	75A==
X-Google-Smtp-Source: AGHT+IE7jpn3hz0DvE2VgEstnENVTCX8dh1jBNBDLDNRPJuJX01TLo3BnVQahHmZrbhz36uFKjKUTDhpYUk=
X-Received: from pfbfa14.prod.google.com ([2002:a05:6a00:2d0e:b0:730:7485:6b59])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce02:b0:224:1acc:14db
 with SMTP id d9443c01a7336-22804882b2fmr22534895ad.29.1743028922455; Wed, 26
 Mar 2025 15:42:02 -0700 (PDT)
Date: Wed, 26 Mar 2025 15:42:00 -0700
In-Reply-To: <Z-R8xRbsjv4lalAX@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320013759.3965869-1-yosry.ahmed@linux.dev>
 <Z-RnjKsXPwNWKsKU@google.com> <Z-R8xRbsjv4lalAX@google.com>
Message-ID: <Z-SCuESxIaOR0bCw@google.com>
Subject: Re: [PATCH] KVM: x86: Unify cross-vCPU IBPB
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 26, 2025, Yosry Ahmed wrote:
> On Wed, Mar 26, 2025 at 01:46:04PM -0700, Sean Christopherson wrote:
> > > @@ -12367,10 +12381,13 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
> > >  
> > >  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> > >  {
> > > -	int idx;
> > > +	int idx, cpu;
> > >  
> > >  	kvmclock_reset(vcpu);
> > >  
> > > +	for_each_possible_cpu(cpu)
> > > +		cmpxchg(per_cpu_ptr(&last_vcpu, cpu), vcpu, NULL);
> > 
> > It's definitely worth keeping a version of SVM's comment to explaining the cross-CPU
> > nullification.
> 
> Good idea. Should I send a new version or will you take care of this as
> well while applying?

I'll fixup when applying.
