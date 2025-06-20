Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A18428A71B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421048; cv=none; b=QH0FK8PQmlGwS1VvCpZsRrl3kd/lBaQO2n9YqO6IGGKkLX/MKQW7xmMMURelabKxSxyCovEGOuzeES+p1eQ/dYsEsssqM1oNLjpFfg/4C3L7cTQRhVfEH5kycZK1pu67VCZRKFeipGIFZBnFKVYErd2zyaSscPBZ0wp0Y+lNyWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421048; c=relaxed/simple;
	bh=l1Z6RZ+Jg/F0bsfyt7bxGpqft0eCD+Wo2GNzL0aL/xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DT5EnT21XtrWG6+ONrc+fRxivDUetlgA6jvpwahNqiqqz08mcIlmUj+Y+fMccgwUNJJB5mUDsk8PVmQ7oxSWit/SI69l4U4k6+tibIpj2RphZjj/CCCo8/pXBPQgRCwxOhOpeCsMJUDLrG2SiU4zqQshDDnA32DM9FoRBF5QBlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hTaPe6/q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTaPe6/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750421044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JW3kxfXMYL5iahKOftdvklIyRga4xpLB5+77DL7Pz9M=;
	b=hTaPe6/qfpZATNdEbXTfqSn94+igvssEc/Tszvlwno2SKMzZTr0T+qHer0FHxp9M9R4TjE
	tL3psX/uLfO2dkQxyr6lt61p74RhiZrhmIkvdp04QnDHxT8C8EvflojXBl2ymezvHcZy2y
	x231bOLvcIC9NGpRb9br5vcz/kl1Zzg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-yogXgJUhPYSLNRPvkIGO5w-1; Fri, 20 Jun 2025 08:04:03 -0400
X-MC-Unique: yogXgJUhPYSLNRPvkIGO5w-1
X-Mimecast-MFC-AGG-ID: yogXgJUhPYSLNRPvkIGO5w_1750421042
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d50eacafso10776715e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421042; x=1751025842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JW3kxfXMYL5iahKOftdvklIyRga4xpLB5+77DL7Pz9M=;
        b=v/tFoL33PNdYCokHtVrQOQexWEoMVc4JBNjFdqT9Xr2pUYxYdeLUK/Z/KUF+SGxZ9o
         dUVTeF3pquCSYAFabbsx5OJ61QpZQyjKcUp4l8acRdvkqK7d+muQsqxVuEnpNziBYFxm
         c0QRJv7Hc4ZcGVJCMOvL757sd1Px+AQJ/3ON0R1uNb63Iqw6ghKCSkX/l9Y/d/X+XPXi
         VZ1fgToR66LwmndnH3GLZb4PlPCQMxeqV9Z/DiAAIEU1bmMKYz0fnUwHnjwvhVcNexn5
         eNmyJprRMvKm7XWtPm5jF0+7NqYXHeu3A20Mt7DyqU/d+sY89liucL0Z15toYDabqPV1
         eABg==
X-Gm-Message-State: AOJu0YypWWEqLT5u9ttEJnhVuC9pRxUQ5P1EjUeQGoclcxwaJ5+tI2OO
	HQO5H1gM6KmVTN0Ojvzk44luueFGDCdChxLppZH9rU7avWHEmniG3J0UcrcfCraoOmYIg4zeFaq
	NQ1omB8e1BBMfo7vOSbLEhRQdB+nQ9xtcr5G/PEnlmf5Jbj6ZQbkhQIvewGadMQH7Ez02gE68CX
	dFTwti1wy3RSRW4bePOXpT57oX7QiJ+U29EbJUdqC7
X-Gm-Gg: ASbGncsznQ/8J7P1SbfknyEyy4iBvIHzA+nXv2FnUR4tHgtR4d7SCDFLg3fn2HdRcQX
	GLlWyjA4jdt+kUCo0hbAbi16Z17gdZBBEZagygsp3L/adTUd4juxQrzL1YYpBwtzYnMnHjeVe7W
	NoUVc=
X-Received: by 2002:a5d:5f8e:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a6d12bb6b6mr2193975f8f.2.1750421041727;
        Fri, 20 Jun 2025 05:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJzasLSc76E2amKmRvg22TG4v1hAFaZKZ2pNBS9y7yYicS3IGqkmtp9MKL+Y+V7M0fpDUlyS00yQ6bumKJzPI=
X-Received: by 2002:a5d:5f8e:0:b0:3a5:243c:6042 with SMTP id
 ffacd0b85a97d-3a6d12bb6b6mr2193916f8f.2.1750421041262; Fri, 20 Jun 2025
 05:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619180159.187358-1-pbonzini@redhat.com> <20250619180159.187358-4-pbonzini@redhat.com>
 <cc443335-442d-4ed0-aa01-a6bf5c27b39c@intel.com>
In-Reply-To: <cc443335-442d-4ed0-aa01-a6bf5c27b39c@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Jun 2025 14:03:49 +0200
X-Gm-Features: Ac12FXzbneTz5YpRMuZL36zwNtkuaeE1Xz-EjUQKtd3ZczaGjNE0oZuCnQ-GZx8
Message-ID: <CABgObfaeYdKeYQb+6j6j6u5ytasgb=t2z03cQvkG2c+owfOCgg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: TDX: Exit to userspace for GetTdVmCallInfo
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, reinette.chatre@intel.com, 
	"Lindgren, Tony" <tony.lindgren@intel.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, mikko.ylinen@linux.intel.com, 
	"Shutemov, Kirill" <kirill.shutemov@intel.com>, "Yao, Jiewen" <jiewen.yao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Il ven 20 giu 2025, 03:21 Xiaoyao Li <xiaoyao.li@intel.com> ha scritto:
>
> >               tdx->vp_enter_args.r11 = 0;
> > +             tdx->vp_enter_args.r12 = 0;
> >               tdx->vp_enter_args.r13 = 0;
> >               tdx->vp_enter_args.r14 = 0;
> > +             return 1;
>
> Though it looks OK to return all-0 for r12 == 0 and undefined case of
> r12 > 1, I prefer returning TDVMCALL_STATUS_INVALID_OPERAND for
> undefined case.


From the GHCI I wasn't sure that TDVMCALL_STATUS_INVALID_OPERAND is a
valid result at all.

Paolo

>
> So please make above "case 0:", and make the "default:" return
> TDVMCALL_STATUS_INVALID_OPERAND
>
> >       }
> > -     return 1;
> >   }
> >
> >   static int tdx_complete_simple(struct kvm_vcpu *vcpu)
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 6708bc88ae69..fb3b4cd8d662 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -461,6 +461,11 @@ struct kvm_run {
> >                                       __u64 gpa;
> >                                       __u64 size;
> >                               } get_quote;
> > +                             struct {
> > +                                     __u64 ret;
> > +                                     __u64 leaf;
> > +                                     __u64 r11, r12, r13, r14;
> > +                             } get_tdvmcall_info;
> >                       };
> >               } tdx;
> >               /* Fix the size of the union. */
>

