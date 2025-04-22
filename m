Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14921481B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324027; cv=none; b=JdPPRgwYZDDcjG51G5Vb6Xoe3EGavzHolrES3X5m8vg1Epf1ub9eHEMOQqvuIHzJ/+76eWXatY/asVPaNrdwiUphbCBGK/qjiHGmoV9yNdsBFCd8pJEO0dPB6Tl7dkEzahUuEyV5mWty9653NZRcxqUVmjSpMUVedLekSVUcWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324027; c=relaxed/simple;
	bh=KIBOyy9o2vYaEZDYCQ3CTftLtE8scteEbCPAvFia0S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/uCpDbuhLA75CpB1k/aTldyt/TVHjul3jSFl/ITqgjVWZElFYF7fhfipilGDLqqGshudJ4yUqlAwlN9pueQHg5f68F2ETodE5WpJbYaItXH0Xyv7ND9T3i4JwJoabALiRx3C3hwVKKi4rqRLKezH7pJna0TaBQewD+hge2M1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnxSO6KM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnxSO6KM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D54FC4CEE9;
	Tue, 22 Apr 2025 12:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324027;
	bh=KIBOyy9o2vYaEZDYCQ3CTftLtE8scteEbCPAvFia0S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnxSO6KMgydloj1OQjYwX2LfjPzBwrhzBDGuRZt92i0XfCKlWX6vdQXTYaIj4cjzU
	 qMwg/B/HIL1Q1HrCYQJ5TSUwLSn0Fa626MZzfnbXqkra3FjypCr4Rz/RZfT7o4Ndzl
	 dfxBYZ97WPlKDbYLKTt7BoIJj2NoWKNDcu/8OXMeFHID8KWrAapUQRVoDrzJYr9Ai8
	 6wT/T/GRzwwFWjRdXSOSNh4RJq8HeTdAK+1DvaHNnix+QKFhbgVRjU8zStj+7HBpBZ
	 mPn9Os8inasb+4kr3QtTZP4Orldo+UPnd51AfqQWdtMkZLLvM3JGg+fPWVsFv5+RuE
	 dy0eJEhUoKrdg==
Date: Tue, 22 Apr 2025 14:13:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: duchangbin <changbin.du@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86: remove orphan header file e820.h
Message-ID: <aAeH969fgOx6R6rw@gmail.com>
References: <20250421041419.3167094-1-changbin.du@huawei.com>
 <aAc9seuR4AMuO4qw@gmail.com>
 <4f2c331fc758402fa662ad5bf4a2293c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f2c331fc758402fa662ad5bf4a2293c@huawei.com>


* duchangbin <changbin.du@huawei.com> wrote:

> Hi, Ingo,
> On Tue, Apr 22, 2025 at 08:56:49AM +0200, Ingo Molnar wrote:
> > 
> > * Changbin Du <changbin.du@huawei.com> wrote:
> > 
> > > The header arch/x86/include/uapi/asm/e820.h isn't used by any source file any
> > > more. The e820 related items are defined in arch/x86/include/asm/e820/types.h.
> > > So clean it up.
> > > 
> > > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > > ---
> > >  arch/x86/include/uapi/asm/e820.h | 82 --------------------------------
> > >  1 file changed, 82 deletions(-)
> > >  delete mode 100644 arch/x86/include/uapi/asm/e820.h
> > 
> > This is part of the specification of the bootloader protocol between 
> > bootloaders and the Linux kernel and thus should not be removed.
> > 
> > The kernel has its internal types that adhere to the same 
> > specification, but that's not grounds to remove this header.
> >
>
> Regarding the e820 definitions used in the boot protocol, the main 
> components involved are 'struct boot_params::e820_table' and the 
> SETUP_E820_EXT node. Both of these utilize the 'struct 
> boot_e820_entry' defined in arch/x86/include/uapi/asm/setup_data.h, 
> which is also part of the UAPI.

True.

> The header arch/x86/include/uapi/asm/e820.h is not referenced by boot 
> protocol definitions. In this scenario, can the header file 
> arch/x86/include/uapi/asm/e820.h be safely removed?

Probably/possibly ...

Thanks,

	Ingo
