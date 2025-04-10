Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791BC1E5201
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300282; cv=none; b=j8fUEywFOIbgCg5ZHaCxBUDR/T/RxbQO9GFHr8XXHyFB7mugaYRwUjvYJgSrP9hQkgwT7rg6FPAMx1tyKarEpknivigwNEh3LzURJUHgBtLSxV5W/f7Ld5i169IU3+emgOWBYQbvAD9FVJKgi6zzDohDULOvCMqIQ9cdR3frvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300282; c=relaxed/simple;
	bh=I1HL4EhttE881MicAtF32b66FddNBn0rz1b+bJ5vSpI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ihXIq+mnf5XHXpsuohSku5tUK8KqUPlzpJcTdObEyBKbzJPaLMQG1rRS2xQxsnlVeRrclLjTHSNLB50pcwny56AjXwGsXZPXPF19xiWnDihbxuZj8Xt9xVk+iy7dslru2S5Hppv8vwaNI63oIXzC6mF7e59+MEGXz5fQs26IJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkZFaSgD; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkZFaSgD"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22403329f9eso8455005ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744300280; x=1744905080; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WI+w75MsGfdj1Z+7uV4Y8gvQFBHXDpFpnvwgAEL/2AQ=;
        b=IkZFaSgDMxVLDJYiztqhLWeJ9BKaBmCbT7F4CFXTzXGHk78dhVZw31jouCnNDop6qG
         LyvJ2AGGW9B/NjGJES68OuKAKaLBwFvD2KGUWdvUlsG1f0aD8K6C+rGbK5ysE6vJ1dDv
         +K+JpZcy29v0dUf1sfGwTYaAYrUFfG7GrYAzIQi7CH+jkldW1WG3aBanwL1UNOUAXBRV
         bHMPWtECNA0qzJQhzQzy4ceyGFHvF2uUxZwwYnkpxqCNMe6h/tq8OFE5STxYBiSEa0NU
         lfHoRRzZvrm0R3beELu0HF0TwdJm5QdJx8sDTJg7rPPsfd5OuFieaYBGI8NvdpPXr494
         9s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300280; x=1744905080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI+w75MsGfdj1Z+7uV4Y8gvQFBHXDpFpnvwgAEL/2AQ=;
        b=O5EUaq0xP51CYQOno/603tw8Nf9UbA9FLRx1RUqJiolwLHJoVtaS3dANKVijeeGP/s
         Z5DIVg0F1Y7wYgnuiEa69eT90gEPn/mGAy8jYhCsz2BfJn45+wpe/tHcJkOuqhh+Znba
         eSCQio6g6FZuKtQ6UTCFsdYNqLLgiV26hCT2Quio5SWKEvTOwBtVs4gW1mJPXz9LQjq3
         y5D62Mwf+mWczE1vXnUmI8Ur5a6AHsWmDkjRuK2lHbRk0RxOtdjOy9qQ+nV8+ulVPuLG
         zwq65Nkv2R/GRwNHva0OM7+dg4uCtqQvqAQAXsqPY9fkdvPlyivkqW+IIWRuZlbcQeQK
         U/LA==
X-Forwarded-Encrypted: i=1; AJvYcCUe/wva8iRfOCcZ2SqaO9mTkE2mOhN72WUveEUkJwSXUZlErjZT0CTcGJznkgowmU7WwkVw1h8vGcJ8i84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8w2RcrGJSy7JBzWetb5PggyBxsrcsad0e0WwPNJQHIcQevWPj
	BGuoJ3D2vn3PJADe/G/GDa9FrfqBvtV6VsaIiPg2sOSdGVB1jF8s79Mo5EWC2VJ3LUEKj0lMFoK
	CMw==
X-Google-Smtp-Source: AGHT+IHHdPvjX46b6rya58AVmth99Sr4qyG2wQ8QULk3PUwKRfJK74c4z91IfDSthvFsL0y+9dnZ4azBoYg=
X-Received: from plsb7.prod.google.com ([2002:a17:902:b607:b0:229:2f8a:d4ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4cf:b0:220:d601:a704
 with SMTP id d9443c01a7336-22be0302063mr29493945ad.18.1744300279479; Thu, 10
 Apr 2025 08:51:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:51:18 -0700
In-Reply-To: <BN9PR11MB5276385B4F4DB1919D4908CF8CB72@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404211449.1443336-1-seanjc@google.com> <20250404211449.1443336-4-seanjc@google.com>
 <BN9PR11MB5276385B4F4DB1919D4908CF8CB72@BN9PR11MB5276.namprd11.prod.outlook.com>
Message-ID: <Z_fo9hPpSfpwi5Jn@google.com>
Subject: Re: [PATCH 3/7] irqbypass: Take ownership of producer/consumer token tracking
From: Sean Christopherson <seanjc@google.com>
To: Kevin Tian <kevin.tian@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	David Matlack <dmatlack@google.com>, Like Xu <like.xu.linux@gmail.com>, 
	Yong He <alexyonghe@tencent.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 10, 2025, Kevin Tian wrote:
> > From: Sean Christopherson <seanjc@google.com>
> > +int irq_bypass_register_consumer(struct irq_bypass_consumer *consumer,
> > +				 struct eventfd_ctx *eventfd)
> >  {
> >  	struct irq_bypass_consumer *tmp;
> >  	struct irq_bypass_producer *producer;
> >  	int ret;
> > 
> > -	if (!consumer->token ||
> > -	    !consumer->add_producer || !consumer->del_producer)
> > +	if (WARN_ON_ONCE(consumer->token))
> > +		return -EINVAL;
> > +
> > +	if (!consumer->add_producer || !consumer->del_producer)
> >  		return -EINVAL;
> > 
> >  	mutex_lock(&lock);
> > 
> >  	list_for_each_entry(tmp, &consumers, node) {
> > -		if (tmp->token == consumer->token || tmp == consumer) {
> > +		if (tmp->token == eventfd || tmp == consumer) {
> >  			ret = -EBUSY;
> >  			goto out_err;
> >  		}
> >  	}
> 
> the 2nd check 'tmp == consumer' is redundant. If they are equal 
> consumer->token is not NULL then the earlier WARN_ON will be
> triggered already.

Oh, nice.  Good catch!  That check subtly gets dropped on the conversion to
xarray, so it definitely makes sense to remove it in this patch.
