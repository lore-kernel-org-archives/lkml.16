Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8221ADB0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104551; cv=none; b=cAXYbwBOR7uEKOoHUoDm03QxEEqRZEaiuJbtDLrmb7xmsbweyBh6oL/GDL/fT2rg4EQJKwS3VBcE4kyUrMH7sgcfxdyqHLQB+84N7wxwYtSvzhFMatZiRVCrRzQaWmE6N6UpRIu7yc340kAGNt5Y3FaNtaxuZHifaUbfhPoCoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104551; c=relaxed/simple;
	bh=70CqdwZp/XJNJBFhWh4bbWfnR3WgzS7LFHiH6rLnjrY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q2BB2N55HhwQm4wgrpxDm2Y71/cdb8l5ITZWO7A3pDxphTJU9XmpiDYrwN09L49R9FWZTSNmUjYDX3QIvq88eNPHCq81xxoQkhJYitrxgLycsuQdAZPbn3rblQXTO6u43ytOQkrGUhAF3ZH+UIBnIpu7x0t2DPxyYkY+fIj+fk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u6+WczHa; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u6+WczHa"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so2356882a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743104549; x=1743709349; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6XBRFWpvobDfnwv4/d7dnVOqu4/BPRmvKykTxk3LH8=;
        b=u6+WczHatmMn8d37fVKSq2DQg69Fv6X27FzQ5A3hhYWP+GekgcAJHcmRfSTXd6BaAO
         ftRwa1i8pYo6ymTA2XntJzlwEP+GME+4mSx9b6nh0uuuUlipgZNP4dnLQsPOxsN8UlHu
         Rt5eM6sGizHIKIEh2m5Cwiw9ADGN4mIi7r7OKqQwkrMnqtLQIkE5exrd0ycwTj9RAfNk
         QpuArNWIaX1B05GoRaldz8ZPkaYrf9NPE7ga3dach7KkYJk5XmZWGuumQC02muux+6D4
         t4Z3ssVFbyObtj9iPg8iPU9Y+AA5MVBN7uHlGdnzehYZuQrvfUlMTa1V3DzO9kjWEr5q
         en0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104549; x=1743709349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6XBRFWpvobDfnwv4/d7dnVOqu4/BPRmvKykTxk3LH8=;
        b=xJ7d66yx3PTLquwsFDMuNs2jSD86cVmqlmF6qz3aDdmMD0IrcGSA38mYjVckJ+BcWJ
         t+tTZzLixoee/xneUgPn9gi9nj4xy2YnkX8/EtNzMjzEZQVw9Zs6VGym4TC0/KtnLUc9
         bBJoE3NqK2piFsMadDLqFB+ZAk8iAP0vnxUkFMoPJDO2MUq2vH2iKCO6i6onuPj8kgBj
         V2pIgjYS5m1Lafq0z3gUHAEhCxLpGW/UYP4LKierI0ZrMhoVwTHFKEl7FWxLU/qjLv5f
         aC/aEiWe+shQAiH/hWou6b/ywJlmJGnEwYtee5cSLmQeHhKxuc3PgqgbBQbbS+nWI2Ca
         rG8g==
X-Forwarded-Encrypted: i=1; AJvYcCU9UXgEJTfYIN1GwS2tLjoV2bddfOadbBZR4+xIvubKImA2XvbD0N05xGzNoy+CgCj5uZB1D4zPy2Xgn54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRt5e/I8DdQKNJlRE/sbSUaEe0YRriXO/3V9NIm+/chdDyTWnQ
	Vi7vP8aMOhLnlH6K3APmJ4FqZ7s2WeLVp4ggT5LeNM9dANa6N71vSGg4ht0q2SuAxyqUGLtn5uo
	sHw==
X-Google-Smtp-Source: AGHT+IEwMIuIvP1yQ+YKbRo8TKvwpvbVEhQ0FrrBLdqpprW7xe1nl9ykfCh6ovQsJejeKJwT7Tg9ravmCG4=
X-Received: from pjtu12.prod.google.com ([2002:a17:90a:c88c:b0:2fc:b544:749e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5686:b0:2fa:15ab:4dff
 with SMTP id 98e67ed59e1d1-303a906ebc2mr6800482a91.31.1743104548855; Thu, 27
 Mar 2025 12:42:28 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:42:27 -0700
In-Reply-To: <Z-WHMZPvCNLsXZ_1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
 <20250326193619.3714986-2-yosry.ahmed@linux.dev> <855xjun3jc.fsf@amd.com> <Z-WHMZPvCNLsXZ_1@google.com>
Message-ID: <Z-WqIxO1XfFAmchX@google.com>
Subject: Re: [RFC PATCH 01/24] KVM: VMX: Generalize VPID allocation to be vendor-neutral
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Nikunj A Dadhania <nikunj@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manali Shukla <manali.shukla@amd.com>, 
	santosh.shukla@amd.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Mar 27, 2025, Yosry Ahmed wrote:
> On Thu, Mar 27, 2025 at 10:58:31AM +0000, Nikunj A Dadhania wrote:
> > > +unsigned int kvm_tlb_tags_alloc(struct kvm_tlb_tags *tlb_tags)
> > > +{
> > > +	unsigned int tag;
> > > +
> > > +	spin_lock(&tlb_tags->lock);
> > > +	tag = find_next_zero_bit(tlb_tags->bitmap, tlb_tags->max + 1,
> > > +				 tlb_tags->min);
> > > +	if (tag <= tlb_tags->max)
> > > +		__set_bit(tag, tlb_tags->bitmap);
> > > +	else
> > > +		tag = 0;
> > 
> > In the event that the KVM runs out of tags, adding WARN_ON_ONCE() here will
> > help debugging.
> 
> Yeah I wanted to do that, but we do not currently WARN in VMX if we run
> out of VPIDs. I am fine with doing adding it if others are. My main
> concern was if there's some existing use case that routinely runs out of
> VPIDs (although I cannot imagine one).

No WARNs, it would be userspace triggerable (hello, syzkaller).  If we really
want to harden things against performance issues due to unexpected VPID/ASID
allocation, I would rather do something like add a knob to fail VM or vCPU
creation if allocation fails (nested would just have to suffer).
