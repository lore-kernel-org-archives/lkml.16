Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A531AE875
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747785116; cv=none; b=kTwpvLW0ZKVinb9YKnnwiTDhhPx9OKFeujiMBcUF4u1e6t9G/5P3D+RXpsWi88/LXb4v+FKoQaSeIP3gKF9bkTTANeJQ07t2kZ1LTkO4ITAzKHtlhNBf3q7ygry+/NAtO8Yr4nsNUTTgJfep0GEpQwrYqyATpuSq1MPLjCAj91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747785116; c=relaxed/simple;
	bh=B3PIdaofAJCL1gtUtpYDYYdhAIxOHvUYqxon7uAGepE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIM2g8Xb8EyrucDq6+fAvnDZ7kAnx94UxxEqY7dMFuk5lziUJmrOWL6uR5a5vbv3GuoCMtPnLpkVpmT04egwEwbsbRwv6G88hKeqTDe71s2mfywkH9KUcGVZXOJ2pHsR52qAXsjVV9PhqXXFXgTKk8wnim/Bk/l6PeSQ+1EK7iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F4jUzqgp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4jUzqgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747785113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oCx6DibYP4odc57ay/ENqMjE+rQ2YsxE6Q4XHEh99BQ=;
	b=F4jUzqgp1bdoVcq18Kes4saiyuJspY/tYPQxNsaBwHxkajpheBZXb8YLC5eJ/eMPvLqb1+
	gRfZ0QeBJm2IVSccLV+Ro8PsfS5OjvWusHTieVQzBrZFd4YGAB5e3UzrsbhVLSL/TaRlTo
	LpmfwiglODj3RKFOF5JaM31itEHgw1s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-Wd6tBYoVMYi3tHRqUfH0Ng-1; Tue, 20 May 2025 19:51:52 -0400
X-MC-Unique: Wd6tBYoVMYi3tHRqUfH0Ng-1
X-Mimecast-MFC-AGG-ID: Wd6tBYoVMYi3tHRqUfH0Ng_1747785112
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso74395506d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747785112; x=1748389912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCx6DibYP4odc57ay/ENqMjE+rQ2YsxE6Q4XHEh99BQ=;
        b=HwW6zIu55cCsC/P/bbxw4fHTfl5A83Wri4pKIyvXjloS988e6iCKIEdjBhx15nCojp
         6Zc02NwNXhk1kTgdQsnWxJTMULZFis5HnxOSRnucHrHyveJl1ILIS7utNHZG52RTGCXM
         cDDS4kK8dx0zExKCpWWaEAYtPEwmepkM5HL5XLnuUe2tboWKlE7ESU74hJncN2ZSn9Gt
         mZNX7J5Cllln01wRw5Banlhz/BYBbsxyIUhVzXD/2EBAhhZVcMxC9QuT4EaRzZkOOIIU
         4MXZVVEk5inI7ANAS2bsAowY0te/9C9fzdpEmwzV0rrI4754P/xlIeifdTOeUMw/NYJ9
         7eWA==
X-Forwarded-Encrypted: i=1; AJvYcCU40OEz6y91+Xws1fXrFgVvR4G+eTEx6RlMbDFBzFexiA5sj0F1Y0c//KrUhYfFFIP+dqqaVv7d8jI3chg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5AeYkipR6+72sw/SOsivXsVnW0YLHp0+15DUTL+or10zAICX
	LNydlxcCwcKaSqcWxTPJEUi58sVEfCEltHTtn+O7I1L3Uw4xv2K+1BBSENhwz7A8tMjm2C8m4aO
	2xKZK6BOS19bCprdvz9LLYarZhlIoRH2Vsh9OIOTsEz/vb4WU7KHwiSiCUvbSnnfnvQ==
X-Gm-Gg: ASbGnct6QWLnotBBQG0cKfHsac8rp62uiv2cirftPsf5PCTf2oEd776+HXN2fCquAEU
	Ff0rMiPkPxbbgIEoiZQkO6pg74Oh5s1zpa50+ARq43B1J8k3ZJIcLGrNKd9gnNh/DhRl3e/gAIB
	wZYEgWupGlHKPxPWwTOHup1JB2mVG8Y55cAOENVip3t+Y0oR7dpYWTBIHSjzvPN5+vIzW3wNF4+
	4UARyw+7ohKWkXxCv3gosmg40VFAWtnK4clRvGpnFl26BBloT7gE5ZWnbCkh2MRD2kys55oZgNx
	m9I=
X-Received: by 2002:a05:6214:1ccf:b0:6f5:fb5:35f0 with SMTP id 6a1803df08f44-6f8b08ceac9mr260631286d6.30.1747785112061;
        Tue, 20 May 2025 16:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEIlVPypnzo7S17o9PUvy0BEqpDjhoUDhLWxqeEPyI/VDnHBmzee3xdJ1BWCBv4uvKxjhQrw==
X-Received: by 2002:a05:6214:1ccf:b0:6f5:fb5:35f0 with SMTP id 6a1803df08f44-6f8b08ceac9mr260631076d6.30.1747785111728;
        Tue, 20 May 2025 16:51:51 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0988e08sm78045886d6.125.2025.05.20.16.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 16:51:51 -0700 (PDT)
Date: Tue, 20 May 2025 19:51:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	James Houghton <jthoughton@google.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: Re: [PATCH v3 0/6]  KVM: Dirty ring fixes and cleanups
Message-ID: <aC0VlENyfE9ewuTF@x1.local>
References: <20250516213540.2546077-1-seanjc@google.com>
 <aCzUIsn1ZF2lEOJ-@x1.local>
 <aC0NMJIeqlgvq0yL@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aC0NMJIeqlgvq0yL@google.com>

On Tue, May 20, 2025 at 04:16:00PM -0700, Sean Christopherson wrote:
> On Tue, May 20, 2025, Peter Xu wrote:
> > On Fri, May 16, 2025 at 02:35:34PM -0700, Sean Christopherson wrote:
> > > Sean Christopherson (6):
> > >   KVM: Bound the number of dirty ring entries in a single reset at
> > >     INT_MAX
> > >   KVM: Bail from the dirty ring reset flow if a signal is pending
> > >   KVM: Conditionally reschedule when resetting the dirty ring
> > >   KVM: Check for empty mask of harvested dirty ring entries in caller
> > >   KVM: Use mask of harvested dirty ring entries to coalesce dirty ring
> > >     resets
> > >   KVM: Assert that slots_lock is held when resetting per-vCPU dirty
> > >     rings
> > 
> > For the last one, I'd think it's majorly because of the memslot accesses
> > (or CONFIG_LOCKDEP=y should yell already on resets?).  
> 
> No?  If KVM only needed to ensure stable memslot accesses, then SRCU would suffice.
> It sounds like holding slots_lock may have been a somewhat unintentional,  but the
> reason KVM can't switch to SRCU is that doing so would break ordering, not because
> slots_lock is needed to protect the memslot accesses.

Hmm.. isn't what you said exactly means a "yes"? :)

I mean, I would still expect lockdep to report this ioctl if without the
slots_lock, please correct me if it's not the case.  And if using RCU is
not trivial (or not necessary either), so far the slots_lock is still
required to make sure the memslot accesses are legal?

-- 
Peter Xu

