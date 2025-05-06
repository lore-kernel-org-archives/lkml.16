Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D713595A;
	Tue,  6 May 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521947; cv=none; b=gNtpDVArA6IQSJE4x8aP93O/E3LDSzynMuqEpC84i9BQV6n68HRvHCfb6VfZ1zd7zwp6k2fYfjTcj9ustMo70h1Ecj2mMXwNcVzKTRxiWz2VPsVu/iwWeRHrWQSZV0uLaAwDP+pq2385uRpRHBPepcHXcbXOsH+uFZU08hyv1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521947; c=relaxed/simple;
	bh=oRucu4czaHUiBPFpgQGLCNAFU684ZzPojv343ekhhdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KA6t8Y4XFY0gSyk+Qs1U13Y1vclhJRfbFNnX6coPch4X0doCZvm1y3c7/RQzPDpIvnUGXCkMnnrYmPYvTwCXgNPs/WC2il9fy+x2GCm930UdN5aHhkTBoz3KFJ8wq61KjqqyEHuUft+/M2hb6VrWXFqP/FHGNCY2ganBchGjEiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/c8sIev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/c8sIev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3161C4CEE4;
	Tue,  6 May 2025 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746521947;
	bh=oRucu4czaHUiBPFpgQGLCNAFU684ZzPojv343ekhhdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/c8sIeviJ4Y9FOawuGJt6S5qBFCyCdr3HfxzJ0R+O4VFAm2G3ogcx5f4VJ4Koauf
	 MjTWkYJerYPcQ1IN/bCEYEygZmcHkMD4pIyq3OXyKuzGsFrMIlvm2E73Wu3FiCwUrE
	 pRvthzSAJgQtActZr3icVDLWVR4G3R+Rg+AHLq5Z7+YZzEimHk8tTQrbghmaV98RZw
	 k7Tn5IFRGMEl8+S2QYJLABrdI6mZG9rxHGoiF+UjfBft0XJPxcnWvnejkyaLhPK860
	 pq5BxoxXRlDo5sOXeYXXg1fUJcKTwx151iRuVzX2+zEGHb5oxmq/XLJFEDBqz7JQrR
	 YoFwiReiCLS3w==
Date: Tue, 6 May 2025 10:59:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 17/26] x86/cpuid: Remove direct CPUID(0x2) query API
Message-ID: <aBnPVj9NZlROyA0W@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-18-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050437.10264-18-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> All call sites at x86/cpu and x86/cacheinfo has been switched from direct
> CPUID(0x2) access to scanned CPUID access.  Remove the direct CPUID(0x2)
> query APIs at <asm/cpuid/leaf_0x2_api.h>.
> 
> Rename the iterator macro:
> 
>     for_each_scanned_leaf_0x2_entry()
> 
> back to:
> 
>     for_each_leaf_0x2_entry()
> 
> since the "for_each_scanned_.." name and was just chosen to accommodate
> the direct CPUID(0x2) to scanned CPUID(0x2) transition.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/include/asm/cpuid/leaf_0x2_api.h | 72 +----------------------
>  arch/x86/kernel/cpu/cacheinfo.c           |  2 +-
>  arch/x86/kernel/cpu/intel.c               |  2 +-
>  3 files changed, 5 insertions(+), 71 deletions(-)

There's one mention of this API orphaned in the 
for_each_leaf_0x2_entry() comment section:

  arch/x86/include/asm/cpuid/leaf_0x2_api.h: *    for_each_scanned_leaf_0x2_entry(regs, ptr, entry) {

Thanks,

	Ingo
