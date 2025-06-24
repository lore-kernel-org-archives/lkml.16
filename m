Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500D307482;
	Tue, 24 Jun 2025 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782837; cv=none; b=rUQs+6V1OWDBEkN07P71VxB+PY9TkFZNIqmvcA91pXm812/sGxOkiEkheEsEi5/8DBex4jNWx3/jKB1VQMjxvZDkksq16kbdK31FkOXZCOPTE5HTGIBMicYgdzS1F0LICAb8zOCI5fz4ftTrYvox10Shg58wQ0FsUrRVbkiMtD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782837; c=relaxed/simple;
	bh=ddcDvRETTZwhT11h7j8+/nwIyBsWNvcBGmnFQXAha9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+CekbjshcR4eMsrBJrwir5fpqO7Gj8vdULWBzzQ29GI8LJFwFd1zLnDQea9tG0J02WRWoE+7BUXRMaXRprWFzzvyhnqHLxsJQ3wAv3D9CRnp55cFD/b4W739cM3j6jSV0/PG80Qg4KvOLWJtgj/vbo4kIbDd8/rDibb6xvizYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E4EC4CEE3;
	Tue, 24 Jun 2025 16:33:54 +0000 (UTC)
Date: Tue, 24 Jun 2025 17:33:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, pcc@google.com, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 03/10] arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature
 to guest
Message-ID: <aFrTcGt-g5sc-uv0@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
 <20250618084513.1761345-4-yeoreum.yun@arm.com>
 <86ldppc86c.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldppc86c.wl-maz@kernel.org>

Hi Marc,

On Wed, Jun 18, 2025 at 05:43:07PM +0100, Marc Zyngier wrote:
> In general, please use a patch title format that matches the one used
> for the subsystem. For KVM, that'd be "KVM: arm64: Expose ..."/
[...]
> >  	case SYS_ID_AA64PFR2_EL1:
> > -		/* We only expose FPMR */
> > -		val &= ID_AA64PFR2_EL1_FPMR;
> > +		mask = ID_AA64PFR2_EL1_FPMR;
> > +
> > +		if (kvm_has_mte(vcpu->kvm))
> > +			mask |= ID_AA64PFR2_EL1_MTEFAR;
> > +
> > +		val &= mask;
> 
> I don't think there is a need for an extra variable, and you could
> follow the pattern established in this file by writing this as:
> 
> 	val &= (ID_AA64PFR2_EL1_FPMR |
> 		(kvm_has_mte(vcpu->kvm) ? ID_AA64PFR2_EL1_MTEFAR : 0));
> 
> Not a big deal though.

I can make the changes locally. Are you ok with the patch otherwise?

-- 
Catalin
