Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C728136B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330076; cv=none; b=gA8AIaYET1ItZFCM0F0W9dmQoytpcmBBH9KV7KVWl2tzLxpV6GsTNMFJ+tptcqhSBRnbT6FXRBhgUD1BggyZKjFGm8E4jEnS0GBywM5kzpVW+2GvNfvzxwTrWBIbEhFShbWNHftldVNugsi8Bigm+LJVXYyO2RY6t+nsW2RDYrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330076; c=relaxed/simple;
	bh=2b9baAJsVK0mUsHxBRRIQc61VYJKPpN1UkewWGq/iX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CbzdqWTRvc+sBRgnR55Beaz+ze/E5EqkINJYL/ptvGdU5KOb30yKVqnd2izeWZqsXW+VVTXt4lXsCXE4xHxL3IHp7xbkidllbtWTsVAJwHsshF422XtWyofexsiUDHm/MwnR3Kj1gKq91gBLO0Eap2w0UrPqwwtcMVmB1elYD7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aGfZKFXn; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aGfZKFXn"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0e5f28841dso1962257a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745330074; x=1745934874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=spL/NHwoEaNnvEHqjM0fIr7zo8pH2b6bBahHGRyQ+PQ=;
        b=aGfZKFXnuqRhLGHGpTvvfuJFU0P6PcVpCcjdVoMMGjp0lbn7KujSQO1kIThi4xpukx
         j2eBQaQOR4qDjXQvIABq0Wc403DGHgDNehYbyYicK+pToc3gm3/xlQ+pWVvUYgU60B/x
         u1KUl7r79g9CVhcn4AWTUqS5YLvjZXo1sbKHrw6FHdwZUGKcZrbpcxGbnA/Cc3s/0KAc
         YmI3wjafG4jypOzS2T/WndXhp79rlju2GNB8MEVq8QfrbRaX9NRR+90CGZudWiV4YKG4
         eP+kVN15/7JlaNqaBR6ueDhBjTcBb7pUrmeIylsoOqe3l/GfKEyV0fpSDrQ7kGIvMFhg
         kFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330074; x=1745934874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spL/NHwoEaNnvEHqjM0fIr7zo8pH2b6bBahHGRyQ+PQ=;
        b=PMEFzDlb3MKrStvdxcY3/sDzoQ1KDS0zu0Dh9Qq/7ZuM9JMEc4uw8M0lOnzd0avkpL
         cVspWKbL+P1b0AwemeOnZwCxnqRDyS7iaJR5geV+pwuobIvnv8USRLlkbWTyqI1JGk5j
         O/F4XYkxjMo7YEigGCZEkcO1k9wbcBbomwdLbbAzrrfztSIrZdpKykmb5SjKZm8Nu3vF
         VFica/zg9cX2UBUESi7nj0H9G2mygLyvB7w3c0AWURODT5/8561dB14lFRRI/3JvlIDy
         h+jlPDgmU+exTT/jujvgPTqpeSi9jbo4+ashxyFhlRnlaSd+DCd6Q3/N947jt29erELR
         850Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBKzIc5PkrEGmUDl1HI2p9J9vkuXx5mirpQQ0NIlDTHJvfnHT6tNBLM5nKC/isVsN8Gb6TxvVoYKxTIDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93ZIj1BqARy2i7hpN8az+uMP0anjSYukNBKNNYRzIQQ7tnvGP
	5ereQPrrrRaC1XF1j0MHoRLn5efJRpuJTNC/6xmmiEghFQFim1yw4bZzTN3sR03sPcPZp6IRvt7
	1aw==
X-Google-Smtp-Source: AGHT+IER9arKqXWkZi7QiNgZABWL0f0GhyHvlF2O4Qzb+ymg5SDKwjhVw41evoJTJc//sPeIbj8yhHGpNZ4=
X-Received: from pjbpv14.prod.google.com ([2002:a17:90b:3c8e:b0:2fa:2891:e310])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:568b:b0:2ef:67c2:4030
 with SMTP id 98e67ed59e1d1-3087bbc4d52mr20753502a91.27.1745330074604; Tue, 22
 Apr 2025 06:54:34 -0700 (PDT)
Date: Tue, 22 Apr 2025 06:54:32 -0700
In-Reply-To: <f5cb3c37589791b2004a100ca3ea3deb9e1ae708.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250415115213.291449-1-elena.reshetova@intel.com>
 <20250415115213.291449-3-elena.reshetova@intel.com> <aAJn8tgubjT5t7DB@google.com>
 <f5cb3c37589791b2004a100ca3ea3deb9e1ae708.camel@intel.com>
Message-ID: <aAefmNVRFc3me6QQ@google.com>
Subject: Re: [PATCH v3 2/2] x86/sgx: Implement EUPDATESVN and
 opportunistically call it during first EPC page alloc
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
	"linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>, 
	Vincent R Scarlata <vincent.r.scarlata@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chong Cai <chongc@google.com>, 
	Asit K Mallick <asit.k.mallick@intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bondarn@google.com" <bondarn@google.com>, 
	"dionnaglaze@google.com" <dionnaglaze@google.com>, Scott Raynor <scott.raynor@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Kai Huang wrote:
> On Fri, 2025-04-18 at 07:55 -0700, Sean Christopherson wrote:
> > On Tue, Apr 15, 2025, Elena Reshetova wrote:
> > That said, handling this deep in the bowels of EPC page allocation seems
> > unnecessary.  The only way for there to be no active EPC pages is if there are
> > no enclaves.  As above, virtual EPC usage is already all but guaranteed to hit
> > false positives, so I don't think there's anything gained by trying to update
> > the SVN based on EPC allocations.
> > 
> > So rather than react to EPC allocations, why not hook sgx_open() and sgx_vepc_open()?
> 
> The only thing I don't like about this is we need to hook both of them.

And having to maintain a separate counter.

> > It's the hypervisor's responsibility to enumerate SGX_CPUID_EUPDATESVN or not.
> > E.g. if the kernel is running in a "passthrough" type setup, it would be perfectly
> > fine to do EUPDATESVN from a guest kernel.  EUPDATESVN could even be proxied,
> > e.g. by intercepting ECREATE to track EPC usage
> 
> I am open to this HYPERVISOR check, because I don't think we currently support
> any kind of "passthrough" setup?

Who is "we"?  KVM?  From the SGX driver's perspective, it doesn't know on which
hypervisor it's running, or the intent of that hypervisor.  I.e. whether or not
KVM or any other hypervisor supports something is irrelevant.

> And depending on what kinda of "passthrough" types, the things that the
> hypervisor traps can vary.
> 
> Anyway, I agree it's not necessary to have this check, because currently it is
> not possible for a guest to see the EUPDATESVN in CPUID.

Why is that?
