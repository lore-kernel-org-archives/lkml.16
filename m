Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0402236FF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747851563; cv=none; b=JdOBH9zX+g7TDTosqcTaIykdxqWIJeCBMjYTG8zu0pz8juNwMF2bJk3AdoRp+uGw0ZYQxrUu7loSclSEmN0Tqq/R/bmLhj6fojtrq7j6PVqKzODcpR69ivaI2UyKGxJn7gqZUNhPEjmJxwODxnAqGdoy2kfzoMicj9aSaN0+rmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747851563; c=relaxed/simple;
	bh=hNOCCsT7WfpiM1b/accfoXI44kJhoT550SBK2E3F0tM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sge2ZYPxmbM4UKtxq+TJKV/tYXt/1n6O6P/yPPtq8/Vp0jHm+zehOEMDCJrYE3hyczU8QX8WUui6drqaT9hrOk0EQMzDy/eGjOi8qnYFHr6vSw+7wKJSPOqdFu9ZQZHhhsWM4znO983JUy3RK+ypM6iws84Uy5LKg9ajkpd3GOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ei3xO6w+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ei3xO6w+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231c326fe2bso62344575ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747851561; x=1748456361; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpmXi2p97nfKGtbYPsKrqYABLynLWTxDiX5+ukiqgG4=;
        b=Ei3xO6w+KBdY1VJlYqibocHC+FO477mHl8m86z1QQWmWf2/OQjvrktvHdX0YrA/kQU
         w3tKexUyTeg0rwk1qBHLD8ZCvWuWMl692b0xVOdX8wKTJlDhG1HG9781NiXn+nyXG3dc
         R/mBgjKnicelO5NgDT+pGpFUnoUoIDxcgkHbnUJbwZd0iaY4kJHQkJJ8tCxUE/kQ/2k9
         RxkE2YAuWGf1JEkEpOCKR9Zc0liCGy/KVZ7Xs2KNlB9pmBepGRuuNINNauruUHSm3N51
         1soSl4WdCLB50Pm/kt7C5jjxxepx+z6jh6nmPSRTsIclAIB0H7uQir1UUwrsCv+D+ThD
         C8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747851561; x=1748456361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpmXi2p97nfKGtbYPsKrqYABLynLWTxDiX5+ukiqgG4=;
        b=SeyZ2tiOLw9dKK7kMd//OmT44l9AQ0KViUUJcTLZCts4CyLdLahWEvwQ6mTi4xHfqz
         95SN4+DFGMMHFLtAboIuWfjZNpdEBjjY8E1W2fzG9FV2izUyFnC6RUhGn+vIPBOyeUij
         r5+WA3UsABXRsmod8WMonHqNmINGxdfTmUasrwuHHA3pyNA6O4VxBpnuPu9sQVaMgrfr
         sN31+BBZwotAWUQeNl5wo13pp0dyMSzzvP9A6tMtsY6Q/dTldnWMPQu/HYpvXja+Jedx
         BdW4lmJILD8gujmZuSpqovJ5Vjz4e2y2glgUJqYzUVSF0z4fnhv/Ql7Tkb+LXp5v4V8f
         n7ag==
X-Forwarded-Encrypted: i=1; AJvYcCVJbcmp+GBo9hRd14G6L/RDUL9pxctDM6yMLIkB6MXd5od4ui/uaJQMBJTO6pe0sjp5GYWdLovyzLT2k8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsbS/C1rIpEKrhwi7elzZdYIQgFPMcCCKBrBeyfoTLqn0KpFWo
	QfX72UKiffnVORwYCBpY4hIatjpbv5O9P2mNu2YphAL24Fnip1XNDvzsADfnwKITN1p7e57xjcS
	iVC24/g==
X-Google-Smtp-Source: AGHT+IEVAnp3aJri/4G8yCbjAGvCZIIAYw69WH0s/hXr+QEcz+tLscv1MFZEYlYAAbnwEEtRsZruxVuyc5E=
X-Received: from plkv11.prod.google.com ([2002:a17:903:1a2b:b0:22e:17e6:898f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aec:b0:21f:1202:f2f5
 with SMTP id d9443c01a7336-231de351473mr239997055ad.8.1747851561301; Wed, 21
 May 2025 11:19:21 -0700 (PDT)
Date: Wed, 21 May 2025 11:19:19 -0700
In-Reply-To: <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
 <20250515220400.1096945-2-dionnaglaze@google.com> <aCZtdN0LhkRqm1Vn@google.com>
 <CAAH4kHai8JStj+=HUiPVxbH9P79GorviG2GykEP7jQ=NB2MbUQ@mail.gmail.com>
Message-ID: <aC4ZJyRPpX6eLKsC@google.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
From: Sean Christopherson <seanjc@google.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 16, 2025, Dionna Amalie Glaze wrote:
> > > @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
> > >
> > >       mutex_lock(&sev->guest_req_mutex);
> > >
> > > +     if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> > > +             svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
> > > +             ret = 1;
> > > +             goto out_unlock;
> >
> > Can you (or anyone) explain what a well-behaved guest will do in in response to
> > BUSY?  And/or explain why KVM injecting an error into the guest is better than
> > exiting to userspace.
> 
> Ah, I missed this question. The guest is meant to back off and try again
> after waiting a bit.  This is the behavior added in
> https://lore.kernel.org/all/20230214164638.1189804-2-dionnaglaze@google.com/

Nice, it's already landed and considered legal VMM behavior.

> If KVM returns to userspace with an exit type that the guest request was
> throttled, then what is user space supposed to do with that?

The userspace exit doesn't have to notify userspace that the guest was throttled,
e.g. KVM could exit on _every_ request and let userspace do its own throttling.

I have no idea whether or not that's sane/useful, which is why I'm asking.  The
cover letter, changelog, and documentation are all painfully sparse with respect
to explaining why *this* uAPI is the right uAPI.

> It could wait a bit before trying KVM_RUN again, but with the enlightened
> method, the guest could at least work on other kernel tasks while it waits
> for its turn to get an attestation report.

Nothing prevents KVM from providing userspace a way to communicate VMM_ERR_BUSY,
e.g. as done for KVM_EXIT_SNP_REQ_CERTS:

https://lore.kernel.org/all/20250428195113.392303-2-michael.roth@amd.com

> Perhaps this is me not understanding the preferred KVM way of doing things.

The only real preference at play is to not end up with uAPI and ABI that doesn't
fit "everyone's" needs.  It's impossible to fully future-proof KVM's ABI, but we
can at least perform due diligence to ensure we didn't simply pick the the path
of least resistance.

The bar gets lowered a tiny bit if we go with a module param (which I think we
should do), but I'd still like an explanation of why a fairly simple ratelimiting
mechanism is the best overall approach.
