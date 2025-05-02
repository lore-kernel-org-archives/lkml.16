Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF281A3174
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746207468; cv=none; b=HNfhYhTpy4n0XFNCODTNGYMMGisI9uih/i1O3oiIzQeW5pAAb0J+EyrcoGQe9/FYYYM+wnIQzV6kxQwHH4krplXg8+qievu7mCzafI4MZyNgQ0GSQEV8rwR4e3TFs+upQnzl3KlvtjNO3RjfWaJ5JKdMWT7m7IzkImPJIsAeAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746207468; c=relaxed/simple;
	bh=Tu2GOJXA5R0nD4GC7d8xxStv7nx/CRoq5jqy9KlhMt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3laKemvIZTerc/PFpxHKBra24HCGDH474SDY1BkVd2m6geJBadjyrL6WJZphxMBn5NXXx863anMWk2Ey4Lc5oHc4SmHL6NScVGL+5tANnYGn4dWKwD/PlNgQmiO/Esd6kyviSQ+FaTwEWJcuBWpOOrqfAb8/DWNXRsT130yTfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51699C4CEE4;
	Fri,  2 May 2025 17:37:43 +0000 (UTC)
Date: Fri, 2 May 2025 18:37:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, broonie@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
Message-ID: <aBUC5fsSVzGkQtUV@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-3-yeoreum.yun@arm.com>
 <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>

On Thu, Apr 24, 2025 at 10:34:57PM +0200, David Hildenbrand wrote:
> On 10.04.25 10:07, Yeoreum Yun wrote:
> > PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> > opeartion only.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   include/uapi/linux/prctl.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 15c18ef4eb11..83ac566251d8 100644
> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -244,6 +244,8 @@ struct prctl_mm_map {
> >   # define PR_MTE_TAG_MASK		(0xffffUL << PR_MTE_TAG_SHIFT)
> >   /* Unused; kept only for source compatibility */
> >   # define PR_MTE_TCF_SHIFT		1
> > +/* MTE tag check store only */
> > +# define PR_MTE_STORE_ONLY		(1UL << 19)
> 
> That is the next available bit after PR_MTE_TAG_MASK, correct?
> 
> Would we want to leave some space to grow PR_MTE_TAG_MASK in the future
> (could that happen?)?

The current mask covers 16 tags (bits 59:56 of a pointer) and given the
reluctance to have a tag storage of 4 bits per 16 bytes (3% of RAM), I
doubt we'd ever grow this.

However, you have a good point, we could indeed leave 32 bits for the
tag mask, just in case MTE gets so much traction that someone wants 8
bits per tag (and likely a bigger granule than 16 bytes). It doesn't
cost us anything to add additional bits from (PR_MTE_TAG_SHIFT + 32).

Thanks.

-- 
Catalin
