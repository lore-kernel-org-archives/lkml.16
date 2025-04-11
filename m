Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F41F541E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381972; cv=none; b=crkv4kSeAEszdmFWwdBCp2rYJ6ThlC76AOjzAK4cf7mUD27E1/Yigm5e4k4N3jLT02Ou5bKaIkmzcXTQxk3nxPGqIMgGwu0+WJVuFJ3y64788N1yoh+3GfE/bx+mzQnLmX6G7PvKP8mmaCuS0NfJxLrHOnRZR2DNDxXFpYq6gsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381972; c=relaxed/simple;
	bh=0uBVlVl6zt2smmydXiApRvxiKMlTSisj2Yu/ktHw5O8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sawVkB2FNSttRmfuL2qTE/1JOAm1JVnpYTrXJV/Msx/87dS+xdd3yyrTKpROUCI58sEMQQoWBZk9ko2R0DgL8ZTmudV0XUXwP5XUb6q4TbgcelhxqS4kYXrGZCAUjX/PVnhDp/n8fake8MPO7ZmLxdj3fNzqUH6zprgtVSkVoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DAtGMazO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DAtGMazO"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736cd27d51fso1821317b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744381969; x=1744986769; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdYWtwGlFqkOjqypokEB9CfaYMOynOKxQo9pc/iInzs=;
        b=DAtGMazOexbsnVylG+qaPeTSMiyZv5B15i+WJ1hP8Ro4dTtSuAUE/azDMa18iM9M/Q
         Bf3L1LSGcreyFuXBiNcovZtjsRKXoGfTa2RHzLuOlDH5KPR5uUre8KguPYMLWb9Z5Bq4
         DR56vkXzGd4g/GjpPuq1RPqmO1VfbE22OCN4X1XqNJghwycE4CwUM5xLK6na5tjna5+P
         MAQuLAtwQesxYr9HfG7OryyOm7+KpSlabIDjCyujJ+4neo0R697Dn/VdTUQzkCoafJ+k
         Ux3A+L1cq/+FmvOM+an0wtKv2OcXlCIdl0jk+Xt/fG6g3VEygHmnC6AnHWl19Jpk6oIk
         SZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381969; x=1744986769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdYWtwGlFqkOjqypokEB9CfaYMOynOKxQo9pc/iInzs=;
        b=eQM6vQKtrQN3PpS5icovJ0Lk/GoHAYwVHXBCakD7kXkCfvCAf+kOtYJ6MhXSVVl6PJ
         P01e1Zz6cnSRyLt4yP1DHR9soj3cpAErkQgciCWHSCfuFtHnsCVD0cpAIu5HEjSfYp1A
         dF8cBlf4nuAgSPY/MZBWmwmcgvaf9pAJ1em1MNOzBpg1ARYXDpv/RZPPmX+bebAIUnHb
         WTi8dgBdHsw5Beu7OazjPxpoJ3yTKDJAT8mqGVPo0ri/kLw6Mk6jtzSX2qVjNjNsMiqi
         DDxZzo6SJ+WpNp/U51VRmMIeGFglT5vk/FxawjEgT1UY0Fr4WlPXLtreG9PQQlXctzXG
         efJg==
X-Forwarded-Encrypted: i=1; AJvYcCVS+0U5n1OisVvU4lveHUrndG6txlmdiXvJSbnrQtTjzYjvoGAscpHRs0EE7fqleD5swUfCixv91mQG8AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/RAcTtPaR4dt6er+Fyw7nu85uZMbqf5Bgtg/wuRgo9QJ5OnN
	FhR4Q/ou7NAxMyoWdEXPSRpqJ/qJ0s/e9gIP4cjqJgYXh2WzvvzcFKOmx1c+eLNorTRiAobcfS2
	MQA==
X-Google-Smtp-Source: AGHT+IFyxCzl6htX/DS8ClLuQoR7pJ/TqB4Bmf2NEvfb9DmOqq4wCNxnwjdldtCmTRsZzd2uBHMx+RmD5A4=
X-Received: from pggs1.prod.google.com ([2002:a63:dc01:0:b0:af2:50f0:bc79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32a2:b0:1f5:7007:9eb7
 with SMTP id adf61e73a8af0-20179983274mr4861364637.37.1744381968654; Fri, 11
 Apr 2025 07:32:48 -0700 (PDT)
Date: Fri, 11 Apr 2025 07:32:47 -0700
In-Reply-To: <d6ccf531-2ed0-4e38-97a5-2b747497fadb@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-10-seanjc@google.com>
 <d6ccf531-2ed0-4e38-97a5-2b747497fadb@amd.com>
Message-ID: <Z_knw1j6KeaEHVxr@google.com>
Subject: Re: [PATCH 09/67] KVM: SVM: Track per-vCPU IRTEs using
 kvm_kernel_irqfd structure
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Arun Kodilkar <sarunkod@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 11, 2025, Arun Kodilkar, Sairaj wrote:
> On 4/5/2025 1:08 AM, Sean Christopherson wrote:
> > diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
> > index 8ad43692e3bb..6510a48e62aa 100644
> > --- a/include/linux/kvm_irqfd.h
> > +++ b/include/linux/kvm_irqfd.h
> > @@ -59,6 +59,9 @@ struct kvm_kernel_irqfd {
> >   	struct work_struct shutdown;
> >   	struct irq_bypass_consumer consumer;
> >   	struct irq_bypass_producer *producer;
> > +
> > +	struct list_head vcpu_list;
> > +	void *irq_bypass_data;
> >   };
> >   #endif /* __LINUX_KVM_IRQFD_H */
> 
> Hi Sean,
> You missed to update the functions avic_set_pi_irte_mode and
> avic_update_iommu_vcpu_affinity, which iterate over the ir_list.

Well bugger, I did indeed.  And now I'm questioning my (hacky) testing, as I don't
see how avic_update_iommu_vcpu_affinity() survived.

Oh, wow.  This is disgustingly hilarious.  By dumb luck, the offset of the data
pointer relative to the list_head structure is the same in amd_svm_iommu_ir and
kvm_kernel_irqfd.  And the usage in avic_set_pi_irte_mode() and
avic_update_iommu_vcpu_affinity() only ever touches the data, not "svm".

So even though the structure is completely wrong, the math works out and
avic_set_pi_irte_mode() and avic_update_iommu_vcpu_affinity() unknowingly pass in
irq_bypass_data, and all is well.

struct amd_svm_iommu_ir {
	struct list_head node;	/* Used by SVM for per-vcpu ir_list */
	void *data;		/* Storing pointer to struct amd_ir_data */
	struct vcpu_svm *svm;
};


struct kvm_kernel_irqfd {
	...

	struct kvm_vcpu *irq_bypass_vcpu;
	struct list_head vcpu_list;
	void *irq_bypass_data;
};

Great catch!  And thanks for the reviews!
