Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E45BA2E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 01:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745025145; cv=none; b=cLRTeNCuW4SdwGhmh2YF2qNgVsWV6uWEN8NHGvnRLFkewIu7ltYjxN9uaptYCggHhdxdh6EU1ifn2Gr7lx/39Ya4lenq77/z5HM7OsIdmnCe1A47OW0WeNb5G12+e+Afj7XuGUsxTCl4dj4fv/ki07nEc7wNOxUQ6bmo9H2b5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745025145; c=relaxed/simple;
	bh=GBLqjUBIYKLE1OiCMwpLkALClRqsAbp12xJDCFy7CyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KO19nI3X1joF9decqTNPAZE47poi3op6ec/5jXjzNLiRGhtnFEbJYjbZ7scJr32T8GpR/AuujdHfXzgV6egBI9rox1lDBuBSj66LjdjXCZc3NJq9PWUZ7mUwcNL+3K+NONNT67LeBUYao055Hmc/7gRPdD9HnIyZJgT1OtTqanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B8NlNWB9; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8NlNWB9"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af9b25da540so1320147a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745025143; x=1745629943; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bAssG5fQ67XkPLJgYAAQI+PG7StKquP6G71qrzqZJ2M=;
        b=B8NlNWB9phPpWgL7/BxpPv4URlLClC8a0BEX+08PszdC9jUUFs1fQ1Fk/tsLb6l0t2
         YoxZ4nxsO60XwxQ4HhC7KKBjTAax118XmJ+zOCGNDc1bk6W/2PK1x60ipv5zZ7rGRSnN
         HayPgA5I56VdRi2WxZ0A+U0i+I8+TvuQI1rDHd9ljGX4GqhX3qMCk4oMR6tGrNLz23Wj
         cpTJXWBPjm8+NQk3R2ttmv9Q+WJ7EIlTPw0nxrVmNH4n3jHu9Oj1QmFSJaIGckXMDVQz
         O2BQsOmRhd4pUeLp0C5O/UYrIfEs/lHPJb5lTZwjj3ErEwanO1j8zc33Vd/aaVbG+R21
         +FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745025143; x=1745629943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAssG5fQ67XkPLJgYAAQI+PG7StKquP6G71qrzqZJ2M=;
        b=HgHrENoWcsvoj672HiZeIBnjxjA7N95pk8penAdDJKgB/7yD2r0f0B8eCnyTO36Rgs
         ssMfQd0pCie/aduNLET9kdoPz6Y+oa278IDtzJSmHddUIbOAAgJc0P4mjINaoUO9y+0W
         wGdcdb4a2uoPpLvy2BWsqr7DIaLxqedw/drWJSgpiy00dhlxK8QSicR+GLgMiuQKZMY5
         IItdGvhpfw+F+dxWxP6PiNkAoyd3ZoPkVzambTSnd4eQ3jLZZSAPbTnXT6FcdaL9N8MB
         X5X1JWUEVrFYUDqcLzrY0hbSqGn/xr05aECKQin+IknTp2Xs9T1pCiBit+mYa21yamGp
         9xpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVynInSvFBMmRZRVTxdYBI3jIKNTFh1AZ5kxkLJFblZ/U6+6yicFRNpaywnLkpsfI0asYRZ2ugOuS9b6jk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz08TCOVf3dXlnYgkX4d7K5zpvL7Kcv7Tlgm4uNPwW+LKHfLjdS
	23khXQ54KeGtBWO7BMsUHlv0EJblJxvhhp4O91B+JjuAKQaT1G3ojNwCXBcly/JTnxWz8V9tvRu
	Xsg==
X-Google-Smtp-Source: AGHT+IEwiOscwRryNbV5HEkDLR/QSN5uMa5G6pQrJMGE0vv7idD4Yujycc133PfZgsKp3+f0KyatWMvuqqA=
X-Received: from pjwx11.prod.google.com ([2002:a17:90a:c2cb:b0:2ea:29de:af10])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef11:b0:224:2384:5b40
 with SMTP id d9443c01a7336-22c535a7e46mr72675585ad.24.1745025143192; Fri, 18
 Apr 2025 18:12:23 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:12:21 -0700
In-Reply-To: <20250417131945.109053-2-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250417131945.109053-1-adrian.hunter@intel.com> <20250417131945.109053-2-adrian.hunter@intel.com>
Message-ID: <aAL4dT1pWG5dDDeo@google.com>
Subject: Re: [PATCH V2 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
From: Sean Christopherson <seanjc@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: pbonzini@redhat.com, mlevitsk@redhat.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 17, 2025, Adrian Hunter wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Add sub-ioctl KVM_TDX_TERMINATE_VM to release the HKID prior to shutdown,
> which enables more efficient reclaim of private memory.
> 
> Private memory is removed from MMU/TDP when guest_memfds are closed. If
> the HKID has not been released, the TDX VM is still in RUNNABLE state,
> so pages must be removed using "Dynamic Page Removal" procedure (refer
> TDX Module Base spec) which involves a number of steps:
> 	Block further address translation
> 	Exit each VCPU
> 	Clear Secure EPT entry
> 	Flush/write-back/invalidate relevant caches
> 
> However, when the HKID is released, the TDX VM moves to TD_TEARDOWN state
> where all TDX VM pages are effectively unmapped, so pages can be reclaimed
> directly.
> 
> Reclaiming TD Pages in TD_TEARDOWN State was seen to decrease the total
> reclaim time.  For example:
> 
> 	VCPUs	Size (GB)	Before (secs)	After (secs)
> 	 4	 18		  72		 24
> 	32	107		 517		134
> 	64	400		5539		467
> 
> [Adrian: wrote commit message, added KVM_TDX_TERMINATE_VM documentation,
>  and moved cpus_read_lock() inside kvm->lock for consistency as reported
>  by lockdep]

/facepalm

I over-thought this.  We've had an long-standing battle with kvm_lock vs.
cpus_read_lock(), but this is kvm->lock, not kvm_lock.  /sigh

> +static int tdx_terminate_vm(struct kvm *kvm)
> +{
> +	int r = 0;
> +
> +	guard(mutex)(&kvm->lock);

With kvm->lock taken outside cpus_read_lock(), just handle KVM_TDX_TERMINATE_VM
in the switch statement, i.e. let tdx_vm_ioctl() deal with kvm->lock.

> +	cpus_read_lock();
> +
> +	if (!kvm_trylock_all_vcpus(kvm)) {
> +		r = -EBUSY;
> +		goto out;
> +	}
> +
> +	kvm_vm_dead(kvm);
> +	kvm_unlock_all_vcpus(kvm);
> +
> +	__tdx_release_hkid(kvm, true);
> +out:
> +	cpus_read_unlock();
> +	return r;
> +}
> +
>  int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
>  {
>  	struct kvm_tdx_cmd tdx_cmd;
> @@ -2805,6 +2827,9 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
>  	if (tdx_cmd.hw_error)
>  		return -EINVAL;
>  
> +	if (tdx_cmd.id == KVM_TDX_TERMINATE_VM)
> +		return tdx_terminate_vm(kvm);
> +
>  	mutex_lock(&kvm->lock);
>  
>  	switch (tdx_cmd.id) {
> -- 
> 2.43.0
> 
