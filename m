Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D3146A68
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746217159; cv=none; b=tgl2SaKxoGUJDFDXSfz1nei6SyvD88BB2nYTADpmMOJJHam74oWdRB5g4qgPge8mboFSzYOHS0qoqJuIEvXqByoeLDJbl7Lak5XaPMF+qWjmjnxdbxrlPMIjk8TB8IuttAsurUyxSdq+r1oUacKvl6YPw/KWTwSrmMBIELAe55o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746217159; c=relaxed/simple;
	bh=yYuqw05ixaJvRe4CUY2qg+SReCrNCvaLdxtBMpCKO2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEyPSdLTr82xLGPbJba1UYu9Qvy3O1Mv2ejKtHZZFU/0fyhxYfvk/sPddwspQ+9fOy/bcCQ2Vup72qkuWQxDCIJqEjk8DPJZPhUtP0auo29Rp4TMMc0IOwh7YHgXZjnrlNmt6JYfSKp7xzFG/0m2a2KD3OTrNksClw+V1BkaG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8697C4CEE4;
	Fri,  2 May 2025 20:19:13 +0000 (UTC)
Date: Fri, 2 May 2025 21:19:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: David Hildenbrand <david@redhat.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
Message-ID: <aBUovySaQN8m8L0w@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-3-yeoreum.yun@arm.com>
 <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com>
 <aBUC5fsSVzGkQtUV@arm.com>
 <CAMn1gO7ai3EvHhepJJQXOvjc8_Mp6DEAZg0J1gMKSJTECnU0VA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMn1gO7ai3EvHhepJJQXOvjc8_Mp6DEAZg0J1gMKSJTECnU0VA@mail.gmail.com>

On Fri, May 02, 2025 at 11:03:02AM -0700, Peter Collingbourne wrote:
> On Fri, May 2, 2025 at 10:37 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Thu, Apr 24, 2025 at 10:34:57PM +0200, David Hildenbrand wrote:
> > > On 10.04.25 10:07, Yeoreum Yun wrote:
> > > > PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> > > > opeartion only.
> > > >
> > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > ---
> > > >   include/uapi/linux/prctl.h | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > > > index 15c18ef4eb11..83ac566251d8 100644
> > > > --- a/include/uapi/linux/prctl.h
> > > > +++ b/include/uapi/linux/prctl.h
> > > > @@ -244,6 +244,8 @@ struct prctl_mm_map {
> > > >   # define PR_MTE_TAG_MASK          (0xffffUL << PR_MTE_TAG_SHIFT)
> > > >   /* Unused; kept only for source compatibility */
> > > >   # define PR_MTE_TCF_SHIFT         1
> > > > +/* MTE tag check store only */
> > > > +# define PR_MTE_STORE_ONLY         (1UL << 19)
> > >
> > > That is the next available bit after PR_MTE_TAG_MASK, correct?
> > >
> > > Would we want to leave some space to grow PR_MTE_TAG_MASK in the future
> > > (could that happen?)?
> >
> > The current mask covers 16 tags (bits 59:56 of a pointer) and given the
> > reluctance to have a tag storage of 4 bits per 16 bytes (3% of RAM), I
> > doubt we'd ever grow this.
> >
> > However, you have a good point, we could indeed leave 32 bits for the
> > tag mask, just in case MTE gets so much traction that someone wants 8
> > bits per tag (and likely a bigger granule than 16 bytes). It doesn't
> > cost us anything to add additional bits from (PR_MTE_TAG_SHIFT + 32).
> 
> If it's 8 bits per tag wouldn't the exclusion mask need to be 256
> bits? I probably wouldn't try to anticipate this case since it would
> likely require a different API anyway.

Yep, not sure what I was thinking. So all good with the original patch.

-- 
Catalin
