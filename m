Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385CC286A1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254985; cv=none; b=rEknx8ZgGXDGS+CGsHBAZTeNfmeUNpEr3g7+BQQvfSjK1zEEBiF56zqEVavWbhrPr31XSqRjGIe2ZVuTrp2yLN0Nu5nYwkj+KL+kKPRiNO4m5e6AChInhWW4yL2UqwJSGmNJRXIS77HBKw36mjswwUZhnGTd7VtLEyfTfYBB2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254985; c=relaxed/simple;
	bh=599WB4f+HeaYDvUCkjFRfoW7ycd8AtJnybDcm55BZfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcnM5CDZC3o5E2YenFzP0hj1r3yJ4ExUShMhQI5ERXp25DUGVs91Tk5dAwSIUJvo8PRvqDZ0LJyy3PwRcXbqldXZ3MdIsU1GAwPJtySFQxNaolxy/pb6jvbcN3UoSo1BQj7brIeIInDrlzrDDuLJVdL+UL/xrzUd5IdodqMhZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rwkX0tDW; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rwkX0tDW"
Date: Thu, 30 Jan 2025 16:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738254966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqHX7O8d5cgYeb7FuzF979jxPcJGlS3Q3RcQkc3h9G8=;
	b=rwkX0tDWzIdr9puvKyNlPXgsuXOv9sjVnukVx/Q4J34iL1Y/Eh9z4fPqfN+1dlG2+6TRh9
	68t3CgGyyZ1pLuyGJbPV2IrV1cqy6q00uxYDbhyBgaEDbWyUFxX0irH6PXOZg5gOgXQckD
	YSJy/7aT9LI9LizjUKY+JysUxznc9oE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: nSVM: Enter guest mode before initializing nested
 NPT MMU
Message-ID: <Z5uqct4AJSasUIWq@google.com>
References: <20250130010825.220346-1-seanjc@google.com>
 <Z5rhH342Jghl2tgL@google.com>
 <Z5ulFoNRWGg3LOzA@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ulFoNRWGg3LOzA@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 30, 2025 at 08:13:10AM -0800, Sean Christopherson wrote:
> On Thu, Jan 30, 2025, Yosry Ahmed wrote:
> > On Wed, Jan 29, 2025 at 05:08:25PM -0800, Sean Christopherson wrote:
> > > When preparing vmcb02 for nested VMRUN (or state restore), "enter" guest
> > > mode prior to initializing the MMU for nested NPT so that guest_mode is
> > > set in the MMU's role.  KVM's model is that all L2 MMUs are tagged with
> > > guest_mode, as the behavior of hypervisor MMUs tends to be significantly
> > > different than kernel MMUs.
> > > 
> > > Practically speaking, the bug is relatively benign, as KVM only directly
> > > queries role.guest_mode in kvm_mmu_free_guest_mode_roots(), which SVM
> > > doesn't use, and in paths that are optimizations (mmu_page_zap_pte() and
> > > shadow_mmu_try_split_huge_pages()).
> > 
> > Just curious, what about kvm_mmu_page_ad_need_write_protect()?
> 
> Doh, I missed that usage.
> 
> > Is it also bengin?
> 
> Yes.  Better to be lucky than good :-)
> 
> That path forces KVM to use write-protection instead of dirty-bit based Page
> Modification Logging (PML) when L2 is active, because the GPAs captured by the
> CPU would be L2 GPAs, not L1 GPAs, and there's no guarantee that the L2=>L1
> translation would be valid when KVM processes the PML buffer.  To ensure the
> correct page gets marked dirty, KVM uses it's standard write-protect scheme when
> running L2, even if KVM is using PML to dirty log L1 accesses.
> 
> Lucky for me, PML isn't supported on any AMD CPUs.

Well, that worked out nicely, and probably explains why the bug was not
noticed. Thanks for explaining it!
