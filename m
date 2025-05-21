Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7DD1C8633
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856748; cv=none; b=fDZxM3lwKZiybshn9Gd97vIJbgg8Tn1hio+UGF595l9Q9mD66BsEcdaO9rW8P1Z6Svj5QcqgCLous3mTyeNmbocsRXFQ0wYx9FA9Dq/Xh0xJFjBBA9BOgENWGvaa7J6LP6CnMB79u8rw3AgEacTIJP+gGM3Aj/SQv4SnLzSgirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856748; c=relaxed/simple;
	bh=w/KQK//gGuiZHs6feqriYpY0wTfbHX9Fx3R5JWgYka4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V5dnnWs681x3SLMGvmU4o54uhG+cAwJmyW71XRxstCSZ+gKiYBLILrtDteUlM2OqvHOsEpf+NOvohndYybg5kf6LuHh1+fwuQv1gyDJIEKPADdk6wpO5n1DaHRjl/DI2Nmv9oSvhzvvY44qD/8x6H31PHJXzy2TLI9hZTtHdkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gL1vVeiE; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gL1vVeiE"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26f30486f0so6543984a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747856746; x=1748461546; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fJskKCNcT8u+ZGbfFAjJXMYt+V7lIICBJ59GECqjzXE=;
        b=gL1vVeiEvaVHWPH87FroaWJbHcdz8wy7NwAsGQL3HX5Qp9YiPfSEP6t12X5YPo0z6q
         Hb8nEb+Ub3hry9tS3S0ClPkmtvCjQx+PMDo4Kr17vnOEAJwCgpG6erC1d0VhmaMVov7z
         26T5rxoochFOVfWLvojYE95WLISXPRPe8E+JUw2Y2bnCXHsQjRTbPVWfF32FDn6dUyiM
         YCriVMyOIQdSB0G3/bHJV5qfUFyv1WE53Q3BrMQ5aon/Z5RFAQac2bjK5F09kedyhc35
         jI94Tr4IR/+zYle0gz2lkda8nRNHAIrs1qeSg7yRDl8H7z2gTznyoq1bJ8E8AYWJCPOQ
         XZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747856746; x=1748461546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJskKCNcT8u+ZGbfFAjJXMYt+V7lIICBJ59GECqjzXE=;
        b=q4YgVQmpHBH78yDG9guNyRwrvSMFZmhoGav7kCgTg6vZGVFUrHq/k4LZ6dzJbZEz/8
         7tfk4st0TtjlszuCvw+f+Jgfip6t4jD04dmM8oUrWbCiRUMeQzc+lPFWW1aiz6V3bOo6
         S2zSlEABxywmQ2bDlsSYF9Z66xIB+Q6nBFrB9jZxSGIXwOK3s2V9X4UAvgYgx2pSpBi+
         7jLKOIm98rUZZpYnt45f9ANmjLLIAMqpbbb1bBEX5+Dzucah/2stLtOvRXISN1FN5AyH
         C/8exfBHxan/gJ4Tm0m5JcwgxW49p5cI9P4vVGMi6dwas/1d0cOnh7bKg+YhJHJA2ezG
         Yj6A==
X-Forwarded-Encrypted: i=1; AJvYcCWxCbSG7A83got4cXnN5uw46u7Ovp6VlsVy6jmdHbeCCz+FTwLzqWSLvrvFesf3vfViAgas5NgTckLlmaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlzM9V3lUxnlyZ/OiGqzfInxl7ISO+eYbJzi1VMhKxF1HeZMg
	Kmr7+7F36jkybXTeOUU1At1W9XfGuI68X8L/GxdE9dTMzBtM0gh4HqXtjr55Q/MgTtZCbdlnQeR
	0blWYMA==
X-Google-Smtp-Source: AGHT+IH5Hu79pYadIlaminwNsuDOzWNHSuqJi/bY0E31HF6EV6XPSwZJrHO3LDFQ99bghSKyKm/AqQjVQak=
X-Received: from pjb6.prod.google.com ([2002:a17:90b:2f06:b0:2f8:49ad:406c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e8e:b0:2ff:64a0:4a58
 with SMTP id 98e67ed59e1d1-30e7d5a8ademr28966699a91.22.1747856745714; Wed, 21
 May 2025 12:45:45 -0700 (PDT)
Date: Wed, 21 May 2025 12:45:44 -0700
In-Reply-To: <aC3pNVfgNcnuJXUG@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516213540.2546077-1-seanjc@google.com> <20250516213540.2546077-6-seanjc@google.com>
 <aC2Z1X0tcJiAMWSV@yzhao56-desk.sh.intel.com> <aC3pNVfgNcnuJXUG@google.com>
Message-ID: <aC4taDzB45fUNQJr@google.com>
Subject: Re: [PATCH v3 5/6] KVM: Use mask of harvested dirty ring entries to
 coalesce dirty ring resets
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, James Houghton <jthoughton@google.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 21, 2025, Sean Christopherson wrote:
> On Wed, May 21, 2025, Yan Zhao wrote:
> > On Fri, May 16, 2025 at 02:35:39PM -0700, Sean Christopherson wrote:
> > > @@ -141,42 +140,42 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
> > >  		ring->reset_index++;
> > >  		(*nr_entries_reset)++;
> > >  
> > > -		/*
> > > -		 * While the size of each ring is fixed, it's possible for the
> > > -		 * ring to be constantly re-dirtied/harvested while the reset
> > > -		 * is in-progress (the hard limit exists only to guard against
> > > -		 * wrapping the count into negative space).
> > > -		 */
> > > -		if (!first_round)
> > > +		if (mask) {
> > > +			/*
> > > +			 * While the size of each ring is fixed, it's possible
> > > +			 * for the ring to be constantly re-dirtied/harvested
> > > +			 * while the reset is in-progress (the hard limit exists
> > > +			 * only to guard against the count becoming negative).
> > > +			 */
> > >  			cond_resched();
> > >  
> > > -		/*
> > > -		 * Try to coalesce the reset operations when the guest is
> > > -		 * scanning pages in the same slot.
> > > -		 */
> > > -		if (!first_round && next_slot == cur_slot) {
> > > -			s64 delta = next_offset - cur_offset;
> > > +			/*
> > > +			 * Try to coalesce the reset operations when the guest
> > > +			 * is scanning pages in the same slot.
> > > +			 */
> > > +			if (next_slot == cur_slot) {
> > > +				s64 delta = next_offset - cur_offset;
> > >  
> > > -			if (delta >= 0 && delta < BITS_PER_LONG) {
> > > -				mask |= 1ull << delta;
> > > -				continue;
> > > -			}
> > > +				if (delta >= 0 && delta < BITS_PER_LONG) {
> > > +					mask |= 1ull << delta;
> > > +					continue;
> > > +				}
> > >  
> > > -			/* Backwards visit, careful about overflows!  */
> > > -			if (delta > -BITS_PER_LONG && delta < 0 &&
> > > -			    (mask << -delta >> -delta) == mask) {
> > > -				cur_offset = next_offset;
> > > -				mask = (mask << -delta) | 1;
> > > -				continue;
> > > +				/* Backwards visit, careful about overflows! */
> > > +				if (delta > -BITS_PER_LONG && delta < 0 &&
> > > +				(mask << -delta >> -delta) == mask) {
> > > +					cur_offset = next_offset;
> > > +					mask = (mask << -delta) | 1;
> > > +					continue;
> > > +				}
> > >  			}
> > > -		}
> > >  
> > > -		/*
> > > -		 * Reset the slot for all the harvested entries that have been
> > > -		 * gathered, but not yet fully processed.
> > > -		 */
> > > -		if (mask)
> > > +			/*
> > > +			 * Reset the slot for all the harvested entries that
> > > +			 * have been gathered, but not yet fully processed.
> > > +			 */
> > >  			kvm_reset_dirty_gfn(kvm, cur_slot, cur_offset, mask);
> > Nit and feel free to ignore it :)
> > 
> > Would it be better to move the "cond_resched()" to here, i.e., executing it for
> > at most every 64 entries?
> 
> Hmm, yeah, I think that makes sense.  The time spent manipulating the ring and
> mask+offset is quite trivial, so checking on every single entry is unnecessary.

Oh, no, scratch that.  Thankfully, past me explicitly documented this.  From
patch 3:

  Note!  Take care to check for reschedule even in the "continue" paths,
  as a pathological scenario (or malicious userspace) could dirty the same
  gfn over and over, i.e. always hit the continue path.

A batch isn't guaranteed to be flushed after processing 64 entries, it's only
flushed when an entry more than N gfns away is encountered.
