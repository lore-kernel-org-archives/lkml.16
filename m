Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D7125DF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250252; cv=none; b=ZA8ASspx9X3mzTGqao5XIms4pvU2Y54Et7pXYOqkyBxd7w+A+AJYbw81r7cySpuvZ9LzbPpyVeAzjAoC0E6dcKYFBPWwPRdzZZA7gJrKqsoWYctI9PrbGayGU+6Xno4l7fCV8mkqEkqHccGmSX0ac3U/7euoE0nSPJJd2uR6Bfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250252; c=relaxed/simple;
	bh=9FBus/nnrcqkp3TJXG8U7uwI7fgPTt0YtA5BGlfV2DQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jMwCtpwyugZqddM6CqirdcAXlFGGL3nFkL5j7hvGciMcbzu9cnoGayx+H0bxj1GydKU08EXpT27YuZhgqnBYwF43MqtJ943iPWnJRVxhEYlyBA0YXweJ+tVVFker/MK2QYHhWRuuZ39qvSnCKaSCO/FL1mPtnPr6hYGfdHYwLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1HylqXX4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1HylqXX4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1430515a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749250250; x=1749855050; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gcR8HNVhw7S1UUII4jwvRqVvrX7swbwirtPPR2NdXI=;
        b=1HylqXX4yiB2/orE9LI9qmGyi2MabIDyCS5+HW6sc2OkQhqRAydxlfHIj07tRDykRu
         aeNV1pq3yZDg1rufsnlwbfMRCPxM2H+aM2zSfk7+yGGz6J5MZHKh/vnYZ4BaopVaKav2
         BK2zvF61XUcPb/AkIMjRWYErkJ2LWkgS4TOfHRwnpTHHy/igHPlbyLFWP2+QRkoh6wpB
         uZch11XBA0Q+yvFOsfaBb1wOWDBI2YqiMZ7CeJTUfNf3ahMARIxFjaLaZreWO270qwVC
         GxDYxqgGKRCkESgFtB2/PuUzATRhd8xRfnu4JaWXlOPXgJD69qzcAdnS5uua+t4vlSgk
         EHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749250250; x=1749855050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gcR8HNVhw7S1UUII4jwvRqVvrX7swbwirtPPR2NdXI=;
        b=R6CgB/LGqaLQuOsz/sCRfzbVwcQ8+au4vBzlSJCaN2PyYtXMVIuoASBjzmB8TrG4+T
         bU0tlM9Pa21hRMquL12Dng7zK5LhXK1zlGwkQhuMAYBxfqdnpSV6VOoMHuygtqxQqQkZ
         vMNmC00Fw+trRnizg4/6qS6NK4qa5qpgw02ukjbNRp9XVZes6Ws4AfWBIeEiQR0fHr6D
         VFc2XwUUY4n5DV5O+uOgpWYKkm78ilMQwiAH3nWRRO7BCQ9WpnN1ONMlBZ2b6nJTR9WG
         znahTRyJOF90flXsqWoJSFLyinCPQfBUpl+lu6UM4a8xTcjTqWPdHRH3ZUM+x2x0nIwb
         9Rjg==
X-Gm-Message-State: AOJu0YwlbQJZaJZGi9WmmTx3xTmYtPkWaNx4Twqvc41xs2KO6iejWoqM
	+RKIgdsZf35fcs5Ic2bI/ddfO63AZDoG1G1wHnfup7rJuQGRzL/QjprOIvclxh/ADpDxT7rRo+A
	GZbbFiQ==
X-Google-Smtp-Source: AGHT+IFul6Ywu0HaZHphQDwEhl1qPeTTs97xLcKkRSWk3IxbD9Y9UJK3+wGAtrWLanrf6df0kDoQ8hBuIB8=
X-Received: from pjq8.prod.google.com ([2002:a17:90b:5608:b0:312:f650:c7aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d88d:b0:311:b0ec:1360
 with SMTP id 98e67ed59e1d1-3134706d56bmr7978630a91.29.1749250250354; Fri, 06
 Jun 2025 15:50:50 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:50:48 -0700
In-Reply-To: <20250401161106.790710-7-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161106.790710-1-pbonzini@redhat.com> <20250401161106.790710-7-pbonzini@redhat.com>
Message-ID: <aENwyCpSTV6niX8A@google.com>
Subject: Re: [PATCH 06/29] KVM: move mem_attr_array to kvm_plane
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, roy.hopkins@suse.com, 
	thomas.lendacky@amd.com, ashish.kalra@amd.com, michael.roth@amd.com, 
	jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 01, 2025, Paolo Bonzini wrote:
> Another aspect of the VM that is now different for separate planes is
> memory attributes, in order to support RWX permissions in the future.
> The existing vm-level ioctls apply to plane 0 and the underlying
> functionality operates on struct kvm_plane, which now hosts the
> mem_attr_array xarray.

...

> -bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> +bool kvm_arch_post_set_memory_attributes(struct kvm_plane *plane,
>  					 struct kvm_gfn_range *range)
>  {
> +	struct kvm *kvm = plane->kvm;
>  	unsigned long attrs = range->arg.attributes;
>  	struct kvm_memory_slot *slot = range->slot;
>  	int level;
> @@ -7767,7 +7770,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>  			 */
>  			if (gfn >= slot->base_gfn &&
>  			    gfn + nr_pages <= slot->base_gfn + slot->npages) {
> -				if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
> +				if (hugepage_has_attrs(plane, slot, gfn, level, attrs))
>  					hugepage_clear_mixed(slot, gfn, level);
>  				else
>  					hugepage_set_mixed(slot, gfn, level);

I don't see how this can possibly work.  Memslots are still per-VM, and so
setting/clearing KVM_LPAGE_MIXED_FLAG based on a givne plane's attributes will
clobber the state of the previous plane.

I think we could make this work by having a per-plane KVM_LPAGE_MIXED_FLAG?  I'm
99% certain we can use disallow_lpage[31:28], and _probably_ bits 31:16?  But I'd
rather

Note, to handle shared/private, we could make planes mutually exclusive with
tracking that state per-VM (see the many guest_memfd discussions), but unless I'm
missing something, we'll need the same logic for mixed RWX attributes, so...

Also, as mentioned in a later respone, planes need to be keyed in kvm_mmu_page_role
for this to work.
