Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E1175D50
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743328595; cv=none; b=e6Wc6tmRXXRL1MTSdf0gmjeqNl+NzIJVe3KRbZ19P4eVFguoE0G5qxo9WCb3J8Z4kFhhjvOHEbThx2BaFPtD/Ztimnl9hdBFMzJHEqpXmPDZ5eeyS9xqaxkZ/zA83qlKVO5Oab3AjFGsKnSnbT/F841bveNmnOSGxfKlTWT/Z60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743328595; c=relaxed/simple;
	bh=RUDSGvItXzSBsZbJHb4eW9ygx48mxfh0w3yikLXGz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFsVt+m+YsGPNAdb8ZIPgDolsMZBYOvDpEi0vAnSoOHFWZGNk1GncFNd7EsnlRkPYW0YbRfeNMc2U/O//m5UAFfK/03j81nlxfrqFiapq/CrsF5NKremWieDSkUjv4TJHgvAl/MTt4wgCY0rxnxLI7M8Rok20/4+TwpcBuN+Rck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyjea/ns; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyjea/ns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C68FC4CEDD;
	Sun, 30 Mar 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743328595;
	bh=RUDSGvItXzSBsZbJHb4eW9ygx48mxfh0w3yikLXGz4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyjea/nsKPX4TBbSc4SNiZkdeh1YrRhW55hXJuEsZjJ8wz01I93NOeNRtgCKaTi8L
	 Qmp6Yt1tO4UynMyiegDW6ZTfv3O6SOiATBaJM4MhZcAmtU2BH8KTnsdLDogk681tDM
	 VECZ+gTexUzlH/TpyF6i+tz8+dbzOLd4Cuzn++788z9myxNmbFhRm/9ZQPrDDOHsC4
	 OauURqFEHUa0kGS5hdiiziXYIUvbbJSBzixzIYxzYcSx28GS5xLJPU6WaQ8Tw++Xet
	 L4ecBw2XI3dP+eOBTSZD+dROhHjfNgf+xSzudq3tYJgjFPC9fL6QPrqKAY/Kx/4fbh
	 LlERAmAwNPwrg==
Date: Sun, 30 Mar 2025 11:56:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <Z-kVT4ROZJXx6kui@gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <Z-Mme_OxuhYfxgzO@gmail.com>
 <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> > So a better optimization I think would be to declare and implement 
> > __sw_hweight32 with a different, less intrusive function call ABI 
> > that
> 
> With an external function, the ABI specifies the location of input 
> argument and function result.

This is all within the kernel, and __sw_hweight32() is implemented in 
the kernel as well, entirely in assembly, and the ALTERNATIVE*() macros 
are fully under our control as well - so we have full control over the 
calling convention.

Ie. in principle there's no need for the __sw_hweight32 function 
utilized by ALTERNATIVE() to be a C-call-ABI external function with all 
its call-clobbering constraints that disturbs register state affected 
by the C-call-ABI. (RSI RSI RDX RCX R8 R9)

The calling convention used is the kernel's choice, which we can 
re-evaluate.

For example, we could make a version of __sw_hweight32 that is a 
largely no-clobber function that only touches a single register, which 
receives its input in RAX and returns the result to RAX (as usual), and 
saves/restores everything else. This pushes overhead into the uncommon 
case (__sw_hweight32 users) and reduces register pressure on the 
calling site.

I'm not saying it's *worth* it for POPCNTL emulation alone:

 - The code generation benefits might or might not be there. Needs to 
   be examined.

 - There may be some trouble with on-stack red zones used by the 
   compiler, if the compiler doesn't know that a call was done.

 - Plus rolling a different calling convention down the alternatives 
   patching macros will have some maintenance overhead side effects. 
   Possibly other usecases need to be found as well for this to be 
   worth it.

But I wanted to bust the false assumption you seem to be making about 
C-call-ABI constraints.

Thanks,

	Ingo
