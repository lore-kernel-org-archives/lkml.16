Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA0A55
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660142; cv=none; b=anaSCZvuNniSha6Xi1L7qFhrIjIBcmgaHlditEOf5uImdcoXx07leId2T+LOD84PMklJbr7bj4gC35Kp5G1OHEmBcxH3+ePHMcm6N4wwHYeP6y0U/AjdNc8QRYnmoI03bKB2wOztxnzfYPfLxfqZBfEJq60JbLhPbr0mbRJ2r7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660142; c=relaxed/simple;
	bh=HBNY5o/P7iBTQR6GooYGfMdU4y7r7nGhbSj7w7z8Ssw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0qVXsFoB9yB568mPX5jjEt3TEhZsTUOyOzm3y8fi/8mcKRo4gGumfz3twRCA7Boodu31DunLPFxMk3huhH7htJDnzAYzpXFLrFkAuWwdSGuaTonS4ZavY3cbzm6C0/oIbkRIXJIwLr/d/FhUrlCJLf7++NwFoxGPGgt/SSfX4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDdexVON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDdexVON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CE2C4CEE4;
	Mon, 19 May 2025 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747660141;
	bh=HBNY5o/P7iBTQR6GooYGfMdU4y7r7nGhbSj7w7z8Ssw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDdexVONW2TB3fG6h5qRnzq8C3q6XhZyl/XFKnzs2O+dU6ZQ/Km60Ds6WAF9KO5r3
	 S4hb4dmpKpTkaA9X2BTT20n9EybSLiv/FDU4q8hyhGA07ZcDK0vL05lF22sf6gAVL7
	 yccLZDkYPyjzfnvN3tp+aeab8bBa7nH+eT8T2WMVyX/Bj/xKq8LzEh3amMizpOl99s
	 WjMU4DOZ+q0WK06f0vdTBvBmjqkV22Rz3ZW1G1ESfA0bXoWhwqaLtBA0UR0f+ztkcT
	 a1S5vqgV/OymI78Bu9NTGR0tm5KCZ8wxL2jxRihF0I9orzGOBFG/10qBJX0r/2mcBN
	 6OESW8eNesYXg==
Date: Mon, 19 May 2025 15:08:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <aCstaIBSfcHXpr8D@gmail.com>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Sat, May 17, 2025 at 11:16:41AM +0200, Ard Biesheuvel wrote:
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index f67a93fc9391..5c19bee0af11 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -395,7 +395,7 @@
> >  #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> >  #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
> >  #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> > -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> > +#define X86_FEATURE_LA57		(16*32+16) /* 57-bit linear addressing */
> >  #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
> >  #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
> >  #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
> > @@ -483,6 +483,7 @@
> >  #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
> >  #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
> >  #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> > +#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */
> 
> I don't think we need this second flag - you can simply clear the existing
> one.

That's what the old code did, and it was an error to do that, we almost 
never do that for CPU hardware capability flags:

 - Do we clear the PAE flag just because the kernel isn't PAE?  We don't.
 - Do we clear the CX8 flag just because it's a UP kernel?      We don't.
 - Do we clear the VMX/SVM flag just because KVM isn't running? We don't.
 - etc. etc.

The handling of the LA57 flag is the odd one out, and it was a mistake 
for the 5-level paging kernel to clear the LA57 flag.

The second best thing we can do is to have a sane, constant LA57 flag 
for the hardware capability, and introduce a synthethic flag that is 
set conditionally (X86_FEATURE_5LEVEL_PAGING) - which is how it should 
have been done originally, and to maintain compatibility, expose the 
synthethic flag in /proc/cpuinfo as 'la57' to maintain the ABI.

And let's remember this the next time someone submits a kernel series 
with CPU flag clearing... ;-)

Thanks,

	Ingo
