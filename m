Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D101E8335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236186; cv=none; b=f/+BNy44wLgiu7iqk4dtwjxsPvVwnTf1Oie1dfwtcGmc2AHpkNE6N1pgtH7JJngEQnFVek3x+sISfIjPPN1oqt4H3ItaPx9HyzAmwSUmCYV2REAHlIwnp99wXkItqWkGAW5KDxD3rQy/AURU3oxfkx+E8bVgUMQkCGDfucskhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236186; c=relaxed/simple;
	bh=Lv8M8SJfFr3b41JpFYH00ihI/lyselj4x1KfCSp2bLo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y+GOjTIcaq+Ljz8CC1UXH5FegZNTkwGr2Ywes7J1fmlADkfBwVcmreN0sn7pGkHjlVJbsHNaYUsHu8hIbNfac7rTZGa8pSNjKjgCeF2Rnr3n0K7cPHkKd2hfwN1Ej6GZktlYSey2VCoo/iRJfTIti6ZTx0wGl0laxPw4MBKLMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZhHRuzc; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZhHRuzc"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311b6d25163so2267420a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749236184; x=1749840984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpZlxNfQQcVcyA2xJgYAPilmDs6fYmkhiO+1JW8Md0U=;
        b=WZhHRuzcmufnrqzWGyNvaB018gA3rWUjZYjl0XMEVR74pzIvqjbxO8iEZMV0QILE5P
         lRahLzeBSyR+S8Dn7lSYd/F2syZCsXFEburwjnJGi21xq2IrkUBKzsiHTVoEn2qdjM2Y
         2Y7zF74aIi/fzTvDs5xOS7/6VYC4mfG0Fd7CKQJJ6vCY+BFNPNROibZvaQHp2pl+lndj
         r+gtHWUpE9Ey908zzT/rsH9Kq8LP5Ow5MeRyHHbrdURbJdisggaE1FcbIfUrS+kCf7Kc
         +fSoi241oHO31ti8PrJv5syvoswrr6GId2lcZI6Y8uO8Ar/ord43alKxCP3uHkv6++tr
         Lehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749236184; x=1749840984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpZlxNfQQcVcyA2xJgYAPilmDs6fYmkhiO+1JW8Md0U=;
        b=OLVXQtTTvGA3gFwCFQw4BoDygyMZJGFMtd7+z2PGcfyAJ1Ojzf6026Qmhb4pk71/CB
         csUxkJkqyV4My0sP3uDgiqycxYQSS4XlNg7jjDyKZLKT4G8aquD8hJQFW4y4nvy6dD07
         BXbsSPd3ykFpJaEKRnH6I/7M2+elFDJvAZXJ74jR1ixzscK04EDCcNXN9WpKwYCeBvV4
         L+89c+H3quQ8bRAOgAOy9A3cqKULWi9K9ORquVx9f0x2urGZu2rOySXOOXrK8MgBmBN/
         QJcRY08YiqL2pdk1GcIeScATVliawB/IDCFOjR2ppIwcN/jeDT8CJOwx6K37n1NOSVu2
         xeSg==
X-Forwarded-Encrypted: i=1; AJvYcCWsEASEQ57EEVG8fyHzzFHnj5hnyRMarSK2MCO16SQ4bfdo4cqgBJTK2CBK8A2sgLtWSfZE5SXyyXxJyG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2vM6Z+/+xVhkT0wOoBAN4LdM5O9XIpFnqMHhDLQ+FpAL3g/zu
	Lfoqo4G0abjjOs1pN49bksQFDKERXe4VLn8ME3JWi8xKBqNV8gbxl8WdLUeoVsoB/S4JRlUD7o1
	ZJE1eIQ==
X-Google-Smtp-Source: AGHT+IGqcoPYRkSjOcLS22pMmTmd9oUCkEfjRM6IzDAHp9YG5cvIGYKKgJc8IWu1CzorqLJUH+Aa5cN/Dnw=
X-Received: from pjd5.prod.google.com ([2002:a17:90b:54c5:b0:310:f76d:7b8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c52:b0:312:1cd7:b337
 with SMTP id 98e67ed59e1d1-31346af99a1mr5984007a91.5.1749236184001; Fri, 06
 Jun 2025 11:56:24 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:56:21 -0700
In-Reply-To: <aEM3rBrlxHMk6Mct@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514071803.209166-1-Neeraj.Upadhyay@amd.com>
 <20250514071803.209166-8-Neeraj.Upadhyay@amd.com> <20250524121241.GKaDG3uWICZGPubp-k@fat_crate.local>
 <4dd45ddb-5faf-4766-b829-d7e10d3d805f@amd.com> <aEM3rBrlxHMk6Mct@google.com>
Message-ID: <aEM51U1RnYC0Dh_j@google.com>
Subject: Re: [RFC PATCH v6 07/32] KVM: x86: apic_test_vector() to common code
From: Sean Christopherson <seanjc@google.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, Thomas.Lendacky@amd.com, 
	nikunj@amd.com, Santosh.Shukla@amd.com, Vasant.Hegde@amd.com, 
	Suravee.Suthikulpanit@amd.com, David.Kaplan@amd.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, pbonzini@redhat.com, kvm@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, huibo.wang@amd.com, naveen.rao@amd.com, 
	francescolavra.fl@gmail.com, tiala@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 06, 2025, Sean Christopherson wrote:
> Actually, looking at the end usage, just drop VEC_POS/REG_POS entirely.  IIRC, I
> suggested keeping the shorthand versions for KVM, but I didn't realize there would
> literally be two helpers left.  At that point, keeping VEC_POS and REG_POS is
> pure stubborness :-)
> 
>  1. Rename VEC_POS/REG_POS => APIC_VECTOR_TO_BIT_NUMBER/APIC_VECTOR_TO_REG_OFFSET
>  2. Rename all of the KVM helpers you intend to move out of KVM.

Looking at the earlier patches again, I vote to add a 4th:

   2a. Replace all "char *" with "void *" in all affected helpers.

Pointer arithmetic for "void *" and "char *" operate identically, and AFAICT that's
the only reason why e.g. __kvm_lapic_set_reg64() takes a "char *".  That way there
is even less of a chance of doing the wrong thing, e.g. neglecting to cast and
reading a byte instead of the desired size.

>  3. Move all of the helpers out of KVM.
