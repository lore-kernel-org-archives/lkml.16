Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240A2397A4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749847813; cv=none; b=fzwOsvri+Xuvp8VvYkRO7dnocWKea1u+JaMSIxpJpyU5rJul4ef/4FDhbMrRt12p7qJwQHM3RcSbR28salP2yH0RF09fAgEoCs7BkGFiezp599eko2loqYkfS/d32bu9qY0Z91sp0ZYgNvdVaSf0blQHCYu9Uer27Qk/l8E6ftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749847813; c=relaxed/simple;
	bh=rlp4as2PRO87GThqzQRdmrqwl1gpmCoEjWDxdIkx3Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzdvBbkxUbHoWn4hRLnd/HeqZwWP5bxFuhf4fIzrqps9tPCqWgFSXKjOpCcv/s4eeFmthjbQUJvgmQEliVpk9fc6UDmF19IF46haZxDn+GV42KlGSh+wSS4zvuUEUMw1nG+BaC9Aha8I9MJYfxdK7UAwXjajzbu1JVOmxpI8tbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FhCqBzeA; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FhCqBzeA"
Date: Fri, 13 Jun 2025 13:50:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749847808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I8Sut+fy8lfu7/XvMjml4eUjNedvlzjM8vX8iOh3OUw=;
	b=FhCqBzeAOonQAm/50ztUH2sE5JTslXDgXCcfs+hGcy47NGTjBpPPfky37vSgwj1uD0nT3g
	BJBHYE0HEaRuDzhBlKzYL2qF6h/Jd2aLZTgwi2ZxfSY2joUdPRuO64zBYIyeKzn/H0APC9
	3z3bxhA8fRMVhxeAk4sWJnUe0AVBnas=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 33/62] KVM: Fold kvm_arch_irqfd_route_changed() into
 kvm_arch_update_irqfd_routing()
Message-ID: <aEyO-elphq6t1G7o@linux.dev>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-35-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-35-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 11, 2025 at 03:45:36PM -0700, Sean Christopherson wrote:
> Fold kvm_arch_irqfd_route_changed() into kvm_arch_update_irqfd_routing().
> Calling arch code to know whether or not to call arch code is absurd.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver
