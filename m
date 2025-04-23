Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527652820C1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420390; cv=none; b=fDBI8N1NfTzugrAvehvuJ+HDy2uSSe18Wo2D8qnPAfXxIzry7O8tX4OaoE6uXxn4qrhwIWlbAvfm+K3/ihVlcaPFGrnjEnyb4I5ENRcffAOxjs6brPKdJNJ8xqNahDcBeudMNBaRh8JYCSCmjb9vRW2tG5cOJtSMyz97A2Tv0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420390; c=relaxed/simple;
	bh=joC8MPhe7Y4rGylApsFiNVu3DF0J+Ie5/Hv0obGM2hM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZS2nmmk33v1VBXt/ZYLAYbOPljzIbnrYMsuTVV+9seV3t8vyhbaF+V/lgxCWoUd8pIztIwsEZAAzuKa5CDOgCBHq8R+5G/glfmNmUX/wZuCC07QDwqiLJb3S38jAweo78+sW7eeLA8pyQBuMpxU4qz+BKYsfxxhdeg/3qZxDLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1NcEIMjE; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1NcEIMjE"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cd36189bso8627397b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745420388; x=1746025188; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3Z3M3/CXlzJB2P4gpatwmi73KDGw0Pwe4smUmYNNEg=;
        b=1NcEIMjEIygQO57So0L9fwlujWGv1Z0Dd4BaTBy9g4RSsNH1geG24ym4BUzl78Bu36
         BI8C8bI2pTTDhw+q6NWqcYr3cg673Khh9qHUy39Dr7rf41wj9UajKHeLUC0MExuickmv
         Rx2JZgNkBtVyiq8fP37FWOdwcpUjLX8GaNnQ+xivjo2aTxKmkc9V0+UH8+Yzx5VDMz+b
         XaD+lBn6G48sk7lsOT8S2DgtXq639B256NNkqpPHrmNkx1VTuamUUi6TGzXCa64HFWjx
         L4564E0BeWXmL6y4bt+UBF982Jrn2FiIfm9ZMBEcHuR5uCOvkUOWYJX1Z/CTS9fLryvf
         cJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420388; x=1746025188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3Z3M3/CXlzJB2P4gpatwmi73KDGw0Pwe4smUmYNNEg=;
        b=ly3ylczXqveffgE0N5qcS4Y1+3DQdtHcYaKSMmGf1q6NAsSH5IifqdkL78vRXzNzCO
         t9V3OVvGAkJ2QX9/fD6oRgPG240hx/KSq4pCLPG5kVGrpwPQPjlyjePj52VKWwJpWRg3
         sFZt4tdzBXuTv3NtCDLnlb+CuNJOIqs/osI0DzOmCGT7X8DOLKRLshsjl8ONV5xChW7+
         skDC7fphSnq/88F6+lxrdlx2eAGQyvM4SRC4mCIWMDzHccOyZyc6CMvDdMsSPj4iOTqJ
         fTW8LKLkRJXJ1q43kxMI38pDGftho9CHjB5UaoJcbhFn/KEWjcRwFUkHSpAwZS0bBUgB
         9BZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfcJCOZac8FV+ZskW/7KQnrOtao8rqxKjb80L7LAs+DU2Tp4GecHpvAK9zTTC2HSz2s63GABoMT4kWBG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwapkwgnmzPjVA9pBcFC16wgQgBqq1WjDxWx5ODA2ijilxlOtHL
	k3JQ6iUPWpHwQ7jeHFlqpvBy5snrgUFfb/2/326tVsJeINHw0xgCfOysXk2pttDQSgKfoVQCYu/
	xRQ==
X-Google-Smtp-Source: AGHT+IGO/Sd0tdO6i4UFNRj94tDZvIUgQD1LkF3gNieibzRpO8k6bRf3NkI2HYbT67Asea9crY0mzdt+CSE=
X-Received: from pgbcz4.prod.google.com ([2002:a05:6a02:2304:b0:b0d:b491:d409])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7887:b0:1f5:837b:1868
 with SMTP id adf61e73a8af0-203cbd0b606mr31028743637.29.1745420388576; Wed, 23
 Apr 2025 07:59:48 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:59:47 -0700
In-Reply-To: <20250423092509.3162-1-lirongqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423092509.3162-1-lirongqing@baidu.com>
Message-ID: <aAkAY40UbqzQNr8m@google.com>
Subject: Re: [PATCH] KVM: Use call_rcu() in kvm_io_bus_register_dev
From: Sean Christopherson <seanjc@google.com>
To: lirongqing <lirongqing@baidu.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lizhaoxin <lizhaoxin04@baidu.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 23, 2025, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> Use call_rcu() instead of costly synchronize_srcu_expedited(), this
> can reduce the VM bootup time, and reduce VM migration downtime
>
> Signed-off-by: lizhaoxin <lizhaoxin04@baidu.com>

If lizhaoxin is a co-author, then this needs:

  Co-developed-by: lizhaoxin <lizhaoxin04@baidu.com>

If they are _the_ author, then the From: above is wrong.

> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  include/linux/kvm_host.h |  1 +
>  virt/kvm/kvm_main.c      | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 291d49b..e772704 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -203,6 +203,7 @@ struct kvm_io_range {
>  #define NR_IOBUS_DEVS 1000
>  
>  struct kvm_io_bus {
> +	struct rcu_head rcu;
>  	int dev_count;
>  	int ioeventfd_count;
>  	struct kvm_io_range range[];
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 2e591cc..af730a5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5865,6 +5865,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>  	return r < 0 ? r : 0;
>  }
>  
> +static void free_kvm_io_bus(struct rcu_head *rcu)
> +{
> +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> +
> +	kfree(bus);
> +}
> +
>  int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>  			    int len, struct kvm_io_device *dev)
>  {
> @@ -5903,8 +5910,8 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>  	memcpy(new_bus->range + i + 1, bus->range + i,
>  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
>  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> -	synchronize_srcu_expedited(&kvm->srcu);
> -	kfree(bus);
> +
> +	call_srcu(&kvm->srcu, &bus->rcu, free_kvm_io_bus);

I don't think this is safe from a functional correctness perspective, as KVM must
guarantee all readers see the new device before KVM returns control to userspace.
E.g. I'm pretty sure KVM_REGISTER_COALESCED_MMIO is used while vCPUs are active.

However, I'm pretty sure the only readers that actually rely on SRCU are vCPUs,
so I _think_ the synchronize_srcu_expedited() is necessary if and only if vCPUs
have been created.

That could race with concurrent vCPU creation in a few flows that don't take
kvm->lock, but that should be ok from an ABI perspective.  False positives (vCPU
creation fails) are benign, and false negatives (vCPU created after the check)
are inherently racy, i.e. userspace can't guarantee the vCPU sees any particular
ordering.

So this?

	if (READ_ONCE(kvm->created_vcpus)) {
		synchronize_srcu_expedited(&kvm->srcu);
		kfree(bus);
	} else {
		call_srcu(&kvm->srcu, &bus->rcu, free_kvm_io_bus);
	}
